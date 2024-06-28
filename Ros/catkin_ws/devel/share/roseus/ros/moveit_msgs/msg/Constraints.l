;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::Constraints)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'Constraints (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::CONSTRAINTS")
  (make-package "MOVEIT_MSGS::CONSTRAINTS"))

(in-package "ROS")
;;//! \htmlinclude Constraints.msg.html


(defclass moveit_msgs::Constraints
  :super ros::object
  :slots (_name _joint_constraints _position_constraints _orientation_constraints _visibility_constraints ))

(defmethod moveit_msgs::Constraints
  (:init
   (&key
    ((:name __name) "")
    ((:joint_constraints __joint_constraints) ())
    ((:position_constraints __position_constraints) ())
    ((:orientation_constraints __orientation_constraints) ())
    ((:visibility_constraints __visibility_constraints) ())
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _joint_constraints __joint_constraints)
   (setq _position_constraints __position_constraints)
   (setq _orientation_constraints __orientation_constraints)
   (setq _visibility_constraints __visibility_constraints)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:joint_constraints
   (&rest __joint_constraints)
   (if (keywordp (car __joint_constraints))
       (send* _joint_constraints __joint_constraints)
     (progn
       (if __joint_constraints (setq _joint_constraints (car __joint_constraints)))
       _joint_constraints)))
  (:position_constraints
   (&rest __position_constraints)
   (if (keywordp (car __position_constraints))
       (send* _position_constraints __position_constraints)
     (progn
       (if __position_constraints (setq _position_constraints (car __position_constraints)))
       _position_constraints)))
  (:orientation_constraints
   (&rest __orientation_constraints)
   (if (keywordp (car __orientation_constraints))
       (send* _orientation_constraints __orientation_constraints)
     (progn
       (if __orientation_constraints (setq _orientation_constraints (car __orientation_constraints)))
       _orientation_constraints)))
  (:visibility_constraints
   (&rest __visibility_constraints)
   (if (keywordp (car __visibility_constraints))
       (send* _visibility_constraints __visibility_constraints)
     (progn
       (if __visibility_constraints (setq _visibility_constraints (car __visibility_constraints)))
       _visibility_constraints)))
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; moveit_msgs/JointConstraint[] _joint_constraints
    (apply #'+ (send-all _joint_constraints :serialization-length)) 4
    ;; moveit_msgs/PositionConstraint[] _position_constraints
    (apply #'+ (send-all _position_constraints :serialization-length)) 4
    ;; moveit_msgs/OrientationConstraint[] _orientation_constraints
    (apply #'+ (send-all _orientation_constraints :serialization-length)) 4
    ;; moveit_msgs/VisibilityConstraint[] _visibility_constraints
    (apply #'+ (send-all _visibility_constraints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; moveit_msgs/JointConstraint[] _joint_constraints
     (write-long (length _joint_constraints) s)
     (dolist (elem _joint_constraints)
       (send elem :serialize s)
       )
     ;; moveit_msgs/PositionConstraint[] _position_constraints
     (write-long (length _position_constraints) s)
     (dolist (elem _position_constraints)
       (send elem :serialize s)
       )
     ;; moveit_msgs/OrientationConstraint[] _orientation_constraints
     (write-long (length _orientation_constraints) s)
     (dolist (elem _orientation_constraints)
       (send elem :serialize s)
       )
     ;; moveit_msgs/VisibilityConstraint[] _visibility_constraints
     (write-long (length _visibility_constraints) s)
     (dolist (elem _visibility_constraints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; moveit_msgs/JointConstraint[] _joint_constraints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_constraints (let (r) (dotimes (i n) (push (instance moveit_msgs::JointConstraint :init) r)) r))
     (dolist (elem- _joint_constraints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; moveit_msgs/PositionConstraint[] _position_constraints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position_constraints (let (r) (dotimes (i n) (push (instance moveit_msgs::PositionConstraint :init) r)) r))
     (dolist (elem- _position_constraints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; moveit_msgs/OrientationConstraint[] _orientation_constraints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _orientation_constraints (let (r) (dotimes (i n) (push (instance moveit_msgs::OrientationConstraint :init) r)) r))
     (dolist (elem- _orientation_constraints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; moveit_msgs/VisibilityConstraint[] _visibility_constraints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _visibility_constraints (let (r) (dotimes (i n) (push (instance moveit_msgs::VisibilityConstraint :init) r)) r))
     (dolist (elem- _visibility_constraints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::Constraints :md5sum-) "8d5ce8d34ef26c65fb5d43c9e99bf6e0")
(setf (get moveit_msgs::Constraints :datatype-) "moveit_msgs/Constraints")
(setf (get moveit_msgs::Constraints :definition-)
      "# This message contains a list of motion planning constraints.
# All constraints must be satisfied for a goal to be considered valid

string name

JointConstraint[] joint_constraints

PositionConstraint[] position_constraints

OrientationConstraint[] orientation_constraints

VisibilityConstraint[] visibility_constraints

================================================================================
MSG: moveit_msgs/JointConstraint
# Constrain the position of a joint to be within a certain bound
string joint_name

# the bound to be achieved is [position - tolerance_below, position + tolerance_above]
float64 position
float64 tolerance_above
float64 tolerance_below

# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
float64 weight
================================================================================
MSG: moveit_msgs/PositionConstraint
# This message contains the definition of a position constraint.

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

================================================================================
MSG: moveit_msgs/OrientationConstraint
# This message contains the definition of an orientation constraint.

Header header

# The desired orientation of the robot link specified as a quaternion
geometry_msgs/Quaternion orientation

# The robot link this constraint refers to
string link_name

# optional axis-angle error tolerances specified
float64 absolute_x_axis_tolerance
float64 absolute_y_axis_tolerance
float64 absolute_z_axis_tolerance

# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
float64 weight

================================================================================
MSG: moveit_msgs/VisibilityConstraint
# The constraint is useful to maintain visibility to a disc (the target) in a particular frame.
# This disc forms the base of a visibiliy cone whose tip is at the origin of the sensor.
# Maintaining visibility is done by ensuring the robot does not obstruct the visibility cone.
# Note:
# This constraint does NOT enforce minimum or maximum distances between the sensor
# and the target, nor does it enforce the target to be in the field of view of
# the sensor. A PositionConstraint can (and probably should) be used for such purposes.

# The radius of the disc that should be maintained visible 
float64 target_radius

# The pose of the disc; as the robot moves, the pose of the disc may change as well
# This can be in the frame of a particular robot link, for example
geometry_msgs/PoseStamped target_pose

# From the sensor origin towards the target, the disc forms a visibility cone
# This cone is approximated using many sides. For example, when using 4 sides, 
# that in fact makes the visibility region be a pyramid.
# This value should always be 3 or more.
int32 cone_sides

# The pose in which visibility is to be maintained.
# The frame id should represent the robot link to which the sensor is attached.
# It is assumed the sensor can look directly at the target, in any direction.
# This assumption is usually not true, but additional PositionConstraints
# can resolve this issue.
geometry_msgs/PoseStamped sensor_pose

# Even though the disc is maintained visible, the visibility cone can be very small
# because of the orientation of the disc with respect to the sensor. It is possible
# for example to view the disk almost from a side, in which case the visibility cone 
# can end up having close to 0 volume. The view angle is defined to be the angle between
# the normal to the visibility disc and the direction vector from the sensor origin.
# The value below represents the minimum desired view angle. For a perfect view,
# this value will be 0 (the two vectors are exact opposites). For a completely obstructed view
# this value will be Pi/2 (the vectors are perpendicular). This value defined below 
# is the maximum view angle to be maintained. This should be a value in the open interval
# (0, Pi/2). If 0 is set, the view angle is NOT enforced.
float64 max_view_angle

# This angle is used similarly to max_view_angle but limits the maximum angle
# between the sensor origin direction vector and the axis that connects the
# sensor origin to the target frame origin. The value is again in the range (0, Pi/2)
# and is NOT enforced if set to 0.
float64 max_range_angle

# The axis that is assumed to indicate the direction of view for the sensor
# X = 2, Y = 1, Z = 0
uint8 SENSOR_Z=0
uint8 SENSOR_Y=1
uint8 SENSOR_X=2
uint8 sensor_view_direction

# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
float64 weight

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

")



(provide :moveit_msgs/Constraints "8d5ce8d34ef26c65fb5d43c9e99bf6e0")


