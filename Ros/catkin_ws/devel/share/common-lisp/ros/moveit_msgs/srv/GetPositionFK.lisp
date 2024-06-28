; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude GetPositionFK-request.msg.html

(cl:defclass <GetPositionFK-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (fk_link_names
    :reader fk_link_names
    :initarg :fk_link_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (robot_state
    :reader robot_state
    :initarg :robot_state
    :type moveit_msgs-msg:RobotState
    :initform (cl:make-instance 'moveit_msgs-msg:RobotState)))
)

(cl:defclass GetPositionFK-request (<GetPositionFK-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPositionFK-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPositionFK-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<GetPositionFK-request> is deprecated: use moveit_msgs-srv:GetPositionFK-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GetPositionFK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:header-val is deprecated.  Use moveit_msgs-srv:header instead.")
  (header m))

(cl:ensure-generic-function 'fk_link_names-val :lambda-list '(m))
(cl:defmethod fk_link_names-val ((m <GetPositionFK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:fk_link_names-val is deprecated.  Use moveit_msgs-srv:fk_link_names instead.")
  (fk_link_names m))

(cl:ensure-generic-function 'robot_state-val :lambda-list '(m))
(cl:defmethod robot_state-val ((m <GetPositionFK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:robot_state-val is deprecated.  Use moveit_msgs-srv:robot_state instead.")
  (robot_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPositionFK-request>) ostream)
  "Serializes a message object of type '<GetPositionFK-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'fk_link_names))))
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
   (cl:slot-value msg 'fk_link_names))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'robot_state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPositionFK-request>) istream)
  "Deserializes a message object of type '<GetPositionFK-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'fk_link_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'fk_link_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'robot_state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPositionFK-request>)))
  "Returns string type for a service object of type '<GetPositionFK-request>"
  "moveit_msgs/GetPositionFKRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPositionFK-request)))
  "Returns string type for a service object of type 'GetPositionFK-request"
  "moveit_msgs/GetPositionFKRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPositionFK-request>)))
  "Returns md5sum for a message object of type '<GetPositionFK-request>"
  "7e5228d4c9e3511cf5071ecf43c502b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPositionFK-request)))
  "Returns md5sum for a message object of type 'GetPositionFK-request"
  "7e5228d4c9e3511cf5071ecf43c502b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPositionFK-request>)))
  "Returns full string definition for message of type '<GetPositionFK-request>"
  (cl:format cl:nil "# A service definition for a standard forward kinematics service~%# The frame_id in the header message is the frame in which ~%# the forward kinematics poses will be returned~%Header header~%~%# A vector of link name for which forward kinematics must be computed~%string[] fk_link_names~%~%# A robot state consisting of joint names and joint positions to be used for forward kinematics~%RobotState robot_state~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: moveit_msgs/RobotState~%# This message contains information about the robot state, i.e. the positions of its joints and links~%sensor_msgs/JointState joint_state~%~%# Joints that may have multiple DOF are specified here~%sensor_msgs/MultiDOFJointState multi_dof_joint_state~%~%# Attached collision objects (attached to some link on the robot)~%AttachedCollisionObject[] attached_collision_objects~%~%# Flag indicating whether this scene is to be interpreted as a diff with respect to some other scene~%# This is mostly important for handling the attached bodies (whether or not to clear the attached bodies~%# of a moveit::core::RobotState before updating it with this message)~%bool is_diff~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: sensor_msgs/MultiDOFJointState~%# Representation of state for joints with multiple degrees of freedom, ~%# following the structure of JointState.~%#~%# It is assumed that a joint in a system corresponds to a transform that gets applied ~%# along the kinematic chain. For example, a planar joint (as in URDF) is 3DOF (x, y, yaw)~%# and those 3DOF can be expressed as a transformation matrix, and that transformation~%# matrix can be converted back to (x, y, yaw)~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# wrench associated with them, you can leave the wrench array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%Header header~%~%string[] joint_names~%geometry_msgs/Transform[] transforms~%geometry_msgs/Twist[] twist~%geometry_msgs/Wrench[] wrench~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%================================================================================~%MSG: moveit_msgs/AttachedCollisionObject~%# The CollisionObject will be attached with a fixed joint to this link~%string link_name~%~%#This contains the actual shapes and poses for the CollisionObject~%#to be attached to the link~%#If action is remove and no object.id is set, all objects~%#attached to the link indicated by link_name will be removed~%CollisionObject object~%~%# The set of links that the attached objects are allowed to touch~%# by default - the link_name is already considered by default~%string[] touch_links~%~%# If certain links were placed in a particular posture for this object to remain attached ~%# (e.g., an end effector closing around an object), the posture necessary for releasing~%# the object is stored here~%trajectory_msgs/JointTrajectory detach_posture~%~%# The weight of the attached object, if known~%float64 weight~%~%================================================================================~%MSG: moveit_msgs/CollisionObject~%# A header, used for interpreting the poses~%Header header~%~%# DISCLAIMER: This field is not in use yet and all other poses~%# are still interpreted in the header frame.~%# https://github.com/ros-planning/moveit/pull/2037~%# implements the actual logic for this field.~%# ---~%# The object's pose relative to the header frame.~%# The shapes and subframe poses are defined relative to this pose.~%geometry_msgs/Pose pose~%~%# The id of the object (name used in MoveIt)~%string id~%~%# The object type in a database of known objects~%object_recognition_msgs/ObjectType type~%~%# The collision geometries associated with the object.~%# Their poses are with respect to the object's pose~%~%# Solid geometric primitives~%shape_msgs/SolidPrimitive[] primitives~%geometry_msgs/Pose[] primitive_poses~%~%# Meshes~%shape_msgs/Mesh[] meshes~%geometry_msgs/Pose[] mesh_poses~%~%# Bounding planes (equation is specified, but the plane can be oriented using an additional pose)~%shape_msgs/Plane[] planes~%geometry_msgs/Pose[] plane_poses~%~%# Named subframes on the object. Use these to define points of interest on the object that you want~%# to plan with (e.g. \"tip\", \"spout\", \"handle\"). The id of the object will be prepended to the subframe.~%# If an object with the id \"screwdriver\" and a subframe \"tip\" is in the scene, you can use the frame~%# \"screwdriver/tip\" for planning.~%# The length of the subframe_names and subframe_poses has to be identical.~%string[] subframe_names~%geometry_msgs/Pose[] subframe_poses~%~%# Adds the object to the planning scene. If the object previously existed, it is replaced.~%byte ADD=0~%~%# Removes the object from the environment entirely (everything that matches the specified id)~%byte REMOVE=1~%~%# Append to an object that already exists in the planning scene. If the object does not exist, it is added.~%byte APPEND=2~%~%# If an object already exists in the scene, new poses can be sent (the geometry arrays must be left empty)~%# if solely moving the object is desired~%byte MOVE=3~%~%# Operation to be performed~%byte operation~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: object_recognition_msgs/ObjectType~%################################################## OBJECT ID #########################################################~%~%# Contains information about the type of a found object. Those two sets of parameters together uniquely define an~%# object~%~%# The key of the found object: the unique identifier in the given db~%string key~%~%# The db parameters stored as a JSON/compressed YAML string. An object id does not make sense without the corresponding~%# database. E.g., in object_recognition, it can look like: \"{'type':'CouchDB', 'root':'http://localhost'}\"~%# There is no conventional format for those parameters and it's nice to keep that flexibility.~%# The object_recognition_core as a generic DB type that can read those fields~%# Current examples:~%# For CouchDB:~%#   type: 'CouchDB'~%#   root: 'http://localhost:5984'~%#   collection: 'object_recognition'~%# For SQL household database:~%#   type: 'SqlHousehold'~%#   host: 'wgs36'~%#   port: 5432~%#   user: 'willow'~%#   password: 'willow'~%#   name: 'household_objects'~%#   module: 'tabletop'~%string db~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: shape_msgs/Mesh~%# Definition of a mesh~%~%# list of triangles; the index values refer to positions in vertices[]~%MeshTriangle[] triangles~%~%# the actual vertices that make up the mesh~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: shape_msgs/MeshTriangle~%# Definition of a triangle's vertices~%uint32[3] vertex_indices~%~%================================================================================~%MSG: shape_msgs/Plane~%# Representation of a plane, using the plane equation ax + by + cz + d = 0~%~%# a := coef[0]~%# b := coef[1]~%# c := coef[2]~%# d := coef[3]~%~%float64[4] coef~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPositionFK-request)))
  "Returns full string definition for message of type 'GetPositionFK-request"
  (cl:format cl:nil "# A service definition for a standard forward kinematics service~%# The frame_id in the header message is the frame in which ~%# the forward kinematics poses will be returned~%Header header~%~%# A vector of link name for which forward kinematics must be computed~%string[] fk_link_names~%~%# A robot state consisting of joint names and joint positions to be used for forward kinematics~%RobotState robot_state~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: moveit_msgs/RobotState~%# This message contains information about the robot state, i.e. the positions of its joints and links~%sensor_msgs/JointState joint_state~%~%# Joints that may have multiple DOF are specified here~%sensor_msgs/MultiDOFJointState multi_dof_joint_state~%~%# Attached collision objects (attached to some link on the robot)~%AttachedCollisionObject[] attached_collision_objects~%~%# Flag indicating whether this scene is to be interpreted as a diff with respect to some other scene~%# This is mostly important for handling the attached bodies (whether or not to clear the attached bodies~%# of a moveit::core::RobotState before updating it with this message)~%bool is_diff~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: sensor_msgs/MultiDOFJointState~%# Representation of state for joints with multiple degrees of freedom, ~%# following the structure of JointState.~%#~%# It is assumed that a joint in a system corresponds to a transform that gets applied ~%# along the kinematic chain. For example, a planar joint (as in URDF) is 3DOF (x, y, yaw)~%# and those 3DOF can be expressed as a transformation matrix, and that transformation~%# matrix can be converted back to (x, y, yaw)~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# wrench associated with them, you can leave the wrench array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%Header header~%~%string[] joint_names~%geometry_msgs/Transform[] transforms~%geometry_msgs/Twist[] twist~%geometry_msgs/Wrench[] wrench~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Wrench~%# This represents force in free space, separated into~%# its linear and angular parts.~%Vector3  force~%Vector3  torque~%~%================================================================================~%MSG: moveit_msgs/AttachedCollisionObject~%# The CollisionObject will be attached with a fixed joint to this link~%string link_name~%~%#This contains the actual shapes and poses for the CollisionObject~%#to be attached to the link~%#If action is remove and no object.id is set, all objects~%#attached to the link indicated by link_name will be removed~%CollisionObject object~%~%# The set of links that the attached objects are allowed to touch~%# by default - the link_name is already considered by default~%string[] touch_links~%~%# If certain links were placed in a particular posture for this object to remain attached ~%# (e.g., an end effector closing around an object), the posture necessary for releasing~%# the object is stored here~%trajectory_msgs/JointTrajectory detach_posture~%~%# The weight of the attached object, if known~%float64 weight~%~%================================================================================~%MSG: moveit_msgs/CollisionObject~%# A header, used for interpreting the poses~%Header header~%~%# DISCLAIMER: This field is not in use yet and all other poses~%# are still interpreted in the header frame.~%# https://github.com/ros-planning/moveit/pull/2037~%# implements the actual logic for this field.~%# ---~%# The object's pose relative to the header frame.~%# The shapes and subframe poses are defined relative to this pose.~%geometry_msgs/Pose pose~%~%# The id of the object (name used in MoveIt)~%string id~%~%# The object type in a database of known objects~%object_recognition_msgs/ObjectType type~%~%# The collision geometries associated with the object.~%# Their poses are with respect to the object's pose~%~%# Solid geometric primitives~%shape_msgs/SolidPrimitive[] primitives~%geometry_msgs/Pose[] primitive_poses~%~%# Meshes~%shape_msgs/Mesh[] meshes~%geometry_msgs/Pose[] mesh_poses~%~%# Bounding planes (equation is specified, but the plane can be oriented using an additional pose)~%shape_msgs/Plane[] planes~%geometry_msgs/Pose[] plane_poses~%~%# Named subframes on the object. Use these to define points of interest on the object that you want~%# to plan with (e.g. \"tip\", \"spout\", \"handle\"). The id of the object will be prepended to the subframe.~%# If an object with the id \"screwdriver\" and a subframe \"tip\" is in the scene, you can use the frame~%# \"screwdriver/tip\" for planning.~%# The length of the subframe_names and subframe_poses has to be identical.~%string[] subframe_names~%geometry_msgs/Pose[] subframe_poses~%~%# Adds the object to the planning scene. If the object previously existed, it is replaced.~%byte ADD=0~%~%# Removes the object from the environment entirely (everything that matches the specified id)~%byte REMOVE=1~%~%# Append to an object that already exists in the planning scene. If the object does not exist, it is added.~%byte APPEND=2~%~%# If an object already exists in the scene, new poses can be sent (the geometry arrays must be left empty)~%# if solely moving the object is desired~%byte MOVE=3~%~%# Operation to be performed~%byte operation~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: object_recognition_msgs/ObjectType~%################################################## OBJECT ID #########################################################~%~%# Contains information about the type of a found object. Those two sets of parameters together uniquely define an~%# object~%~%# The key of the found object: the unique identifier in the given db~%string key~%~%# The db parameters stored as a JSON/compressed YAML string. An object id does not make sense without the corresponding~%# database. E.g., in object_recognition, it can look like: \"{'type':'CouchDB', 'root':'http://localhost'}\"~%# There is no conventional format for those parameters and it's nice to keep that flexibility.~%# The object_recognition_core as a generic DB type that can read those fields~%# Current examples:~%# For CouchDB:~%#   type: 'CouchDB'~%#   root: 'http://localhost:5984'~%#   collection: 'object_recognition'~%# For SQL household database:~%#   type: 'SqlHousehold'~%#   host: 'wgs36'~%#   port: 5432~%#   user: 'willow'~%#   password: 'willow'~%#   name: 'household_objects'~%#   module: 'tabletop'~%string db~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: shape_msgs/Mesh~%# Definition of a mesh~%~%# list of triangles; the index values refer to positions in vertices[]~%MeshTriangle[] triangles~%~%# the actual vertices that make up the mesh~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: shape_msgs/MeshTriangle~%# Definition of a triangle's vertices~%uint32[3] vertex_indices~%~%================================================================================~%MSG: shape_msgs/Plane~%# Representation of a plane, using the plane equation ax + by + cz + d = 0~%~%# a := coef[0]~%# b := coef[1]~%# c := coef[2]~%# d := coef[3]~%~%float64[4] coef~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPositionFK-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'fk_link_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'robot_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPositionFK-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPositionFK-request
    (cl:cons ':header (header msg))
    (cl:cons ':fk_link_names (fk_link_names msg))
    (cl:cons ':robot_state (robot_state msg))
))
;//! \htmlinclude GetPositionFK-response.msg.html

(cl:defclass <GetPositionFK-response> (roslisp-msg-protocol:ros-message)
  ((pose_stamped
    :reader pose_stamped
    :initarg :pose_stamped
    :type (cl:vector geometry_msgs-msg:PoseStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PoseStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PoseStamped)))
   (fk_link_names
    :reader fk_link_names
    :initarg :fk_link_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (error_code
    :reader error_code
    :initarg :error_code
    :type moveit_msgs-msg:MoveItErrorCodes
    :initform (cl:make-instance 'moveit_msgs-msg:MoveItErrorCodes)))
)

(cl:defclass GetPositionFK-response (<GetPositionFK-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPositionFK-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPositionFK-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<GetPositionFK-response> is deprecated: use moveit_msgs-srv:GetPositionFK-response instead.")))

(cl:ensure-generic-function 'pose_stamped-val :lambda-list '(m))
(cl:defmethod pose_stamped-val ((m <GetPositionFK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:pose_stamped-val is deprecated.  Use moveit_msgs-srv:pose_stamped instead.")
  (pose_stamped m))

(cl:ensure-generic-function 'fk_link_names-val :lambda-list '(m))
(cl:defmethod fk_link_names-val ((m <GetPositionFK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:fk_link_names-val is deprecated.  Use moveit_msgs-srv:fk_link_names instead.")
  (fk_link_names m))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <GetPositionFK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:error_code-val is deprecated.  Use moveit_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPositionFK-response>) ostream)
  "Serializes a message object of type '<GetPositionFK-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_stamped))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pose_stamped))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'fk_link_names))))
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
   (cl:slot-value msg 'fk_link_names))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error_code) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPositionFK-response>) istream)
  "Deserializes a message object of type '<GetPositionFK-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose_stamped) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_stamped)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PoseStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'fk_link_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'fk_link_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error_code) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPositionFK-response>)))
  "Returns string type for a service object of type '<GetPositionFK-response>"
  "moveit_msgs/GetPositionFKResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPositionFK-response)))
  "Returns string type for a service object of type 'GetPositionFK-response"
  "moveit_msgs/GetPositionFKResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPositionFK-response>)))
  "Returns md5sum for a message object of type '<GetPositionFK-response>"
  "7e5228d4c9e3511cf5071ecf43c502b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPositionFK-response)))
  "Returns md5sum for a message object of type 'GetPositionFK-response"
  "7e5228d4c9e3511cf5071ecf43c502b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPositionFK-response>)))
  "Returns full string definition for message of type '<GetPositionFK-response>"
  (cl:format cl:nil "# The resultant vector of PoseStamped messages that contains the (stamped) poses of the requested links~%geometry_msgs/PoseStamped[] pose_stamped~%~%# The list of link names corresponding to the poses~%string[] fk_link_names~%~%MoveItErrorCodes error_code~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: moveit_msgs/MoveItErrorCodes~%int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPositionFK-response)))
  "Returns full string definition for message of type 'GetPositionFK-response"
  (cl:format cl:nil "# The resultant vector of PoseStamped messages that contains the (stamped) poses of the requested links~%geometry_msgs/PoseStamped[] pose_stamped~%~%# The list of link names corresponding to the poses~%string[] fk_link_names~%~%MoveItErrorCodes error_code~%~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: moveit_msgs/MoveItErrorCodes~%int32 val~%~%# overall behavior~%int32 SUCCESS=1~%int32 FAILURE=99999~%~%int32 PLANNING_FAILED=-1~%int32 INVALID_MOTION_PLAN=-2~%int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3~%int32 CONTROL_FAILED=-4~%int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5~%int32 TIMED_OUT=-6~%int32 PREEMPTED=-7~%~%# planning & kinematics request errors~%int32 START_STATE_IN_COLLISION=-10~%int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11~%~%int32 GOAL_IN_COLLISION=-12~%int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13~%int32 GOAL_CONSTRAINTS_VIOLATED=-14~%~%int32 INVALID_GROUP_NAME=-15~%int32 INVALID_GOAL_CONSTRAINTS=-16~%int32 INVALID_ROBOT_STATE=-17~%int32 INVALID_LINK_NAME=-18~%int32 INVALID_OBJECT_NAME=-19~%~%# system errors~%int32 FRAME_TRANSFORM_FAILURE=-21~%int32 COLLISION_CHECKING_UNAVAILABLE=-22~%int32 ROBOT_STATE_STALE=-23~%int32 SENSOR_INFO_STALE=-24~%int32 COMMUNICATION_FAILURE=-25~%~%# kinematics errors~%int32 NO_IK_SOLUTION=-31~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPositionFK-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_stamped) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'fk_link_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error_code))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPositionFK-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPositionFK-response
    (cl:cons ':pose_stamped (pose_stamped msg))
    (cl:cons ':fk_link_names (fk_link_names msg))
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetPositionFK)))
  'GetPositionFK-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetPositionFK)))
  'GetPositionFK-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPositionFK)))
  "Returns string type for a service object of type '<GetPositionFK>"
  "moveit_msgs/GetPositionFK")