; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude ExecuteKnownTrajectory-request.msg.html

(cl:defclass <ExecuteKnownTrajectory-request> (roslisp-msg-protocol:ros-message)
  ((trajectory
    :reader trajectory
    :initarg :trajectory
    :type moveit_msgs-msg:RobotTrajectory
    :initform (cl:make-instance 'moveit_msgs-msg:RobotTrajectory))
   (wait_for_execution
    :reader wait_for_execution
    :initarg :wait_for_execution
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ExecuteKnownTrajectory-request (<ExecuteKnownTrajectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecuteKnownTrajectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecuteKnownTrajectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ExecuteKnownTrajectory-request> is deprecated: use moveit_msgs-srv:ExecuteKnownTrajectory-request instead.")))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <ExecuteKnownTrajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:trajectory-val is deprecated.  Use moveit_msgs-srv:trajectory instead.")
  (trajectory m))

(cl:ensure-generic-function 'wait_for_execution-val :lambda-list '(m))
(cl:defmethod wait_for_execution-val ((m <ExecuteKnownTrajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:wait_for_execution-val is deprecated.  Use moveit_msgs-srv:wait_for_execution instead.")
  (wait_for_execution m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecuteKnownTrajectory-request>) ostream)
  "Serializes a message object of type '<ExecuteKnownTrajectory-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wait_for_execution) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecuteKnownTrajectory-request>) istream)
  "Deserializes a message object of type '<ExecuteKnownTrajectory-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
    (cl:setf (cl:slot-value msg 'wait_for_execution) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecuteKnownTrajectory-request>)))
  "Returns string type for a service object of type '<ExecuteKnownTrajectory-request>"
  "moveit_msgs/ExecuteKnownTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteKnownTrajectory-request)))
  "Returns string type for a service object of type 'ExecuteKnownTrajectory-request"
  "moveit_msgs/ExecuteKnownTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecuteKnownTrajectory-request>)))
  "Returns md5sum for a message object of type '<ExecuteKnownTrajectory-request>"
  "90682c5b72fe34a7ac8538ce473e228b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecuteKnownTrajectory-request)))
  "Returns md5sum for a message object of type 'ExecuteKnownTrajectory-request"
  "90682c5b72fe34a7ac8538ce473e228b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecuteKnownTrajectory-request>)))
  "Returns full string definition for message of type '<ExecuteKnownTrajectory-request>"
  (cl:format cl:nil "# This service is deprecated and will go away at some point. For new development use the ExecuteTrajectory action.~%# Effective since: Indigo 0.7.4, Jade and Kinetic 0.8.3~%~%# The trajectory to execute ~%RobotTrajectory trajectory~%~%# Set this to true if the service should block until the execution is complete~%bool wait_for_execution~%~%~%================================================================================~%MSG: moveit_msgs/RobotTrajectory~%trajectory_msgs/JointTrajectory joint_trajectory~%trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectory~%# The header is used to specify the coordinate frame and the reference time for the trajectory durations~%Header header~%~%# A representation of a multi-dof joint trajectory (each point is a transformation)~%# Each point along the trajectory will include an array of positions/velocities/accelerations~%# that has the same length as the array of joint names, and has the same order of joints as ~%# the joint names array.~%~%string[] joint_names~%MultiDOFJointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint~%# Each multi-dof joint can specify a transform (up to 6 DOF)~%geometry_msgs/Transform[] transforms~%~%# There can be a velocity specified for the origin of the joint ~%geometry_msgs/Twist[] velocities~%~%# There can be an acceleration specified for the origin of the joint ~%geometry_msgs/Twist[] accelerations~%~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecuteKnownTrajectory-request)))
  "Returns full string definition for message of type 'ExecuteKnownTrajectory-request"
  (cl:format cl:nil "# This service is deprecated and will go away at some point. For new development use the ExecuteTrajectory action.~%# Effective since: Indigo 0.7.4, Jade and Kinetic 0.8.3~%~%# The trajectory to execute ~%RobotTrajectory trajectory~%~%# Set this to true if the service should block until the execution is complete~%bool wait_for_execution~%~%~%================================================================================~%MSG: moveit_msgs/RobotTrajectory~%trajectory_msgs/JointTrajectory joint_trajectory~%trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectory~%# The header is used to specify the coordinate frame and the reference time for the trajectory durations~%Header header~%~%# A representation of a multi-dof joint trajectory (each point is a transformation)~%# Each point along the trajectory will include an array of positions/velocities/accelerations~%# that has the same length as the array of joint names, and has the same order of joints as ~%# the joint names array.~%~%string[] joint_names~%MultiDOFJointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint~%# Each multi-dof joint can specify a transform (up to 6 DOF)~%geometry_msgs/Transform[] transforms~%~%# There can be a velocity specified for the origin of the joint ~%geometry_msgs/Twist[] velocities~%~%# There can be an acceleration specified for the origin of the joint ~%geometry_msgs/Twist[] accelerations~%~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecuteKnownTrajectory-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecuteKnownTrajectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecuteKnownTrajectory-request
    (cl:cons ':trajectory (trajectory msg))
    (cl:cons ':wait_for_execution (wait_for_execution msg))
))
;//! \htmlinclude ExecuteKnownTrajectory-response.msg.html

(cl:defclass <ExecuteKnownTrajectory-response> (roslisp-msg-protocol:ros-message)
  ((error_code
    :reader error_code
    :initarg :error_code
    :type moveit_msgs-msg:MoveItErrorCodes
    :initform (cl:make-instance 'moveit_msgs-msg:MoveItErrorCodes)))
)

(cl:defclass ExecuteKnownTrajectory-response (<ExecuteKnownTrajectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecuteKnownTrajectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecuteKnownTrajectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ExecuteKnownTrajectory-response> is deprecated: use moveit_msgs-srv:ExecuteKnownTrajectory-response instead.")))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <ExecuteKnownTrajectory-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:error_code-val is deprecated.  Use moveit_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecuteKnownTrajectory-response>) ostream)
  "Serializes a message object of type '<ExecuteKnownTrajectory-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error_code) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecuteKnownTrajectory-response>) istream)
  "Deserializes a message object of type '<ExecuteKnownTrajectory-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error_code) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecuteKnownTrajectory-response>)))
  "Returns string type for a service object of type '<ExecuteKnownTrajectory-response>"
  "moveit_msgs/ExecuteKnownTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteKnownTrajectory-response)))
  "Returns string type for a service object of type 'ExecuteKnownTrajectory-response"
  "moveit_msgs/ExecuteKnownTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecuteKnownTrajectory-response>)))
  "Returns md5sum for a message object of type '<ExecuteKnownTrajectory-response>"
  "90682c5b72fe34a7ac8538ce473e228b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecuteKnownTrajectory-response)))
  "Returns md5sum for a message object of type 'ExecuteKnownTrajectory-response"
  "90682c5b72fe34a7ac8538ce473e228b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecuteKnownTrajectory-response>)))
  "Returns full string definition for message of type '<ExecuteKnownTrajectory-response>"
  (cl:format cl:nil "~%# Error code - encodes the overall reason for failure~%MoveItErrorCodes error_code~%~%~%================================================================================~%MSG: moveit_msgs/MoveItErrorCodes~%int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecuteKnownTrajectory-response)))
  "Returns full string definition for message of type 'ExecuteKnownTrajectory-response"
  (cl:format cl:nil "~%# Error code - encodes the overall reason for failure~%MoveItErrorCodes error_code~%~%~%================================================================================~%MSG: moveit_msgs/MoveItErrorCodes~%int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecuteKnownTrajectory-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error_code))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecuteKnownTrajectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecuteKnownTrajectory-response
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecuteKnownTrajectory)))
  'ExecuteKnownTrajectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecuteKnownTrajectory)))
  'ExecuteKnownTrajectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecuteKnownTrajectory)))
  "Returns string type for a service object of type '<ExecuteKnownTrajectory>"
  "moveit_msgs/ExecuteKnownTrajectory")