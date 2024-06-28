; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude RenameRobotStateInWarehouse-request.msg.html

(cl:defclass <RenameRobotStateInWarehouse-request> (roslisp-msg-protocol:ros-message)
  ((old_name
    :reader old_name
    :initarg :old_name
    :type cl:string
    :initform "")
   (new_name
    :reader new_name
    :initarg :new_name
    :type cl:string
    :initform "")
   (robot
    :reader robot
    :initarg :robot
    :type cl:string
    :initform ""))
)

(cl:defclass RenameRobotStateInWarehouse-request (<RenameRobotStateInWarehouse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RenameRobotStateInWarehouse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RenameRobotStateInWarehouse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<RenameRobotStateInWarehouse-request> is deprecated: use moveit_msgs-srv:RenameRobotStateInWarehouse-request instead.")))

(cl:ensure-generic-function 'old_name-val :lambda-list '(m))
(cl:defmethod old_name-val ((m <RenameRobotStateInWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:old_name-val is deprecated.  Use moveit_msgs-srv:old_name instead.")
  (old_name m))

(cl:ensure-generic-function 'new_name-val :lambda-list '(m))
(cl:defmethod new_name-val ((m <RenameRobotStateInWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:new_name-val is deprecated.  Use moveit_msgs-srv:new_name instead.")
  (new_name m))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <RenameRobotStateInWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:robot-val is deprecated.  Use moveit_msgs-srv:robot instead.")
  (robot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RenameRobotStateInWarehouse-request>) ostream)
  "Serializes a message object of type '<RenameRobotStateInWarehouse-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'old_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'old_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'new_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'new_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RenameRobotStateInWarehouse-request>) istream)
  "Deserializes a message object of type '<RenameRobotStateInWarehouse-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'old_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'old_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'new_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'new_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RenameRobotStateInWarehouse-request>)))
  "Returns string type for a service object of type '<RenameRobotStateInWarehouse-request>"
  "moveit_msgs/RenameRobotStateInWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RenameRobotStateInWarehouse-request)))
  "Returns string type for a service object of type 'RenameRobotStateInWarehouse-request"
  "moveit_msgs/RenameRobotStateInWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RenameRobotStateInWarehouse-request>)))
  "Returns md5sum for a message object of type '<RenameRobotStateInWarehouse-request>"
  "073dc05c3fd313b947cea483c25c46b0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RenameRobotStateInWarehouse-request)))
  "Returns md5sum for a message object of type 'RenameRobotStateInWarehouse-request"
  "073dc05c3fd313b947cea483c25c46b0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RenameRobotStateInWarehouse-request>)))
  "Returns full string definition for message of type '<RenameRobotStateInWarehouse-request>"
  (cl:format cl:nil "string old_name~%string new_name~%string robot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RenameRobotStateInWarehouse-request)))
  "Returns full string definition for message of type 'RenameRobotStateInWarehouse-request"
  (cl:format cl:nil "string old_name~%string new_name~%string robot~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RenameRobotStateInWarehouse-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'old_name))
     4 (cl:length (cl:slot-value msg 'new_name))
     4 (cl:length (cl:slot-value msg 'robot))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RenameRobotStateInWarehouse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RenameRobotStateInWarehouse-request
    (cl:cons ':old_name (old_name msg))
    (cl:cons ':new_name (new_name msg))
    (cl:cons ':robot (robot msg))
))
;//! \htmlinclude RenameRobotStateInWarehouse-response.msg.html

(cl:defclass <RenameRobotStateInWarehouse-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass RenameRobotStateInWarehouse-response (<RenameRobotStateInWarehouse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RenameRobotStateInWarehouse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RenameRobotStateInWarehouse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<RenameRobotStateInWarehouse-response> is deprecated: use moveit_msgs-srv:RenameRobotStateInWarehouse-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RenameRobotStateInWarehouse-response>) ostream)
  "Serializes a message object of type '<RenameRobotStateInWarehouse-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RenameRobotStateInWarehouse-response>) istream)
  "Deserializes a message object of type '<RenameRobotStateInWarehouse-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RenameRobotStateInWarehouse-response>)))
  "Returns string type for a service object of type '<RenameRobotStateInWarehouse-response>"
  "moveit_msgs/RenameRobotStateInWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RenameRobotStateInWarehouse-response)))
  "Returns string type for a service object of type 'RenameRobotStateInWarehouse-response"
  "moveit_msgs/RenameRobotStateInWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RenameRobotStateInWarehouse-response>)))
  "Returns md5sum for a message object of type '<RenameRobotStateInWarehouse-response>"
  "073dc05c3fd313b947cea483c25c46b0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RenameRobotStateInWarehouse-response)))
  "Returns md5sum for a message object of type 'RenameRobotStateInWarehouse-response"
  "073dc05c3fd313b947cea483c25c46b0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RenameRobotStateInWarehouse-response>)))
  "Returns full string definition for message of type '<RenameRobotStateInWarehouse-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RenameRobotStateInWarehouse-response)))
  "Returns full string definition for message of type 'RenameRobotStateInWarehouse-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RenameRobotStateInWarehouse-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RenameRobotStateInWarehouse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RenameRobotStateInWarehouse-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RenameRobotStateInWarehouse)))
  'RenameRobotStateInWarehouse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RenameRobotStateInWarehouse)))
  'RenameRobotStateInWarehouse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RenameRobotStateInWarehouse)))
  "Returns string type for a service object of type '<RenameRobotStateInWarehouse>"
  "moveit_msgs/RenameRobotStateInWarehouse")