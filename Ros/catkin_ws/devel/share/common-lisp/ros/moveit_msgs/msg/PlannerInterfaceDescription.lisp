; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude PlannerInterfaceDescription.msg.html

(cl:defclass <PlannerInterfaceDescription> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (planner_ids
    :reader planner_ids
    :initarg :planner_ids
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass PlannerInterfaceDescription (<PlannerInterfaceDescription>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlannerInterfaceDescription>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlannerInterfaceDescription)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<PlannerInterfaceDescription> is deprecated: use moveit_msgs-msg:PlannerInterfaceDescription instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <PlannerInterfaceDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:name-val is deprecated.  Use moveit_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'planner_ids-val :lambda-list '(m))
(cl:defmethod planner_ids-val ((m <PlannerInterfaceDescription>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:planner_ids-val is deprecated.  Use moveit_msgs-msg:planner_ids instead.")
  (planner_ids m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlannerInterfaceDescription>) ostream)
  "Serializes a message object of type '<PlannerInterfaceDescription>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'planner_ids))))
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
   (cl:slot-value msg 'planner_ids))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlannerInterfaceDescription>) istream)
  "Deserializes a message object of type '<PlannerInterfaceDescription>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'planner_ids) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'planner_ids)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlannerInterfaceDescription>)))
  "Returns string type for a message object of type '<PlannerInterfaceDescription>"
  "moveit_msgs/PlannerInterfaceDescription")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlannerInterfaceDescription)))
  "Returns string type for a message object of type 'PlannerInterfaceDescription"
  "moveit_msgs/PlannerInterfaceDescription")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlannerInterfaceDescription>)))
  "Returns md5sum for a message object of type '<PlannerInterfaceDescription>"
  "ea5f6e6129aa1b110ccda9900d2bf25e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlannerInterfaceDescription)))
  "Returns md5sum for a message object of type 'PlannerInterfaceDescription"
  "ea5f6e6129aa1b110ccda9900d2bf25e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlannerInterfaceDescription>)))
  "Returns full string definition for message of type '<PlannerInterfaceDescription>"
  (cl:format cl:nil "# The name of the planner interface~%string name~%~%# The names of the planner ids within the interface~%string[] planner_ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlannerInterfaceDescription)))
  "Returns full string definition for message of type 'PlannerInterfaceDescription"
  (cl:format cl:nil "# The name of the planner interface~%string name~%~%# The names of the planner ids within the interface~%string[] planner_ids~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlannerInterfaceDescription>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'planner_ids) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlannerInterfaceDescription>))
  "Converts a ROS message object to a list"
  (cl:list 'PlannerInterfaceDescription
    (cl:cons ':name (name msg))
    (cl:cons ':planner_ids (planner_ids msg))
))
