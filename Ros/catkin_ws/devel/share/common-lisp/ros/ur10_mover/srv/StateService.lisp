; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude StateService-request.msg.html

(cl:defclass <StateService-request> (roslisp-msg-protocol:ros-message)
  ((input_msg
    :reader input_msg
    :initarg :input_msg
    :type cl:string
    :initform ""))
)

(cl:defclass StateService-request (<StateService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StateService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StateService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<StateService-request> is deprecated: use ur10_mover-srv:StateService-request instead.")))

(cl:ensure-generic-function 'input_msg-val :lambda-list '(m))
(cl:defmethod input_msg-val ((m <StateService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:input_msg-val is deprecated.  Use ur10_mover-srv:input_msg instead.")
  (input_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StateService-request>) ostream)
  "Serializes a message object of type '<StateService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StateService-request>) istream)
  "Deserializes a message object of type '<StateService-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StateService-request>)))
  "Returns string type for a service object of type '<StateService-request>"
  "ur10_mover/StateServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateService-request)))
  "Returns string type for a service object of type 'StateService-request"
  "ur10_mover/StateServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StateService-request>)))
  "Returns md5sum for a message object of type '<StateService-request>"
  "30fae736b7734374461e907d8c1eb052")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StateService-request)))
  "Returns md5sum for a message object of type 'StateService-request"
  "30fae736b7734374461e907d8c1eb052")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StateService-request>)))
  "Returns full string definition for message of type '<StateService-request>"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StateService-request)))
  "Returns full string definition for message of type 'StateService-request"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StateService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StateService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StateService-request
    (cl:cons ':input_msg (input_msg msg))
))
;//! \htmlinclude StateService-response.msg.html

(cl:defclass <StateService-response> (roslisp-msg-protocol:ros-message)
  ((output_msg
    :reader output_msg
    :initarg :output_msg
    :type cl:string
    :initform "")
   (current_joint_angles
    :reader current_joint_angles
    :initarg :current_joint_angles
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass StateService-response (<StateService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StateService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StateService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<StateService-response> is deprecated: use ur10_mover-srv:StateService-response instead.")))

(cl:ensure-generic-function 'output_msg-val :lambda-list '(m))
(cl:defmethod output_msg-val ((m <StateService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:output_msg-val is deprecated.  Use ur10_mover-srv:output_msg instead.")
  (output_msg m))

(cl:ensure-generic-function 'current_joint_angles-val :lambda-list '(m))
(cl:defmethod current_joint_angles-val ((m <StateService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:current_joint_angles-val is deprecated.  Use ur10_mover-srv:current_joint_angles instead.")
  (current_joint_angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StateService-response>) ostream)
  "Serializes a message object of type '<StateService-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_msg))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'current_joint_angles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StateService-response>) istream)
  "Deserializes a message object of type '<StateService-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'output_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:setf (cl:slot-value msg 'current_joint_angles) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'current_joint_angles)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StateService-response>)))
  "Returns string type for a service object of type '<StateService-response>"
  "ur10_mover/StateServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateService-response)))
  "Returns string type for a service object of type 'StateService-response"
  "ur10_mover/StateServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StateService-response>)))
  "Returns md5sum for a message object of type '<StateService-response>"
  "30fae736b7734374461e907d8c1eb052")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StateService-response)))
  "Returns md5sum for a message object of type 'StateService-response"
  "30fae736b7734374461e907d8c1eb052")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StateService-response>)))
  "Returns full string definition for message of type '<StateService-response>"
  (cl:format cl:nil "string output_msg~%float64[6] current_joint_angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StateService-response)))
  "Returns full string definition for message of type 'StateService-response"
  (cl:format cl:nil "string output_msg~%float64[6] current_joint_angles~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StateService-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'output_msg))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'current_joint_angles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StateService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StateService-response
    (cl:cons ':output_msg (output_msg msg))
    (cl:cons ':current_joint_angles (current_joint_angles msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StateService)))
  'StateService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StateService)))
  'StateService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateService)))
  "Returns string type for a service object of type '<StateService>"
  "ur10_mover/StateService")