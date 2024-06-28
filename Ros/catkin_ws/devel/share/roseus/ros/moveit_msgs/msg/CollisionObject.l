;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::CollisionObject)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'CollisionObject (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::COLLISIONOBJECT")
  (make-package "MOVEIT_MSGS::COLLISIONOBJECT"))

(in-package "ROS")
;;//! \htmlinclude CollisionObject.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "OBJECT_RECOGNITION_MSGS"))
  (ros::roseus-add-msgs "object_recognition_msgs"))
(if (not (find-package "SHAPE_MSGS"))
  (ros::roseus-add-msgs "shape_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ADD*" (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(shadow '*ADD* (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(defconstant moveit_msgs::CollisionObject::*ADD* 0)
(intern "*REMOVE*" (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(shadow '*REMOVE* (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(defconstant moveit_msgs::CollisionObject::*REMOVE* 1)
(intern "*APPEND*" (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(shadow '*APPEND* (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(defconstant moveit_msgs::CollisionObject::*APPEND* 2)
(intern "*MOVE*" (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(shadow '*MOVE* (find-package "MOVEIT_MSGS::COLLISIONOBJECT"))
(defconstant moveit_msgs::CollisionObject::*MOVE* 3)

(defun moveit_msgs::CollisionObject-to-symbol (const)
  (cond
        ((= const 0) 'moveit_msgs::CollisionObject::*ADD*)
        ((= const 1) 'moveit_msgs::CollisionObject::*REMOVE*)
        ((= const 2) 'moveit_msgs::CollisionObject::*APPEND*)
        ((= const 3) 'moveit_msgs::CollisionObject::*MOVE*)
        (t nil)))

(defclass moveit_msgs::CollisionObject
  :super ros::object
  :slots (_header _pose _id _type _primitives _primitive_poses _meshes _mesh_poses _planes _plane_poses _subframe_names _subframe_poses _operation ))

(defmethod moveit_msgs::CollisionObject
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:id __id) "")
    ((:type __type) (instance object_recognition_msgs::ObjectType :init))
    ((:primitives __primitives) ())
    ((:primitive_poses __primitive_poses) ())
    ((:meshes __meshes) ())
    ((:mesh_poses __mesh_poses) ())
    ((:planes __planes) ())
    ((:plane_poses __plane_poses) ())
    ((:subframe_names __subframe_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:subframe_poses __subframe_poses) ())
    ((:operation __operation) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _id (string __id))
   (setq _type __type)
   (setq _primitives __primitives)
   (setq _primitive_poses __primitive_poses)
   (setq _meshes __meshes)
   (setq _mesh_poses __mesh_poses)
   (setq _planes __planes)
   (setq _plane_poses __plane_poses)
   (setq _subframe_names __subframe_names)
   (setq _subframe_poses __subframe_poses)
   (setq _operation (round __operation))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:type
   (&rest __type)
   (if (keywordp (car __type))
       (send* _type __type)
     (progn
       (if __type (setq _type (car __type)))
       _type)))
  (:primitives
   (&rest __primitives)
   (if (keywordp (car __primitives))
       (send* _primitives __primitives)
     (progn
       (if __primitives (setq _primitives (car __primitives)))
       _primitives)))
  (:primitive_poses
   (&rest __primitive_poses)
   (if (keywordp (car __primitive_poses))
       (send* _primitive_poses __primitive_poses)
     (progn
       (if __primitive_poses (setq _primitive_poses (car __primitive_poses)))
       _primitive_poses)))
  (:meshes
   (&rest __meshes)
   (if (keywordp (car __meshes))
       (send* _meshes __meshes)
     (progn
       (if __meshes (setq _meshes (car __meshes)))
       _meshes)))
  (:mesh_poses
   (&rest __mesh_poses)
   (if (keywordp (car __mesh_poses))
       (send* _mesh_poses __mesh_poses)
     (progn
       (if __mesh_poses (setq _mesh_poses (car __mesh_poses)))
       _mesh_poses)))
  (:planes
   (&rest __planes)
   (if (keywordp (car __planes))
       (send* _planes __planes)
     (progn
       (if __planes (setq _planes (car __planes)))
       _planes)))
  (:plane_poses
   (&rest __plane_poses)
   (if (keywordp (car __plane_poses))
       (send* _plane_poses __plane_poses)
     (progn
       (if __plane_poses (setq _plane_poses (car __plane_poses)))
       _plane_poses)))
  (:subframe_names
   (&optional __subframe_names)
   (if __subframe_names (setq _subframe_names __subframe_names)) _subframe_names)
  (:subframe_poses
   (&rest __subframe_poses)
   (if (keywordp (car __subframe_poses))
       (send* _subframe_poses __subframe_poses)
     (progn
       (if __subframe_poses (setq _subframe_poses (car __subframe_poses)))
       _subframe_poses)))
  (:operation
   (&optional __operation)
   (if __operation (setq _operation __operation)) _operation)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; string _id
    4 (length _id)
    ;; object_recognition_msgs/ObjectType _type
    (send _type :serialization-length)
    ;; shape_msgs/SolidPrimitive[] _primitives
    (apply #'+ (send-all _primitives :serialization-length)) 4
    ;; geometry_msgs/Pose[] _primitive_poses
    (apply #'+ (send-all _primitive_poses :serialization-length)) 4
    ;; shape_msgs/Mesh[] _meshes
    (apply #'+ (send-all _meshes :serialization-length)) 4
    ;; geometry_msgs/Pose[] _mesh_poses
    (apply #'+ (send-all _mesh_poses :serialization-length)) 4
    ;; shape_msgs/Plane[] _planes
    (apply #'+ (send-all _planes :serialization-length)) 4
    ;; geometry_msgs/Pose[] _plane_poses
    (apply #'+ (send-all _plane_poses :serialization-length)) 4
    ;; string[] _subframe_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _subframe_names)) 4
    ;; geometry_msgs/Pose[] _subframe_poses
    (apply #'+ (send-all _subframe_poses :serialization-length)) 4
    ;; byte _operation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; object_recognition_msgs/ObjectType _type
       (send _type :serialize s)
     ;; shape_msgs/SolidPrimitive[] _primitives
     (write-long (length _primitives) s)
     (dolist (elem _primitives)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Pose[] _primitive_poses
     (write-long (length _primitive_poses) s)
     (dolist (elem _primitive_poses)
       (send elem :serialize s)
       )
     ;; shape_msgs/Mesh[] _meshes
     (write-long (length _meshes) s)
     (dolist (elem _meshes)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Pose[] _mesh_poses
     (write-long (length _mesh_poses) s)
     (dolist (elem _mesh_poses)
       (send elem :serialize s)
       )
     ;; shape_msgs/Plane[] _planes
     (write-long (length _planes) s)
     (dolist (elem _planes)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Pose[] _plane_poses
     (write-long (length _plane_poses) s)
     (dolist (elem _plane_poses)
       (send elem :serialize s)
       )
     ;; string[] _subframe_names
     (write-long (length _subframe_names) s)
     (dolist (elem _subframe_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; geometry_msgs/Pose[] _subframe_poses
     (write-long (length _subframe_poses) s)
     (dolist (elem _subframe_poses)
       (send elem :serialize s)
       )
     ;; byte _operation
       (write-byte _operation s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; object_recognition_msgs/ObjectType _type
     (send _type :deserialize buf ptr-) (incf ptr- (send _type :serialization-length))
   ;; shape_msgs/SolidPrimitive[] _primitives
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _primitives (let (r) (dotimes (i n) (push (instance shape_msgs::SolidPrimitive :init) r)) r))
     (dolist (elem- _primitives)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Pose[] _primitive_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _primitive_poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _primitive_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; shape_msgs/Mesh[] _meshes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _meshes (let (r) (dotimes (i n) (push (instance shape_msgs::Mesh :init) r)) r))
     (dolist (elem- _meshes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Pose[] _mesh_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mesh_poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _mesh_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; shape_msgs/Plane[] _planes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _planes (let (r) (dotimes (i n) (push (instance shape_msgs::Plane :init) r)) r))
     (dolist (elem- _planes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Pose[] _plane_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plane_poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _plane_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _subframe_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _subframe_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _subframe_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; geometry_msgs/Pose[] _subframe_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _subframe_poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _subframe_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; byte _operation
     (setq _operation (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _operation 127) (setq _operation (- _operation 256)))
   ;;
   self)
  )

(setf (get moveit_msgs::CollisionObject :md5sum-) "dbba710596087da521c07564160dfccb")
(setf (get moveit_msgs::CollisionObject :datatype-) "moveit_msgs/CollisionObject")
(setf (get moveit_msgs::CollisionObject :definition-)
      "# A header, used for interpreting the poses
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
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

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

")



(provide :moveit_msgs/CollisionObject "dbba710596087da521c07564160dfccb")


