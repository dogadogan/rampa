;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::ExecuteKnownTrajectory)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'ExecuteKnownTrajectory (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::EXECUTEKNOWNTRAJECTORY")
  (make-package "MOVEIT_MSGS::EXECUTEKNOWNTRAJECTORY"))
(unless (find-package "MOVEIT_MSGS::EXECUTEKNOWNTRAJECTORYREQUEST")
  (make-package "MOVEIT_MSGS::EXECUTEKNOWNTRAJECTORYREQUEST"))
(unless (find-package "MOVEIT_MSGS::EXECUTEKNOWNTRAJECTORYRESPONSE")
  (make-package "MOVEIT_MSGS::EXECUTEKNOWNTRAJECTORYRESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::ExecuteKnownTrajectoryRequest
  :super ros::object
  :slots (_trajectory _wait_for_execution ))

(defmethod moveit_msgs::ExecuteKnownTrajectoryRequest
  (:init
   (&key
    ((:trajectory __trajectory) (instance moveit_msgs::RobotTrajectory :init))
    ((:wait_for_execution __wait_for_execution) nil)
    )
   (send-super :init)
   (setq _trajectory __trajectory)
   (setq _wait_for_execution __wait_for_execution)
   self)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:wait_for_execution
   (&optional (__wait_for_execution :null))
   (if (not (eq __wait_for_execution :null)) (setq _wait_for_execution __wait_for_execution)) _wait_for_execution)
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/RobotTrajectory _trajectory
    (send _trajectory :serialization-length)
    ;; bool _wait_for_execution
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/RobotTrajectory _trajectory
       (send _trajectory :serialize s)
     ;; bool _wait_for_execution
       (if _wait_for_execution (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/RobotTrajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; bool _wait_for_execution
     (setq _wait_for_execution (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass moveit_msgs::ExecuteKnownTrajectoryResponse
  :super ros::object
  :slots (_error_code ))

(defmethod moveit_msgs::ExecuteKnownTrajectoryResponse
  (:init
   (&key
    ((:error_code __error_code) (instance moveit_msgs::MoveItErrorCodes :init))
    )
   (send-super :init)
   (setq _error_code __error_code)
   self)
  (:error_code
   (&rest __error_code)
   (if (keywordp (car __error_code))
       (send* _error_code __error_code)
     (progn
       (if __error_code (setq _error_code (car __error_code)))
       _error_code)))
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/MoveItErrorCodes _error_code
    (send _error_code :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/MoveItErrorCodes _error_code
       (send _error_code :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/MoveItErrorCodes _error_code
     (send _error_code :deserialize buf ptr-) (incf ptr- (send _error_code :serialization-length))
   ;;
   self)
  )

(defclass moveit_msgs::ExecuteKnownTrajectory
  :super ros::object
  :slots ())

(setf (get moveit_msgs::ExecuteKnownTrajectory :md5sum-) "90682c5b72fe34a7ac8538ce473e228b")
(setf (get moveit_msgs::ExecuteKnownTrajectory :datatype-) "moveit_msgs/ExecuteKnownTrajectory")
(setf (get moveit_msgs::ExecuteKnownTrajectory :request) moveit_msgs::ExecuteKnownTrajectoryRequest)
(setf (get moveit_msgs::ExecuteKnownTrajectory :response) moveit_msgs::ExecuteKnownTrajectoryResponse)

(defmethod moveit_msgs::ExecuteKnownTrajectoryRequest
  (:response () (instance moveit_msgs::ExecuteKnownTrajectoryResponse :init)))

(setf (get moveit_msgs::ExecuteKnownTrajectoryRequest :md5sum-) "90682c5b72fe34a7ac8538ce473e228b")
(setf (get moveit_msgs::ExecuteKnownTrajectoryRequest :datatype-) "moveit_msgs/ExecuteKnownTrajectoryRequest")
(setf (get moveit_msgs::ExecuteKnownTrajectoryRequest :definition-)
      "# This service is deprecated and will go away at some point. For new development use the ExecuteTrajectory action.
# Effective since: Indigo 0.7.4, Jade and Kinetic 0.8.3

# The trajectory to execute 
RobotTrajectory trajectory

# Set this to true if the service should block until the execution is complete
bool wait_for_execution


================================================================================
MSG: moveit_msgs/RobotTrajectory
trajectory_msgs/JointTrajectory joint_trajectory
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
---

# Error code - encodes the overall reason for failure
MoveItErrorCodes error_code


================================================================================
MSG: moveit_msgs/MoveItErrorCodes
int32 val

# overall behavior
int32 SUCCESS=1
int32 FAILURE=99999

int32 PLANNING_FAILED=-1
int32 INVALID_MOTION_PLAN=-2
int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3
int32 CONTROL_FAILED=-4
int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5
int32 TIMED_OUT=-6
int32 PREEMPTED=-7

# planning & kinematics request errors
int32 START_STATE_IN_COLLISION=-10
int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11

int32 GOAL_IN_COLLISION=-12
int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13
int32 GOAL_CONSTRAINTS_VIOLATED=-14

int32 INVALID_GROUP_NAME=-15
int32 INVALID_GOAL_CONSTRAINTS=-16
int32 INVALID_ROBOT_STATE=-17
int32 INVALID_LINK_NAME=-18
int32 INVALID_OBJECT_NAME=-19

# system errors
int32 FRAME_TRANSFORM_FAILURE=-21
int32 COLLISION_CHECKING_UNAVAILABLE=-22
int32 ROBOT_STATE_STALE=-23
int32 SENSOR_INFO_STALE=-24
int32 COMMUNICATION_FAILURE=-25

# kinematics errors
int32 NO_IK_SOLUTION=-31
")

(setf (get moveit_msgs::ExecuteKnownTrajectoryResponse :md5sum-) "90682c5b72fe34a7ac8538ce473e228b")
(setf (get moveit_msgs::ExecuteKnownTrajectoryResponse :datatype-) "moveit_msgs/ExecuteKnownTrajectoryResponse")
(setf (get moveit_msgs::ExecuteKnownTrajectoryResponse :definition-)
      "# This service is deprecated and will go away at some point. For new development use the ExecuteTrajectory action.
# Effective since: Indigo 0.7.4, Jade and Kinetic 0.8.3

# The trajectory to execute 
RobotTrajectory trajectory

# Set this to true if the service should block until the execution is complete
bool wait_for_execution


================================================================================
MSG: moveit_msgs/RobotTrajectory
trajectory_msgs/JointTrajectory joint_trajectory
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
---

# Error code - encodes the overall reason for failure
MoveItErrorCodes error_code


================================================================================
MSG: moveit_msgs/MoveItErrorCodes
int32 val

# overall behavior
int32 SUCCESS=1
int32 FAILURE=99999

int32 PLANNING_FAILED=-1
int32 INVALID_MOTION_PLAN=-2
int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3
int32 CONTROL_FAILED=-4
int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5
int32 TIMED_OUT=-6
int32 PREEMPTED=-7

# planning & kinematics request errors
int32 START_STATE_IN_COLLISION=-10
int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11

int32 GOAL_IN_COLLISION=-12
int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13
int32 GOAL_CONSTRAINTS_VIOLATED=-14

int32 INVALID_GROUP_NAME=-15
int32 INVALID_GOAL_CONSTRAINTS=-16
int32 INVALID_ROBOT_STATE=-17
int32 INVALID_LINK_NAME=-18
int32 INVALID_OBJECT_NAME=-19

# system errors
int32 FRAME_TRANSFORM_FAILURE=-21
int32 COLLISION_CHECKING_UNAVAILABLE=-22
int32 ROBOT_STATE_STALE=-23
int32 SENSOR_INFO_STALE=-24
int32 COMMUNICATION_FAILURE=-25

# kinematics errors
int32 NO_IK_SOLUTION=-31
")



(provide :moveit_msgs/ExecuteKnownTrajectory "90682c5b72fe34a7ac8538ce473e228b")


