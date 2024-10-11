; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude DiscardService-request.msg.html

(cl:defclass <DiscardService-request> (roslisp-msg-protocol:ros-message)
  ((input_msg
    :reader input_msg
    :initarg :input_msg
    :type cl:string
    :initform ""))
)

(cl:defclass DiscardService-request (<DiscardService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiscardService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiscardService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<DiscardService-request> is deprecated: use ur10_mover-srv:DiscardService-request instead.")))

(cl:ensure-generic-function 'input_msg-val :lambda-list '(m))
(cl:defmethod input_msg-val ((m <DiscardService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:input_msg-val is deprecated.  Use ur10_mover-srv:input_msg instead.")
  (input_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiscardService-request>) ostream)
  "Serializes a message object of type '<DiscardService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiscardService-request>) istream)
  "Deserializes a message object of type '<DiscardService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'input_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiscardService-request>)))
  "Returns string type for a service object of type '<DiscardService-request>"
  "ur10_mover/DiscardServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiscardService-request)))
  "Returns string type for a service object of type 'DiscardService-request"
  "ur10_mover/DiscardServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiscardService-request>)))
  "Returns md5sum for a message object of type '<DiscardService-request>"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiscardService-request)))
  "Returns md5sum for a message object of type 'DiscardService-request"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiscardService-request>)))
  "Returns full string definition for message of type '<DiscardService-request>"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiscardService-request)))
  "Returns full string definition for message of type 'DiscardService-request"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiscardService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiscardService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DiscardService-request
    (cl:cons ':input_msg (input_msg msg))
))
;//! \htmlinclude DiscardService-response.msg.html

(cl:defclass <DiscardService-response> (roslisp-msg-protocol:ros-message)
  ((output_msg
    :reader output_msg
    :initarg :output_msg
    :type cl:string
    :initform ""))
)

(cl:defclass DiscardService-response (<DiscardService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DiscardService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DiscardService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<DiscardService-response> is deprecated: use ur10_mover-srv:DiscardService-response instead.")))

(cl:ensure-generic-function 'output_msg-val :lambda-list '(m))
(cl:defmethod output_msg-val ((m <DiscardService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:output_msg-val is deprecated.  Use ur10_mover-srv:output_msg instead.")
  (output_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DiscardService-response>) ostream)
  "Serializes a message object of type '<DiscardService-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DiscardService-response>) istream)
  "Deserializes a message object of type '<DiscardService-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'output_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DiscardService-response>)))
  "Returns string type for a service object of type '<DiscardService-response>"
  "ur10_mover/DiscardServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiscardService-response)))
  "Returns string type for a service object of type 'DiscardService-response"
  "ur10_mover/DiscardServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DiscardService-response>)))
  "Returns md5sum for a message object of type '<DiscardService-response>"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DiscardService-response)))
  "Returns md5sum for a message object of type 'DiscardService-response"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DiscardService-response>)))
  "Returns full string definition for message of type '<DiscardService-response>"
  (cl:format cl:nil "string output_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DiscardService-response)))
  "Returns full string definition for message of type 'DiscardService-response"
  (cl:format cl:nil "string output_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DiscardService-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'output_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DiscardService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DiscardService-response
    (cl:cons ':output_msg (output_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DiscardService)))
  'DiscardService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DiscardService)))
  'DiscardService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DiscardService)))
  "Returns string type for a service object of type '<DiscardService>"
  "ur10_mover/DiscardService")