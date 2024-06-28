; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude QueryPlannerInterfaces-request.msg.html

(cl:defclass <QueryPlannerInterfaces-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass QueryPlannerInterfaces-request (<QueryPlannerInterfaces-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QueryPlannerInterfaces-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QueryPlannerInterfaces-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<QueryPlannerInterfaces-request> is deprecated: use moveit_msgs-srv:QueryPlannerInterfaces-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QueryPlannerInterfaces-request>) ostream)
  "Serializes a message object of type '<QueryPlannerInterfaces-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QueryPlannerInterfaces-request>) istream)
  "Deserializes a message object of type '<QueryPlannerInterfaces-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QueryPlannerInterfaces-request>)))
  "Returns string type for a service object of type '<QueryPlannerInterfaces-request>"
  "moveit_msgs/QueryPlannerInterfacesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryPlannerInterfaces-request)))
  "Returns string type for a service object of type 'QueryPlannerInterfaces-request"
  "moveit_msgs/QueryPlannerInterfacesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QueryPlannerInterfaces-request>)))
  "Returns md5sum for a message object of type '<QueryPlannerInterfaces-request>"
  "acd3317a4c5631f33127fb428209db05")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QueryPlannerInterfaces-request)))
  "Returns md5sum for a message object of type 'QueryPlannerInterfaces-request"
  "acd3317a4c5631f33127fb428209db05")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QueryPlannerInterfaces-request>)))
  "Returns full string definition for message of type '<QueryPlannerInterfaces-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QueryPlannerInterfaces-request)))
  "Returns full string definition for message of type 'QueryPlannerInterfaces-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QueryPlannerInterfaces-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QueryPlannerInterfaces-request>))
  "Converts a ROS message object to a list"
  (cl:list 'QueryPlannerInterfaces-request
))
;//! \htmlinclude QueryPlannerInterfaces-response.msg.html

(cl:defclass <QueryPlannerInterfaces-response> (roslisp-msg-protocol:ros-message)
  ((planner_interfaces
    :reader planner_interfaces
    :initarg :planner_interfaces
    :type (cl:vector moveit_msgs-msg:PlannerInterfaceDescription)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:PlannerInterfaceDescription :initial-element (cl:make-instance 'moveit_msgs-msg:PlannerInterfaceDescription))))
)

(cl:defclass QueryPlannerInterfaces-response (<QueryPlannerInterfaces-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QueryPlannerInterfaces-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QueryPlannerInterfaces-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<QueryPlannerInterfaces-response> is deprecated: use moveit_msgs-srv:QueryPlannerInterfaces-response instead.")))

(cl:ensure-generic-function 'planner_interfaces-val :lambda-list '(m))
(cl:defmethod planner_interfaces-val ((m <QueryPlannerInterfaces-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:planner_interfaces-val is deprecated.  Use moveit_msgs-srv:planner_interfaces instead.")
  (planner_interfaces m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QueryPlannerInterfaces-response>) ostream)
  "Serializes a message object of type '<QueryPlannerInterfaces-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'planner_interfaces))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'planner_interfaces))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QueryPlannerInterfaces-response>) istream)
  "Deserializes a message object of type '<QueryPlannerInterfaces-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'planner_interfaces) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'planner_interfaces)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:PlannerInterfaceDescription))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QueryPlannerInterfaces-response>)))
  "Returns string type for a service object of type '<QueryPlannerInterfaces-response>"
  "moveit_msgs/QueryPlannerInterfacesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryPlannerInterfaces-response)))
  "Returns string type for a service object of type 'QueryPlannerInterfaces-response"
  "moveit_msgs/QueryPlannerInterfacesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QueryPlannerInterfaces-response>)))
  "Returns md5sum for a message object of type '<QueryPlannerInterfaces-response>"
  "acd3317a4c5631f33127fb428209db05")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QueryPlannerInterfaces-response)))
  "Returns md5sum for a message object of type 'QueryPlannerInterfaces-response"
  "acd3317a4c5631f33127fb428209db05")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QueryPlannerInterfaces-response>)))
  "Returns full string definition for message of type '<QueryPlannerInterfaces-response>"
  (cl:format cl:nil "~%# The planning instances that could be used in the benchmark~%PlannerInterfaceDescription[] planner_interfaces~%~%~%================================================================================~%MSG: moveit_msgs/PlannerInterfaceDescription~%# The name of the planner interface~%string name~%~%# The names of the planner ids within the interface~%string[] planner_ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QueryPlannerInterfaces-response)))
  "Returns full string definition for message of type 'QueryPlannerInterfaces-response"
  (cl:format cl:nil "~%# The planning instances that could be used in the benchmark~%PlannerInterfaceDescription[] planner_interfaces~%~%~%================================================================================~%MSG: moveit_msgs/PlannerInterfaceDescription~%# The name of the planner interface~%string name~%~%# The names of the planner ids within the interface~%string[] planner_ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QueryPlannerInterfaces-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'planner_interfaces) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QueryPlannerInterfaces-response>))
  "Converts a ROS message object to a list"
  (cl:list 'QueryPlannerInterfaces-response
    (cl:cons ':planner_interfaces (planner_interfaces msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'QueryPlannerInterfaces)))
  'QueryPlannerInterfaces-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'QueryPlannerInterfaces)))
  'QueryPlannerInterfaces-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryPlannerInterfaces)))
  "Returns string type for a service object of type '<QueryPlannerInterfaces>"
  "moveit_msgs/QueryPlannerInterfaces")