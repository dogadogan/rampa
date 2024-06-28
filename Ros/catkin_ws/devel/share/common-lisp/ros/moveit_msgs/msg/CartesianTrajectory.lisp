; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude CartesianTrajectory.msg.html

(cl:defclass <CartesianTrajectory> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tracked_frame
    :reader tracked_frame
    :initarg :tracked_frame
    :type cl:string
    :initform "")
   (points
    :reader points
    :initarg :points
    :type (cl:vector moveit_msgs-msg:CartesianTrajectoryPoint)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:CartesianTrajectoryPoint :initial-element (cl:make-instance 'moveit_msgs-msg:CartesianTrajectoryPoint))))
)

(cl:defclass CartesianTrajectory (<CartesianTrajectory>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CartesianTrajectory>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CartesianTrajectory)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<CartesianTrajectory> is deprecated: use moveit_msgs-msg:CartesianTrajectory instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <CartesianTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:header-val is deprecated.  Use moveit_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tracked_frame-val :lambda-list '(m))
(cl:defmethod tracked_frame-val ((m <CartesianTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:tracked_frame-val is deprecated.  Use moveit_msgs-msg:tracked_frame instead.")
  (tracked_frame m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <CartesianTrajectory>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:points-val is deprecated.  Use moveit_msgs-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CartesianTrajectory>) ostream)
  "Serializes a message object of type '<CartesianTrajectory>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'tracked_frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'tracked_frame))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CartesianTrajectory>) istream)
  "Deserializes a message object of type '<CartesianTrajectory>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tracked_frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'tracked_frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:CartesianTrajectoryPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CartesianTrajectory>)))
  "Returns string type for a message object of type '<CartesianTrajectory>"
  "moveit_msgs/CartesianTrajectory")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CartesianTrajectory)))
  "Returns string type for a message object of type 'CartesianTrajectory"
  "moveit_msgs/CartesianTrajectory")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CartesianTrajectory>)))
  "Returns md5sum for a message object of type '<CartesianTrajectory>"
  "4886769850ce858fcceba546fd5c793b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CartesianTrajectory)))
  "Returns md5sum for a message object of type 'CartesianTrajectory"
  "4886769850ce858fcceba546fd5c793b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CartesianTrajectory>)))
  "Returns full string definition for message of type '<CartesianTrajectory>"
  (cl:format cl:nil "# This message describes the trajectory of a tracked frame in task-space~%Header header~%~%# The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id~%string tracked_frame~%~%CartesianTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: moveit_msgs/CartesianTrajectoryPoint~%# The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,~%# following the pattern of the JointTrajectory message~%CartesianPoint point~%~%duration time_from_start~%~%================================================================================~%MSG: moveit_msgs/CartesianPoint~%# This message defines a point in a cartesian trajectory~%geometry_msgs/Pose pose~%geometry_msgs/Twist velocity~%geometry_msgs/Accel acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CartesianTrajectory)))
  "Returns full string definition for message of type 'CartesianTrajectory"
  (cl:format cl:nil "# This message describes the trajectory of a tracked frame in task-space~%Header header~%~%# The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id~%string tracked_frame~%~%CartesianTrajectoryPoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: moveit_msgs/CartesianTrajectoryPoint~%# The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,~%# following the pattern of the JointTrajectory message~%CartesianPoint point~%~%duration time_from_start~%~%================================================================================~%MSG: moveit_msgs/CartesianPoint~%# This message defines a point in a cartesian trajectory~%geometry_msgs/Pose pose~%geometry_msgs/Twist velocity~%geometry_msgs/Accel acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CartesianTrajectory>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'tracked_frame))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CartesianTrajectory>))
  "Converts a ROS message object to a list"
  (cl:list 'CartesianTrajectory
    (cl:cons ':header (header msg))
    (cl:cons ':tracked_frame (tracked_frame msg))
    (cl:cons ':points (points msg))
))
