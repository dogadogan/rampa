#!/usr/bin/env python3

import numpy as np
import os
import time
import math
import matplotlib.pyplot as plt
from movement_primitives.promp import ProMP
from movement_primitives.dmp import DMP
from gmr import GMM
from scipy.spatial.transform import Rotation as R


_demo_data = []
isTraining = False
last_training = ""
sample_length = 100
n_dims_pos = 3
n_dims_or = 4
gmm_context = []

## fill this!!
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


### LOADING DATA!!! you must fill the filenames list
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

    return interpolated_points

def start_training(input):
        
    global last_training
    global _demo_data

    trajectories = read_data_files()
    
    context = []
    for traj in trajectories:
        context.append(traj[0][7])
    context = np.array(context)
    print(context)

    trajectories = [[pose[0:7] for pose in traj] for traj in trajectories]
    print(trajectories)

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

    _demo_data = demo_data

    global num_demo
    num_demo = number_of_demonstrations

    if (input == "promp"):
        Ts = np.linspace(0, 1, sample_length).reshape((1, sample_length))  # Generate Ts for one demonstration
        Ts = np.tile(Ts, (number_of_demonstrations, 1))
        #Ts = np.linspace(0,1,sample_length).reshape((number_of_demonstrations,sample_length)) 
        Ypos = demo_data_pos
        Yor = demo_data_or

        # Training
        p_pos.imitate(Ts,Ypos)
        p_or.imitate(Ts,Yor)

        last_training = "promp"
    
    elif (input == "gmm"):

        Ypos_x = demo_data_pos[:,:,0]
        Ypos_y = demo_data_pos[:,:,1]
        Ypos_z = demo_data_pos[:,:,2]

        Yor_x = demo_data_or[:,:,0]
        Yor_y = demo_data_or[:,:,1]
        Yor_z = demo_data_or[:,:,2]
        Yor_w = demo_data_or[:,:,3]

        # Training
        g_pos_x.from_samples(Ypos_x)
        g_pos_y.from_samples(Ypos_y)
        g_pos_z.from_samples(Ypos_z)
        g_or_x.from_samples(Yor_x)
        g_or_y.from_samples(Yor_y)
        g_or_z.from_samples(Yor_z)
        g_or_w.from_samples(Yor_w)

        last_training = "gmm" 

    elif (input == "contextual_promp"):

        timesteps = np.linspace(0, 1, sample_length)
        timesteps = np.tile(timesteps, (number_of_demonstrations, 1))
        weights_pos = np.empty((number_of_demonstrations, n_dims_pos * priors))
        weights_or = np.empty((number_of_demonstrations, n_dims_or * priors))

        p_pos.imitate(timesteps, demo_data_pos)
        p_or.imitate(timesteps, demo_data_or)

        for demo_idx in range(number_of_demonstrations):
            weights_pos[demo_idx] = p_pos.weights(timesteps[demo_idx], demo_data_pos[demo_idx]).flatten()
            weights_or[demo_idx] = p_or.weights(timesteps[demo_idx], demo_data_or[demo_idx]).flatten()
            
        weights = np.concatenate((weights_pos, weights_or), axis=-1)

        context_features = context.reshape(-1, 1)   # Reshape to column vector so it can be concatenated
        X = np.hstack((context_features, weights))

        global gmm_context
        gmm_context = GMM(n_components=3, random_state=0)
        gmm_context.from_samples(X)

        last_training = "contextual_promp"
    
    isTraining = False

def get_promp_from_context(gmm_, context_feature):
    pmp = ProMP(n_dims=n_dims_or + n_dims_pos, n_weights_per_dim=priors)
    context_feature = np.array([context_feature]).reshape(1, -1)

    conditional_weight_distribution = gmm_.condition(np.arange(context_feature.shape[1]), context_feature).to_mvn()
    conditional_mean = conditional_weight_distribution.mean[-(n_dims_or + n_dims_pos) * priors:]
    conditional_covariance = conditional_weight_distribution.covariance[-(n_dims_or + n_dims_pos) * priors:, -(n_dims_or + n_dims_pos) * priors:]
    pmp.from_weight_distribution(conditional_mean, conditional_covariance)
    return pmp
    
def sample_trajectory(poses, novel_context = 0):

    global last_training
    condition_poses = []
    condition_orientations = []
    for pose in poses:
        condition_poses.append([pose[0], pose[1], pose[2]])
        condition_orientations.append([pose[3], pose[4], pose[5], pose[6]])
        
    T = np.linspace(0,1,len(condition_poses)) # generate time steps

    trajectory_pos = []
    trajectory_or = []

    if (last_training == "promp"):
        # conditioning model
        for i in range(len(condition_poses)):
            pose = condition_poses[i]
            p_pos.condition_position([pose[0], pose[1], pose[2]],t=T[i])

        #sampling
        trajectory_pos = p_pos.sample_trajectories(T=np.linspace(0,1,sample_length).reshape(sample_length), n_samples=1, random_state=np.random.RandomState(seed=1234))

        for i in range(len(condition_orientations)):
            orientation = condition_orientations[i]
            p_or.condition_position([orientation[0], orientation[1], orientation[2], orientation[3]],t=T[i])

        #sampling
        trajectory_or = p_or.sample_trajectories(T=np.linspace(0,1,sample_length).reshape(sample_length), n_samples=1, random_state=np.random.RandomState(seed=1234))
    elif (last_training == "gmm"):
        
        for i in range(len(condition_poses)):
            pos = condition_poses[i]
            index = (i / (len(condition_poses))) * sample_length
            index = math.floor(index)
            g_pos_x.condition([index], pos[0])
            g_pos_y.condition([index], pos[1])
            g_pos_z.condition([index], pos[2])
        
        for i in range(len(condition_orientations)):
            orientation = condition_orientations[i]
            index = (i / (len(condition_orientations))) * sample_length
            index = math.floor(index)

            orientation = condition_orientations[i]

            g_or_x.condition([index], orientation[0])
            g_or_y.condition([index], orientation[1])
            g_or_z.condition([index], orientation[2])
            g_or_w.condition([index], orientation[3])

        #sampling
        trajectory_pos_x = g_pos_x.sample(1)
        trajectory_pos_y = g_pos_y.sample(1)
        trajectory_pos_z = g_pos_z.sample(1)
        trajectory_or_x = g_or_x.sample(1)
        trajectory_or_y = g_or_y.sample(1)
        trajectory_or_z = g_or_z.sample(1)
        trajectory_or_w = g_or_w.sample(1)

        trajectory_pos = np.column_stack((trajectory_pos_x[0], trajectory_pos_y[0], trajectory_pos_z[0]))
        trajectory_or = np.column_stack((trajectory_or_x[0], trajectory_or_y[0], trajectory_or_z[0], trajectory_or_w[0]))

    elif (last_training == "contextual_promp"):
        
        timesteps = np.linspace(0, 1, sample_length)
        timesteps = np.tile(timesteps, (num_demo, 1))

        new_context_feature = novel_context # Novel context
        pmp = get_promp_from_context(gmm_context, new_context_feature)

        # Generate trajectory based on the adapted ProMP
        mean_trajectory = pmp.mean_trajectory(timesteps[0])
        trajectory_pos = mean_trajectory
    
    sample = []
    if (last_training == "promp"):
        sample = np.concatenate((trajectory_pos[0],trajectory_or[0]), axis=-1)
    elif last_training == "gmm":
        sample = np.concatenate((trajectory_pos,trajectory_or), axis=-1)
    else:
        sample = trajectory_pos

    # only plots orientations at the moment
    plot(_demo_data, sample, poses)

    ### SAMPLE COMPLETED



def plot(demo_data, sample, waypoints):
    # (100,4)

    T = np.linspace(0,100,100)
    
    for j in range(4):
        plt.figure()
        plt.grid(alpha=0.2)
        plt.xlabel('Timestamp', fontsize=14)

        lbl = 'x' if j==0 else ('y' if j==1 else ('z' if j==2 else 'w'))

        plt.ylabel(f'Quaternion {lbl}', fontsize=14)

        
        
        plt.plot(T, sample[:,j], linewidth=3, label="generated", c="blue", alpha=1)
        for i in range (len(demo_data)):
            data = demo_data[i]
            if (i == 0):
                plt.plot(T, data[:,j], label="data", c="black", alpha=0.3)
            else:
                plt.plot(T, data[:,j], c="black", alpha=0.3)
        for i in range(len(waypoints)):
            waypoint = waypoints[i]
            if (i == 0):
                plt.scatter(i*len(T)/(len(waypoints)-1), waypoint[j], label="condition points", c="green")
            else:
                plt.scatter(i*len(T)/(len(waypoints)-1), waypoint[j], c="green")
        
        plt.title(f'Quaternion {lbl} vs. time', fontsize=16)
        plt.ylim(-1,1)
        plt.legend(loc = 'lower left')
        if (j==1):
            plt.legend(loc = 'center left')
        plt.show()



if __name__ == "__main__":

    ### EDIT THESE
    os.chdir('/home/user/.ros')
    prev_files = os.listdir('/home/user/.ros')
    for file in prev_files:
        if file.endswith('.npy') & file.startswith('data'):
            filenames.append(file)


    
    start_training("contextual_promp")
    # waypoints = [[posx, posy, posz, orx, ory, orz, orw], ...] (2D array)
    waypoints = [[0,0,0,-0.25,-0.9,-0.25,0.25],[0,0,0,-0.25,-0.9,0,0.12]]
    sample_trajectory(waypoints, 0.15)




    


    
