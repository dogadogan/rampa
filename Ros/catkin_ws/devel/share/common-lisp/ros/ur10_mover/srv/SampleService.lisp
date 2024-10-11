; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude SampleService-request.msg.html

(cl:defclass <SampleService-request> (roslisp-msg-protocol:ros-message)
  ((input_msg
    :reader input_msg
    :initarg :input_msg
    :type cl:string
    :initform "")
   (condition_poses
    :reader condition_poses
    :initarg :condition_poses
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (context
    :reader context
    :initarg :context
    :type cl:float
    :initform 0.0))
)

(cl:defclass SampleService-request (<SampleService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SampleService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SampleService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<SampleService-request> is deprecated: use ur10_mover-srv:SampleService-request instead.")))

(cl:ensure-generic-function 'input_msg-val :lambda-list '(m))
(cl:defmethod input_msg-val ((m <SampleService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:input_msg-val is deprecated.  Use ur10_mover-srv:input_msg instead.")
  (input_msg m))

(cl:ensure-generic-function 'condition_poses-val :lambda-list '(m))
(cl:defmethod condition_poses-val ((m <SampleService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:condition_poses-val is deprecated.  Use ur10_mover-srv:condition_poses instead.")
  (condition_poses m))

(cl:ensure-generic-function 'context-val :lambda-list '(m))
(cl:defmethod context-val ((m <SampleService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:context-val is deprecated.  Use ur10_mover-srv:context instead.")
  (context m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SampleService-request>) ostream)
  "Serializes a message object of type '<SampleService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_msg))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'condition_poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'condition_poses))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'context))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SampleService-request>) istream)
  "Deserializes a message object of type '<SampleService-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'input_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'input_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'condition_poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'condition_poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'context) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SampleService-request>)))
  "Returns string type for a service object of type '<SampleService-request>"
  "ur10_mover/SampleServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SampleService-request)))
  "Returns string type for a service object of type 'SampleService-request"
  "ur10_mover/SampleServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SampleService-request>)))
  "Returns md5sum for a message object of type '<SampleService-request>"
  "1d1a2b8ec8f0aacf9f57d31767f2b42d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SampleService-request)))
  "Returns md5sum for a message object of type 'SampleService-request"
  "1d1a2b8ec8f0aacf9f57d31767f2b42d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SampleService-request>)))
  "Returns full string definition for message of type '<SampleService-request>"
  (cl:format cl:nil "string input_msg~%geometry_msgs/Pose[] condition_poses~%float64 context~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SampleService-request)))
  "Returns full string definition for message of type 'SampleService-request"
  (cl:format cl:nil "string input_msg~%geometry_msgs/Pose[] condition_poses~%float64 context~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SampleService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_msg))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'condition_poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SampleService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SampleService-request
    (cl:cons ':input_msg (input_msg msg))
    (cl:cons ':condition_poses (condition_poses msg))
    (cl:cons ':context (context msg))
))
;//! \htmlinclude SampleService-response.msg.html

(cl:defclass <SampleService-response> (roslisp-msg-protocol:ros-message)
  ((output_msg
    :reader output_msg
    :initarg :output_msg
    :type cl:string
    :initform "")
   (sampled_trajectory
    :reader sampled_trajectory
    :initarg :sampled_trajectory
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose))))
)

(cl:defclass SampleService-response (<SampleService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SampleService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SampleService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<SampleService-response> is deprecated: use ur10_mover-srv:SampleService-response instead.")))

(cl:ensure-generic-function 'output_msg-val :lambda-list '(m))
(cl:defmethod output_msg-val ((m <SampleService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:output_msg-val is deprecated.  Use ur10_mover-srv:output_msg instead.")
  (output_msg m))

(cl:ensure-generic-function 'sampled_trajectory-val :lambda-list '(m))
(cl:defmethod sampled_trajectory-val ((m <SampleService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:sampled_trajectory-val is deprecated.  Use ur10_mover-srv:sampled_trajectory instead.")
  (sampled_trajectory m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SampleService-response>) ostream)
  "Serializes a message object of type '<SampleService-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_msg))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'sampled_trajectory))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'sampled_trajectory))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SampleService-response>) istream)
  "Deserializes a message object of type '<SampleService-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'output_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'output_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'sampled_trajectory) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'sampled_trajectory)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SampleService-response>)))
  "Returns string type for a service object of type '<SampleService-response>"
  "ur10_mover/SampleServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SampleService-response)))
  "Returns string type for a service object of type 'SampleService-response"
  "ur10_mover/SampleServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SampleService-response>)))
  "Returns md5sum for a message object of type '<SampleService-response>"
  "1d1a2b8ec8f0aacf9f57d31767f2b42d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SampleService-response)))
  "Returns md5sum for a message object of type 'SampleService-response"
  "1d1a2b8ec8f0aacf9f57d31767f2b42d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SampleService-response>)))
  "Returns full string definition for message of type '<SampleService-response>"
  (cl:format cl:nil "string output_msg~%geometry_msgs/Pose[] sampled_trajectory~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SampleService-response)))
  "Returns full string definition for message of type 'SampleService-response"
  (cl:format cl:nil "string output_msg~%geometry_msgs/Pose[] sampled_trajectory~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SampleService-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'output_msg))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'sampled_trajectory) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SampleService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SampleService-response
    (cl:cons ':output_msg (output_msg msg))
    (cl:cons ':sampled_trajectory (sampled_trajectory msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SampleService)))
  'SampleService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SampleService)))
  'SampleService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SampleService)))
  "Returns string type for a service object of type '<SampleService>"
  "ur10_mover/SampleService")