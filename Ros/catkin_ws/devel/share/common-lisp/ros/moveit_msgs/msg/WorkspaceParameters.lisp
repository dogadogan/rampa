; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude WorkspaceParameters.msg.html

(cl:defclass <WorkspaceParameters> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (min_corner
    :reader min_corner
    :initarg :min_corner
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (max_corner
    :reader max_corner
    :initarg :max_corner
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass WorkspaceParameters (<WorkspaceParameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WorkspaceParameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WorkspaceParameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<WorkspaceParameters> is deprecated: use moveit_msgs-msg:WorkspaceParameters instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <WorkspaceParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:header-val is deprecated.  Use moveit_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'min_corner-val :lambda-list '(m))
(cl:defmethod min_corner-val ((m <WorkspaceParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:min_corner-val is deprecated.  Use moveit_msgs-msg:min_corner instead.")
  (min_corner m))

(cl:ensure-generic-function 'max_corner-val :lambda-list '(m))
(cl:defmethod max_corner-val ((m <WorkspaceParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:max_corner-val is deprecated.  Use moveit_msgs-msg:max_corner instead.")
  (max_corner m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WorkspaceParameters>) ostream)
  "Serializes a message object of type '<WorkspaceParameters>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'min_corner) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'max_corner) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WorkspaceParameters>) istream)
  "Deserializes a message object of type '<WorkspaceParameters>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'min_corner) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'max_corner) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WorkspaceParameters>)))
  "Returns string type for a message object of type '<WorkspaceParameters>"
  "moveit_msgs/WorkspaceParameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WorkspaceParameters)))
  "Returns string type for a message object of type 'WorkspaceParameters"
  "moveit_msgs/WorkspaceParameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WorkspaceParameters>)))
  "Returns md5sum for a message object of type '<WorkspaceParameters>"
  "d639a834e7b1f927e9f1d6c30e920016")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WorkspaceParameters)))
  "Returns md5sum for a message object of type 'WorkspaceParameters"
  "d639a834e7b1f927e9f1d6c30e920016")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WorkspaceParameters>)))
  "Returns full string definition for message of type '<WorkspaceParameters>"
  (cl:format cl:nil "# This message contains a set of parameters useful in~%# setting up the volume (a box) in which the robot is allowed to move.~%# This is useful only when planning for mobile parts of ~%# the robot as well.~%~%# Define the frame of reference for the box corners~%Header header~%~%# The minumum corner of the box, with respect to the robot starting pose~%geometry_msgs/Vector3 min_corner~%~%# The maximum corner of the box, with respect to the robot starting pose~%geometry_msgs/Vector3 max_corner~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WorkspaceParameters)))
  "Returns full string definition for message of type 'WorkspaceParameters"
  (cl:format cl:nil "# This message contains a set of parameters useful in~%# setting up the volume (a box) in which the robot is allowed to move.~%# This is useful only when planning for mobile parts of ~%# the robot as well.~%~%# Define the frame of reference for the box corners~%Header header~%~%# The minumum corner of the box, with respect to the robot starting pose~%geometry_msgs/Vector3 min_corner~%~%# The maximum corner of the box, with respect to the robot starting pose~%geometry_msgs/Vector3 max_corner~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WorkspaceParameters>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'min_corner))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'max_corner))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WorkspaceParameters>))
  "Converts a ROS message object to a list"
  (cl:list 'WorkspaceParameters
    (cl:cons ':header (header msg))
    (cl:cons ':min_corner (min_corner msg))
    (cl:cons ':max_corner (max_corner msg))
))
