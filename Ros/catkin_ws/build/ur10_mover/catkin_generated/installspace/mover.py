#!/usr/bin/env python3

from __future__ import print_function


import rospy

import sys
import copy
import moveit_commander
import numpy as np
import os

from sensor_msgs.msg import JointState
from moveit_msgs.msg import RobotState,RobotTrajectory
from geometry_msgs.msg import Pose

from ur10_mover.srv import PlannerService, PlannerServiceRequest, PlannerServiceResponse
from ur10_mover.srv import StateService, StateServiceRequest, StateServiceResponse
from ur10_mover.srv import ExecutionService, ExecutionServiceRequest, ExecutionServiceResponse
from ur10_mover.srv import DiscardService, DiscardServiceRequest, DiscardServiceResponse

from sensor_msgs.msg import JointState
from geometry_msgs.msg import Pose, WrenchStamped
from ur10_interface import UR10

joint_names = ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']

#Between Melodic and Noetic, the return type of plan() changed. moveit_commander has no __version__ variable, so checking the python version as a proxy
if sys.version_info >= (3, 0):
    def planCompat(plan):
        return plan[1]
else:
    def planCompat(plan):
        return plan
        
"""
    Given the start angles of the robot, plan a trajectory that ends at the destination pose.
"""
def plan_trajectory(move_group, destination_pose, start_joint_angles): 
    current_joint_state = JointState()
    current_joint_state.name = joint_names
    current_joint_state.position = start_joint_angles

    moveit_robot_state = RobotState()
    moveit_robot_state.joint_state = current_joint_state
    move_group.set_start_state(moveit_robot_state)

    move_group.set_pose_target(destination_pose)
    plan = move_group.plan()

    if not plan:
        exception_str = """
            Trajectory could not be planned for a destination of {} with starting joint angles {}.
            Please make sure target and destination are reachable by the robot.
        """.format(destination_pose, destination_pose)
        raise Exception(exception_str)

    return planCompat(plan)

def execute_joint_angles(joint_angles,group):
    group.set_joint_value_target(joint_angles)

    # Plan the trajectory
    plan = group.plan()

    # Execute the trajectory
    group.execute(plan[1])
    return

# def calculate_interpolation(current_pose, target_pose):
#         distance = np.linalg.norm(np.array(current_pose[:3]) - np.array(target_pose[:3]))
#         n_steps = max(int(distance / 0.1), 1)
#         pos_intpl = np.linspace(current_pose[:3], target_pose[:3], n_steps+1)[1:]
#         quats = R.concatenate([R.from_quat(current_pose[3:]), R.from_quat(target_pose[3:])])
#         intpl_func = Slerp([0, 1], quats)
#         rot_intpl = intpl_func(np.linspace(0, 1, n_steps+1)).as_quat()[1:]
#         return pos_intpl, rot_intpl

def plan_pick_and_place(req):
    rospy.loginfo(rospy.get_caller_id() + "Plan Requested:\n")

    response = PlannerServiceResponse()
    response.request_type = req.request_type

    rospy.loginfo("Recieved pose count is:")
    rospy.loginfo(len(req.pose_list))
    rospy.loginfo(req.pose_list)

    current_pose = move_group.get_current_pose().pose

    current_orientation = current_pose.orientation
    down_orientation = Pose().orientation
    down_orientation.x, down_orientation.y, down_orientation.z, down_orientation.w = 1,0,0,0

    previous_ending_joint_angles = req.joints_input #robot.get_joint_position()
    for pose in req.pose_list:
        pose.orientation = down_orientation
        trajectory = plan_trajectory(move_group,pose,previous_ending_joint_angles) 
        if not trajectory.joint_trajectory.points:
            rospy.logerr("AN ERROR OCCURED WHILE PLANNING")
            rospy.logerr(pose)
            response.output_msg = "Timeout"
            if len(response.trajectories) > 0:
                save_trajectory(response.trajectories)
            return response
        previous_ending_joint_angles = trajectory.joint_trajectory.points[-1].positions
        response.trajectories.append(trajectory)

    move_group.clear_pose_targets()
    save_trajectory(response.trajectories)
    #rospy.loginfo(response.trajectories)
    response.pose_list = req.pose_list

    return response

def convert_data_file_to_list(input_file):
    traj = []
    saved_trajectory = input_file.readlines()
    input_file.close()
    for point in saved_trajectory:
        point= [float(i) for i in point[1:-2].split(',')]
        traj.append(point)
    rospy.loginfo("traj")    
    rospy.loginfo(traj)
    return traj

def plan_pick_and_place2(req):

    rospy.loginfo(rospy.get_caller_id() + "Plan Requested:\n")

    response = PlannerServiceResponse()
    response.request_type = req.request_type

    rospy.loginfo("Recieved pose count is:")
    rospy.loginfo(len(req.pose_list))
    rospy.loginfo(req.pose_list)

    current_pose = move_group.get_current_pose().pose



    file_path = os.path.join(os.path.dirname(__file__), 'sample.txt')
    with open(file_path, 'r') as input_file:
        pose_list = convert_data_file_to_list(input_file)
        

    current_orientation = current_pose.orientation
    down_orientation = Pose().orientation
    down_orientation.x, down_orientation.y, down_orientation.z, down_orientation.w = 1,0,0,0

    previous_ending_joint_angles = req.joints_input #robot.get_joint_position()

    rospy.loginfo(req.joints_input)

    for pose_xyz in pose_list:
        pose = Pose()
        pose.orientation = down_orientation
        pose.position.x, pose.position.y, pose.position.z = pose_xyz[0] , pose_xyz[1], pose_xyz[2]
        trajectory = plan_trajectory(move_group,pose,previous_ending_joint_angles) 
        if not trajectory.joint_trajectory.points:
            rospy.logerr("AN ERROR OCCURED WHILE PLANNING!")
            rospy.logerr(pose)
            response.output_msg = "Timeout"
            if len(response.trajectories) > 0:
                save_trajectory(response.trajectories)
            return response
        previous_ending_joint_angles = trajectory.joint_trajectory.points[-1].positions
        response.trajectories.append(trajectory)

    move_group.clear_pose_targets()
    save_trajectory(response.trajectories)
    #rospy.loginfo(response.trajectories)
    response.pose_list = pose_list

    return response

def save_trajectory(trajectories):
    f = open("trajectory.txt","w")
    for trajectory in trajectories:
        for point in trajectory.joint_trajectory.points:
            f.write(str(point.positions) + '\n')
    f.close()

def discard_last_trajectory(req):
    response = DiscardServiceResponse()
    discard_file = open("trajectory.txt", 'w') # Open with write mod as an empty file and close it
    discard_file.close()
    response.output_msg = "success"
    return response


def return_joint_state(req):
    response = StateServiceResponse()
    try:
        current_joint_angles = robot.get_joint_position()
        if len(current_joint_angles) < 6:
            response.output_msg = "Driver could not be reached"
            return response
    except:
        response.output_msg = "Driver could not be reached"
        return response
    response.output_msg = "success"
    response.current_joint_angles = current_joint_angles
    return response

def execute_on_real_robot(req):
    response = ExecutionServiceResponse()
    input_file = open("trajectory.txt", 'r')
    saved_trajectory = input_file.readlines()
    
    traj = []
    rospy.loginfo("Executing trajectory with " + str(len(saved_trajectory)) +" intermediate states.")
    for state in saved_trajectory:
        state= [float(i) for i in state[1:-2].split(',')]
        #state = [state[i] for i in joint_order]
        traj.append(state)
    input_file.close()
    
    # TODO move_group needs another format input to run on simulation
    
    #rospy.loginfo("Trajectory execution request is sent to driver.")
    #robot.set_joint_positions(traj)
    return response

def moveit_server():
    moveit_commander.roscpp_initialize(sys.argv)
    #rospy.init_node('niryo_moveit_server')

    rospy.Service('planner', PlannerService, plan_pick_and_place)
    rospy.Service("get_joint_state", StateService, return_joint_state)
    rospy.Service("execute",ExecutionService, execute_on_real_robot)
    rospy.Service("discard",DiscardService, discard_last_trajectory)

    print("Service is ready to plan")
    rospy.spin()

rospy.init_node('ur10_mover_server')
robot = UR10()
group_name = "manipulator"
move_group = moveit_commander.MoveGroupCommander(group_name)

rospy.sleep(2)


if __name__ == "__main__":
    moveit_server()
    

    