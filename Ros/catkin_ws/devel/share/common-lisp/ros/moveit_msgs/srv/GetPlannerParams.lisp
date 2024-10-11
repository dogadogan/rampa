; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude GetPlannerParams-request.msg.html

(cl:defclass <GetPlannerParams-request> (roslisp-msg-protocol:ros-message)
  ((planner_config
    :reader planner_config
    :initarg :planner_config
    :type cl:string
    :initform "")
   (group
    :reader group
    :initarg :group
    :type cl:string
    :initform ""))
)

(cl:defclass GetPlannerParams-request (<GetPlannerParams-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPlannerParams-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPlannerParams-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<GetPlannerParams-request> is deprecated: use moveit_msgs-srv:GetPlannerParams-request instead.")))

(cl:ensure-generic-function 'planner_config-val :lambda-list '(m))
(cl:defmethod planner_config-val ((m <GetPlannerParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:planner_config-val is deprecated.  Use moveit_msgs-srv:planner_config instead.")
  (planner_config m))

(cl:ensure-generic-function 'group-val :lambda-list '(m))
(cl:defmethod group-val ((m <GetPlannerParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:group-val is deprecated.  Use moveit_msgs-srv:group instead.")
  (group m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPlannerParams-request>) ostream)
  "Serializes a message object of type '<GetPlannerParams-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'planner_config))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'planner_config))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'group))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'group))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPlannerParams-request>) istream)
  "Deserializes a message object of type '<GetPlannerParams-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'planner_config) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'planner_config) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'group) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'group) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPlannerParams-request>)))
  "Returns string type for a service object of type '<GetPlannerParams-request>"
  "moveit_msgs/GetPlannerParamsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPlannerParams-request)))
  "Returns string type for a service object of type 'GetPlannerParams-request"
  "moveit_msgs/GetPlannerParamsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPlannerParams-request>)))
  "Returns md5sum for a message object of type '<GetPlannerParams-request>"
  "b3ec1aca2b1471e3eea051c548c69810")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPlannerParams-request)))
  "Returns md5sum for a message object of type 'GetPlannerParams-request"
  "b3ec1aca2b1471e3eea051c548c69810")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPlannerParams-request>)))
  "Returns full string definition for message of type '<GetPlannerParams-request>"
  (cl:format cl:nil "# Name of planning config~%string planner_config~%~%# Optional name of planning group (return global defaults if empty)~%string group~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPlannerParams-request)))
  "Returns full string definition for message of type 'GetPlannerParams-request"
  (cl:format cl:nil "# Name of planning config~%string planner_config~%~%# Optional name of planning group (return global defaults if empty)~%string group~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPlannerParams-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'planner_config))
     4 (cl:length (cl:slot-value msg 'group))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPlannerParams-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPlannerParams-request
    (cl:cons ':planner_config (planner_config msg))
    (cl:cons ':group (group msg))
))
;//! \htmlinclude GetPlannerParams-response.msg.html

(cl:defclass <GetPlannerParams-response> (roslisp-msg-protocol:ros-message)
  ((params
    :reader params
    :initarg :params
    :type moveit_msgs-msg:PlannerParams
    :initform (cl:make-instance 'moveit_msgs-msg:PlannerParams)))
)

(cl:defclass GetPlannerParams-response (<GetPlannerParams-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPlannerParams-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPlannerParams-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<GetPlannerParams-response> is deprecated: use moveit_msgs-srv:GetPlannerParams-response instead.")))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <GetPlannerParams-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:params-val is deprecated.  Use moveit_msgs-srv:params instead.")
  (params m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPlannerParams-response>) ostream)
  "Serializes a message object of type '<GetPlannerParams-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'params) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPlannerParams-response>) istream)
  "Deserializes a message object of type '<GetPlannerParams-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'params) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPlannerParams-response>)))
  "Returns string type for a service object of type '<GetPlannerParams-response>"
  "moveit_msgs/GetPlannerParamsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPlannerParams-response)))
  "Returns string type for a service object of type 'GetPlannerParams-response"
  "moveit_msgs/GetPlannerParamsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPlannerParams-response>)))
  "Returns md5sum for a message object of type '<GetPlannerParams-response>"
  "b3ec1aca2b1471e3eea051c548c69810")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPlannerParams-response)))
  "Returns md5sum for a message object of type 'GetPlannerParams-response"
  "b3ec1aca2b1471e3eea051c548c69810")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPlannerParams-response>)))
  "Returns full string definition for message of type '<GetPlannerParams-response>"
  (cl:format cl:nil "~%# parameters as key-value pairs~%PlannerParams params~%~%~%================================================================================~%MSG: moveit_msgs/PlannerParams~%# parameter names (same size as values)~%string[] keys~%~%# parameter values (same size as keys)~%string[] values~%~%# parameter description (can be empty)~%string[] descriptions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPlannerParams-response)))
  "Returns full string definition for message of type 'GetPlannerParams-response"
  (cl:format cl:nil "~%# parameters as key-value pairs~%PlannerParams params~%~%~%================================================================================~%MSG: moveit_msgs/PlannerParams~%# parameter names (same size as values)~%string[] keys~%~%# parameter values (same size as keys)~%string[] values~%~%# parameter description (can be empty)~%string[] descriptions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPlannerParams-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'params))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPlannerParams-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPlannerParams-response
    (cl:cons ':params (params msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetPlannerParams)))
  'GetPlannerParams-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetPlannerParams)))
  'GetPlannerParams-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPlannerParams)))
  "Returns string type for a service object of type '<GetPlannerParams>"
  "moveit_msgs/GetPlannerParams")