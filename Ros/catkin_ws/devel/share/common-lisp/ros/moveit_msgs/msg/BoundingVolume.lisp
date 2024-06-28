; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude BoundingVolume.msg.html

(cl:defclass <BoundingVolume> (roslisp-msg-protocol:ros-message)
  ((primitives
    :reader primitives
    :initarg :primitives
    :type (cl:vector shape_msgs-msg:SolidPrimitive)
   :initform (cl:make-array 0 :element-type 'shape_msgs-msg:SolidPrimitive :initial-element (cl:make-instance 'shape_msgs-msg:SolidPrimitive)))
   (primitive_poses
    :reader primitive_poses
    :initarg :primitive_poses
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (meshes
    :reader meshes
    :initarg :meshes
    :type (cl:vector shape_msgs-msg:Mesh)
   :initform (cl:make-array 0 :element-type 'shape_msgs-msg:Mesh :initial-element (cl:make-instance 'shape_msgs-msg:Mesh)))
   (mesh_poses
    :reader mesh_poses
    :initarg :mesh_poses
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose))))
)

(cl:defclass BoundingVolume (<BoundingVolume>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BoundingVolume>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BoundingVolume)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<BoundingVolume> is deprecated: use moveit_msgs-msg:BoundingVolume instead.")))

(cl:ensure-generic-function 'primitives-val :lambda-list '(m))
(cl:defmethod primitives-val ((m <BoundingVolume>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:primitives-val is deprecated.  Use moveit_msgs-msg:primitives instead.")
  (primitives m))

(cl:ensure-generic-function 'primitive_poses-val :lambda-list '(m))
(cl:defmethod primitive_poses-val ((m <BoundingVolume>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:primitive_poses-val is deprecated.  Use moveit_msgs-msg:primitive_poses instead.")
  (primitive_poses m))

(cl:ensure-generic-function 'meshes-val :lambda-list '(m))
(cl:defmethod meshes-val ((m <BoundingVolume>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:meshes-val is deprecated.  Use moveit_msgs-msg:meshes instead.")
  (meshes m))

(cl:ensure-generic-function 'mesh_poses-val :lambda-list '(m))
(cl:defmethod mesh_poses-val ((m <BoundingVolume>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:mesh_poses-val is deprecated.  Use moveit_msgs-msg:mesh_poses instead.")
  (mesh_poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BoundingVolume>) ostream)
  "Serializes a message object of type '<BoundingVolume>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'primitives))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'primitives))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'primitive_poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'primitive_poses))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'meshes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'meshes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'mesh_poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'mesh_poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BoundingVolume>) istream)
  "Deserializes a message object of type '<BoundingVolume>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'primitives) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'primitives)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'shape_msgs-msg:SolidPrimitive))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'primitive_poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'primitive_poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'meshes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'meshes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'shape_msgs-msg:Mesh))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'mesh_poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'mesh_poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BoundingVolume>)))
  "Returns string type for a message object of type '<BoundingVolume>"
  "moveit_msgs/BoundingVolume")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BoundingVolume)))
  "Returns string type for a message object of type 'BoundingVolume"
  "moveit_msgs/BoundingVolume")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BoundingVolume>)))
  "Returns md5sum for a message object of type '<BoundingVolume>"
  "22db94010f39e9198032cb4a1aeda26e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BoundingVolume)))
  "Returns md5sum for a message object of type 'BoundingVolume"
  "22db94010f39e9198032cb4a1aeda26e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BoundingVolume>)))
  "Returns full string definition for message of type '<BoundingVolume>"
  (cl:format cl:nil "# Define a volume in 3D~%~%# A set of solid geometric primitives that make up the volume to define (as a union)~%shape_msgs/SolidPrimitive[] primitives~%~%# The poses at which the primitives are located~%geometry_msgs/Pose[] primitive_poses~%~%# In addition to primitives, meshes can be specified to add to the bounding volume (again, as union)~%shape_msgs/Mesh[] meshes~%~%# The poses at which the meshes are located~%geometry_msgs/Pose[] mesh_poses~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: shape_msgs/Mesh~%# Definition of a mesh~%~%# list of triangles; the index values refer to positions in vertices[]~%MeshTriangle[] triangles~%~%# the actual vertices that make up the mesh~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: shape_msgs/MeshTriangle~%# Definition of a triangle's vertices~%uint32[3] vertex_indices~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BoundingVolume)))
  "Returns full string definition for message of type 'BoundingVolume"
  (cl:format cl:nil "# Define a volume in 3D~%~%# A set of solid geometric primitives that make up the volume to define (as a union)~%shape_msgs/SolidPrimitive[] primitives~%~%# The poses at which the primitives are located~%geometry_msgs/Pose[] primitive_poses~%~%# In addition to primitives, meshes can be specified to add to the bounding volume (again, as union)~%shape_msgs/Mesh[] meshes~%~%# The poses at which the meshes are located~%geometry_msgs/Pose[] mesh_poses~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: shape_msgs/Mesh~%# Definition of a mesh~%~%# list of triangles; the index values refer to positions in vertices[]~%MeshTriangle[] triangles~%~%# the actual vertices that make up the mesh~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: shape_msgs/MeshTriangle~%# Definition of a triangle's vertices~%uint32[3] vertex_indices~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BoundingVolume>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'primitives) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'primitive_poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'meshes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'mesh_poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BoundingVolume>))
  "Converts a ROS message object to a list"
  (cl:list 'BoundingVolume
    (cl:cons ':primitives (primitives msg))
    (cl:cons ':primitive_poses (primitive_poses msg))
    (cl:cons ':meshes (meshes msg))
    (cl:cons ':mesh_poses (mesh_poses msg))
))
