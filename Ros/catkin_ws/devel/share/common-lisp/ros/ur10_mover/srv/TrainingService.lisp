; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude TrainingService-request.msg.html

(cl:defclass <TrainingService-request> (roslisp-msg-protocol:ros-message)
  ((input_msg
    :reader input_msg
    :initarg :input_msg
    :type cl:string
    :initform ""))
)

(cl:defclass TrainingService-request (<TrainingService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrainingService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrainingService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<TrainingService-request> is deprecated: use ur10_mover-srv:TrainingService-request instead.")))

(cl:ensure-generic-function 'input_msg-val :lambda-list '(m))
(cl:defmethod input_msg-val ((m <TrainingService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:input_msg-val is deprecated.  Use ur10_mover-srv:input_msg instead.")
  (input_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrainingService-request>) ostream)
  "Serializes a message object of type '<TrainingService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrainingService-request>) istream)
  "Deserializes a message object of type '<TrainingService-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrainingService-request>)))
  "Returns string type for a service object of type '<TrainingService-request>"
  "ur10_mover/TrainingServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainingService-request)))
  "Returns string type for a service object of type 'TrainingService-request"
  "ur10_mover/TrainingServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrainingService-request>)))
  "Returns md5sum for a message object of type '<TrainingService-request>"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrainingService-request)))
  "Returns md5sum for a message object of type 'TrainingService-request"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrainingService-request>)))
  "Returns full string definition for message of type '<TrainingService-request>"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrainingService-request)))
  "Returns full string definition for message of type 'TrainingService-request"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrainingService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrainingService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TrainingService-request
    (cl:cons ':input_msg (input_msg msg))
))
;//! \htmlinclude TrainingService-response.msg.html

(cl:defclass <TrainingService-response> (roslisp-msg-protocol:ros-message)
  ((output_msg
    :reader output_msg
    :initarg :output_msg
    :type cl:string
    :initform ""))
)

(cl:defclass TrainingService-response (<TrainingService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrainingService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrainingService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<TrainingService-response> is deprecated: use ur10_mover-srv:TrainingService-response instead.")))

(cl:ensure-generic-function 'output_msg-val :lambda-list '(m))
(cl:defmethod output_msg-val ((m <TrainingService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:output_msg-val is deprecated.  Use ur10_mover-srv:output_msg instead.")
  (output_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrainingService-response>) ostream)
  "Serializes a message object of type '<TrainingService-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrainingService-response>) istream)
  "Deserializes a message object of type '<TrainingService-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrainingService-response>)))
  "Returns string type for a service object of type '<TrainingService-response>"
  "ur10_mover/TrainingServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainingService-response)))
  "Returns string type for a service object of type 'TrainingService-response"
  "ur10_mover/TrainingServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrainingService-response>)))
  "Returns md5sum for a message object of type '<TrainingService-response>"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrainingService-response)))
  "Returns md5sum for a message object of type 'TrainingService-response"
  "b57e415505eb1ef8a5131e05d03cd81c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrainingService-response>)))
  "Returns full string definition for message of type '<TrainingService-response>"
  (cl:format cl:nil "string output_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrainingService-response)))
  "Returns full string definition for message of type 'TrainingService-response"
  (cl:format cl:nil "string output_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrainingService-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'output_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrainingService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TrainingService-response
    (cl:cons ':output_msg (output_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TrainingService)))
  'TrainingService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TrainingService)))
  'TrainingService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainingService)))
  "Returns string type for a service object of type '<TrainingService>"
  "ur10_mover/TrainingService")