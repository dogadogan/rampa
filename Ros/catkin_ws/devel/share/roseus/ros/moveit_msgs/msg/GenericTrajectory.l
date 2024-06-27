;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::GenericTrajectory)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'GenericTrajectory (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::GENERICTRAJECTORY")
  (make-package "MOVEIT_MSGS::GENERICTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude GenericTrajectory.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass moveit_msgs::GenericTrajectory
  :super ros::object
  :slots (_header _joint_trajectory _cartesian_trajectory ))

(defmethod moveit_msgs::GenericTrajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:joint_trajectory __joint_trajectory) ())
    ((:cartesian_trajectory __cartesian_trajectory) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _joint_trajectory __joint_trajectory)
   (setq _cartesian_trajectory __cartesian_trajectory)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:joint_trajectory
   (&rest __joint_trajectory)
   (if (keywordp (car __joint_trajectory))
       (send* _joint_trajectory __joint_trajectory)
     (progn
       (if __joint_trajectory (setq _joint_trajectory (car __joint_trajectory)))
       _joint_trajectory)))
  (:cartesian_trajectory
   (&rest __cartesian_trajectory)
   (if (keywordp (car __cartesian_trajectory))
       (send* _cartesian_trajectory __cartesian_trajectory)
     (progn
       (if __cartesian_trajectory (setq _cartesian_trajectory (car __cartesian_trajectory)))
       _cartesian_trajectory)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; trajectory_msgs/JointTrajectory[] _joint_trajectory
    (apply #'+ (send-all _joint_trajectory :serialization-length)) 4
    ;; moveit_msgs/CartesianTrajectory[] _cartesian_trajectory
    (apply #'+ (send-all _cartesian_trajectory :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; trajectory_msgs/JointTrajectory[] _joint_trajectory
     (write-long (length _joint_trajectory) s)
     (dolist (elem _joint_trajectory)
       (send elem :serialize s)
       )
     ;; moveit_msgs/CartesianTrajectory[] _cartesian_trajectory
     (write-long (length _cartesian_trajectory) s)
     (dolist (elem _cartesian_trajectory)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; trajectory_msgs/JointTrajectory[] _joint_trajectory
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_trajectory (let (r) (dotimes (i n) (push (instance trajectory_msgs::JointTrajectory :init) r)) r))
     (dolist (elem- _joint_trajectory)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; moveit_msgs/CartesianTrajectory[] _cartesian_trajectory
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cartesian_trajectory (let (r) (dotimes (i n) (push (instance moveit_msgs::CartesianTrajectory :init) r)) r))
     (dolist (elem- _cartesian_trajectory)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::GenericTrajectory :md5sum-) "d68b5c73072efa2012238a77e49c2c58")
(setf (get moveit_msgs::GenericTrajectory :datatype-) "moveit_msgs/GenericTrajectory")
(setf (get moveit_msgs::GenericTrajectory :definition-)
      "# A generic trajectory message that may either encode a joint- or cartesian-space trajectory, or both
# Trajectories encoded in this message are considered semantically equivalent
Header header
trajectory_msgs/JointTrajectory[] joint_trajectory
moveit_msgs/CartesianTrajectory[] cartesian_trajectory

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
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

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
MSG: moveit_msgs/CartesianTrajectory
# This message describes the trajectory of a tracked frame in task-space
Header header

# The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id
string tracked_frame

CartesianTrajectoryPoint[] points

================================================================================
MSG: moveit_msgs/CartesianTrajectoryPoint
# The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,
# following the pattern of the JointTrajectory message
CartesianPoint point

duration time_from_start

================================================================================
MSG: moveit_msgs/CartesianPoint
# This message defines a point in a cartesian trajectory
geometry_msgs/Pose pose
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
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
MSG: geometry_msgs/Accel
# This expresses acceleration in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

")



(provide :moveit_msgs/GenericTrajectory "d68b5c73072efa2012238a77e49c2c58")


