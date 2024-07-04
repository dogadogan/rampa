; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude ExecutionService-request.msg.html

(cl:defclass <ExecutionService-request> (roslisp-msg-protocol:ros-message)
  ((input_msg
    :reader input_msg
    :initarg :input_msg
    :type cl:string
    :initform ""))
)

(cl:defclass ExecutionService-request (<ExecutionService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutionService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutionService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<ExecutionService-request> is deprecated: use ur10_mover-srv:ExecutionService-request instead.")))

(cl:ensure-generic-function 'input_msg-val :lambda-list '(m))
(cl:defmethod input_msg-val ((m <ExecutionService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:input_msg-val is deprecated.  Use ur10_mover-srv:input_msg instead.")
  (input_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutionService-request>) ostream)
  "Serializes a message object of type '<ExecutionService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutionService-request>) istream)
  "Deserializes a message object of type '<ExecutionService-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutionService-request>)))
  "Returns string type for a service object of type '<ExecutionService-request>"
  "ur10_mover/ExecutionServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutionService-request)))
  "Returns string type for a service object of type 'ExecutionService-request"
  "ur10_mover/ExecutionServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutionService-request>)))
  "Returns md5sum for a message object of type '<ExecutionService-request>"
  "f8f3ec77ce7e0e05b9dfadb0a8e55bcc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutionService-request)))
  "Returns md5sum for a message object of type 'ExecutionService-request"
  "f8f3ec77ce7e0e05b9dfadb0a8e55bcc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutionService-request>)))
  "Returns full string definition for message of type '<ExecutionService-request>"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutionService-request)))
  "Returns full string definition for message of type 'ExecutionService-request"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutionService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutionService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutionService-request
    (cl:cons ':input_msg (input_msg msg))
))
;//! \htmlinclude ExecutionService-response.msg.html

(cl:defclass <ExecutionService-response> (roslisp-msg-protocol:ros-message)
  ((joint_states
    :reader joint_states
    :initarg :joint_states
    :type (cl:vector trajectory_msgs-msg:JointTrajectoryPoint)
   :initform (cl:make-array 0 :element-type 'trajectory_msgs-msg:JointTrajectoryPoint :initial-element (cl:make-instance 'trajectory_msgs-msg:JointTrajectoryPoint))))
)

(cl:defclass ExecutionService-response (<ExecutionService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutionService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutionService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<ExecutionService-response> is deprecated: use ur10_mover-srv:ExecutionService-response instead.")))

(cl:ensure-generic-function 'joint_states-val :lambda-list '(m))
(cl:defmethod joint_states-val ((m <ExecutionService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:joint_states-val is deprecated.  Use ur10_mover-srv:joint_states instead.")
  (joint_states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutionService-response>) ostream)
  "Serializes a message object of type '<ExecutionService-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joint_states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutionService-response>) istream)
  "Deserializes a message object of type '<ExecutionService-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'trajectory_msgs-msg:JointTrajectoryPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
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
  "f8f3ec77ce7e0e05b9dfadb0a8e55bcc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutionService-response)))
  "Returns md5sum for a message object of type 'ExecutionService-response"
  "f8f3ec77ce7e0e05b9dfadb0a8e55bcc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutionService-response>)))
  "Returns full string definition for message of type '<ExecutionService-response>"
  (cl:format cl:nil "trajectory_msgs/JointTrajectoryPoint[] joint_states~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutionService-response)))
  "Returns full string definition for message of type 'ExecutionService-response"
  (cl:format cl:nil "trajectory_msgs/JointTrajectoryPoint[] joint_states~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutionService-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutionService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutionService-response
    (cl:cons ':joint_states (joint_states msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ExecutionService)))
  'ExecutionService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ExecutionService)))
  'ExecutionService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutionService)))
  "Returns string type for a service object of type '<ExecutionService>"
  "ur10_mover/ExecutionService")