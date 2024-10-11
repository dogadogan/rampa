; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude AllowedCollisionEntry.msg.html

(cl:defclass <AllowedCollisionEntry> (roslisp-msg-protocol:ros-message)
  ((enabled
    :reader enabled
    :initarg :enabled
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass AllowedCollisionEntry (<AllowedCollisionEntry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AllowedCollisionEntry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AllowedCollisionEntry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<AllowedCollisionEntry> is deprecated: use moveit_msgs-msg:AllowedCollisionEntry instead.")))

(cl:ensure-generic-function 'enabled-val :lambda-list '(m))
(cl:defmethod enabled-val ((m <AllowedCollisionEntry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:enabled-val is deprecated.  Use moveit_msgs-msg:enabled instead.")
  (enabled m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AllowedCollisionEntry>) ostream)
  "Serializes a message object of type '<AllowedCollisionEntry>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'enabled))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'enabled))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AllowedCollisionEntry>) istream)
  "Deserializes a message object of type '<AllowedCollisionEntry>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'enabled) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'enabled)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AllowedCollisionEntry>)))
  "Returns string type for a message object of type '<AllowedCollisionEntry>"
  "moveit_msgs/AllowedCollisionEntry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AllowedCollisionEntry)))
  "Returns string type for a message object of type 'AllowedCollisionEntry"
  "moveit_msgs/AllowedCollisionEntry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AllowedCollisionEntry>)))
  "Returns md5sum for a message object of type '<AllowedCollisionEntry>"
  "90d1ae1850840724bb043562fe3285fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AllowedCollisionEntry)))
  "Returns md5sum for a message object of type 'AllowedCollisionEntry"
  "90d1ae1850840724bb043562fe3285fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AllowedCollisionEntry>)))
  "Returns full string definition for message of type '<AllowedCollisionEntry>"
  (cl:format cl:nil "# whether or not collision checking is enabled~%bool[] enabled~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AllowedCollisionEntry)))
  "Returns full string definition for message of type 'AllowedCollisionEntry"
  (cl:format cl:nil "# whether or not collision checking is enabled~%bool[] enabled~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AllowedCollisionEntry>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'enabled) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AllowedCollisionEntry>))
  "Converts a ROS message object to a list"
  (cl:list 'AllowedCollisionEntry
    (cl:cons ':enabled (enabled msg))
))
