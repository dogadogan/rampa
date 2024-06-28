; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude ObjectColor.msg.html

(cl:defclass <ObjectColor> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (color
    :reader color
    :initarg :color
    :type std_msgs-msg:ColorRGBA
    :initform (cl:make-instance 'std_msgs-msg:ColorRGBA)))
)

(cl:defclass ObjectColor (<ObjectColor>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectColor>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectColor)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<ObjectColor> is deprecated: use moveit_msgs-msg:ObjectColor instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ObjectColor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:id-val is deprecated.  Use moveit_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <ObjectColor>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:color-val is deprecated.  Use moveit_msgs-msg:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectColor>) ostream)
  "Serializes a message object of type '<ObjectColor>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'color) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectColor>) istream)
  "Deserializes a message object of type '<ObjectColor>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'color) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectColor>)))
  "Returns string type for a message object of type '<ObjectColor>"
  "moveit_msgs/ObjectColor")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectColor)))
  "Returns string type for a message object of type 'ObjectColor"
  "moveit_msgs/ObjectColor")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectColor>)))
  "Returns md5sum for a message object of type '<ObjectColor>"
  "ec3bd6f103430e64b2ae706a67d8488e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectColor)))
  "Returns md5sum for a message object of type 'ObjectColor"
  "ec3bd6f103430e64b2ae706a67d8488e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectColor>)))
  "Returns full string definition for message of type '<ObjectColor>"
  (cl:format cl:nil "# The object id for which we specify color~%string id~%~%# The value of the color~%std_msgs/ColorRGBA color~%~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectColor)))
  "Returns full string definition for message of type 'ObjectColor"
  (cl:format cl:nil "# The object id for which we specify color~%string id~%~%# The value of the color~%std_msgs/ColorRGBA color~%~%================================================================================~%MSG: std_msgs/ColorRGBA~%float32 r~%float32 g~%float32 b~%float32 a~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectColor>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'color))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectColor>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectColor
    (cl:cons ':id (id msg))
    (cl:cons ':color (color msg))
))
