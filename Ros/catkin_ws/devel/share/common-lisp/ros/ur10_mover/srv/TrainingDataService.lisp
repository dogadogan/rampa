; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude TrainingDataService-request.msg.html

(cl:defclass <TrainingDataService-request> (roslisp-msg-protocol:ros-message)
  ((input_msg
    :reader input_msg
    :initarg :input_msg
    :type cl:string
    :initform "")
   (pose_list
    :reader pose_list
    :initarg :pose_list
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (context
    :reader context
    :initarg :context
    :type cl:float
    :initform 0.0))
)

(cl:defclass TrainingDataService-request (<TrainingDataService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrainingDataService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrainingDataService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<TrainingDataService-request> is deprecated: use ur10_mover-srv:TrainingDataService-request instead.")))

(cl:ensure-generic-function 'input_msg-val :lambda-list '(m))
(cl:defmethod input_msg-val ((m <TrainingDataService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:input_msg-val is deprecated.  Use ur10_mover-srv:input_msg instead.")
  (input_msg m))

(cl:ensure-generic-function 'pose_list-val :lambda-list '(m))
(cl:defmethod pose_list-val ((m <TrainingDataService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:pose_list-val is deprecated.  Use ur10_mover-srv:pose_list instead.")
  (pose_list m))

(cl:ensure-generic-function 'context-val :lambda-list '(m))
(cl:defmethod context-val ((m <TrainingDataService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:context-val is deprecated.  Use ur10_mover-srv:context instead.")
  (context m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrainingDataService-request>) ostream)
  "Serializes a message object of type '<TrainingDataService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_msg))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pose_list))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrainingDataService-request>) istream)
  "Deserializes a message object of type '<TrainingDataService-request>"
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
  (cl:setf (cl:slot-value msg 'pose_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_list)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrainingDataService-request>)))
  "Returns string type for a service object of type '<TrainingDataService-request>"
  "ur10_mover/TrainingDataServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainingDataService-request)))
  "Returns string type for a service object of type 'TrainingDataService-request"
  "ur10_mover/TrainingDataServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrainingDataService-request>)))
  "Returns md5sum for a message object of type '<TrainingDataService-request>"
  "2553c089c44939195fc3dab519dd2853")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrainingDataService-request)))
  "Returns md5sum for a message object of type 'TrainingDataService-request"
  "2553c089c44939195fc3dab519dd2853")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrainingDataService-request>)))
  "Returns full string definition for message of type '<TrainingDataService-request>"
  (cl:format cl:nil "string input_msg~%geometry_msgs/Pose[] pose_list~%float64 context~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrainingDataService-request)))
  "Returns full string definition for message of type 'TrainingDataService-request"
  (cl:format cl:nil "string input_msg~%geometry_msgs/Pose[] pose_list~%float64 context~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrainingDataService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_msg))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrainingDataService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TrainingDataService-request
    (cl:cons ':input_msg (input_msg msg))
    (cl:cons ':pose_list (pose_list msg))
    (cl:cons ':context (context msg))
))
;//! \htmlinclude TrainingDataService-response.msg.html

(cl:defclass <TrainingDataService-response> (roslisp-msg-protocol:ros-message)
  ((output_msg
    :reader output_msg
    :initarg :output_msg
    :type cl:string
    :initform ""))
)

(cl:defclass TrainingDataService-response (<TrainingDataService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrainingDataService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrainingDataService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<TrainingDataService-response> is deprecated: use ur10_mover-srv:TrainingDataService-response instead.")))

(cl:ensure-generic-function 'output_msg-val :lambda-list '(m))
(cl:defmethod output_msg-val ((m <TrainingDataService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:output_msg-val is deprecated.  Use ur10_mover-srv:output_msg instead.")
  (output_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrainingDataService-response>) ostream)
  "Serializes a message object of type '<TrainingDataService-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'output_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'output_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrainingDataService-response>) istream)
  "Deserializes a message object of type '<TrainingDataService-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrainingDataService-response>)))
  "Returns string type for a service object of type '<TrainingDataService-response>"
  "ur10_mover/TrainingDataServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainingDataService-response)))
  "Returns string type for a service object of type 'TrainingDataService-response"
  "ur10_mover/TrainingDataServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrainingDataService-response>)))
  "Returns md5sum for a message object of type '<TrainingDataService-response>"
  "2553c089c44939195fc3dab519dd2853")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrainingDataService-response)))
  "Returns md5sum for a message object of type 'TrainingDataService-response"
  "2553c089c44939195fc3dab519dd2853")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrainingDataService-response>)))
  "Returns full string definition for message of type '<TrainingDataService-response>"
  (cl:format cl:nil "string output_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrainingDataService-response)))
  "Returns full string definition for message of type 'TrainingDataService-response"
  (cl:format cl:nil "string output_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrainingDataService-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'output_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrainingDataService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TrainingDataService-response
    (cl:cons ':output_msg (output_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TrainingDataService)))
  'TrainingDataService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TrainingDataService)))
  'TrainingDataService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrainingDataService)))
  "Returns string type for a service object of type '<TrainingDataService>"
  "ur10_mover/TrainingDataService")