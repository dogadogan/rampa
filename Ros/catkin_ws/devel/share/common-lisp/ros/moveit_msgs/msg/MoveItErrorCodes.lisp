; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude MoveItErrorCodes.msg.html

(cl:defclass <MoveItErrorCodes> (roslisp-msg-protocol:ros-message)
  ((val
    :reader val
    :initarg :val
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveItErrorCodes (<MoveItErrorCodes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveItErrorCodes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveItErrorCodes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<MoveItErrorCodes> is deprecated: use moveit_msgs-msg:MoveItErrorCodes instead.")))

(cl:ensure-generic-function 'val-val :lambda-list '(m))
(cl:defmethod val-val ((m <MoveItErrorCodes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:val-val is deprecated.  Use moveit_msgs-msg:val instead.")
  (val m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<MoveItErrorCodes>)))
    "Constants for message type '<MoveItErrorCodes>"
  '((:SUCCESS . 1)
    (:FAILURE . 99999)
    (:PLANNING_FAILED . -1)
    (:INVALID_MOTION_PLAN . -2)
    (:MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE . -3)
    (:CONTROL_FAILED . -4)
    (:UNABLE_TO_AQUIRE_SENSOR_DATA . -5)
    (:TIMED_OUT . -6)
    (:PREEMPTED . -7)
    (:START_STATE_IN_COLLISION . -10)
    (:START_STATE_VIOLATES_PATH_CONSTRAINTS . -11)
    (:GOAL_IN_COLLISION . -12)
    (:GOAL_VIOLATES_PATH_CONSTRAINTS . -13)
    (:GOAL_CONSTRAINTS_VIOLATED . -14)
    (:INVALID_GROUP_NAME . -15)
    (:INVALID_GOAL_CONSTRAINTS . -16)
    (:INVALID_ROBOT_STATE . -17)
    (:INVALID_LINK_NAME . -18)
    (:INVALID_OBJECT_NAME . -19)
    (:FRAME_TRANSFORM_FAILURE . -21)
    (:COLLISION_CHECKING_UNAVAILABLE . -22)
    (:ROBOT_STATE_STALE . -23)
    (:SENSOR_INFO_STALE . -24)
    (:COMMUNICATION_FAILURE . -25)
    (:NO_IK_SOLUTION . -31))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'MoveItErrorCodes)))
    "Constants for message type 'MoveItErrorCodes"
  '((:SUCCESS . 1)
    (:FAILURE . 99999)
    (:PLANNING_FAILED . -1)
    (:INVALID_MOTION_PLAN . -2)
    (:MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE . -3)
    (:CONTROL_FAILED . -4)
    (:UNABLE_TO_AQUIRE_SENSOR_DATA . -5)
    (:TIMED_OUT . -6)
    (:PREEMPTED . -7)
    (:START_STATE_IN_COLLISION . -10)
    (:START_STATE_VIOLATES_PATH_CONSTRAINTS . -11)
    (:GOAL_IN_COLLISION . -12)
    (:GOAL_VIOLATES_PATH_CONSTRAINTS . -13)
    (:GOAL_CONSTRAINTS_VIOLATED . -14)
    (:INVALID_GROUP_NAME . -15)
    (:INVALID_GOAL_CONSTRAINTS . -16)
    (:INVALID_ROBOT_STATE . -17)
    (:INVALID_LINK_NAME . -18)
    (:INVALID_OBJECT_NAME . -19)
    (:FRAME_TRANSFORM_FAILURE . -21)
    (:COLLISION_CHECKING_UNAVAILABLE . -22)
    (:ROBOT_STATE_STALE . -23)
    (:SENSOR_INFO_STALE . -24)
    (:COMMUNICATION_FAILURE . -25)
    (:NO_IK_SOLUTION . -31))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveItErrorCodes>) ostream)
  "Serializes a message object of type '<MoveItErrorCodes>"
  (cl:let* ((signed (cl:slot-value msg 'val)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveItErrorCodes>) istream)
  "Deserializes a message object of type '<MoveItErrorCodes>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'val) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveItErrorCodes>)))
  "Returns string type for a message object of type '<MoveItErrorCodes>"
  "moveit_msgs/MoveItErrorCodes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveItErrorCodes)))
  "Returns string type for a message object of type 'MoveItErrorCodes"
  "moveit_msgs/MoveItErrorCodes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveItErrorCodes>)))
  "Returns md5sum for a message object of type '<MoveItErrorCodes>"
  "35a153d4489afb90a182bbf874ecc0f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveItErrorCodes)))
  "Returns md5sum for a message object of type 'MoveItErrorCodes"
  "35a153d4489afb90a182bbf874ecc0f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveItErrorCodes>)))
  "Returns full string definition for message of type '<MoveItErrorCodes>"
  (cl:format cl:nil "int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveItErrorCodes)))
  "Returns full string definition for message of type 'MoveItErrorCodes"
  (cl:format cl:nil "int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveItErrorCodes>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveItErrorCodes>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveItErrorCodes
    (cl:cons ':val (val msg))
))
