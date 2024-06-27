; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude CheckIfRobotStateExistsInWarehouse-request.msg.html

(cl:defclass <CheckIfRobotStateExistsInWarehouse-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (robot
    :reader robot
    :initarg :robot
    :type cl:string
    :initform ""))
)

(cl:defclass CheckIfRobotStateExistsInWarehouse-request (<CheckIfRobotStateExistsInWarehouse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckIfRobotStateExistsInWarehouse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckIfRobotStateExistsInWarehouse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<CheckIfRobotStateExistsInWarehouse-request> is deprecated: use moveit_msgs-srv:CheckIfRobotStateExistsInWarehouse-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <CheckIfRobotStateExistsInWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:name-val is deprecated.  Use moveit_msgs-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <CheckIfRobotStateExistsInWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:robot-val is deprecated.  Use moveit_msgs-srv:robot instead.")
  (robot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckIfRobotStateExistsInWarehouse-request>) ostream)
  "Serializes a message object of type '<CheckIfRobotStateExistsInWarehouse-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckIfRobotStateExistsInWarehouse-request>) istream)
  "Deserializes a message object of type '<CheckIfRobotStateExistsInWarehouse-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckIfRobotStateExistsInWarehouse-request>)))
  "Returns string type for a service object of type '<CheckIfRobotStateExistsInWarehouse-request>"
  "moveit_msgs/CheckIfRobotStateExistsInWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckIfRobotStateExistsInWarehouse-request)))
  "Returns string type for a service object of type 'CheckIfRobotStateExistsInWarehouse-request"
  "moveit_msgs/CheckIfRobotStateExistsInWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckIfRobotStateExistsInWarehouse-request>)))
  "Returns md5sum for a message object of type '<CheckIfRobotStateExistsInWarehouse-request>"
  "3b47364b81dd44f643fa67c9cd127486")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckIfRobotStateExistsInWarehouse-request)))
  "Returns md5sum for a message object of type 'CheckIfRobotStateExistsInWarehouse-request"
  "3b47364b81dd44f643fa67c9cd127486")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckIfRobotStateExistsInWarehouse-request>)))
  "Returns full string definition for message of type '<CheckIfRobotStateExistsInWarehouse-request>"
  (cl:format cl:nil "string name~%string robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckIfRobotStateExistsInWarehouse-request)))
  "Returns full string definition for message of type 'CheckIfRobotStateExistsInWarehouse-request"
  (cl:format cl:nil "string name~%string robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckIfRobotStateExistsInWarehouse-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'robot))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckIfRobotStateExistsInWarehouse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckIfRobotStateExistsInWarehouse-request
    (cl:cons ':name (name msg))
    (cl:cons ':robot (robot msg))
))
;//! \htmlinclude CheckIfRobotStateExistsInWarehouse-response.msg.html

(cl:defclass <CheckIfRobotStateExistsInWarehouse-response> (roslisp-msg-protocol:ros-message)
  ((exists
    :reader exists
    :initarg :exists
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CheckIfRobotStateExistsInWarehouse-response (<CheckIfRobotStateExistsInWarehouse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckIfRobotStateExistsInWarehouse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckIfRobotStateExistsInWarehouse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<CheckIfRobotStateExistsInWarehouse-response> is deprecated: use moveit_msgs-srv:CheckIfRobotStateExistsInWarehouse-response instead.")))

(cl:ensure-generic-function 'exists-val :lambda-list '(m))
(cl:defmethod exists-val ((m <CheckIfRobotStateExistsInWarehouse-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:exists-val is deprecated.  Use moveit_msgs-srv:exists instead.")
  (exists m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckIfRobotStateExistsInWarehouse-response>) ostream)
  "Serializes a message object of type '<CheckIfRobotStateExistsInWarehouse-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'exists) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckIfRobotStateExistsInWarehouse-response>) istream)
  "Deserializes a message object of type '<CheckIfRobotStateExistsInWarehouse-response>"
    (cl:setf (cl:slot-value msg 'exists) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckIfRobotStateExistsInWarehouse-response>)))
  "Returns string type for a service object of type '<CheckIfRobotStateExistsInWarehouse-response>"
  "moveit_msgs/CheckIfRobotStateExistsInWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckIfRobotStateExistsInWarehouse-response)))
  "Returns string type for a service object of type 'CheckIfRobotStateExistsInWarehouse-response"
  "moveit_msgs/CheckIfRobotStateExistsInWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckIfRobotStateExistsInWarehouse-response>)))
  "Returns md5sum for a message object of type '<CheckIfRobotStateExistsInWarehouse-response>"
  "3b47364b81dd44f643fa67c9cd127486")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckIfRobotStateExistsInWarehouse-response)))
  "Returns md5sum for a message object of type 'CheckIfRobotStateExistsInWarehouse-response"
  "3b47364b81dd44f643fa67c9cd127486")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckIfRobotStateExistsInWarehouse-response>)))
  "Returns full string definition for message of type '<CheckIfRobotStateExistsInWarehouse-response>"
  (cl:format cl:nil "~%bool exists~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckIfRobotStateExistsInWarehouse-response)))
  "Returns full string definition for message of type 'CheckIfRobotStateExistsInWarehouse-response"
  (cl:format cl:nil "~%bool exists~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckIfRobotStateExistsInWarehouse-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckIfRobotStateExistsInWarehouse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckIfRobotStateExistsInWarehouse-response
    (cl:cons ':exists (exists msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CheckIfRobotStateExistsInWarehouse)))
  'CheckIfRobotStateExistsInWarehouse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CheckIfRobotStateExistsInWarehouse)))
  'CheckIfRobotStateExistsInWarehouse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckIfRobotStateExistsInWarehouse)))
  "Returns string type for a service object of type '<CheckIfRobotStateExistsInWarehouse>"
  "moveit_msgs/CheckIfRobotStateExistsInWarehouse")