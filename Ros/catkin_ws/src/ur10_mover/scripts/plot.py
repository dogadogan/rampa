import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import os

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

def read_sample():
    file_path = os.path.join(os.path.dirname(__file__), 'sample.txt')
    input_file = open(file_path, 'r')
    traj = []
    saved_trajectory = input_file.readlines()
    input_file.close()
    for point in saved_trajectory:
        point= [float(i) for i in point[1:-2].split()]
        traj.append(point)
    return np.array(traj)

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


        

trajectories = read_data_files()

interp_traj = []

for trajectory in trajectories:
    interpolated_points = interpolate_points(trajectory,100)
    interp_traj.append(interpolated_points)

trajectories = np.array(interp_traj)



fig = plt.figure()
# ax = fig.add_subplot(111, projection='3d')

for i in range (len(trajectories)):
    x, y, z = trajectories[i,:,0], trajectories[i,:,1], trajectories[i,:,2]
    plt.plot(y,z, color = 'y')
    # ax.plot(x,y,z, color='y')

sample = read_sample()

x, y, z = sample[:,0], sample[:,1], sample[:,2]
plt.plot(y,z, linestyle='--', color='g')
# ax.plot(x,y,z, color = 'b')

plt.show()




