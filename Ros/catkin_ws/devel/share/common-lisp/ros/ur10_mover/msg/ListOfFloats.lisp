; Auto-generated. Do not edit!


(cl:in-package ur10_mover-msg)


;//! \htmlinclude ListOfFloats.msg.html

(cl:defclass <ListOfFloats> (roslisp-msg-protocol:ros-message)
  ((list
    :reader list
    :initarg :list
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ListOfFloats (<ListOfFloats>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListOfFloats>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListOfFloats)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-msg:<ListOfFloats> is deprecated: use ur10_mover-msg:ListOfFloats instead.")))

(cl:ensure-generic-function 'list-val :lambda-list '(m))
(cl:defmethod list-val ((m <ListOfFloats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-msg:list-val is deprecated.  Use ur10_mover-msg:list instead.")
  (list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListOfFloats>) ostream)
  "Serializes a message object of type '<ListOfFloats>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListOfFloats>) istream)
  "Deserializes a message object of type '<ListOfFloats>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListOfFloats>)))
  "Returns string type for a message object of type '<ListOfFloats>"
  "ur10_mover/ListOfFloats")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListOfFloats)))
  "Returns string type for a message object of type 'ListOfFloats"
  "ur10_mover/ListOfFloats")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListOfFloats>)))
  "Returns md5sum for a message object of type '<ListOfFloats>"
  "c927dcaf1d3ff0b9aa7fd844cd956a22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListOfFloats)))
  "Returns md5sum for a message object of type 'ListOfFloats"
  "c927dcaf1d3ff0b9aa7fd844cd956a22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListOfFloats>)))
  "Returns full string definition for message of type '<ListOfFloats>"
  (cl:format cl:nil "float64[] list~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListOfFloats)))
  "Returns full string definition for message of type 'ListOfFloats"
  (cl:format cl:nil "float64[] list~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListOfFloats>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListOfFloats>))
  "Converts a ROS message object to a list"
  (cl:list 'ListOfFloats
    (cl:cons ':list (list msg))
))
