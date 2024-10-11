;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::PlanningOptions)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'PlanningOptions (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::PLANNINGOPTIONS")
  (make-package "MOVEIT_MSGS::PLANNINGOPTIONS"))

(in-package "ROS")
;;//! \htmlinclude PlanningOptions.msg.html


(defclass moveit_msgs::PlanningOptions
  :super ros::object
  :slots (_planning_scene_diff _plan_only _look_around _look_around_attempts _max_safe_execution_cost _replan _replan_attempts _replan_delay ))

(defmethod moveit_msgs::PlanningOptions
  (:init
   (&key
    ((:planning_scene_diff __planning_scene_diff) (instance moveit_msgs::PlanningScene :init))
    ((:plan_only __plan_only) nil)
    ((:look_around __look_around) nil)
    ((:look_around_attempts __look_around_attempts) 0)
    ((:max_safe_execution_cost __max_safe_execution_cost) 0.0)
    ((:replan __replan) nil)
    ((:replan_attempts __replan_attempts) 0)
    ((:replan_delay __replan_delay) 0.0)
    )
   (send-super :init)
   (setq _planning_scene_diff __planning_scene_diff)
   (setq _plan_only __plan_only)
   (setq _look_around __look_around)
   (setq _look_around_attempts (round __look_around_attempts))
   (setq _max_safe_execution_cost (float __max_safe_execution_cost))
   (setq _replan __replan)
   (setq _replan_attempts (round __replan_attempts))
   (setq _replan_delay (float __replan_delay))
   self)
  (:planning_scene_diff
   (&rest __planning_scene_diff)
   (if (keywordp (car __planning_scene_diff))
       (send* _planning_scene_diff __planning_scene_diff)
     (progn
       (if __planning_scene_diff (setq _planning_scene_diff (car __planning_scene_diff)))
       _planning_scene_diff)))
  (:plan_only
   (&optional (__plan_only :null))
   (if (not (eq __plan_only :null)) (setq _plan_only __plan_only)) _plan_only)
  (:look_around
   (&optional (__look_around :null))
   (if (not (eq __look_around :null)) (setq _look_around __look_around)) _look_around)
  (:look_around_attempts
   (&optional __look_around_attempts)
   (if __look_around_attempts (setq _look_around_attempts __look_around_attempts)) _look_around_attempts)
  (:max_safe_execution_cost
   (&optional __max_safe_execution_cost)
   (if __max_safe_execution_cost (setq _max_safe_execution_cost __max_safe_execution_cost)) _max_safe_execution_cost)
  (:replan
   (&optional (__replan :null))
   (if (not (eq __replan :null)) (setq _replan __replan)) _replan)
  (:replan_attempts
   (&optional __replan_attempts)
   (if __replan_attempts (setq _replan_attempts __replan_attempts)) _replan_attempts)
  (:replan_delay
   (&optional __replan_delay)
   (if __replan_delay (setq _replan_delay __replan_delay)) _replan_delay)
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/PlanningScene _planning_scene_diff
    (send _planning_scene_diff :serialization-length)
    ;; bool _plan_only
    1
    ;; bool _look_around
    1
    ;; int32 _look_around_attempts
    4
    ;; float64 _max_safe_execution_cost
    8
    ;; bool _replan
    1
    ;; int32 _replan_attempts
    4
    ;; float64 _replan_delay
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/PlanningScene _planning_scene_diff
       (send _planning_scene_diff :serialize s)
     ;; bool _plan_only
       (if _plan_only (write-byte -1 s) (write-byte 0 s))
     ;; bool _look_around
       (if _look_around (write-byte -1 s) (write-byte 0 s))
     ;; int32 _look_around_attempts
       (write-long _look_around_attempts s)
     ;; float64 _max_safe_execution_cost
       (sys::poke _max_safe_execution_cost (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _replan
       (if _replan (write-byte -1 s) (write-byte 0 s))
     ;; int32 _replan_attempts
       (write-long _replan_attempts s)
     ;; float64 _replan_delay
       (sys::poke _replan_delay (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/PlanningScene _planning_scene_diff
     (send _planning_scene_diff :deserialize buf ptr-) (incf ptr- (send _planning_scene_diff :serialization-length))
   ;; bool _plan_only
     (setq _plan_only (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _look_around
     (setq _look_around (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _look_around_attempts
     (setq _look_around_attempts (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _max_safe_execution_cost
     (setq _max_safe_execution_cost (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _replan
     (setq _replan (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int32 _replan_attempts
     (setq _replan_attempts (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _replan_delay
     (setq _replan_delay (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::PlanningOptions :md5sum-) "3134e041c806c7c2ff59948db4d57835")
(setf (get moveit_msgs::PlanningOptions :datatype-) "moveit_msgs/PlanningOptions")
(setf (get moveit_msgs::PlanningOptions :definition-)
      "
# The diff to consider for the planning scene (optional)
PlanningScene planning_scene_diff

# If this flag is set to true, the action
# returns an executable plan in the response but does not attempt execution  
bool plan_only

# If this flag is set to true, the action of planning &
# executing is allowed to look around  (move sensors) if
# it seems that not enough information is available about
# the environment
bool look_around

# If this value is positive, the action of planning & executing
# is allowed to look around for a maximum number of attempts;
# If the value is left as 0, the default value is used, as set
# with dynamic_reconfigure
int32 look_around_attempts

# If set and if look_around is true, this value is used as
# the maximum cost allowed for a path to be considered executable.
# If the cost of a path is higher than this value, more sensing or 
# a new plan needed. If left as 0.0 but look_around is true, then 
# the default value set via dynamic_reconfigure is used
float64 max_safe_execution_cost

# If the plan becomes invalidated during execution, it is possible to have
# that plan recomputed and execution restarted. This flag enables this
# functionality 
bool replan

# The maximum number of replanning attempts 
int32 replan_attempts

# The amount of time to wait in between replanning attempts (in seconds)
float64 replan_delay

================================================================================
MSG: moveit_msgs/PlanningScene
# name of planning scene
string name

# full robot state
RobotState robot_state

# The name of the robot model this scene is for
string robot_model_name

#additional frames for duplicating tf (with respect to the planning frame)
geometry_msgs/TransformStamped[] fixed_frame_transforms

#full allowed collision matrix
AllowedCollisionMatrix allowed_collision_matrix

# all link paddings
LinkPadding[] link_padding

# all link scales
LinkScale[] link_scale

# Attached objects, collision objects, even the octomap or collision map can have 
# colors associated to them. This array specifies them.
ObjectColor[] object_colors

# the collision map
PlanningSceneWorld world

# Flag indicating whether this scene is to be interpreted as a diff with respect to some other scene
bool is_diff

================================================================================
MSG: moveit_msgs/RobotState
# This message contains information about the robot state, i.e. the positions of its joints and links
sensor_msgs/JointState joint_state

# Joints that may have multiple DOF are specified here
sensor_msgs/MultiDOFJointState multi_dof_joint_state

# Attached collision objects (attached to some link on the robot)
AttachedCollisionObject[] attached_collision_objects

# Flag indicating whether this scene is to be interpreted as a diff with respect to some other scene
# This is mostly important for handling the attached bodies (whether or not to clear the attached bodies
# of a moveit::core::RobotState before updating it with this message)
bool is_diff

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/MultiDOFJointState
# Representation of state for joints with multiple degrees of freedom, 
# following the structure of JointState.
#
# It is assumed that a joint in a system corresponds to a transform that gets applied 
# along the kinematic chain. For example, a planar joint (as in URDF) is 3DOF (x, y, yaw)
# and those 3DOF can be expressed as a transformation matrix, and that transformation
# matrix can be converted back to (x, y, yaw)
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# wrench associated with them, you can leave the wrench array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.

Header header

string[] joint_names
geometry_msgs/Transform[] transforms
geometry_msgs/Twist[] twist
geometry_msgs/Wrench[] wrench

================================================================================
MSG: geometry_msgs/Transform
# This represents the transform between two coordinate frames in free space.

Vector3 translation
Quaternion rotation

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Wrench
# This represents force in free space, separated into
# its linear and angular parts.
Vector3  force
Vector3  torque

================================================================================
MSG: moveit_msgs/AttachedCollisionObject
# The CollisionObject will be attached with a fixed joint to this link
string link_name

#This contains the actual shapes and poses for the CollisionObject
#to be attached to the link
#If action is remove and no object.id is set, all objects
#attached to the link indicated by link_name will be removed
CollisionObject object

# The set of links that the attached objects are allowed to touch
# by default - the link_name is already considered by default
string[] touch_links

# If certain links were placed in a particular posture for this object to remain attached 
# (e.g., an end effector closing around an object), the posture necessary for releasing
# the object is stored here
trajectory_msgs/JointTrajectory detach_posture

# The weight of the attached object, if known
float64 weight

================================================================================
MSG: moveit_msgs/CollisionObject
# A header, used for interpreting the poses
Header header

# DISCLAIMER: This field is not in use yet and all other poses
# are still interpreted in the header frame.
# https://github.com/ros-planning/moveit/pull/2037
# implements the actual logic for this field.
# ---
# The object's pose relative to the header frame.
# The shapes and subframe poses are defined relative to this pose.
geometry_msgs/Pose pose

# The id of the object (name used in MoveIt)
string id

# The object type in a database of known objects
object_recognition_msgs/ObjectType type

# The collision geometries associated with the object.
# Their poses are with respect to the object's pose

# Solid geometric primitives
shape_msgs/SolidPrimitive[] primitives
geometry_msgs/Pose[] primitive_poses

# Meshes
shape_msgs/Mesh[] meshes
geometry_msgs/Pose[] mesh_poses

# Bounding planes (equation is specified, but the plane can be oriented using an additional pose)
shape_msgs/Plane[] planes
geometry_msgs/Pose[] plane_poses

# Named subframes on the object. Use these to define points of interest on the object that you want
# to plan with (e.g. \"tip\", \"spout\", \"handle\"). The id of the object will be prepended to the subframe.
# If an object with the id \"screwdriver\" and a subframe \"tip\" is in the scene, you can use the frame
# \"screwdriver/tip\" for planning.
# The length of the subframe_names and subframe_poses has to be identical.
string[] subframe_names
geometry_msgs/Pose[] subframe_poses

# Adds the object to the planning scene. If the object previously existed, it is replaced.
byte ADD=0

# Removes the object from the environment entirely (everything that matches the specified id)
byte REMOVE=1

# Append to an object that already exists in the planning scene. If the object does not exist, it is added.
byte APPEND=2

# If an object already exists in the scene, new poses can be sent (the geometry arrays must be left empty)
# if solely moving the object is desired
byte MOVE=3

# Operation to be performed
byte operation

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: object_recognition_msgs/ObjectType
################################################## OBJECT ID #########################################################

# Contains information about the type of a found object. Those two sets of parameters together uniquely define an
# object

# The key of the found object: the unique identifier in the given db
string key

# The db parameters stored as a JSON/compressed YAML string. An object id does not make sense without the corresponding
# database. E.g., in object_recognition, it can look like: \"{'type':'CouchDB', 'root':'http://localhost'}\"
# There is no conventional format for those parameters and it's nice to keep that flexibility.
# The object_recognition_core as a generic DB type that can read those fields
# Current examples:
# For CouchDB:
#   type: 'CouchDB'
#   root: 'http://localhost:5984'
#   collection: 'object_recognition'
# For SQL household database:
#   type: 'SqlHousehold'
#   host: 'wgs36'
#   port: 5432
#   user: 'willow'
#   password: 'willow'
#   name: 'household_objects'
#   module: 'tabletop'
string db

================================================================================
MSG: shape_msgs/SolidPrimitive
# Define box, sphere, cylinder, cone 
# All shapes are defined to have their bounding boxes centered around 0,0,0.

uint8 BOX=1
uint8 SPHERE=2
uint8 CYLINDER=3
uint8 CONE=4

# The type of the shape
uint8 type


# The dimensions of the shape
float64[] dimensions

# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array

# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding
# sides of the box.
uint8 BOX_X=0
uint8 BOX_Y=1
uint8 BOX_Z=2


# For the SPHERE type, only one component is used, and it gives the radius of
# the sphere.
uint8 SPHERE_RADIUS=0


# For the CYLINDER and CONE types, the center line is oriented along
# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component
# of dimensions gives the height of the cylinder (cone).  The
# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the
# radius of the base of the cylinder (cone).  Cone and cylinder
# primitives are defined to be circular. The tip of the cone is
# pointing up, along +Z axis.

uint8 CYLINDER_HEIGHT=0
uint8 CYLINDER_RADIUS=1

uint8 CONE_HEIGHT=0
uint8 CONE_RADIUS=1

================================================================================
MSG: shape_msgs/Mesh
# Definition of a mesh

# list of triangles; the index values refer to positions in vertices[]
MeshTriangle[] triangles

# the actual vertices that make up the mesh
geometry_msgs/Point[] vertices

================================================================================
MSG: shape_msgs/MeshTriangle
# Definition of a triangle's vertices
uint32[3] vertex_indices

================================================================================
MSG: shape_msgs/Plane
# Representation of a plane, using the plane equation ax + by + cz + d = 0

# a := coef[0]
# b := coef[1]
# c := coef[2]
# d := coef[3]

float64[4] coef

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: geometry_msgs/TransformStamped
# This expresses a transform from coordinate frame header.frame_id
# to the coordinate frame child_frame_id
#
# This message is mostly used by the 
# <a href=\"http://wiki.ros.org/tf\">tf</a> package. 
# See its documentation for more information.

Header header
string child_frame_id # the frame id of the child frame
Transform transform

================================================================================
MSG: moveit_msgs/AllowedCollisionMatrix
# The list of entry names in the matrix
string[] entry_names

# The individual entries in the allowed collision matrix
# square, symmetric, with same order as entry_names
AllowedCollisionEntry[] entry_values

# In addition to the collision matrix itself, we also have 
# the default entry value for each entry name.

# If the allowed collision flag is queried for a pair of names (n1, n2)
# that is not found in the collision matrix itself, the value of
# the collision flag is considered to be that of the entry (n1 or n2)
# specified in the list below. If both n1 and n2 are found in the list 
# of defaults, the result is computed with an AND operation

string[] default_entry_names
bool[] default_entry_values

================================================================================
MSG: moveit_msgs/AllowedCollisionEntry
# whether or not collision checking is enabled
bool[] enabled

================================================================================
MSG: moveit_msgs/LinkPadding
#name for the link
string link_name

# padding to apply to the link
float64 padding

================================================================================
MSG: moveit_msgs/LinkScale
#name for the link
string link_name

# scaling to apply to the link
float64 scale

================================================================================
MSG: moveit_msgs/ObjectColor
# The object id for which we specify color
string id

# The value of the color
std_msgs/ColorRGBA color

================================================================================
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

================================================================================
MSG: moveit_msgs/PlanningSceneWorld
# collision objects
CollisionObject[] collision_objects

# The octomap that represents additional collision data
octomap_msgs/OctomapWithPose octomap

================================================================================
MSG: octomap_msgs/OctomapWithPose
# A 3D map in binary format, as Octree
Header header

# The pose of the octree with respect to the header frame 
geometry_msgs/Pose origin

# The actual octree msg
octomap_msgs/Octomap octomap

================================================================================
MSG: octomap_msgs/Octomap
# A 3D map in binary format, as Octree
Header header

# Flag to denote a binary (only free/occupied) or full occupancy octree (.bt/.ot file)
bool binary

# Class id of the contained octree 
string id

# Resolution (in m) of the smallest octree nodes
float64 resolution

# binary serialization of octree, use conversions.h to read and write octrees
int8[] data

")



(provide :moveit_msgs/PlanningOptions "3134e041c806c7c2ff59948db4d57835")


