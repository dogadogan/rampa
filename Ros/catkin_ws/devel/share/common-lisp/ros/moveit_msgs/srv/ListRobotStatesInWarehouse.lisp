; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude ListRobotStatesInWarehouse-request.msg.html

(cl:defclass <ListRobotStatesInWarehouse-request> (roslisp-msg-protocol:ros-message)
  ((regex
    :reader regex
    :initarg :regex
    :type cl:string
    :initform "")
   (robot
    :reader robot
    :initarg :robot
    :type cl:string
    :initform ""))
)

(cl:defclass ListRobotStatesInWarehouse-request (<ListRobotStatesInWarehouse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListRobotStatesInWarehouse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListRobotStatesInWarehouse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ListRobotStatesInWarehouse-request> is deprecated: use moveit_msgs-srv:ListRobotStatesInWarehouse-request instead.")))

(cl:ensure-generic-function 'regex-val :lambda-list '(m))
(cl:defmethod regex-val ((m <ListRobotStatesInWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:regex-val is deprecated.  Use moveit_msgs-srv:regex instead.")
  (regex m))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <ListRobotStatesInWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:robot-val is deprecated.  Use moveit_msgs-srv:robot instead.")
  (robot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListRobotStatesInWarehouse-request>) ostream)
  "Serializes a message object of type '<ListRobotStatesInWarehouse-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'regex))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'regex))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListRobotStatesInWarehouse-request>) istream)
  "Deserializes a message object of type '<ListRobotStatesInWarehouse-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'regex) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'regex) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListRobotStatesInWarehouse-request>)))
  "Returns string type for a service object of type '<ListRobotStatesInWarehouse-request>"
  "moveit_msgs/ListRobotStatesInWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListRobotStatesInWarehouse-request)))
  "Returns string type for a service object of type 'ListRobotStatesInWarehouse-request"
  "moveit_msgs/ListRobotStatesInWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListRobotStatesInWarehouse-request>)))
  "Returns md5sum for a message object of type '<ListRobotStatesInWarehouse-request>"
  "dc02fa289e68670e9d392985a0235ee6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListRobotStatesInWarehouse-request)))
  "Returns md5sum for a message object of type 'ListRobotStatesInWarehouse-request"
  "dc02fa289e68670e9d392985a0235ee6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListRobotStatesInWarehouse-request>)))
  "Returns full string definition for message of type '<ListRobotStatesInWarehouse-request>"
  (cl:format cl:nil "string regex~%string robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListRobotStatesInWarehouse-request)))
  "Returns full string definition for message of type 'ListRobotStatesInWarehouse-request"
  (cl:format cl:nil "string regex~%string robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListRobotStatesInWarehouse-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'regex))
     4 (cl:length (cl:slot-value msg 'robot))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListRobotStatesInWarehouse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ListRobotStatesInWarehouse-request
    (cl:cons ':regex (regex msg))
    (cl:cons ':robot (robot msg))
))
;//! \htmlinclude ListRobotStatesInWarehouse-response.msg.html

(cl:defclass <ListRobotStatesInWarehouse-response> (roslisp-msg-protocol:ros-message)
  ((states
    :reader states
    :initarg :states
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ListRobotStatesInWarehouse-response (<ListRobotStatesInWarehouse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListRobotStatesInWarehouse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListRobotStatesInWarehouse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ListRobotStatesInWarehouse-response> is deprecated: use moveit_msgs-srv:ListRobotStatesInWarehouse-response instead.")))

(cl:ensure-generic-function 'states-val :lambda-list '(m))
(cl:defmethod states-val ((m <ListRobotStatesInWarehouse-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:states-val is deprecated.  Use moveit_msgs-srv:states instead.")
  (states m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListRobotStatesInWarehouse-response>) ostream)
  "Serializes a message object of type '<ListRobotStatesInWarehouse-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'states))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'states))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListRobotStatesInWarehouse-response>) istream)
  "Deserializes a message object of type '<ListRobotStatesInWarehouse-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'states) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'states)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListRobotStatesInWarehouse-response>)))
  "Returns string type for a service object of type '<ListRobotStatesInWarehouse-response>"
  "moveit_msgs/ListRobotStatesInWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListRobotStatesInWarehouse-response)))
  "Returns string type for a service object of type 'ListRobotStatesInWarehouse-response"
  "moveit_msgs/ListRobotStatesInWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListRobotStatesInWarehouse-response>)))
  "Returns md5sum for a message object of type '<ListRobotStatesInWarehouse-response>"
  "dc02fa289e68670e9d392985a0235ee6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListRobotStatesInWarehouse-response)))
  "Returns md5sum for a message object of type 'ListRobotStatesInWarehouse-response"
  "dc02fa289e68670e9d392985a0235ee6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListRobotStatesInWarehouse-response>)))
  "Returns full string definition for message of type '<ListRobotStatesInWarehouse-response>"
  (cl:format cl:nil "~%string[] states~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListRobotStatesInWarehouse-response)))
  "Returns full string definition for message of type 'ListRobotStatesInWarehouse-response"
  (cl:format cl:nil "~%string[] states~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListRobotStatesInWarehouse-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'states) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListRobotStatesInWarehouse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ListRobotStatesInWarehouse-response
    (cl:cons ':states (states msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ListRobotStatesInWarehouse)))
  'ListRobotStatesInWarehouse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ListRobotStatesInWarehouse)))
  'ListRobotStatesInWarehouse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListRobotStatesInWarehouse)))
  "Returns string type for a service object of type '<ListRobotStatesInWarehouse>"
  "moveit_msgs/ListRobotStatesInWarehouse")