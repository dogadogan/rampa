; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude DeleteRobotStateFromWarehouse-request.msg.html

(cl:defclass <DeleteRobotStateFromWarehouse-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass DeleteRobotStateFromWarehouse-request (<DeleteRobotStateFromWarehouse-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DeleteRobotStateFromWarehouse-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DeleteRobotStateFromWarehouse-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<DeleteRobotStateFromWarehouse-request> is deprecated: use moveit_msgs-srv:DeleteRobotStateFromWarehouse-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <DeleteRobotStateFromWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:name-val is deprecated.  Use moveit_msgs-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'robot-val :lambda-list '(m))
(cl:defmethod robot-val ((m <DeleteRobotStateFromWarehouse-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:robot-val is deprecated.  Use moveit_msgs-srv:robot instead.")
  (robot m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DeleteRobotStateFromWarehouse-request>) ostream)
  "Serializes a message object of type '<DeleteRobotStateFromWarehouse-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DeleteRobotStateFromWarehouse-request>) istream)
  "Deserializes a message object of type '<DeleteRobotStateFromWarehouse-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DeleteRobotStateFromWarehouse-request>)))
  "Returns string type for a service object of type '<DeleteRobotStateFromWarehouse-request>"
  "moveit_msgs/DeleteRobotStateFromWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DeleteRobotStateFromWarehouse-request)))
  "Returns string type for a service object of type 'DeleteRobotStateFromWarehouse-request"
  "moveit_msgs/DeleteRobotStateFromWarehouseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DeleteRobotStateFromWarehouse-request>)))
  "Returns md5sum for a message object of type '<DeleteRobotStateFromWarehouse-request>"
  "dab44354403f811c40b84964e068219c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DeleteRobotStateFromWarehouse-request)))
  "Returns md5sum for a message object of type 'DeleteRobotStateFromWarehouse-request"
  "dab44354403f811c40b84964e068219c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DeleteRobotStateFromWarehouse-request>)))
  "Returns full string definition for message of type '<DeleteRobotStateFromWarehouse-request>"
  (cl:format cl:nil "string name~%string robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DeleteRobotStateFromWarehouse-request)))
  "Returns full string definition for message of type 'DeleteRobotStateFromWarehouse-request"
  (cl:format cl:nil "string name~%string robot~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DeleteRobotStateFromWarehouse-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'robot))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DeleteRobotStateFromWarehouse-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DeleteRobotStateFromWarehouse-request
    (cl:cons ':name (name msg))
    (cl:cons ':robot (robot msg))
))
;//! \htmlinclude DeleteRobotStateFromWarehouse-response.msg.html

(cl:defclass <DeleteRobotStateFromWarehouse-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass DeleteRobotStateFromWarehouse-response (<DeleteRobotStateFromWarehouse-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DeleteRobotStateFromWarehouse-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DeleteRobotStateFromWarehouse-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<DeleteRobotStateFromWarehouse-response> is deprecated: use moveit_msgs-srv:DeleteRobotStateFromWarehouse-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DeleteRobotStateFromWarehouse-response>) ostream)
  "Serializes a message object of type '<DeleteRobotStateFromWarehouse-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DeleteRobotStateFromWarehouse-response>) istream)
  "Deserializes a message object of type '<DeleteRobotStateFromWarehouse-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DeleteRobotStateFromWarehouse-response>)))
  "Returns string type for a service object of type '<DeleteRobotStateFromWarehouse-response>"
  "moveit_msgs/DeleteRobotStateFromWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DeleteRobotStateFromWarehouse-response)))
  "Returns string type for a service object of type 'DeleteRobotStateFromWarehouse-response"
  "moveit_msgs/DeleteRobotStateFromWarehouseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DeleteRobotStateFromWarehouse-response>)))
  "Returns md5sum for a message object of type '<DeleteRobotStateFromWarehouse-response>"
  "dab44354403f811c40b84964e068219c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DeleteRobotStateFromWarehouse-response)))
  "Returns md5sum for a message object of type 'DeleteRobotStateFromWarehouse-response"
  "dab44354403f811c40b84964e068219c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DeleteRobotStateFromWarehouse-response>)))
  "Returns full string definition for message of type '<DeleteRobotStateFromWarehouse-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DeleteRobotStateFromWarehouse-response)))
  "Returns full string definition for message of type 'DeleteRobotStateFromWarehouse-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DeleteRobotStateFromWarehouse-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DeleteRobotStateFromWarehouse-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DeleteRobotStateFromWarehouse-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DeleteRobotStateFromWarehouse)))
  'DeleteRobotStateFromWarehouse-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DeleteRobotStateFromWarehouse)))
  'DeleteRobotStateFromWarehouse-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DeleteRobotStateFromWarehouse)))
  "Returns string type for a service object of type '<DeleteRobotStateFromWarehouse>"
  "moveit_msgs/DeleteRobotStateFromWarehouse")