; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude PlanningSceneComponents.msg.html

(cl:defclass <PlanningSceneComponents> (roslisp-msg-protocol:ros-message)
  ((components
    :reader components
    :initarg :components
    :type cl:integer
    :initform 0))
)

(cl:defclass PlanningSceneComponents (<PlanningSceneComponents>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlanningSceneComponents>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlanningSceneComponents)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<PlanningSceneComponents> is deprecated: use moveit_msgs-msg:PlanningSceneComponents instead.")))

(cl:ensure-generic-function 'components-val :lambda-list '(m))
(cl:defmethod components-val ((m <PlanningSceneComponents>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:components-val is deprecated.  Use moveit_msgs-msg:components instead.")
  (components m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<PlanningSceneComponents>)))
    "Constants for message type '<PlanningSceneComponents>"
  '((:SCENE_SETTINGS . 1)
    (:ROBOT_STATE . 2)
    (:ROBOT_STATE_ATTACHED_OBJECTS . 4)
    (:WORLD_OBJECT_NAMES . 8)
    (:WORLD_OBJECT_GEOMETRY . 16)
    (:OCTOMAP . 32)
    (:TRANSFORMS . 64)
    (:ALLOWED_COLLISION_MATRIX . 128)
    (:LINK_PADDING_AND_SCALING . 256)
    (:OBJECT_COLORS . 512))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'PlanningSceneComponents)))
    "Constants for message type 'PlanningSceneComponents"
  '((:SCENE_SETTINGS . 1)
    (:ROBOT_STATE . 2)
    (:ROBOT_STATE_ATTACHED_OBJECTS . 4)
    (:WORLD_OBJECT_NAMES . 8)
    (:WORLD_OBJECT_GEOMETRY . 16)
    (:OCTOMAP . 32)
    (:TRANSFORMS . 64)
    (:ALLOWED_COLLISION_MATRIX . 128)
    (:LINK_PADDING_AND_SCALING . 256)
    (:OBJECT_COLORS . 512))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlanningSceneComponents>) ostream)
  "Serializes a message object of type '<PlanningSceneComponents>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'components)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'components)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'components)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'components)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlanningSceneComponents>) istream)
  "Deserializes a message object of type '<PlanningSceneComponents>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'components)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'components)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'components)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'components)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlanningSceneComponents>)))
  "Returns string type for a message object of type '<PlanningSceneComponents>"
  "moveit_msgs/PlanningSceneComponents")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlanningSceneComponents)))
  "Returns string type for a message object of type 'PlanningSceneComponents"
  "moveit_msgs/PlanningSceneComponents")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlanningSceneComponents>)))
  "Returns md5sum for a message object of type '<PlanningSceneComponents>"
  "bc993e784476960b918b6e7ad5bb58ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlanningSceneComponents)))
  "Returns md5sum for a message object of type 'PlanningSceneComponents"
  "bc993e784476960b918b6e7ad5bb58ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlanningSceneComponents>)))
  "Returns full string definition for message of type '<PlanningSceneComponents>"
  (cl:format cl:nil "# This message defines the components that make up the PlanningScene message.~%# The values can be used as a bitfield to specify which parts of the PlanningScene message~%# are of interest~%~%# Scene name, model name, model root~%uint32 SCENE_SETTINGS=1~%~%# Joint values of the robot state~%uint32 ROBOT_STATE=2~%~%# Attached objects (including geometry) for the robot state~%uint32 ROBOT_STATE_ATTACHED_OBJECTS=4~%~%# The names of the world objects~%uint32 WORLD_OBJECT_NAMES=8~%~%# The geometry of the world objects~%uint32 WORLD_OBJECT_GEOMETRY=16~%~%# The maintained octomap ~%uint32 OCTOMAP=32~%~%# The maintained list of transforms~%uint32 TRANSFORMS=64~%~%# The allowed collision matrix~%uint32 ALLOWED_COLLISION_MATRIX=128~%~%# The default link padding and link scaling~%uint32 LINK_PADDING_AND_SCALING=256~%~%# The stored object colors~%uint32 OBJECT_COLORS=512~%~%# Bitfield combining options indicated above~%uint32 components~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlanningSceneComponents)))
  "Returns full string definition for message of type 'PlanningSceneComponents"
  (cl:format cl:nil "# This message defines the components that make up the PlanningScene message.~%# The values can be used as a bitfield to specify which parts of the PlanningScene message~%# are of interest~%~%# Scene name, model name, model root~%uint32 SCENE_SETTINGS=1~%~%# Joint values of the robot state~%uint32 ROBOT_STATE=2~%~%# Attached objects (including geometry) for the robot state~%uint32 ROBOT_STATE_ATTACHED_OBJECTS=4~%~%# The names of the world objects~%uint32 WORLD_OBJECT_NAMES=8~%~%# The geometry of the world objects~%uint32 WORLD_OBJECT_GEOMETRY=16~%~%# The maintained octomap ~%uint32 OCTOMAP=32~%~%# The maintained list of transforms~%uint32 TRANSFORMS=64~%~%# The allowed collision matrix~%uint32 ALLOWED_COLLISION_MATRIX=128~%~%# The default link padding and link scaling~%uint32 LINK_PADDING_AND_SCALING=256~%~%# The stored object colors~%uint32 OBJECT_COLORS=512~%~%# Bitfield combining options indicated above~%uint32 components~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlanningSceneComponents>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlanningSceneComponents>))
  "Converts a ROS message object to a list"
  (cl:list 'PlanningSceneComponents
    (cl:cons ':components (components msg))
))
