;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::PositionConstraint)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'PositionConstraint (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::POSITIONCONSTRAINT")
  (make-package "MOVEIT_MSGS::POSITIONCONSTRAINT"))

(in-package "ROS")
;;//! \htmlinclude PositionConstraint.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass moveit_msgs::PositionConstraint
  :super ros::object
  :slots (_header _link_name _target_point_offset _constraint_region _weight ))

(defmethod moveit_msgs::PositionConstraint
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:link_name __link_name) "")
    ((:target_point_offset __target_point_offset) (instance geometry_msgs::Vector3 :init))
    ((:constraint_region __constraint_region) (instance moveit_msgs::BoundingVolume :init))
    ((:weight __weight) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _link_name (string __link_name))
   (setq _target_point_offset __target_point_offset)
   (setq _constraint_region __constraint_region)
   (setq _weight (float __weight))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:link_name
   (&optional __link_name)
   (if __link_name (setq _link_name __link_name)) _link_name)
  (:target_point_offset
   (&rest __target_point_offset)
   (if (keywordp (car __target_point_offset))
       (send* _target_point_offset __target_point_offset)
     (progn
       (if __target_point_offset (setq _target_point_offset (car __target_point_offset)))
       _target_point_offset)))
  (:constraint_region
   (&rest __constraint_region)
   (if (keywordp (car __constraint_region))
       (send* _constraint_region __constraint_region)
     (progn
       (if __constraint_region (setq _constraint_region (car __constraint_region)))
       _constraint_region)))
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _link_name
    4 (length _link_name)
    ;; geometry_msgs/Vector3 _target_point_offset
    (send _target_point_offset :serialization-length)
    ;; moveit_msgs/BoundingVolume _constraint_region
    (send _constraint_region :serialization-length)
    ;; float64 _weight
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _link_name
       (write-long (length _link_name) s) (princ _link_name s)
     ;; geometry_msgs/Vector3 _target_point_offset
       (send _target_point_offset :serialize s)
     ;; moveit_msgs/BoundingVolume _constraint_region
       (send _constraint_region :serialize s)
     ;; float64 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _link_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _link_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Vector3 _target_point_offset
     (send _target_point_offset :deserialize buf ptr-) (incf ptr- (send _target_point_offset :serialization-length))
   ;; moveit_msgs/BoundingVolume _constraint_region
     (send _constraint_region :deserialize buf ptr-) (incf ptr- (send _constraint_region :serialization-length))
   ;; float64 _weight
     (setq _weight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::PositionConstraint :md5sum-) "c83edf208d87d3aa3169f47775a58e6a")
(setf (get moveit_msgs::PositionConstraint :datatype-) "moveit_msgs/PositionConstraint")
(setf (get moveit_msgs::PositionConstraint :definition-)
      "# This message contains the definition of a position constraint.

Header header

# The robot link this constraint refers to
string link_name

# The offset (in the link frame) for the target point on the link we are planning for
geometry_msgs/Vector3 target_point_offset

# The volume this constraint refers to 
BoundingVolume constraint_region

# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
float64 weight

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
MSG: moveit_msgs/BoundingVolume
# Define a volume in 3D

# A set of solid geometric primitives that make up the volume to define (as a union)
shape_msgs/SolidPrimitive[] primitives

# The poses at which the primitives are located
geometry_msgs/Pose[] primitive_poses

# In addition to primitives, meshes can be specified to add to the bounding volume (again, as union)
shape_msgs/Mesh[] meshes

# The poses at which the meshes are located
geometry_msgs/Pose[] mesh_poses

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

")



(provide :moveit_msgs/PositionConstraint "c83edf208d87d3aa3169f47775a58e6a")


