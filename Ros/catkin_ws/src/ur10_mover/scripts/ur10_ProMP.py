#!/usr/bin/env python3

import rospy
import numpy as np
import os
import time
import math
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
n_dims_pos = 3
n_dims_or = 4

filenames = []

priors = 20 # number of GMM components

p_pos = ProMP(n_dims=n_dims_pos,n_weights_per_dim=20)
p_or = ProMP(n_dims=n_dims_or, n_weights_per_dim=20)

d_pos = DMP(n_dims=n_dims_pos, n_weights_per_dim=20)
d_or = DMP(n_dims=n_dims_or, n_weights_per_dim=20)

g_pos_x = GMM(n_components=priors, random_state=1234)
g_pos_y = GMM(n_components=priors, random_state=1234)
g_pos_z = GMM(n_components=priors, random_state=1234)
g_or_x = GMM(n_components=priors, random_state=1234)
g_or_y = GMM(n_components=priors, random_state=1234)
g_or_z = GMM(n_components=priors, random_state=1234)
g_or_w = GMM(n_components=priors, random_state=1234)

def save_trajectory_to_data(req):

    global filenames

    rospy.loginfo("Starting")
    rospy.loginfo(req.pose_list)
    response = TrainingDataServiceResponse()
    rospy.loginfo("Received training data")

    timestamp = str(int(time.time() * 1000))
    filename = f"data_{timestamp}.npy"
    rospy.loginfo("Received training data")
    if len(req.pose_list) == 0:
        response.output_msg = "no point given"
        return response
    rospy.loginfo("Opening file")
    trajectory = []
    for pose in req.pose_list:
        pose_list = [pose.position.x, pose.position.y, pose.position.z,
                         pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w]
        
        trajectory.append(pose_list)
    trajectory = np.array(trajectory)
    np.save(filename, trajectory)
    filenames.append(filename)
    response.output_msg = "success"
    return response

def read_data_files():
    trajectory_list= []
    for filename in filenames:
        trajectory = np.load(filename)
        trajectory_list.append(trajectory)
    return trajectory_list

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
    demo_data = demo_data.reshape((number_of_demonstrations, sample_length, n_dims_pos + n_dims_or))

    demo_data_pos = demo_data[:,:,:3]
    demo_data_or = demo_data[:,:,-4:]

    rospy.loginfo(demo_data_pos.shape)
    rospy.loginfo(demo_data_or.shape)
    
    if (req.input_msg == "promp"):
        Ts = np.linspace(0, 1, sample_length).reshape((1, sample_length))  # Generate Ts for one demonstration
        Ts = np.tile(Ts, (number_of_demonstrations, 1))
        #Ts = np.linspace(0,1,sample_length).reshape((number_of_demonstrations,sample_length)) 
        Ypos = demo_data_pos
        Yor = demo_data_or

        rospy.loginfo("Starting to train")

        # Training
        p_pos.imitate(Ts,Ypos)
        p_or.imitate(Ts,Yor)

        rospy.loginfo("Finished training")

        last_training = "promp"

    elif (req.input_msg == "dmp"):

        Ypos = demo_data_pos
        Yor = demo_data_or
        Ts = np.linspace(0,1,sample_length).reshape(sample_length)

        rospy.loginfo("Starting to train")

        # Training
        for i, traj in enumerate(Ypos):
            d_pos.imitate(T=Ts, Y = traj)
        
        for i, traj in enumerate(Yor):
            d_or.imitate(T=Ts, Y = traj)

        rospy.loginfo("Finished training")

        last_training = "dmp"
    
    
    elif (req.input_msg == "gmm"):

        Ypos_x = demo_data_pos[:,:,0]
        Ypos_y = demo_data_pos[:,:,1]
        Ypos_z = demo_data_pos[:,:,2]

        Yor_x = demo_data_or[:,:,0]
        Yor_y = demo_data_or[:,:,1]
        Yor_z = demo_data_or[:,:,2]
        Yor_w = demo_data_or[:,:,3]

        rospy.loginfo("Starting to train")
        # Training
        g_pos_x.from_samples(Ypos_x)
        g_pos_y.from_samples(Ypos_y)
        g_pos_z.from_samples(Ypos_z)
        g_or_x.from_samples(Yor_x)
        g_or_y.from_samples(Yor_y)
        g_or_x.from_samples(Yor_z)
        g_or_x.from_samples(Yor_w)
        rospy.loginfo("Finished training")

        last_training = "gmm" 

    isTraining = False
    response.output_msg = "success"
    return response

def sample_trajectory(req):

    global last_training

    rospy.loginfo("Received sample request")
    response = SampleServiceResponse()
    rospy.loginfo(req.condition_poses)
    condition_poses = []
    condition_orientations = []
    for pose in req.condition_poses:
        condition_poses.append(pose.position)
        condition_orientations.append(pose.orientation)
        
    T = np.linspace(0,1,len(condition_poses)) # generate time steps

    rospy.loginfo(condition_poses)
    rospy.loginfo(condition_orientations)

    trajectory_pos = []
    trajectory_or = []

    rospy.loginfo(last_training)

    if (last_training == "promp"):
        # conditioning model
        for i in range(len(condition_poses)):
            pose = condition_poses[i]
            rospy.loginfo(T[i])
            p_pos.condition_position([pose.x,pose.y,pose.z],t=T[i])

        #sampling
        trajectory_pos = p_pos.sample_trajectories(T=np.linspace(0,1,sample_length).reshape(sample_length), n_samples=1, random_state=np.random.RandomState(seed=1234))

        for i in range(len(condition_orientations)):
            orientation = condition_orientations[i]
            p_or.condition_position([orientation.x,orientation.y,orientation.z, orientation.w],t=T[i])

        #sampling
        trajectory_or = p_or.sample_trajectories(T=np.linspace(0,1,sample_length).reshape(sample_length), n_samples=1, random_state=np.random.RandomState(seed=1234))

    elif (last_training == "dmp"):

        for i in range(0, len(condition_poses)):
            pose = condition_poses[i]
            d_pos.configure(t = T[i], goal_y = np.array([pose.x, pose.y, pose.z]))

        t, trajectory_pos = d_pos.open_loop()
        trajectory_pos = trajectory_pos[:sample_length]

        for i in range(0, len(condition_orientations)):
            orientation = condition_orientations[i]
            d_or.configure(t = T[i], goal_y = np.array([orientation.x, orientation.y, orientation.z, orientation.w]))

        t, trajectory_or = d_or.open_loop()
        trajectory_or = trajectory_or[:sample_length]
    
    elif (last_training == "gmm"):
        
        for i in range(len(condition_poses)):
            pos = condition_poses[i]
            index = (i / (len(condition_poses))) * sample_length
            index = math.floor(index)
            g_pos_x.condition([index], pos.x)
            g_pos_y.condition([index], pos.y)
            g_pos_z.condition([index], pos.z)
        
        for i in range(len(condition_orientations)):
            orientation = condition_orientations[i]
            index = (i / (len(condition_orientations))) * sample_length
            index = math.floor(index)
            g_or_x.condition([index], orientation.x)
            g_or_y.condition([index], orientation.y)
            g_or_z.condition([index], orientation.z)
            g_or_w.condition([index], orientation.w)

        #sampling
        trajectory_pos_x = g_pos_x.sample(1)
        trajectory_pos_y = g_pos_y.sample(1)
        trajectory_pos_z = g_pos_z.sample(1)
        trajectory_or_x = g_or_x.sample(1)
        trajectory_or_y = g_or_y.sample(1)
        trajectory_or_z = g_or_z.sample(1)
        trajectory_or_w = g_or_w.sample(1)

        trajectory_pos = np.stack((trajectory_pos_x, trajectory_pos_y, trajectory_pos_z), 1)
        trajectory_or = np.stack((trajectory_or_x, trajectory_or_y, trajectory_or_z, trajectory_or_w), 1)

    rospy.loginfo("SAMPLED TRAJECTORY")
    
    sample = []
    if (last_training == "promp"):
        rospy.loginfo("Taking the first trajectory")
        sample = np.concatenate((trajectory_pos[0],trajectory_or[0]), axis=-1)
    else:
        sample = np.concatenate((trajectory_pos,trajectory_or), axis=-1)

    response_trajectory = []
    for point in sample: 
        pose = Pose()
        pose.position.x, pose.position.y, pose.position.z = point[0], point[1], point[2]
        pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w = point[3], point[4], point[5], point[6]
        response_trajectory.append(pose)
    response.sampled_trajectory = response_trajectory

    rospy.loginfo("Returned sampled trajectory with length " + str(len(response_trajectory)))

    np.save('sample.npy', sample)

    return response

def delete_training_data(req):

    global filenames
    
    rospy.loginfo("Starting")
    response = TrainingServiceResponse()
    rospy.loginfo("Received deletion trigger.")

    
    for filename in filenames:
        os.remove(filename)
        print("Deleted: " + filename)
        response.output_msg = "success"

    filenames = []
    return response


def send_training_data(req):
    
    rospy.loginfo("Starting")
    response = GetTrainingDataServiceResponse()
    rospy.loginfo("Training data requested.")
    
    global filenames
    filenames = []

    # fill filename
    prev_files = os.listdir('.')
    for file in prev_files:
        if file.endswith('.npy') & file.startswith('data'):
                filenames.append(file)

    rospy.loginfo(prev_files)
    rospy.loginfo(filenames)

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




    