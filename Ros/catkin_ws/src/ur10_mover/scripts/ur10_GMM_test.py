#!/usr/bin/env python3

import numpy as np
import os
import time
from movement_primitives.promp import ProMP
from movement_primitives.dmp import DMP
from gmr import GMM


from geometry_msgs.msg import Pose
from ur10_mover.msg import ListOfPoses

isTraining = False
sample_length = 100
n_dims = 3

priors = 20 # number of GMM components  ?

gmm_x = GMM(n_components=priors, random_state=1234)
gmm_y = GMM(n_components=priors, random_state=1234)
gmm_z = GMM(n_components=priors, random_state=1234)

def read_data_files():
    data_folder_path = os.path.join(os.path.dirname(__file__), 'data')
    trajectory_list= []
    for filename in os.listdir(data_folder_path):
        if filename.startswith("data_"):
            file_path = os.path.join(data_folder_path, filename)
            with open(file_path, 'r') as input_file:
                traj = convert_data_file_to_list(input_file)
                trajectory_list.append(traj)
    return trajectory_list

def convert_data_file_to_list(input_file):
    traj = []
    saved_trajectory = input_file.readlines()
    input_file.close()
    for point in saved_trajectory:
        point= [float(i) for i in point[1:-2].split(',')]
        traj.append(point)
    return traj

def interpolate_points(points, total_points):
    num_segments = len(points) - 1
    points_per_segment = total_points // num_segments
    remaining_points = total_points % num_segments

    interpolated_points = []
    points = np.array(points)
    for i in range(len(points) - 1):
        start_point = points[i]
        end_point = points[i + 1]
        num_points = points_per_segment + (1 if i < remaining_points else 0)

        for j in range(num_points):
            ratio = (j + 1) / (num_points + 1)  # Calculate ratio between start and end points
            interpolated_point = (1 - ratio) * start_point + ratio * end_point  # Linear interpolation formula
            interpolated_points.append(interpolated_point)
    return np.array(interpolated_points)

def start_training():

    trajectories = read_data_files()
    number_of_demonstrations = len(trajectories)
    all_demonstrations = []
    for trajectory in trajectories:
        interpolated_points = interpolate_points(trajectory,sample_length)
        #interpolated_points_reshaped = interpolated_points.reshape(-1, 3)
        #rospy.loginfo(interpolated_points)
        all_demonstrations.append(interpolated_points)
    #rospy.loginfo(all_demonstrations)
    demo_data = np.array(all_demonstrations)

    demo_data = demo_data.reshape((number_of_demonstrations, sample_length, -1))

    demo_data = demo_data[:,:,:3]

    Yx = demo_data[:,:,0]
    Yy = demo_data[:,:,1]
    Yz = demo_data[:,:,2]

    print(f"demo_data.shape: {demo_data.shape}")
    print(f"Y.shape: {Yx.shape}")
        
    gmm_x.from_samples(Yx)
    gmm_y.from_samples(Yy)
    gmm_z.from_samples(Yz)

def sample_trajectory(waypoints):

    trajectory = ""

    start = waypoints[0]
    end = waypoints[-1]
    
    _gmm_x = gmm_x.condition([0,-1], [start[0], end[0]])
    _gmm_y = gmm_y.condition([0,-1], [start[1], end[1]])
    _gmm_z = gmm_z.condition([0,-1], [start[2], end[2]])

    trajectory_x = _gmm_x.sample(1)
    trajectory_x = np.insert(trajectory_x, 0, start[0])
    trajectory_x = np.append(trajectory_x, end[0])

    trajectory_y = _gmm_y.sample(1)
    trajectory_y = np.insert(trajectory_y, 0, start[1])
    trajectory_y = np.append(trajectory_y, end[1])

    trajectory_z = _gmm_z.sample(1)
    trajectory_z = np.insert(trajectory_z, 0, start[2])
    trajectory_z = np.append(trajectory_z, end[2])

    trajectory = np.stack((trajectory_x, trajectory_y, trajectory_z), axis=1)

    file_path = os.path.join(os.path.dirname(__file__), 'sample.txt')
    with open(file_path, 'w+') as file:
        for point in trajectory:
            file.write(str(point) + '\n')
    

if __name__ == "__main__":
    start_training()
    
    waypoints = []
    waypoints.append(np.array([0.26, 0.575, 1.0]))
    waypoints.append(np.array([-0.15, 0.525, 0.91]))

    sample_trajectory(waypoints)





    