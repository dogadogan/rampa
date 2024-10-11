#!/usr/bin/env python3

import rospy
import numpy as np
import os
import time
import math
import matplotlib.pyplot as plt
from movement_primitives.promp import ProMP
from movement_primitives.dmp import DMP
from gmr import GMM
from scipy.spatial.transform import Rotation as R

from geometry_msgs.msg import Pose
from ur10_mover.msg import ListOfPoses

from ur10_mover.srv import TrainingDataService, TrainingDataServiceRequest, TrainingDataServiceResponse
from ur10_mover.srv import TrainingService, TrainingServiceRequest, TrainingServiceResponse
from ur10_mover.srv import SampleService, SampleServiceRequest, SampleServiceResponse
from ur10_mover.srv import PlannerService, PlannerServiceRequest, PlannerServiceResponse
from ur10_mover.srv import GetTrainingDataService, GetTrainingDataServiceRequest, GetTrainingDataServiceResponse

rospy.init_node('ur10_ProMP_server')
rospy.sleep(2)

_demo_data = []
isTraining = False
last_training = ""
sample_length = 100
n_dims_pos = 3
n_dims_or = 4
num_demo = 0

filenames = []

num_comp = 20 # number of GMM components

p_pos = ProMP(n_dims=n_dims_pos,n_weights_per_dim=20)
p_or = ProMP(n_dims=n_dims_or, n_weights_per_dim=20)

d_pos = DMP(n_dims=n_dims_pos, n_weights_per_dim=20)
d_or = DMP(n_dims=n_dims_or, n_weights_per_dim=20)

g_pos_x = GMM(n_components=num_comp, random_state=1234)
g_pos_y = GMM(n_components=num_comp, random_state=1234)
g_pos_z = GMM(n_components=num_comp, random_state=1234)
g_or_x = GMM(n_components=num_comp, random_state=1234)
g_or_y = GMM(n_components=num_comp, random_state=1234)
g_or_z = GMM(n_components=num_comp, random_state=1234)
g_or_w = GMM(n_components=num_comp, random_state=1234)

gmm_context_pos = []
gmm_context_or = []

def slerp(q1,q2,t):
    dot = np.dot(q1,q2)

    if dot < 0.0:
        q1 = -q1
        dot = -dot
    
    dot = np.clip(dot, -1.0, 1.0)

    theta_0 = np.arccos(dot)
    sin_theta_0 = np.sin(theta_0)

    if sin_theta_0 > 0.001:
        theta = theta_0 * t
        sin_theta = np.sin(theta)

        s1 = np.cos(theta) - dot * sin_theta / sin_theta_0
        s2 = sin_theta / sin_theta_0
    else:
        s1 = 1.0 - t
        s2 = t
    
    q_interp = s1*q1 + s2*q2

    return q_interp / np.linalg.norm(q_interp)

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

        if pose.orientation.w < 0:
            pose.orientation.x *= -1
            pose.orientation.y *= -1
            pose.orientation.z *= -1
            pose.orientation.w *= -1

        pose_list = [pose.position.x, pose.position.y, pose.position.z,
                         pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w, req.context]
        
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

        trajectory = make_quaternions_continuous(trajectory)
            
        trajectory_list.append(trajectory)
    return trajectory_list

def make_quaternions_continuous(trajectory):
    for i in range(1, len(trajectory)):
        prev_q = trajectory[i-1][3:7]
        curr_q = trajectory[i][3:7]

        dot_product = np.dot(prev_q, curr_q)

        if dot_product < 0:
            trajectory[i][3:7] = -1 * curr_q
    
    return trajectory


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

def interpolate_quaternions(quaternions, total_points):
    num_segments = len(quaternions) - 1
    points_per_segment = (total_points - len(quaternions)) // num_segments
    remaining_points = (total_points - len(quaternions)) % num_segments

    interpolated_points = []
    for i in range(num_segments):
        q1 = quaternions[i]
        q2 = quaternions[i+1]
        num_points = points_per_segment + (1 if i < remaining_points else 0)

        interpolated_points.append(q1)

        for j in range(num_points):
            t = (j+1) / (num_points + 1)
            q = slerp(q1,q2,t)
            interpolated_points.append(q)
    
    interpolated_points.append(quaternions[-1])

    interpolated_points = np.array(interpolated_points)
    rospy.loginfo(interpolated_points.shape)

    return interpolated_points

def start_training(req):
    
    global last_training
    global _demo_data
    
    rospy.loginfo("Recived training request")
    response = TrainingServiceResponse()
    global isTraining
    if isTraining:
        response.output_msg = "already training"
        return response
    isTraining=True

    rospy.loginfo("Reading data files")
    trajectories = read_data_files()
    
    context = []
    for traj in trajectories:
        context.append(traj[0][7])
    context = np.array(context)

    trajectories = [[pose[0:7] for pose in traj] for traj in trajectories]

    number_of_demonstrations = len(trajectories)
    all_demonstrations = []
    for trajectory in trajectories:
        pos_trajectory = [pose[0:3] for pose in trajectory]
        or_trajectory = [pose[3:7] for pose in trajectory]
        interpolated_points = interpolate_points(pos_trajectory,sample_length)
        interpolated_quaternions = interpolate_quaternions(or_trajectory, sample_length)

        interpolated_data = np.concatenate((interpolated_points, interpolated_quaternions), axis = -1)

        all_demonstrations.append(interpolated_data)
    #rospy.loginfo(all_demonstrations)
    demo_data = np.array(all_demonstrations)
    demo_data = demo_data.reshape((number_of_demonstrations, sample_length, n_dims_pos + n_dims_or))

    demo_data_pos = demo_data[:,:,:3]
    demo_data_or = demo_data[:,:,-4:]

    _demo_data = demo_data_or

    global num_demo
    num_demo = number_of_demonstrations

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
        g_or_z.from_samples(Yor_z)
        g_or_w.from_samples(Yor_w)
        rospy.loginfo("Finished training")

        last_training = "gmm" 

    elif (req.input_msg == "contextual_promp"):
        
        timesteps = np.linspace(0, 1, sample_length)
        timesteps = np.tile(timesteps, (number_of_demonstrations, 1))
        weights_pos = np.empty((number_of_demonstrations, n_dims_pos * num_comp))
        weights_or = np.empty((number_of_demonstrations, n_dims_or * num_comp))
        
        p_pos.imitate(timesteps, demo_data_pos)
        p_or.imitate(timesteps, demo_data_or)

        for demo_idx in range(number_of_demonstrations):
            weights_pos[demo_idx] = p_pos.weights(timesteps[demo_idx], demo_data_pos[demo_idx]).flatten()
            weights_or[demo_idx] = p_or.weights(timesteps[demo_idx], demo_data_or[demo_idx]).flatten()

        # weights = np.concatenate((weights_pos, weights_or), axis=-1)

        context_features = context.reshape(-1, 1)  # Reshape to column vector so it can be concatenated
        X_pos = np.hstack((context_features, weights_pos))
        X_or = np.hstack((context_features, weights_or))

        global gmm_context_pos
        global gmm_context_or
        gmm_context_pos = GMM(n_components=3, random_state=0)
        gmm_context_or = GMM(n_components=3, random_state=0)
        gmm_context_pos.from_samples(X_pos)
        gmm_context_or.from_samples(X_or)
    
    isTraining = False
    response.output_msg = "success"
    return response

def get_promp_from_context(gmm_, context_feature):
    pmp = ProMP(n_dims=n_dims_or + n_dims_pos, n_weights_per_dim=num_comp)
    context_feature = np.array([context_feature]).reshape(1, -1)

    conditional_weight_distribution = gmm_.condition(np.arange(context_feature.shape[1]), context_feature).to_mvn()
    conditional_mean = conditional_weight_distribution.mean[-(n_dims_or + n_dims_pos) * num_comp:]
    conditional_covariance = conditional_weight_distribution.covariance[-(n_dims_or + n_dims_pos) * num_comp:, -(n_dims_or + n_dims_pos) * num_comp:]
    pmp.from_weight_distribution(conditional_mean, conditional_covariance)
    return pmp

def sample_trajectory(req):

    global gmm_context

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

            p_or.condition_position([orientation.x, orientation.y, orientation.z, orientation.w],t=T[i])

        #sampling
        trajectory_or = p_or.sample_trajectories(T=np.linspace(0,1,sample_length).reshape(sample_length), n_samples=1, random_state=np.random.RandomState(seed=1234))
    
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

            orientation = condition_orientations[i]

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

        rospy.loginfo(trajectory_or_x.shape)

        trajectory_pos = np.column_stack((trajectory_pos_x[0], trajectory_pos_y[0], trajectory_pos_z[0]))
        trajectory_or = np.column_stack((trajectory_or_x[0], trajectory_or_y[0], trajectory_or_z[0], trajectory_or_w[0]))

        rospy.loginfo(trajectory_or.shape)

    elif (last_training == "contextual_promp"):
        
        timesteps = np.linspace(0, 1, sample_length)
        timesteps = np.tile(timesteps, (num_demo, 1))

        new_context_feature = req.context  # Novel context
        pmp_pos = get_promp_from_context(gmm_context_pos, new_context_feature, True)
        pmp_or = get_promp_from_context(gmm_context_or, new_context_feature, False)

        # Generate trajectory based on the adapted ProMP

        for i in range(len(condition_poses)):
            pose = condition_poses[i]
            pmp_pos.condition_position([pose[0], pose[1], pose[2]], t=T[i])

        for i in range(len(condition_orientations)):
            orientation = condition_orientations[i]
            pmp_or.condition_position([orientation[0], orientation[1], orientation[2], orientation[3]], t=T[i])

        mean_trajectory_pos = pmp_pos.mean_trajectory(timesteps[0])
        mean_trajectory_or = pmp_or.mean_trajectory(timesteps[0])
        trajectory_pos = mean_trajectory_pos
        trajectory_or = mean_trajectory_or

    rospy.loginfo("SAMPLED TRAJECTORY")

    
    sample = []
    if (last_training == "promp"):
        rospy.loginfo("Taking the first trajectory")
        sample = np.concatenate((trajectory_pos[0],trajectory_or[0]), axis=-1)
    elif last_training == "gmm":
        sample = np.concatenate((trajectory_pos,trajectory_or), axis=-1)
        rospy.loginfo(sample.shape)
    else:
        sample = trajectory_pos


    # plot(_demo_data, sample)

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

def plot(demo_data, sample):
    # (100,4)

    T = np.linspace(0,100,100)
    for i in range(4):
        plt.figure()
        plt.scatter(T, sample[:,i], c="blue")
        for data in demo_data:
            plt.scatter(T, data[:,i])
        plt.title(f'{i} vs. time')
        plt.show()

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
            currPose.position.x = pose[0]
            currPose.position.y = pose[1]
            currPose.position.z = pose[2]
            currPose.orientation.x = pose[3]
            currPose.orientation.y = pose[4]
            currPose.orientation.z = pose[5]
            currPose.orientation.w = pose[6]
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




    