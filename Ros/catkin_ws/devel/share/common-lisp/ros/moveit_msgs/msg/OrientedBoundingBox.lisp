; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude OrientedBoundingBox.msg.html

(cl:defclass <OrientedBoundingBox> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (extents
    :reader extents
    :initarg :extents
    :type geometry_msgs-msg:Point32
    :initform (cl:make-instance 'geometry_msgs-msg:Point32)))
)

(cl:defclass OrientedBoundingBox (<OrientedBoundingBox>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OrientedBoundingBox>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OrientedBoundingBox)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<OrientedBoundingBox> is deprecated: use moveit_msgs-msg:OrientedBoundingBox instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <OrientedBoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:pose-val is deprecated.  Use moveit_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'extents-val :lambda-list '(m))
(cl:defmethod extents-val ((m <OrientedBoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:extents-val is deprecated.  Use moveit_msgs-msg:extents instead.")
  (extents m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OrientedBoundingBox>) ostream)
  "Serializes a message object of type '<OrientedBoundingBox>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'extents) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OrientedBoundingBox>) istream)
  "Deserializes a message object of type '<OrientedBoundingBox>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'extents) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OrientedBoundingBox>)))
  "Returns string type for a message object of type '<OrientedBoundingBox>"
  "moveit_msgs/OrientedBoundingBox")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OrientedBoundingBox)))
  "Returns string type for a message object of type 'OrientedBoundingBox"
  "moveit_msgs/OrientedBoundingBox")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OrientedBoundingBox>)))
  "Returns md5sum for a message object of type '<OrientedBoundingBox>"
  "da3bd98e7cb14efa4141367a9d886ee7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OrientedBoundingBox)))
  "Returns md5sum for a message object of type 'OrientedBoundingBox"
  "da3bd98e7cb14efa4141367a9d886ee7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OrientedBoundingBox>)))
  "Returns full string definition for message of type '<OrientedBoundingBox>"
  (cl:format cl:nil "# the pose of the box~%geometry_msgs/Pose pose~%~%# the extents of the box, assuming the center is at the origin~%geometry_msgs/Point32 extents~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OrientedBoundingBox)))
  "Returns full string definition for message of type 'OrientedBoundingBox"
  (cl:format cl:nil "# the pose of the box~%geometry_msgs/Pose pose~%~%# the extents of the box, assuming the center is at the origin~%geometry_msgs/Point32 extents~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OrientedBoundingBox>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'extents))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OrientedBoundingBox>))
  "Converts a ROS message object to a list"
  (cl:list 'OrientedBoundingBox
    (cl:cons ':pose (pose msg))
    (cl:cons ':extents (extents msg))
))
