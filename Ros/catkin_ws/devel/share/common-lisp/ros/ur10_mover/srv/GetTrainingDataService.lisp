; Auto-generated. Do not edit!


(cl:in-package ur10_mover-srv)


;//! \htmlinclude GetTrainingDataService-request.msg.html

(cl:defclass <GetTrainingDataService-request> (roslisp-msg-protocol:ros-message)
  ((input_msg
    :reader input_msg
    :initarg :input_msg
    :type cl:string
    :initform ""))
)

(cl:defclass GetTrainingDataService-request (<GetTrainingDataService-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTrainingDataService-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTrainingDataService-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<GetTrainingDataService-request> is deprecated: use ur10_mover-srv:GetTrainingDataService-request instead.")))

(cl:ensure-generic-function 'input_msg-val :lambda-list '(m))
(cl:defmethod input_msg-val ((m <GetTrainingDataService-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:input_msg-val is deprecated.  Use ur10_mover-srv:input_msg instead.")
  (input_msg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTrainingDataService-request>) ostream)
  "Serializes a message object of type '<GetTrainingDataService-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'input_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'input_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTrainingDataService-request>) istream)
  "Deserializes a message object of type '<GetTrainingDataService-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTrainingDataService-request>)))
  "Returns string type for a service object of type '<GetTrainingDataService-request>"
  "ur10_mover/GetTrainingDataServiceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTrainingDataService-request)))
  "Returns string type for a service object of type 'GetTrainingDataService-request"
  "ur10_mover/GetTrainingDataServiceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTrainingDataService-request>)))
  "Returns md5sum for a message object of type '<GetTrainingDataService-request>"
  "a23732bf635c86b0cb4cf0b1248e70e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTrainingDataService-request)))
  "Returns md5sum for a message object of type 'GetTrainingDataService-request"
  "a23732bf635c86b0cb4cf0b1248e70e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTrainingDataService-request>)))
  "Returns full string definition for message of type '<GetTrainingDataService-request>"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTrainingDataService-request)))
  "Returns full string definition for message of type 'GetTrainingDataService-request"
  (cl:format cl:nil "string input_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTrainingDataService-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'input_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTrainingDataService-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTrainingDataService-request
    (cl:cons ':input_msg (input_msg msg))
))
;//! \htmlinclude GetTrainingDataService-response.msg.html

(cl:defclass <GetTrainingDataService-response> (roslisp-msg-protocol:ros-message)
  ((trajectoryList
    :reader trajectoryList
    :initarg :trajectoryList
    :type (cl:vector ur10_mover-msg:ListOfPoses)
   :initform (cl:make-array 0 :element-type 'ur10_mover-msg:ListOfPoses :initial-element (cl:make-instance 'ur10_mover-msg:ListOfPoses))))
)

(cl:defclass GetTrainingDataService-response (<GetTrainingDataService-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetTrainingDataService-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetTrainingDataService-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ur10_mover-srv:<GetTrainingDataService-response> is deprecated: use ur10_mover-srv:GetTrainingDataService-response instead.")))

(cl:ensure-generic-function 'trajectoryList-val :lambda-list '(m))
(cl:defmethod trajectoryList-val ((m <GetTrainingDataService-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ur10_mover-srv:trajectoryList-val is deprecated.  Use ur10_mover-srv:trajectoryList instead.")
  (trajectoryList m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetTrainingDataService-response>) ostream)
  "Serializes a message object of type '<GetTrainingDataService-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'trajectoryList))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'trajectoryList))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetTrainingDataService-response>) istream)
  "Deserializes a message object of type '<GetTrainingDataService-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'trajectoryList) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'trajectoryList)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'ur10_mover-msg:ListOfPoses))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetTrainingDataService-response>)))
  "Returns string type for a service object of type '<GetTrainingDataService-response>"
  "ur10_mover/GetTrainingDataServiceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTrainingDataService-response)))
  "Returns string type for a service object of type 'GetTrainingDataService-response"
  "ur10_mover/GetTrainingDataServiceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetTrainingDataService-response>)))
  "Returns md5sum for a message object of type '<GetTrainingDataService-response>"
  "a23732bf635c86b0cb4cf0b1248e70e9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetTrainingDataService-response)))
  "Returns md5sum for a message object of type 'GetTrainingDataService-response"
  "a23732bf635c86b0cb4cf0b1248e70e9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetTrainingDataService-response>)))
  "Returns full string definition for message of type '<GetTrainingDataService-response>"
  (cl:format cl:nil "ur10_mover/ListOfPoses[] trajectoryList~%~%~%================================================================================~%MSG: ur10_mover/ListOfPoses~%geometry_msgs/Pose[] pose_list~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetTrainingDataService-response)))
  "Returns full string definition for message of type 'GetTrainingDataService-response"
  (cl:format cl:nil "ur10_mover/ListOfPoses[] trajectoryList~%~%~%================================================================================~%MSG: ur10_mover/ListOfPoses~%geometry_msgs/Pose[] pose_list~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetTrainingDataService-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'trajectoryList) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetTrainingDataService-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetTrainingDataService-response
    (cl:cons ':trajectoryList (trajectoryList msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetTrainingDataService)))
  'GetTrainingDataService-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetTrainingDataService)))
  'GetTrainingDataService-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetTrainingDataService)))
  "Returns string type for a service object of type '<GetTrainingDataService>"
  "ur10_mover/GetTrainingDataService")