; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude ExecutionService-request.msg.html

(cl:defclass <ExecutionService-request> (roslisp-msg-protocol:ros-message)
  ((joint_states
    :reader joint_states
    :initarg :joint_states
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ExecutionService-request (<ExecutionService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutionService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutionService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<ExecutionService-request> is deprecated: use ur10_mover-srv:ExecutionService-request instead.")))

(cl:ensure-generic-function 'joint_states-val :lambda-list '(m))
(cl:defmethod joint_states-val ((m <ExecutionService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:joint_states-val is deprecated.  Use ur10_mover-srv:joint_states instead.")
  (joint_states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutionService-request>) ostream)
  "Serializes a message object of type '<ExecutionService-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_states))))
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
   (cl:slot-value msg 'joint_states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutionService-request>) istream)
  "Deserializes a message object of type '<ExecutionService-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_states)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutionService-request>)))
  "Returns string type for a service object of type '<ExecutionService-request>"
  "ur10_mover/ExecutionServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutionService-request)))
  "Returns string type for a service object of type 'ExecutionService-request"
  "ur10_mover/ExecutionServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutionService-request>)))
  "Returns md5sum for a message object of type '<ExecutionService-request>"
  "5c9003936ef71c09a5e049f44ee8dd53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutionService-request)))
  "Returns md5sum for a message object of type 'ExecutionService-request"
  "5c9003936ef71c09a5e049f44ee8dd53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutionService-request>)))
  "Returns full string definition for message of type '<ExecutionService-request>"
  (cl:format cl:nil "float64[] joint_states~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutionService-request)))
  "Returns full string definition for message of type 'ExecutionService-request"
  (cl:format cl:nil "float64[] joint_states~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutionService-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutionService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutionService-request
    (cl:cons ':joint_states (joint_states msg))
))
;//! \htmlinclude ExecutionService-response.msg.html

(cl:defclass <ExecutionService-response> (roslisp-msg-protocol:ros-message)
  ((output_msg
    :reader output_msg
    :initarg :output_msg
    :type cl:string
    :initform ""))
)

(cl:defclass ExecutionService-response (<ExecutionService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutionService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutionService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<ExecutionService-response> is deprecated: use ur10_mover-srv:ExecutionService-response instead.")))

(cl:ensure-generic-function 'output_msg-val :lambda-list '(m))
(cl:defmethod output_msg-val ((m <ExecutionService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:output_msg-val is deprecated.  Use ur10_mover-srv:output_msg instead.")
  (output_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutionService-response>) ostream)
  "Serializes a message object of type '<ExecutionService-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutionService-response>) istream)
  "Deserializes a message object of type '<ExecutionService-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutionService-response>)))
  "Returns string type for a service object of type '<ExecutionService-response>"
  "ur10_mover/ExecutionServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutionService-response)))
  "Returns string type for a service object of type 'ExecutionService-response"
  "ur10_mover/ExecutionServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutionService-response>)))
  "Returns md5sum for a message object of type '<ExecutionService-response>"
  "5c9003936ef71c09a5e049f44ee8dd53")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutionService-response)))
  "Returns md5sum for a message object of type 'ExecutionService-response"
  "5c9003936ef71c09a5e049f44ee8dd53")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutionService-response>)))
  "Returns full string definition for message of type '<ExecutionService-response>"
  (cl:format cl:nil "string output_msg~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutionService-response)))
  "Returns full string definition for message of type 'ExecutionService-response"
  (cl:format cl:nil "string output_msg~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutionService-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'output_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutionService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutionService-response
    (cl:cons ':output_msg (output_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecutionService)))
  'ExecutionService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecutionService)))
  'ExecutionService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutionService)))
  "Returns string type for a service object of type '<ExecutionService>"
  "ur10_mover/ExecutionService")