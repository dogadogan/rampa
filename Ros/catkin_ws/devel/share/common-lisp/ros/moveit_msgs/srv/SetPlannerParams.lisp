; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude SetPlannerParams-request.msg.html

(cl:defclass <SetPlannerParams-request> (roslisp-msg-protocol:ros-message)
  ((planner_config
    :reader planner_config
    :initarg :planner_config
    :type cl:string
    :initform "")
   (group
    :reader group
    :initarg :group
    :type cl:string
    :initform "")
   (params
    :reader params
    :initarg :params
    :type moveit_msgs-msg:PlannerParams
    :initform (cl:make-instance 'moveit_msgs-msg:PlannerParams))
   (replace
    :reader replace
    :initarg :replace
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetPlannerParams-request (<SetPlannerParams-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPlannerParams-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPlannerParams-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<SetPlannerParams-request> is deprecated: use moveit_msgs-srv:SetPlannerParams-request instead.")))

(cl:ensure-generic-function 'planner_config-val :lambda-list '(m))
(cl:defmethod planner_config-val ((m <SetPlannerParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:planner_config-val is deprecated.  Use moveit_msgs-srv:planner_config instead.")
  (planner_config m))

(cl:ensure-generic-function 'group-val :lambda-list '(m))
(cl:defmethod group-val ((m <SetPlannerParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:group-val is deprecated.  Use moveit_msgs-srv:group instead.")
  (group m))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <SetPlannerParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:params-val is deprecated.  Use moveit_msgs-srv:params instead.")
  (params m))

(cl:ensure-generic-function 'replace-val :lambda-list '(m))
(cl:defmethod replace-val ((m <SetPlannerParams-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:replace-val is deprecated.  Use moveit_msgs-srv:replace instead.")
  (replace m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPlannerParams-request>) ostream)
  "Serializes a message object of type '<SetPlannerParams-request>"
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
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'params) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'replace) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPlannerParams-request>) istream)
  "Deserializes a message object of type '<SetPlannerParams-request>"
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'params) istream)
    (cl:setf (cl:slot-value msg 'replace) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPlannerParams-request>)))
  "Returns string type for a service object of type '<SetPlannerParams-request>"
  "moveit_msgs/SetPlannerParamsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPlannerParams-request)))
  "Returns string type for a service object of type 'SetPlannerParams-request"
  "moveit_msgs/SetPlannerParamsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPlannerParams-request>)))
  "Returns md5sum for a message object of type '<SetPlannerParams-request>"
  "86762d89189c5f52cda7680fdbceb1db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPlannerParams-request)))
  "Returns md5sum for a message object of type 'SetPlannerParams-request"
  "86762d89189c5f52cda7680fdbceb1db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPlannerParams-request>)))
  "Returns full string definition for message of type '<SetPlannerParams-request>"
  (cl:format cl:nil "# Name of planning config~%string planner_config~%~%# Optional name of planning group (set global defaults if empty)~%string group~%~%# parameters as key-value pairs~%PlannerParams params~%~%# replace params or augment existing ones?~%bool replace~%~%~%================================================================================~%MSG: moveit_msgs/PlannerParams~%# parameter names (same size as values)~%string[] keys~%~%# parameter values (same size as keys)~%string[] values~%~%# parameter description (can be empty)~%string[] descriptions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPlannerParams-request)))
  "Returns full string definition for message of type 'SetPlannerParams-request"
  (cl:format cl:nil "# Name of planning config~%string planner_config~%~%# Optional name of planning group (set global defaults if empty)~%string group~%~%# parameters as key-value pairs~%PlannerParams params~%~%# replace params or augment existing ones?~%bool replace~%~%~%================================================================================~%MSG: moveit_msgs/PlannerParams~%# parameter names (same size as values)~%string[] keys~%~%# parameter values (same size as keys)~%string[] values~%~%# parameter description (can be empty)~%string[] descriptions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPlannerParams-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'planner_config))
     4 (cl:length (cl:slot-value msg 'group))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'params))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPlannerParams-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPlannerParams-request
    (cl:cons ':planner_config (planner_config msg))
    (cl:cons ':group (group msg))
    (cl:cons ':params (params msg))
    (cl:cons ':replace (replace msg))
))
;//! \htmlinclude SetPlannerParams-response.msg.html

(cl:defclass <SetPlannerParams-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SetPlannerParams-response (<SetPlannerParams-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetPlannerParams-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetPlannerParams-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<SetPlannerParams-response> is deprecated: use moveit_msgs-srv:SetPlannerParams-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetPlannerParams-response>) ostream)
  "Serializes a message object of type '<SetPlannerParams-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetPlannerParams-response>) istream)
  "Deserializes a message object of type '<SetPlannerParams-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetPlannerParams-response>)))
  "Returns string type for a service object of type '<SetPlannerParams-response>"
  "moveit_msgs/SetPlannerParamsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPlannerParams-response)))
  "Returns string type for a service object of type 'SetPlannerParams-response"
  "moveit_msgs/SetPlannerParamsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetPlannerParams-response>)))
  "Returns md5sum for a message object of type '<SetPlannerParams-response>"
  "86762d89189c5f52cda7680fdbceb1db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetPlannerParams-response)))
  "Returns md5sum for a message object of type 'SetPlannerParams-response"
  "86762d89189c5f52cda7680fdbceb1db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetPlannerParams-response>)))
  "Returns full string definition for message of type '<SetPlannerParams-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetPlannerParams-response)))
  "Returns full string definition for message of type 'SetPlannerParams-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetPlannerParams-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetPlannerParams-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetPlannerParams-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetPlannerParams)))
  'SetPlannerParams-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetPlannerParams)))
  'SetPlannerParams-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetPlannerParams)))
  "Returns string type for a service object of type '<SetPlannerParams>"
  "moveit_msgs/SetPlannerParams")