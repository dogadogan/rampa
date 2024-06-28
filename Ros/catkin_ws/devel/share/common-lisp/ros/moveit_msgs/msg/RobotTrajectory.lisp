; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude RobotTrajectory.msg.html

(cl:defclass <RobotTrajectory> (roslisp-msg-protocol:ros-message)
  ((joint_trajectory
    :reader joint_trajectory
    :initarg :joint_trajectory
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory))
   (multi_dof_joint_trajectory
    :reader multi_dof_joint_trajectory
    :initarg :multi_dof_joint_trajectory
    :type trajectory_msgs-msg:MultiDOFJointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:MultiDOFJointTrajectory)))
)

(cl:defclass RobotTrajectory (<RobotTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<RobotTrajectory> is deprecated: use moveit_msgs-msg:RobotTrajectory instead.")))

(cl:ensure-generic-function 'joint_trajectory-val :lambda-list '(m))
(cl:defmethod joint_trajectory-val ((m <RobotTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:joint_trajectory-val is deprecated.  Use moveit_msgs-msg:joint_trajectory instead.")
  (joint_trajectory m))

(cl:ensure-generic-function 'multi_dof_joint_trajectory-val :lambda-list '(m))
(cl:defmethod multi_dof_joint_trajectory-val ((m <RobotTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:multi_dof_joint_trajectory-val is deprecated.  Use moveit_msgs-msg:multi_dof_joint_trajectory instead.")
  (multi_dof_joint_trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotTrajectory>) ostream)
  "Serializes a message object of type '<RobotTrajectory>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_trajectory) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'multi_dof_joint_trajectory) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotTrajectory>) istream)
  "Deserializes a message object of type '<RobotTrajectory>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_trajectory) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'multi_dof_joint_trajectory) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotTrajectory>)))
  "Returns string type for a message object of type '<RobotTrajectory>"
  "moveit_msgs/RobotTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotTrajectory)))
  "Returns string type for a message object of type 'RobotTrajectory"
  "moveit_msgs/RobotTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotTrajectory>)))
  "Returns md5sum for a message object of type '<RobotTrajectory>"
  "dfa9556423d709a3729bcef664bddf67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotTrajectory)))
  "Returns md5sum for a message object of type 'RobotTrajectory"
  "dfa9556423d709a3729bcef664bddf67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotTrajectory>)))
  "Returns full string definition for message of type '<RobotTrajectory>"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory joint_trajectory~%trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectory~%# The header is used to specify the coordinate frame and the reference time for the trajectory durations~%Header header~%~%# A representation of a multi-dof joint trajectory (each point is a transformation)~%# Each point along the trajectory will include an array of positions/velocities/accelerations~%# that has the same length as the array of joint names, and has the same order of joints as ~%# the joint names array.~%~%string[] joint_names~%MultiDOFJointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint~%# Each multi-dof joint can specify a transform (up to 6 DOF)~%geometry_msgs/Transform[] transforms~%~%# There can be a velocity specified for the origin of the joint ~%geometry_msgs/Twist[] velocities~%~%# There can be an acceleration specified for the origin of the joint ~%geometry_msgs/Twist[] accelerations~%~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotTrajectory)))
  "Returns full string definition for message of type 'RobotTrajectory"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory joint_trajectory~%trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectory~%# The header is used to specify the coordinate frame and the reference time for the trajectory durations~%Header header~%~%# A representation of a multi-dof joint trajectory (each point is a transformation)~%# Each point along the trajectory will include an array of positions/velocities/accelerations~%# that has the same length as the array of joint names, and has the same order of joints as ~%# the joint names array.~%~%string[] joint_names~%MultiDOFJointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint~%# Each multi-dof joint can specify a transform (up to 6 DOF)~%geometry_msgs/Transform[] transforms~%~%# There can be a velocity specified for the origin of the joint ~%geometry_msgs/Twist[] velocities~%~%# There can be an acceleration specified for the origin of the joint ~%geometry_msgs/Twist[] accelerations~%~%duration time_from_start~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotTrajectory>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_trajectory))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'multi_dof_joint_trajectory))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotTrajectory
    (cl:cons ':joint_trajectory (joint_trajectory msg))
    (cl:cons ':multi_dof_joint_trajectory (multi_dof_joint_trajectory msg))
))
