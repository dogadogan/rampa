; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude KinematicSolverInfo.msg.html

(cl:defclass <KinematicSolverInfo> (roslisp-msg-protocol:ros-message)
  ((joint_names
    :reader joint_names
    :initarg :joint_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (limits
    :reader limits
    :initarg :limits
    :type (cl:vector moveit_msgs-msg:JointLimits)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:JointLimits :initial-element (cl:make-instance 'moveit_msgs-msg:JointLimits)))
   (link_names
    :reader link_names
    :initarg :link_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass KinematicSolverInfo (<KinematicSolverInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KinematicSolverInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KinematicSolverInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<KinematicSolverInfo> is deprecated: use moveit_msgs-msg:KinematicSolverInfo instead.")))

(cl:ensure-generic-function 'joint_names-val :lambda-list '(m))
(cl:defmethod joint_names-val ((m <KinematicSolverInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:joint_names-val is deprecated.  Use moveit_msgs-msg:joint_names instead.")
  (joint_names m))

(cl:ensure-generic-function 'limits-val :lambda-list '(m))
(cl:defmethod limits-val ((m <KinematicSolverInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:limits-val is deprecated.  Use moveit_msgs-msg:limits instead.")
  (limits m))

(cl:ensure-generic-function 'link_names-val :lambda-list '(m))
(cl:defmethod link_names-val ((m <KinematicSolverInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:link_names-val is deprecated.  Use moveit_msgs-msg:link_names instead.")
  (link_names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KinematicSolverInfo>) ostream)
  "Serializes a message object of type '<KinematicSolverInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_names))))
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
   (cl:slot-value msg 'joint_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'limits))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'limits))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'link_names))))
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
   (cl:slot-value msg 'link_names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KinematicSolverInfo>) istream)
  "Deserializes a message object of type '<KinematicSolverInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'limits) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'limits)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:JointLimits))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'link_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'link_names)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KinematicSolverInfo>)))
  "Returns string type for a message object of type '<KinematicSolverInfo>"
  "moveit_msgs/KinematicSolverInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KinematicSolverInfo)))
  "Returns string type for a message object of type 'KinematicSolverInfo"
  "moveit_msgs/KinematicSolverInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KinematicSolverInfo>)))
  "Returns md5sum for a message object of type '<KinematicSolverInfo>"
  "cc048557c0f9795c392dd80f8bb00489")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KinematicSolverInfo)))
  "Returns md5sum for a message object of type 'KinematicSolverInfo"
  "cc048557c0f9795c392dd80f8bb00489")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KinematicSolverInfo>)))
  "Returns full string definition for message of type '<KinematicSolverInfo>"
  (cl:format cl:nil "# A list of joints in the kinematic tree~%string[] joint_names~%# A list of joint limits corresponding to the joint names~%moveit_msgs/JointLimits[] limits~%# A list of links that the kinematics node provides solutions for~%string[] link_names~%~%================================================================================~%MSG: moveit_msgs/JointLimits~%# This message contains information about limits of a particular joint (or control dimension)~%string joint_name~%~%# true if the joint has position limits~%bool has_position_limits~%~%# min and max position limits~%float64 min_position~%float64 max_position~%~%# true if joint has velocity limits~%bool has_velocity_limits~%~%# max velocity limit~%float64 max_velocity~%# min_velocity is assumed to be -max_velocity~%~%# true if joint has acceleration limits~%bool has_acceleration_limits~%# max acceleration limit~%float64 max_acceleration~%# min_acceleration is assumed to be -max_acceleration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KinematicSolverInfo)))
  "Returns full string definition for message of type 'KinematicSolverInfo"
  (cl:format cl:nil "# A list of joints in the kinematic tree~%string[] joint_names~%# A list of joint limits corresponding to the joint names~%moveit_msgs/JointLimits[] limits~%# A list of links that the kinematics node provides solutions for~%string[] link_names~%~%================================================================================~%MSG: moveit_msgs/JointLimits~%# This message contains information about limits of a particular joint (or control dimension)~%string joint_name~%~%# true if the joint has position limits~%bool has_position_limits~%~%# min and max position limits~%float64 min_position~%float64 max_position~%~%# true if joint has velocity limits~%bool has_velocity_limits~%~%# max velocity limit~%float64 max_velocity~%# min_velocity is assumed to be -max_velocity~%~%# true if joint has acceleration limits~%bool has_acceleration_limits~%# max acceleration limit~%float64 max_acceleration~%# min_acceleration is assumed to be -max_acceleration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KinematicSolverInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'limits) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'link_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KinematicSolverInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'KinematicSolverInfo
    (cl:cons ':joint_names (joint_names msg))
    (cl:cons ':limits (limits msg))
    (cl:cons ':link_names (link_names msg))
))
