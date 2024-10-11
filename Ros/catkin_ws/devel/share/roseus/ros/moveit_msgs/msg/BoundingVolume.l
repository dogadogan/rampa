;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::BoundingVolume)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'BoundingVolume (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::BOUNDINGVOLUME")
  (make-package "MOVEIT_MSGS::BOUNDINGVOLUME"))

(in-package "ROS")
;;//! \htmlinclude BoundingVolume.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SHAPE_MSGS"))
  (ros::roseus-add-msgs "shape_msgs"))


(defclass moveit_msgs::BoundingVolume
  :super ros::object
  :slots (_primitives _primitive_poses _meshes _mesh_poses ))

(defmethod moveit_msgs::BoundingVolume
  (:init
   (&key
    ((:primitives __primitives) ())
    ((:primitive_poses __primitive_poses) ())
    ((:meshes __meshes) ())
    ((:mesh_poses __mesh_poses) ())
    )
   (send-super :init)
   (setq _primitives __primitives)
   (setq _primitive_poses __primitive_poses)
   (setq _meshes __meshes)
   (setq _mesh_poses __mesh_poses)
   self)
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
  (:serialization-length
   ()
   (+
    ;; shape_msgs/SolidPrimitive[] _primitives
    (apply #'+ (send-all _primitives :serialization-length)) 4
    ;; geometry_msgs/Pose[] _primitive_poses
    (apply #'+ (send-all _primitive_poses :serialization-length)) 4
    ;; shape_msgs/Mesh[] _meshes
    (apply #'+ (send-all _meshes :serialization-length)) 4
    ;; geometry_msgs/Pose[] _mesh_poses
    (apply #'+ (send-all _mesh_poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
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
   ;;
   self)
  )

(setf (get moveit_msgs::BoundingVolume :md5sum-) "22db94010f39e9198032cb4a1aeda26e")
(setf (get moveit_msgs::BoundingVolume :datatype-) "moveit_msgs/BoundingVolume")
(setf (get moveit_msgs::BoundingVolume :definition-)
      "# Define a volume in 3D

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



(provide :moveit_msgs/BoundingVolume "22db94010f39e9198032cb4a1aeda26e")


