; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude GenericTrajectory.msg.html

(cl:defclass <GenericTrajectory> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (joint_trajectory
    :reader joint_trajectory
    :initarg :joint_trajectory
    :type (cl:vector trajectory_msgs-msg:JointTrajectory)
   :initform (cl:make-array 0 :element-type 'trajectory_msgs-msg:JointTrajectory :initial-element (cl:make-instance 'trajectory_msgs-msg:JointTrajectory)))
   (cartesian_trajectory
    :reader cartesian_trajectory
    :initarg :cartesian_trajectory
    :type (cl:vector moveit_msgs-msg:CartesianTrajectory)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:CartesianTrajectory :initial-element (cl:make-instance 'moveit_msgs-msg:CartesianTrajectory))))
)

(cl:defclass GenericTrajectory (<GenericTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GenericTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GenericTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<GenericTrajectory> is deprecated: use moveit_msgs-msg:GenericTrajectory instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GenericTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:header-val is deprecated.  Use moveit_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'joint_trajectory-val :lambda-list '(m))
(cl:defmethod joint_trajectory-val ((m <GenericTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:joint_trajectory-val is deprecated.  Use moveit_msgs-msg:joint_trajectory instead.")
  (joint_trajectory m))

(cl:ensure-generic-function 'cartesian_trajectory-val :lambda-list '(m))
(cl:defmethod cartesian_trajectory-val ((m <GenericTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:cartesian_trajectory-val is deprecated.  Use moveit_msgs-msg:cartesian_trajectory instead.")
  (cartesian_trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GenericTrajectory>) ostream)
  "Serializes a message object of type '<GenericTrajectory>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_trajectory))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joint_trajectory))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cartesian_trajectory))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'cartesian_trajectory))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GenericTrajectory>) istream)
  "Deserializes a message object of type '<GenericTrajectory>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_trajectory) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_trajectory)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'trajectory_msgs-msg:JointTrajectory))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cartesian_trajectory) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cartesian_trajectory)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:CartesianTrajectory))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GenericTrajectory>)))
  "Returns string type for a message object of type '<GenericTrajectory>"
  "moveit_msgs/GenericTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GenericTrajectory)))
  "Returns string type for a message object of type 'GenericTrajectory"
  "moveit_msgs/GenericTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GenericTrajectory>)))
  "Returns md5sum for a message object of type '<GenericTrajectory>"
  "d68b5c73072efa2012238a77e49c2c58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GenericTrajectory)))
  "Returns md5sum for a message object of type 'GenericTrajectory"
  "d68b5c73072efa2012238a77e49c2c58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GenericTrajectory>)))
  "Returns full string definition for message of type '<GenericTrajectory>"
  (cl:format cl:nil "# A generic trajectory message that may either encode a joint- or cartesian-space trajectory, or both~%# Trajectories encoded in this message are considered semantically equivalent~%Header header~%trajectory_msgs/JointTrajectory[] joint_trajectory~%moveit_msgs/CartesianTrajectory[] cartesian_trajectory~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: moveit_msgs/CartesianTrajectory~%# This message describes the trajectory of a tracked frame in task-space~%Header header~%~%# The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id~%string tracked_frame~%~%CartesianTrajectoryPoint[] points~%~%================================================================================~%MSG: moveit_msgs/CartesianTrajectoryPoint~%# The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,~%# following the pattern of the JointTrajectory message~%CartesianPoint point~%~%duration time_from_start~%~%================================================================================~%MSG: moveit_msgs/CartesianPoint~%# This message defines a point in a cartesian trajectory~%geometry_msgs/Pose pose~%geometry_msgs/Twist velocity~%geometry_msgs/Accel acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GenericTrajectory)))
  "Returns full string definition for message of type 'GenericTrajectory"
  (cl:format cl:nil "# A generic trajectory message that may either encode a joint- or cartesian-space trajectory, or both~%# Trajectories encoded in this message are considered semantically equivalent~%Header header~%trajectory_msgs/JointTrajectory[] joint_trajectory~%moveit_msgs/CartesianTrajectory[] cartesian_trajectory~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%================================================================================~%MSG: moveit_msgs/CartesianTrajectory~%# This message describes the trajectory of a tracked frame in task-space~%Header header~%~%# The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id~%string tracked_frame~%~%CartesianTrajectoryPoint[] points~%~%================================================================================~%MSG: moveit_msgs/CartesianTrajectoryPoint~%# The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,~%# following the pattern of the JointTrajectory message~%CartesianPoint point~%~%duration time_from_start~%~%================================================================================~%MSG: moveit_msgs/CartesianPoint~%# This message defines a point in a cartesian trajectory~%geometry_msgs/Pose pose~%geometry_msgs/Twist velocity~%geometry_msgs/Accel acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GenericTrajectory>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_trajectory) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cartesian_trajectory) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GenericTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'GenericTrajectory
    (cl:cons ':header (header msg))
    (cl:cons ':joint_trajectory (joint_trajectory msg))
    (cl:cons ':cartesian_trajectory (cartesian_trajectory msg))
))
