; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude LinkPadding.msg.html

(cl:defclass <LinkPadding> (roslisp-msg-protocol:ros-message)
  ((link_name
    :reader link_name
    :initarg :link_name
    :type cl:string
    :initform "")
   (padding
    :reader padding
    :initarg :padding
    :type cl:float
    :initform 0.0))
)

(cl:defclass LinkPadding (<LinkPadding>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LinkPadding>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LinkPadding)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<LinkPadding> is deprecated: use moveit_msgs-msg:LinkPadding instead.")))

(cl:ensure-generic-function 'link_name-val :lambda-list '(m))
(cl:defmethod link_name-val ((m <LinkPadding>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:link_name-val is deprecated.  Use moveit_msgs-msg:link_name instead.")
  (link_name m))

(cl:ensure-generic-function 'padding-val :lambda-list '(m))
(cl:defmethod padding-val ((m <LinkPadding>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:padding-val is deprecated.  Use moveit_msgs-msg:padding instead.")
  (padding m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LinkPadding>) ostream)
  "Serializes a message object of type '<LinkPadding>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'link_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'link_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'padding))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LinkPadding>) istream)
  "Deserializes a message object of type '<LinkPadding>"
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
    (cl:setf (cl:slot-value msg 'padding) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LinkPadding>)))
  "Returns string type for a message object of type '<LinkPadding>"
  "moveit_msgs/LinkPadding")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LinkPadding)))
  "Returns string type for a message object of type 'LinkPadding"
  "moveit_msgs/LinkPadding")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LinkPadding>)))
  "Returns md5sum for a message object of type '<LinkPadding>"
  "b3ea75670df55c696fedee97774d5947")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LinkPadding)))
  "Returns md5sum for a message object of type 'LinkPadding"
  "b3ea75670df55c696fedee97774d5947")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LinkPadding>)))
  "Returns full string definition for message of type '<LinkPadding>"
  (cl:format cl:nil "#name for the link~%string link_name~%~%# padding to apply to the link~%float64 padding~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LinkPadding)))
  "Returns full string definition for message of type 'LinkPadding"
  (cl:format cl:nil "#name for the link~%string link_name~%~%# padding to apply to the link~%float64 padding~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LinkPadding>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'link_name))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LinkPadding>))
  "Converts a ROS message object to a list"
  (cl:list 'LinkPadding
    (cl:cons ':link_name (link_name msg))
    (cl:cons ':padding (padding msg))
))
