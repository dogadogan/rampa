import sys
from copy import deepcopy
import rospy
import numpy as np
import moveit_commander # moveit_commander requires:
# sudo apt-get install ros-noetic-moveit
# pip install --user pyassimp
import moveit_msgs.msg
from geometry_msgs.msg import Pose, PoseStamped
from scipy.spatial.transform import Rotation as R
from scipy.spatial.transform import Slerp

#this UR10 interface requires Moveit installed and launching the planning node (see below)
class UR10:
    def __init__(self):
        print("This interface requires launching Moveit planning node")
        print("i.e. command: roslaunch ur10_moveit_config moveit_planning_execution.launch")
        self.robot = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        group_name = "manipulator"
        self.move_group = moveit_commander.MoveGroupCommander(group_name)
        self.display_trajectory_publisher = rospy.Publisher(
            "/move_group/display_planned_path",
            moveit_msgs.msg.DisplayTrajectory,
            queue_size=20,
        )
        
    def get_joint_position(self):
        return self.move_group.get_current_joint_values()

    def get_cartesian_position(self):
        pose = self.move_group.get_current_pose().pose
        return [pose.position.x, pose.position.y, pose.position.z,
                         pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w]

    def set_joint_position(self, joint_position, blocking=True):
        self.move_group.go(joint_position, wait=blocking)
        self.move_group.stop()
        self.move_group.clear_pose_targets()
        return

    def print_plan(self,plan):
        for i in range(len(plan.joint_trajectory.points)):
            joint_positions = plan.joint_trajectory.points[i].positions
            joint_velocities = plan.joint_trajectory.points[i].velocities
            joint_accelerations = plan.joint_trajectory.points[i].accelerations
            timestamp = plan.joint_trajectory.points[i].time_from_start
            print("Waypoint", i+1, "at time", timestamp, "has positions:", joint_positions)

    def calculate_interpolation(self, current_pose, target_pose):
        distance = np.linalg.norm(np.array(current_pose[:3]) - np.array(target_pose[:3]))
        n_steps = max(int(distance / 0.05), 1)
        #print("Number of steps:", n_steps)
        pos_intpl = np.linspace(current_pose[:3], target_pose[:3], n_steps+1)[1:]
        quats = R.concatenate([R.from_quat(current_pose[3:]), R.from_quat(target_pose[3:])])
        intpl_func = Slerp([0, 1], quats)
        rot_intpl = intpl_func(np.linspace(0, 1, n_steps+1)).as_quat()[1:]
        return pos_intpl, rot_intpl

    def set_cartesian_position(self, target_pose, blocking=True):
        current_pose = self.get_cartesian_position()
        pos_intpl, rot_intpl = self.calculate_interpolation(current_pose,target_pose)
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
            waypoints.append(deepcopy(pose))
        plan, _ = self.move_group.compute_cartesian_path(waypoints, 0.01, 0.0)
        self.print_plan(plan)
        self.move_group.execute(plan, wait=blocking)
        #self.move_group.stop()
        #self.move_group.clear_pose_targets()

    def set_multi_cartesian_position(self, target_poses, blocking=True):
        current_pose = self.get_cartesian_position()  # Set initial current pose
        waypoints = []
        for target_pose in target_poses:
            pos_intpl, rot_intpl = self.calculate_interpolation(current_pose, target_pose)
            
            for pos, quat in zip(pos_intpl, rot_intpl):
                pose = Pose()
                pose.position.x = pos[0]
                pose.position.y = pos[1]
                pose.position.z = pos[2]
                pose.orientation.x = quat[0]
                pose.orientation.y = quat[1]
                pose.orientation.z = quat[2]
                pose.orientation.w = quat[3]
                waypoints.append(deepcopy(pose))
            current_pose = target_pose 
        
        plan, _ = self.move_group.compute_cartesian_path(waypoints, 0.01, 0.0)
        self.print_plan(plan)
        self.move_group.execute(plan, wait=blocking)

    def table_pose(self):
        angles = np.array([-0.0095, -1.8569, -1.3694, -1.4878, 1.5183, -2.3095])
        self.set_joint_position(angles)

    def zero_pose(self):
        angles = np.radians([0, -90, 0, -90, 0, 0])
        self.set_joint_position(angles)