; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude JointLimits.msg.html

(cl:defclass <JointLimits> (roslisp-msg-protocol:ros-message)
  ((joint_name
    :reader joint_name
    :initarg :joint_name
    :type cl:string
    :initform "")
   (has_position_limits
    :reader has_position_limits
    :initarg :has_position_limits
    :type cl:boolean
    :initform cl:nil)
   (min_position
    :reader min_position
    :initarg :min_position
    :type cl:float
    :initform 0.0)
   (max_position
    :reader max_position
    :initarg :max_position
    :type cl:float
    :initform 0.0)
   (has_velocity_limits
    :reader has_velocity_limits
    :initarg :has_velocity_limits
    :type cl:boolean
    :initform cl:nil)
   (max_velocity
    :reader max_velocity
    :initarg :max_velocity
    :type cl:float
    :initform 0.0)
   (has_acceleration_limits
    :reader has_acceleration_limits
    :initarg :has_acceleration_limits
    :type cl:boolean
    :initform cl:nil)
   (max_acceleration
    :reader max_acceleration
    :initarg :max_acceleration
    :type cl:float
    :initform 0.0))
)

(cl:defclass JointLimits (<JointLimits>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointLimits>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointLimits)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<JointLimits> is deprecated: use moveit_msgs-msg:JointLimits instead.")))

(cl:ensure-generic-function 'joint_name-val :lambda-list '(m))
(cl:defmethod joint_name-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:joint_name-val is deprecated.  Use moveit_msgs-msg:joint_name instead.")
  (joint_name m))

(cl:ensure-generic-function 'has_position_limits-val :lambda-list '(m))
(cl:defmethod has_position_limits-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:has_position_limits-val is deprecated.  Use moveit_msgs-msg:has_position_limits instead.")
  (has_position_limits m))

(cl:ensure-generic-function 'min_position-val :lambda-list '(m))
(cl:defmethod min_position-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:min_position-val is deprecated.  Use moveit_msgs-msg:min_position instead.")
  (min_position m))

(cl:ensure-generic-function 'max_position-val :lambda-list '(m))
(cl:defmethod max_position-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:max_position-val is deprecated.  Use moveit_msgs-msg:max_position instead.")
  (max_position m))

(cl:ensure-generic-function 'has_velocity_limits-val :lambda-list '(m))
(cl:defmethod has_velocity_limits-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:has_velocity_limits-val is deprecated.  Use moveit_msgs-msg:has_velocity_limits instead.")
  (has_velocity_limits m))

(cl:ensure-generic-function 'max_velocity-val :lambda-list '(m))
(cl:defmethod max_velocity-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:max_velocity-val is deprecated.  Use moveit_msgs-msg:max_velocity instead.")
  (max_velocity m))

(cl:ensure-generic-function 'has_acceleration_limits-val :lambda-list '(m))
(cl:defmethod has_acceleration_limits-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:has_acceleration_limits-val is deprecated.  Use moveit_msgs-msg:has_acceleration_limits instead.")
  (has_acceleration_limits m))

(cl:ensure-generic-function 'max_acceleration-val :lambda-list '(m))
(cl:defmethod max_acceleration-val ((m <JointLimits>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:max_acceleration-val is deprecated.  Use moveit_msgs-msg:max_acceleration instead.")
  (max_acceleration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointLimits>) ostream)
  "Serializes a message object of type '<JointLimits>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'joint_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'joint_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_position_limits) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'min_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_velocity_limits) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'has_acceleration_limits) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_acceleration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointLimits>) istream)
  "Deserializes a message object of type '<JointLimits>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'joint_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'joint_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'has_position_limits) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_position) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'has_velocity_limits) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'has_acceleration_limits) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_acceleration) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointLimits>)))
  "Returns string type for a message object of type '<JointLimits>"
  "moveit_msgs/JointLimits")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointLimits)))
  "Returns string type for a message object of type 'JointLimits"
  "moveit_msgs/JointLimits")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointLimits>)))
  "Returns md5sum for a message object of type '<JointLimits>"
  "8ca618c7329ea46142cbc864a2efe856")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointLimits)))
  "Returns md5sum for a message object of type 'JointLimits"
  "8ca618c7329ea46142cbc864a2efe856")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointLimits>)))
  "Returns full string definition for message of type '<JointLimits>"
  (cl:format cl:nil "# This message contains information about limits of a particular joint (or control dimension)~%string joint_name~%~%# true if the joint has position limits~%bool has_position_limits~%~%# min and max position limits~%float64 min_position~%float64 max_position~%~%# true if joint has velocity limits~%bool has_velocity_limits~%~%# max velocity limit~%float64 max_velocity~%# min_velocity is assumed to be -max_velocity~%~%# true if joint has acceleration limits~%bool has_acceleration_limits~%# max acceleration limit~%float64 max_acceleration~%# min_acceleration is assumed to be -max_acceleration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointLimits)))
  "Returns full string definition for message of type 'JointLimits"
  (cl:format cl:nil "# This message contains information about limits of a particular joint (or control dimension)~%string joint_name~%~%# true if the joint has position limits~%bool has_position_limits~%~%# min and max position limits~%float64 min_position~%float64 max_position~%~%# true if joint has velocity limits~%bool has_velocity_limits~%~%# max velocity limit~%float64 max_velocity~%# min_velocity is assumed to be -max_velocity~%~%# true if joint has acceleration limits~%bool has_acceleration_limits~%# max acceleration limit~%float64 max_acceleration~%# min_acceleration is assumed to be -max_acceleration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointLimits>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'joint_name))
     1
     8
     8
     1
     8
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointLimits>))
  "Converts a ROS message object to a list"
  (cl:list 'JointLimits
    (cl:cons ':joint_name (joint_name msg))
    (cl:cons ':has_position_limits (has_position_limits msg))
    (cl:cons ':min_position (min_position msg))
    (cl:cons ':max_position (max_position msg))
    (cl:cons ':has_velocity_limits (has_velocity_limits msg))
    (cl:cons ':max_velocity (max_velocity msg))
    (cl:cons ':has_acceleration_limits (has_acceleration_limits msg))
    (cl:cons ':max_acceleration (max_acceleration msg))
))
