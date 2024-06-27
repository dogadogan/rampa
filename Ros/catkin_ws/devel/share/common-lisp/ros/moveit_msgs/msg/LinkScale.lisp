; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude LinkScale.msg.html

(cl:defclass <LinkScale> (roslisp-msg-protocol:ros-message)
  ((link_name
    :reader link_name
    :initarg :link_name
    :type cl:string
    :initform "")
   (scale
    :reader scale
    :initarg :scale
    :type cl:float
    :initform 0.0))
)

(cl:defclass LinkScale (<LinkScale>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LinkScale>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LinkScale)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<LinkScale> is deprecated: use moveit_msgs-msg:LinkScale instead.")))

(cl:ensure-generic-function 'link_name-val :lambda-list '(m))
(cl:defmethod link_name-val ((m <LinkScale>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:link_name-val is deprecated.  Use moveit_msgs-msg:link_name instead.")
  (link_name m))

(cl:ensure-generic-function 'scale-val :lambda-list '(m))
(cl:defmethod scale-val ((m <LinkScale>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:scale-val is deprecated.  Use moveit_msgs-msg:scale instead.")
  (scale m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LinkScale>) ostream)
  "Serializes a message object of type '<LinkScale>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'link_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'link_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'scale))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LinkScale>) istream)
  "Deserializes a message object of type '<LinkScale>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'link_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'link_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'scale) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LinkScale>)))
  "Returns string type for a message object of type '<LinkScale>"
  "moveit_msgs/LinkScale")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LinkScale)))
  "Returns string type for a message object of type 'LinkScale"
  "moveit_msgs/LinkScale")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LinkScale>)))
  "Returns md5sum for a message object of type '<LinkScale>"
  "19faf226446bfb2f645a4da6f2a56166")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LinkScale)))
  "Returns md5sum for a message object of type 'LinkScale"
  "19faf226446bfb2f645a4da6f2a56166")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LinkScale>)))
  "Returns full string definition for message of type '<LinkScale>"
  (cl:format cl:nil "#name for the link~%string link_name~%~%# scaling to apply to the link~%float64 scale~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LinkScale)))
  "Returns full string definition for message of type 'LinkScale"
  (cl:format cl:nil "#name for the link~%string link_name~%~%# scaling to apply to the link~%float64 scale~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LinkScale>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'link_name))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LinkScale>))
  "Converts a ROS message object to a list"
  (cl:list 'LinkScale
    (cl:cons ':link_name (link_name msg))
    (cl:cons ':scale (scale msg))
))
