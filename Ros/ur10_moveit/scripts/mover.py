#!/usr/bin/env python

from __future__ import print_function
#from ur10_robot import UR10

import rospy

import sys
import copy
import math
import moveit_commander
import numpy as np

from scipy.spatial.transform import Rotation as R
from scipy.spatial.transform import Slerp

import moveit_msgs.msg
from moveit_msgs.msg import Constraints, JointConstraint, PositionConstraint, OrientationConstraint, BoundingVolume
from sensor_msgs.msg import JointState
from moveit_msgs.msg import RobotState
import geometry_msgs.msg
from geometry_msgs.msg import Quaternion, Pose
from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list

from niryo_moveit.srv import MoverService, MoverServiceRequest, MoverServiceResponse

joint_names = ['shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint']

# Between Melodic and Noetic, the return type of plan() changed. moveit_commander has no __version__ variable, so checking the python version as a proxy
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
    print("\n ROBOT STATE")
    print(start_joint_angles)
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

def calculate_interpolation(current_pose, target_pose):
        distance = np.linalg.norm(np.array(current_pose[:3]) - np.array(target_pose[:3]))
        n_steps = max(int(distance / 0.1), 1)
        #print("Number of steps:", n_steps)
        pos_intpl = np.linspace(current_pose[:3], target_pose[:3], n_steps+1)[1:]
        quats = R.concatenate([R.from_quat(current_pose[3:]), R.from_quat(target_pose[3:])])
        intpl_func = Slerp([0, 1], quats)
        rot_intpl = intpl_func(np.linspace(0, 1, n_steps+1)).as_quat()[1:]
        return pos_intpl, rot_intpl

def get_pose_from_joint_angles(joint_angles,group):
    group.set_max_velocity_scaling_factor(1.0)  # Double the execution speed
    group.set_max_acceleration_scaling_factor(1.0)

    group.set_joint_value_target(joint_angles)

    # Plan the trajectory
    plan = group.plan()

    # Execute the trajectory
    group.execute(plan[1])
    # Get the end-effector pose
    pose_stamped = group.get_current_pose().pose
    print("End-effector pose:", pose_stamped)
    return pose_stamped

"""
    Creates a pick and place plan using the four states below.
    
    1. Pre Grasp - position gripper directly above target object
    2. Grasp - lower gripper so that fingers are on either side of object
    3. Pick Up - raise gripper back to the pre grasp position
    4. Place - move gripper to desired placement position

    Gripper behaviour is handled outside of this trajectory planning.
        - Gripper close occurs after 'grasp' position has been achieved
        - Gripper open occurs after 'place' position has been achieved

    https://github.com/ros-planning/moveit/blob/master/moveit_commander/src/moveit_commander/move_group.py
"""
def plan_pick_and_place(req):
    rospy.loginfo(rospy.get_caller_id() + "Plan Requested:\n")
    rospy.loginfo(req)
    rospy.loginfo("Request is over")

    response = MoverServiceResponse()

    #robot = UR10()
    #plan = robot.set_cartesian_position(req.pick_pose)
    #rospy.loginfo(plan)

    group_name = "manipulator"
    move_group = moveit_commander.MoveGroupCommander(group_name)

    current_robot_joint_configuration = req.joints_input
    rospy.loginfo("Planning Pre Grasp Pose Trajectory")


    rospy.loginfo("REQ")
    rospy.loginfo(req.pick_pose)
    current_pose = move_group.get_current_pose().pose
    position = get_pose_from_joint_angles(current_robot_joint_configuration,move_group)
    current_cartesian_pose = get_cartesian_position(position)
    pick_cartesian_pose = get_cartesian_position(req.pick_pose)

    rospy.loginfo(position)
    pos_intpl, rot_intpl = calculate_interpolation(current_cartesian_pose,pick_cartesian_pose)
    waypoints = []
    for pos, quat in zip(pos_intpl, rot_intpl):
        pose = Pose()
        pose.position.x = pos[0]
        pose.position.y = pos[1]
        pose.position.z = pos[2]
        pose.orientation.x = quat[0]
        pose.orientation.y = quat[1]
        pose.orientation.z = quat[2]
        pose.orientation.w = quat[3]
        waypoints.append(copy.deepcopy(pose))
    rospy.loginfo("Waypoint Count: ")
    rospy.loginfo(len(waypoints))
    previous_ending_joint_angles = req.joints_input
    rospy.loginfo(previous_ending_joint_angles)
    for waypoint in waypoints:
        trajectory = plan_trajectory(move_group,waypoint,previous_ending_joint_angles) 
        if not trajectory.joint_trajectory.points:
            rospy.logerr("AN ERROR OCCURED WHILE PLANNING")
            rospy.logerr(response)
            return response
        previous_ending_joint_angles = trajectory.joint_trajectory.points[-1].positions
        response.trajectories.append(trajectory)
    move_group.clear_pose_targets()

    return response

def get_cartesian_position(pose):
        return [pose.position.x, pose.position.y, pose.position.z,
                         pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w]

def moveit_server():
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('niryo_moveit_server')

    rospy.Service('niryo_moveit', MoverService, plan_pick_and_place)
    print("Service is ready to plan")
    rospy.spin()


if __name__ == "__main__":
    moveit_server()
