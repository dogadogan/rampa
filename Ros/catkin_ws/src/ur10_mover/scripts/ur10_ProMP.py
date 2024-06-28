#!/usr/bin/env python3

import rospy
import numpy as np
import os
import time
from movement_primitives.promp import ProMP
from movement_primitives.dmp import DMP
from gmr import GMM


from geometry_msgs.msg import Pose
from ur10_mover.msg import ListOfPoses

from ur10_mover.srv import TrainingDataService, TrainingDataServiceRequest, TrainingDataServiceResponse
from ur10_mover.srv import TrainingService, TrainingServiceRequest, TrainingServiceResponse
from ur10_mover.srv import SampleService, SampleServiceRequest, SampleServiceResponse
from ur10_mover.srv import PlannerService, PlannerServiceRequest, PlannerServiceResponse
from ur10_mover.srv import GetTrainingDataService, GetTrainingDataServiceRequest, GetTrainingDataServiceResponse

rospy.init_node('ur10_ProMP_server')
rospy.sleep(2)

isTraining = False
last_training = ""
sample_length = 100
n_dims = 3

priors = 20 # number of GMM components

p = ProMP(n_dims=n_dims,n_weights_per_dim=20)
d = DMP(n_dims=n_dims, n_weights_per_dim=20)
g = GMM(n_components=priors, random_state=1234)

def save_trajectory_to_data(req):
    rospy.loginfo("Starting")
    rospy.loginfo(req.pose_list)
    response = TrainingDataServiceResponse()
    rospy.loginfo("Received training data")

    timestamp = str(int(time.time() * 1000))
    filename = f"data_{timestamp}.txt"
    file_path = os.path.join(os.path.dirname(__file__), 'data', filename)
    rospy.loginfo("Received training data")
    if len(req.pose_list) == 0:
        response.output_msg = "no point given"
        return response
    rospy.loginfo("Opening file")
    with open(file_path, 'w+') as file:
        for pose in req.pose_list:
            pose_list = [pose.position.x, pose.position.y, pose.position.z]
            file.write(str(pose_list) + '\n')
    response.output_msg = "success"
    return response

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

def start_training(req):
    
    global last_training
    
    rospy.loginfo("Recived training request")
    response = TrainingServiceResponse()
    global isTraining
    if isTraining:
        response.output_msg = "already training"
        return response
    isTraining=True

    rospy.loginfo("Reading data files")
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
    demo_data = demo_data.reshape((number_of_demonstrations, sample_length, n_dims))

    rospy.loginfo(req.input_msg)

    if (req.input_msg == "promp"):
        Ts = np.linspace(0, 1, sample_length).reshape((1, sample_length))  # Generate Ts for one demonstration
        Ts = np.tile(Ts, (number_of_demonstrations, 1))
        #Ts = np.linspace(0,1,sample_length).reshape((number_of_demonstrations,sample_length)) 
        Ys = demo_data

        rospy.loginfo("Starting to train")

        # Training
        p.imitate(Ts,Ys)

        rospy.loginfo("Finished training")

        last_training = "promp"

    elif (req.input_msg == "dmp"):

        Y = demo_data
        Ts = np.linspace(0,1,sample_length).reshape(sample_length)

        rospy.loginfo("Starting to train")

        # Training
        for i, traj in enumerate(Y):
            d.imitate(T=Ts, Y = traj)

        rospy.loginfo("Finished training")

        last_training = "dmp"
    
    elif (req.input_msg == "gmm"):
        Y = demo_data.reshape(demo_data.shape[0], -1)

        rospy.loginfo("Starting to train")
        # Training
        g.from_samples(Y)
        rospy.loginfo("Finished training")

        last_training = "gmm"

    isTraining = False
    response.output_msg = "success"
    return response

def sample_trajectory(req):

    global last_training

    rospy.loginfo("Received sample request")
    response = SampleServiceResponse()
    condition_poses = []
    for pose in req.condition_poses:
        condition_poses.append(pose.position)
        
    T = np.linspace(0,1,len(condition_poses)) # generate time steps

    trajectory = ""

    rospy.loginfo(last_training)

    if (last_training == "promp"):
        # conditioning model
        _p = p
        for i in range(len(condition_poses)):
            pose = condition_poses[i]
            rospy.loginfo(T[i])
            _p = _p.condition_position([pose.x,pose.y,pose.z],t=T[i])

        #sampling
        trajectory = _p.sample_trajectories(T=np.linspace(0,1,sample_length).reshape(sample_length), n_samples=1, random_state=np.random.RandomState(seed=1234))

    elif (last_training == "dmp"):

        _d = d
        
        for i in range(0, len(condition_poses)):
            pose = condition_poses[i]
            _d.configure(t = T[i], goal_y = np.array([pose.x, pose.y, pose.z]))

        t, trajectory = _d.open_loop()
        trajectory = trajectory[:sample_length]
    
    elif (last_training == "gmm"):


        start = np.array([start_pos.x,start_pos.y,start_pos.z])
        end = np.array([end_pos.x,end_pos.y,end_pos.z])

        _g = g
        _g = _g.condition([0,-1], [start, end])
        trajectory = _g.sample(1)
        trajectory = np.insert(trajectory, 0, start)
        trajectory = np.append(trajectory, end)
                        

    rospy.loginfo("SAMPLED TRAJECTORY")
    

    sample = []
    if (last_training == "promp"):
        rospy.loginfo("Taking the first trajectory")
        
        sample = trajectory[0]

        rospy.loginfo(sample)
    else:
        sample = trajectory

    response_trajectory = []
    for point in sample: 
        pose = Pose()
        pose.position.x, pose.position.y, pose.position.z = point[0], point[1], point[2]
        response_trajectory.append(pose)
    response.sampled_trajectory = response_trajectory

    rospy.loginfo("Returned sampled trajectory with length " + str(len(response_trajectory)))

    file_path = os.path.join(os.path.dirname(__file__), 'sample.txt')
    with open(file_path, 'w+') as file:
        for point in sample:
            file.write(str(point) + '\n')

    return response

def delete_training_data(req):
    rospy.loginfo("Starting")
    response = TrainingServiceResponse()
    rospy.loginfo("Received deletion trigger.")

    directory_name = os.path.join(os.path.dirname(__file__), 'data')
    for filename in os.listdir(directory_name):
        file_path = os.path.join(directory_name, filename)
        os.remove(file_path)
        print("Deleted: " + file_path)
        response.output_msg = "success"
    return response


def send_training_data(req):
    
    rospy.loginfo("Starting")
    response = GetTrainingDataServiceResponse()
    rospy.loginfo("Training data requested.")
    
    data = read_data_files()

    for trajectory in data:
        listOfPoses = ListOfPoses()
        for pose in trajectory:
            currPose = Pose()
            #ros to unity conversion
            currPose.position.x = -1 * pose[1]
            currPose.position.y = pose[2]
            currPose.position.z = pose[0]
            listOfPoses.pose_list.append(currPose)
        response.trajectoryList.append(listOfPoses)
    
    return response

    


def proMP_server():
    
    rospy.Service("save_training_data", TrainingDataService, save_trajectory_to_data)
    rospy.Service("start_training", TrainingService, start_training)
    rospy.Service("sample",SampleService,sample_trajectory)
    
    rospy.Service("delete_training_data", TrainingService, delete_training_data)

    rospy.Service("get_training_data", GetTrainingDataService, send_training_data)

    rospy.spin()

if __name__ == "__main__":
    proMP_server()




    