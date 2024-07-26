import os
import numpy as np

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

filenames = []

os.chdir('/home/user/.ros')
prev_files = os.listdir('/home/user/.ros')
for file in prev_files:
    if file.endswith('.npy') & file.startswith('data'):
        filenames.append(file)

data = []

for file in filenames:
    trajectory = np.load(file)
    trajectory = make_quaternions_continuous(trajectory)
    interpolated_points = interpolate_points(trajectory[:,:3],100)
    interpolated_quaternions = interpolate_quaternions(trajectory[:,-4:], 100)
    interpolated_data = np.concatenate((interpolated_points, interpolated_quaternions), axis = -1)
    data.append(interpolated_data)

data = np.array(data)
np.save('contextual_learning', data)
print(data.shape)

    
