#!/usr/bin/env python3

import rospy
import numpy as np
from tf2_msgs.msg import TFMessage
from std_msgs.msg import Header
from sensor_msgs.msg import JointState
from geometry_msgs.msg import Pose, WrenchStamped
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from control_msgs.msg import FollowJointTrajectoryActionGoal
from actionlib_msgs.msg import GoalStatusArray
from actionlib import SimpleActionClient

# this is an interface for UR10 that doesn't require Moveit, but lacks inverse kinematics for setting cartesian position
# if possible better use the interface with Moveit


class UR10:
    def __init__(self, rate=100):
        self.rate = rospy.Rate(rate)
        self.joint_names = [ "shoulder_pan_joint","shoulder_lift_joint", "elbow_joint", "wrist_1_joint", "wrist_2_joint", "wrist_3_joint"]
        # self._joint_pub = rospy.Publisher("/scaled_pos_joint_traj_controller/command", JointTrajectory, queue_size=10)
        self._goal_pub = rospy.Publisher("/scaled_pos_joint_traj_controller/follow_joint_trajectory/goal", FollowJointTrajectoryActionGoal, queue_size=10)
        self._goal_sub = rospy.Subscriber("/scaled_pos_joint_traj_controller/follow_joint_trajectory/status", GoalStatusArray, self._fill_status)
        self._joint_sub = rospy.Subscriber("/joint_states", JointState, self._fill_joints)
        self._tool_controller_position_sub = rospy.Subscriber("/tf", TFMessage, self._fill_tool_controller_position)
        self._force_torque_sub = rospy.Subscriber("/wrench", WrenchStamped, self._fill_force_torque)
        self._joint_position = {}
        self._joint_velocity = {}
        self._cartesian_position = []
        self._goal_status_list = []
        self._force = []
        self._torque = []
        rospy.sleep

    def get_joint_position(self):
        position = []
        rospy.loginfo(self._joint_position)
        for name in self.joint_names:
            position.append(self._joint_position[name])
        return position

    def set_joint_position(self, angles, time_from_start=5, blocking=True):
        if blocking:
            ratio_max_time=500/100 #percentage of time_from_start given after which wating expires
            max_time = rospy.get_time() + time_from_start*ratio_max_time
        msg = JointTrajectory()
        msg.joint_names = self.joint_names
        msg.header.stamp = rospy.Time.now()
        point = JointTrajectoryPoint()
        point.positions = angles
        point.time_from_start = rospy.Duration(time_from_start)
        msg.points = [point]
        #self._joint_pub.publish(msg) #raw publishing won't allow to retrieve status
        goal=FollowJointTrajectoryActionGoal()
        goal_random_id=str(np.random.randint(100))
        goal.goal_id.id=goal_random_id
        goal.goal.trajectory=msg
        self._goal_pub.publish(goal)
        if blocking:
            wait=True
            curr_goal_status=1 #presumed in execution
            while wait:
                for elem in self._goal_status_list:
                    if elem.goal_id.id == goal_random_id: #if goal_id is in goals list
                        curr_goal_status = elem.status #update it
                if curr_goal_status==3: #success reported
                    wait=False
                if rospy.get_time()>max_time:
                    print("Timeout reached before goal reported success!")
                    print(" robot had {}s to complete a {}s trajectory".format(time_from_start*ratio_max_time,time_from_start))
                    print(" reduced speed of robot below {}% may cause the issue".format(100/ratio_max_time))
                    wait=False
                if curr_goal_status>3:
                    print("goal reported failure, code ", curr_goal_status)
                    wait=False
                self.rate.sleep()

    def set_joint_positions(self, angle_list, time_from_start=3, time_between_waypoints= 1, blocking=True):
        if blocking:
            ratio_max_time=500/100 #percentage of time_from_start given after which wating expires
            max_time = rospy.get_time() + time_from_start*ratio_max_time
            
        msg = JointTrajectory()
        msg.joint_names = self.joint_names
        msg.header.stamp = rospy.Time.now()
        points = []
        for angle_index in range(len(angle_list)):
            angles = angle_list[angle_index]
            point = JointTrajectoryPoint()
            point.positions = angles
            point.time_from_start = rospy.Duration(time_from_start + (angle_index + 1) * time_between_waypoints)
            points.append(point)
        msg.points = points
        #self._joint_pub.publish(msg) #raw publishing won't allow to retrieve status
        goal=FollowJointTrajectoryActionGoal()
        goal_random_id=str(np.random.randint(100))
        goal.goal_id.id=goal_random_id
        goal.goal.trajectory=msg
        self._goal_pub.publish(goal)
        if blocking:
            wait=True
            curr_goal_status=1 #presumed in execution
            while wait:
                for elem in self._goal_status_list:
                    if elem.goal_id.id == goal_random_id: #if goal_id is in goals list
                        curr_goal_status = elem.status #update it
                if curr_goal_status==3: #success reported
                    wait=False
                if rospy.get_time()>max_time:
                    print("Timeout reached before goal reported success!")
                    print(" robot had {}s to complete a {}s trajectory".format(time_from_start*ratio_max_time,time_from_start))
                    print(" reduced speed of robot below {}% may cause the issue".format(100/ratio_max_time))
                    wait=False
                if curr_goal_status>3:
                    print("goal reported failure, code ", curr_goal_status)
                    wait=False
                self.rate.sleep()

    def get_joint_velocity(self):
        velocity = []
        for name in self.joint_names:
            velocity.append(self._joint_velocity[name])
        return velocity

    def set_joint_velocity(self, velocities, time_from_start=5, blocking=True):
        if blocking:
            ratio_max_time=500/100 #percentage of time_from_start given after which wating expires
            max_time = rospy.get_time() + time_from_start*ratio_max_time
        msg = JointTrajectory()
        msg.joint_names = self.joint_names
        msg.header.stamp = rospy.Time.now()
        point = JointTrajectoryPoint()
        point.positions = self.get_joint_position()
        point.velocities = velocities
        point.time_from_start = rospy.Duration(time_from_start)
        msg.points = [point]
        #self._joint_pub.publish(msg) #raw publishing won't allow to retrieve status
        goal=FollowJointTrajectoryActionGoal()
        goal_random_id=str(np.random.randint(100))
        goal.goal_id.id=goal_random_id
        goal.goal.trajectory=msg
        self._goal_pub.publish(goal)
        if blocking:
            wait=True
            curr_goal_status=1 #presumed in execution
            while wait:
                for elem in self._goal_status_list:
                    if elem.goal_id.id == goal_random_id: #if goal_id is in goals list
                        curr_goal_status = elem.status #update it
                if curr_goal_status==3: #success reported
                    wait=False
                if rospy.get_time()>max_time:
                    print("Timeout reached before goal reported success!")
                    print(" robot had {}s to complete a {}s trajectory".format(time_from_start*ratio_max_time,time_from_start))
                    print(" reduced speed of robot below {}% may cause the issue".format(100/ratio_max_time))
                    wait=False
                if curr_goal_status>3:
                    print("goal reported failure, code ", curr_goal_status)
                    wait=False
                self.rate.sleep()

    def table_pose(self, time_from_start=5, blocking=True):
        angles = np.array([-0.0095, -1.8569, -1.3694, -1.4878, 1.5183, -2.3095])
        self.set_joint_position(angles, time_from_start, blocking)

    def zero_pose(self, time_from_start=5, blocking=True):
        angles = np.radians([0, -90, 0, -90, 0, 0])
        self.set_joint_position(angles, time_from_start, blocking)

    def wobble(self, time, time_from_start=0.5):
        end_time = rospy.get_time() + time
        while rospy.get_time() < end_time:
            target_velocities = np.radians(np.random.uniform(-30, 30, (6,)))
            print(target_velocities)
            self.set_joint_velocity(target_velocities.tolist(), time_from_start=time_from_start)

    def _fill_joints(self, msg):
        for name, pos, vel in zip(msg.name, msg.position, msg.velocity):
            self._joint_position[name] = pos
            self._joint_velocity[name] = vel

    def _fill_tool_controller_position(self, msg):
        first_transform=msg.transforms[0]
        if first_transform.child_frame_id == "tool0_controller":
            transform=first_transform.transform
            self._cartesian_position = [transform.translation.x,transform.translation.y,transform.translation.z,
                                        transform.rotation.z,transform.rotation.x,transform.rotation.w,transform.rotation.y]

    def get_cartesian_position(self):
        return self._cartesian_position

    def _fill_status(self, msg):
        self._goal_status_list = msg.status_list

    def _fill_force_torque(self, msg):
        self._force = [ msg.wrench.force.x, msg.wrench.force.y, msg.wrench.force.z ]
        self._torque = [ msg.wrench.torque.x, msg.wrench.torque.y, msg.wrench.torque.z ]

    def get_force(self):
        return self._force

    def get_torque(self):
        return self._torque