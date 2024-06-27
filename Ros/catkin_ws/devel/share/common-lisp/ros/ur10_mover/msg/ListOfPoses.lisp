; Auto-generated. Do not edit!


(cl:in-package ur10_mover-msg)


;//! \htmlinclude ListOfPoses.msg.html

(cl:defclass <ListOfPoses> (roslisp-msg-protocol:ros-message)
  ((pose_list
    :reader pose_list
    :initarg :pose_list
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose))))
)

(cl:defclass ListOfPoses (<ListOfPoses>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListOfPoses>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListOfPoses)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-msg:<ListOfPoses> is deprecated: use ur10_mover-msg:ListOfPoses instead.")))

(cl:ensure-generic-function 'pose_list-val :lambda-list '(m))
(cl:defmethod pose_list-val ((m <ListOfPoses>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-msg:pose_list-val is deprecated.  Use ur10_mover-msg:pose_list instead.")
  (pose_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListOfPoses>) ostream)
  "Serializes a message object of type '<ListOfPoses>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pose_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListOfPoses>) istream)
  "Deserializes a message object of type '<ListOfPoses>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListOfPoses>)))
  "Returns string type for a message object of type '<ListOfPoses>"
  "ur10_mover/ListOfPoses")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListOfPoses)))
  "Returns string type for a message object of type 'ListOfPoses"
  "ur10_mover/ListOfPoses")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListOfPoses>)))
  "Returns md5sum for a message object of type '<ListOfPoses>"
  "5e5f9729e6eac8b890e586b463fdbada")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListOfPoses)))
  "Returns md5sum for a message object of type 'ListOfPoses"
  "5e5f9729e6eac8b890e586b463fdbada")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListOfPoses>)))
  "Returns full string definition for message of type '<ListOfPoses>"
  (cl:format cl:nil "geometry_msgs/Pose[] pose_list~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListOfPoses)))
  "Returns full string definition for message of type 'ListOfPoses"
  (cl:format cl:nil "geometry_msgs/Pose[] pose_list~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListOfPoses>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListOfPoses>))
  "Converts a ROS message object to a list"
  (cl:list 'ListOfPoses
    (cl:cons ':pose_list (pose_list msg))
))
