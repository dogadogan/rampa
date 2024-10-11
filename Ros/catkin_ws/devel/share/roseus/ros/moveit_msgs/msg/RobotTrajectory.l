;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::RobotTrajectory)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'RobotTrajectory (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::ROBOTTRAJECTORY")
  (make-package "MOVEIT_MSGS::ROBOTTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude RobotTrajectory.msg.html
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass moveit_msgs::RobotTrajectory
  :super ros::object
  :slots (_joint_trajectory _multi_dof_joint_trajectory ))

(defmethod moveit_msgs::RobotTrajectory
  (:init
   (&key
    ((:joint_trajectory __joint_trajectory) (instance trajectory_msgs::JointTrajectory :init))
    ((:multi_dof_joint_trajectory __multi_dof_joint_trajectory) (instance trajectory_msgs::MultiDOFJointTrajectory :init))
    )
   (send-super :init)
   (setq _joint_trajectory __joint_trajectory)
   (setq _multi_dof_joint_trajectory __multi_dof_joint_trajectory)
   self)
  (:joint_trajectory
   (&rest __joint_trajectory)
   (if (keywordp (car __joint_trajectory))
       (send* _joint_trajectory __joint_trajectory)
     (progn
       (if __joint_trajectory (setq _joint_trajectory (car __joint_trajectory)))
       _joint_trajectory)))
  (:multi_dof_joint_trajectory
   (&rest __multi_dof_joint_trajectory)
   (if (keywordp (car __multi_dof_joint_trajectory))
       (send* _multi_dof_joint_trajectory __multi_dof_joint_trajectory)
     (progn
       (if __multi_dof_joint_trajectory (setq _multi_dof_joint_trajectory (car __multi_dof_joint_trajectory)))
       _multi_dof_joint_trajectory)))
  (:serialization-length
   ()
   (+
    ;; trajectory_msgs/JointTrajectory _joint_trajectory
    (send _joint_trajectory :serialization-length)
    ;; trajectory_msgs/MultiDOFJointTrajectory _multi_dof_joint_trajectory
    (send _multi_dof_joint_trajectory :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajectory_msgs/JointTrajectory _joint_trajectory
       (send _joint_trajectory :serialize s)
     ;; trajectory_msgs/MultiDOFJointTrajectory _multi_dof_joint_trajectory
       (send _multi_dof_joint_trajectory :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; trajectory_msgs/JointTrajectory _joint_trajectory
     (send _joint_trajectory :deserialize buf ptr-) (incf ptr- (send _joint_trajectory :serialization-length))
   ;; trajectory_msgs/MultiDOFJointTrajectory _multi_dof_joint_trajectory
     (send _multi_dof_joint_trajectory :deserialize buf ptr-) (incf ptr- (send _multi_dof_joint_trajectory :serialization-length))
   ;;
   self)
  )

(setf (get moveit_msgs::RobotTrajectory :md5sum-) "dfa9556423d709a3729bcef664bddf67")
(setf (get moveit_msgs::RobotTrajectory :datatype-) "moveit_msgs/RobotTrajectory")
(setf (get moveit_msgs::RobotTrajectory :definition-)
      "trajectory_msgs/JointTrajectory joint_trajectory
trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: trajectory_msgs/MultiDOFJointTrajectory
# The header is used to specify the coordinate frame and the reference time for the trajectory durations
Header header

# A representation of a multi-dof joint trajectory (each point is a transformation)
# Each point along the trajectory will include an array of positions/velocities/accelerations
# that has the same length as the array of joint names, and has the same order of joints as 
# the joint names array.

string[] joint_names
MultiDOFJointTrajectoryPoint[] points

================================================================================
MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint
# Each multi-dof joint can specify a transform (up to 6 DOF)
geometry_msgs/Transform[] transforms

# There can be a velocity specified for the origin of the joint 
geometry_msgs/Twist[] velocities

# There can be an acceleration specified for the origin of the joint 
geometry_msgs/Twist[] accelerations

duration time_from_start

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

")



(provide :moveit_msgs/RobotTrajectory "dfa9556423d709a3729bcef664bddf67")


