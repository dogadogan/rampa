; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude Constraints.msg.html

(cl:defclass <Constraints> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (joint_constraints
    :reader joint_constraints
    :initarg :joint_constraints
    :type (cl:vector moveit_msgs-msg:JointConstraint)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:JointConstraint :initial-element (cl:make-instance 'moveit_msgs-msg:JointConstraint)))
   (position_constraints
    :reader position_constraints
    :initarg :position_constraints
    :type (cl:vector moveit_msgs-msg:PositionConstraint)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:PositionConstraint :initial-element (cl:make-instance 'moveit_msgs-msg:PositionConstraint)))
   (orientation_constraints
    :reader orientation_constraints
    :initarg :orientation_constraints
    :type (cl:vector moveit_msgs-msg:OrientationConstraint)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:OrientationConstraint :initial-element (cl:make-instance 'moveit_msgs-msg:OrientationConstraint)))
   (visibility_constraints
    :reader visibility_constraints
    :initarg :visibility_constraints
    :type (cl:vector moveit_msgs-msg:VisibilityConstraint)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:VisibilityConstraint :initial-element (cl:make-instance 'moveit_msgs-msg:VisibilityConstraint))))
)

(cl:defclass Constraints (<Constraints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Constraints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Constraints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<Constraints> is deprecated: use moveit_msgs-msg:Constraints instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Constraints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:name-val is deprecated.  Use moveit_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'joint_constraints-val :lambda-list '(m))
(cl:defmethod joint_constraints-val ((m <Constraints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:joint_constraints-val is deprecated.  Use moveit_msgs-msg:joint_constraints instead.")
  (joint_constraints m))

(cl:ensure-generic-function 'position_constraints-val :lambda-list '(m))
(cl:defmethod position_constraints-val ((m <Constraints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:position_constraints-val is deprecated.  Use moveit_msgs-msg:position_constraints instead.")
  (position_constraints m))

(cl:ensure-generic-function 'orientation_constraints-val :lambda-list '(m))
(cl:defmethod orientation_constraints-val ((m <Constraints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:orientation_constraints-val is deprecated.  Use moveit_msgs-msg:orientation_constraints instead.")
  (orientation_constraints m))

(cl:ensure-generic-function 'visibility_constraints-val :lambda-list '(m))
(cl:defmethod visibility_constraints-val ((m <Constraints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:visibility_constraints-val is deprecated.  Use moveit_msgs-msg:visibility_constraints instead.")
  (visibility_constraints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Constraints>) ostream)
  "Serializes a message object of type '<Constraints>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_constraints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joint_constraints))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'position_constraints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'position_constraints))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'orientation_constraints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'orientation_constraints))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'visibility_constraints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'visibility_constraints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Constraints>) istream)
  "Deserializes a message object of type '<Constraints>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_constraints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_constraints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:JointConstraint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position_constraints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'position_constraints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:PositionConstraint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'orientation_constraints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'orientation_constraints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:OrientationConstraint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'visibility_constraints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'visibility_constraints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:VisibilityConstraint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Constraints>)))
  "Returns string type for a message object of type '<Constraints>"
  "moveit_msgs/Constraints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Constraints)))
  "Returns string type for a message object of type 'Constraints"
  "moveit_msgs/Constraints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Constraints>)))
  "Returns md5sum for a message object of type '<Constraints>"
  "8d5ce8d34ef26c65fb5d43c9e99bf6e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Constraints)))
  "Returns md5sum for a message object of type 'Constraints"
  "8d5ce8d34ef26c65fb5d43c9e99bf6e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Constraints>)))
  "Returns full string definition for message of type '<Constraints>"
  (cl:format cl:nil "# This message contains a list of motion planning constraints.~%# All constraints must be satisfied for a goal to be considered valid~%~%string name~%~%JointConstraint[] joint_constraints~%~%PositionConstraint[] position_constraints~%~%OrientationConstraint[] orientation_constraints~%~%VisibilityConstraint[] visibility_constraints~%~%================================================================================~%MSG: moveit_msgs/JointConstraint~%# Constrain the position of a joint to be within a certain bound~%string joint_name~%~%# the bound to be achieved is [position - tolerance_below, position + tolerance_above]~%float64 position~%float64 tolerance_above~%float64 tolerance_below~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%================================================================================~%MSG: moveit_msgs/PositionConstraint~%# This message contains the definition of a position constraint.~%~%Header header~%~%# The robot link this constraint refers to~%string link_name~%~%# The offset (in the link frame) for the target point on the link we are planning for~%geometry_msgs/Vector3 target_point_offset~%~%# The volume this constraint refers to ~%BoundingVolume constraint_region~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: moveit_msgs/BoundingVolume~%# Define a volume in 3D~%~%# A set of solid geometric primitives that make up the volume to define (as a union)~%shape_msgs/SolidPrimitive[] primitives~%~%# The poses at which the primitives are located~%geometry_msgs/Pose[] primitive_poses~%~%# In addition to primitives, meshes can be specified to add to the bounding volume (again, as union)~%shape_msgs/Mesh[] meshes~%~%# The poses at which the meshes are located~%geometry_msgs/Pose[] mesh_poses~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: shape_msgs/Mesh~%# Definition of a mesh~%~%# list of triangles; the index values refer to positions in vertices[]~%MeshTriangle[] triangles~%~%# the actual vertices that make up the mesh~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: shape_msgs/MeshTriangle~%# Definition of a triangle's vertices~%uint32[3] vertex_indices~%~%================================================================================~%MSG: moveit_msgs/OrientationConstraint~%# This message contains the definition of an orientation constraint.~%~%Header header~%~%# The desired orientation of the robot link specified as a quaternion~%geometry_msgs/Quaternion orientation~%~%# The robot link this constraint refers to~%string link_name~%~%# optional axis-angle error tolerances specified~%float64 absolute_x_axis_tolerance~%float64 absolute_y_axis_tolerance~%float64 absolute_z_axis_tolerance~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%~%================================================================================~%MSG: moveit_msgs/VisibilityConstraint~%# The constraint is useful to maintain visibility to a disc (the target) in a particular frame.~%# This disc forms the base of a visibiliy cone whose tip is at the origin of the sensor.~%# Maintaining visibility is done by ensuring the robot does not obstruct the visibility cone.~%# Note:~%# This constraint does NOT enforce minimum or maximum distances between the sensor~%# and the target, nor does it enforce the target to be in the field of view of~%# the sensor. A PositionConstraint can (and probably should) be used for such purposes.~%~%# The radius of the disc that should be maintained visible ~%float64 target_radius~%~%# The pose of the disc; as the robot moves, the pose of the disc may change as well~%# This can be in the frame of a particular robot link, for example~%geometry_msgs/PoseStamped target_pose~%~%# From the sensor origin towards the target, the disc forms a visibility cone~%# This cone is approximated using many sides. For example, when using 4 sides, ~%# that in fact makes the visibility region be a pyramid.~%# This value should always be 3 or more.~%int32 cone_sides~%~%# The pose in which visibility is to be maintained.~%# The frame id should represent the robot link to which the sensor is attached.~%# It is assumed the sensor can look directly at the target, in any direction.~%# This assumption is usually not true, but additional PositionConstraints~%# can resolve this issue.~%geometry_msgs/PoseStamped sensor_pose~%~%# Even though the disc is maintained visible, the visibility cone can be very small~%# because of the orientation of the disc with respect to the sensor. It is possible~%# for example to view the disk almost from a side, in which case the visibility cone ~%# can end up having close to 0 volume. The view angle is defined to be the angle between~%# the normal to the visibility disc and the direction vector from the sensor origin.~%# The value below represents the minimum desired view angle. For a perfect view,~%# this value will be 0 (the two vectors are exact opposites). For a completely obstructed view~%# this value will be Pi/2 (the vectors are perpendicular). This value defined below ~%# is the maximum view angle to be maintained. This should be a value in the open interval~%# (0, Pi/2). If 0 is set, the view angle is NOT enforced.~%float64 max_view_angle~%~%# This angle is used similarly to max_view_angle but limits the maximum angle~%# between the sensor origin direction vector and the axis that connects the~%# sensor origin to the target frame origin. The value is again in the range (0, Pi/2)~%# and is NOT enforced if set to 0.~%float64 max_range_angle~%~%# The axis that is assumed to indicate the direction of view for the sensor~%# X = 2, Y = 1, Z = 0~%uint8 SENSOR_Z=0~%uint8 SENSOR_Y=1~%uint8 SENSOR_X=2~%uint8 sensor_view_direction~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Constraints)))
  "Returns full string definition for message of type 'Constraints"
  (cl:format cl:nil "# This message contains a list of motion planning constraints.~%# All constraints must be satisfied for a goal to be considered valid~%~%string name~%~%JointConstraint[] joint_constraints~%~%PositionConstraint[] position_constraints~%~%OrientationConstraint[] orientation_constraints~%~%VisibilityConstraint[] visibility_constraints~%~%================================================================================~%MSG: moveit_msgs/JointConstraint~%# Constrain the position of a joint to be within a certain bound~%string joint_name~%~%# the bound to be achieved is [position - tolerance_below, position + tolerance_above]~%float64 position~%float64 tolerance_above~%float64 tolerance_below~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%================================================================================~%MSG: moveit_msgs/PositionConstraint~%# This message contains the definition of a position constraint.~%~%Header header~%~%# The robot link this constraint refers to~%string link_name~%~%# The offset (in the link frame) for the target point on the link we are planning for~%geometry_msgs/Vector3 target_point_offset~%~%# The volume this constraint refers to ~%BoundingVolume constraint_region~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: moveit_msgs/BoundingVolume~%# Define a volume in 3D~%~%# A set of solid geometric primitives that make up the volume to define (as a union)~%shape_msgs/SolidPrimitive[] primitives~%~%# The poses at which the primitives are located~%geometry_msgs/Pose[] primitive_poses~%~%# In addition to primitives, meshes can be specified to add to the bounding volume (again, as union)~%shape_msgs/Mesh[] meshes~%~%# The poses at which the meshes are located~%geometry_msgs/Pose[] mesh_poses~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: shape_msgs/Mesh~%# Definition of a mesh~%~%# list of triangles; the index values refer to positions in vertices[]~%MeshTriangle[] triangles~%~%# the actual vertices that make up the mesh~%geometry_msgs/Point[] vertices~%~%================================================================================~%MSG: shape_msgs/MeshTriangle~%# Definition of a triangle's vertices~%uint32[3] vertex_indices~%~%================================================================================~%MSG: moveit_msgs/OrientationConstraint~%# This message contains the definition of an orientation constraint.~%~%Header header~%~%# The desired orientation of the robot link specified as a quaternion~%geometry_msgs/Quaternion orientation~%~%# The robot link this constraint refers to~%string link_name~%~%# optional axis-angle error tolerances specified~%float64 absolute_x_axis_tolerance~%float64 absolute_y_axis_tolerance~%float64 absolute_z_axis_tolerance~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%~%================================================================================~%MSG: moveit_msgs/VisibilityConstraint~%# The constraint is useful to maintain visibility to a disc (the target) in a particular frame.~%# This disc forms the base of a visibiliy cone whose tip is at the origin of the sensor.~%# Maintaining visibility is done by ensuring the robot does not obstruct the visibility cone.~%# Note:~%# This constraint does NOT enforce minimum or maximum distances between the sensor~%# and the target, nor does it enforce the target to be in the field of view of~%# the sensor. A PositionConstraint can (and probably should) be used for such purposes.~%~%# The radius of the disc that should be maintained visible ~%float64 target_radius~%~%# The pose of the disc; as the robot moves, the pose of the disc may change as well~%# This can be in the frame of a particular robot link, for example~%geometry_msgs/PoseStamped target_pose~%~%# From the sensor origin towards the target, the disc forms a visibility cone~%# This cone is approximated using many sides. For example, when using 4 sides, ~%# that in fact makes the visibility region be a pyramid.~%# This value should always be 3 or more.~%int32 cone_sides~%~%# The pose in which visibility is to be maintained.~%# The frame id should represent the robot link to which the sensor is attached.~%# It is assumed the sensor can look directly at the target, in any direction.~%# This assumption is usually not true, but additional PositionConstraints~%# can resolve this issue.~%geometry_msgs/PoseStamped sensor_pose~%~%# Even though the disc is maintained visible, the visibility cone can be very small~%# because of the orientation of the disc with respect to the sensor. It is possible~%# for example to view the disk almost from a side, in which case the visibility cone ~%# can end up having close to 0 volume. The view angle is defined to be the angle between~%# the normal to the visibility disc and the direction vector from the sensor origin.~%# The value below represents the minimum desired view angle. For a perfect view,~%# this value will be 0 (the two vectors are exact opposites). For a completely obstructed view~%# this value will be Pi/2 (the vectors are perpendicular). This value defined below ~%# is the maximum view angle to be maintained. This should be a value in the open interval~%# (0, Pi/2). If 0 is set, the view angle is NOT enforced.~%float64 max_view_angle~%~%# This angle is used similarly to max_view_angle but limits the maximum angle~%# between the sensor origin direction vector and the axis that connects the~%# sensor origin to the target frame origin. The value is again in the range (0, Pi/2)~%# and is NOT enforced if set to 0.~%float64 max_range_angle~%~%# The axis that is assumed to indicate the direction of view for the sensor~%# X = 2, Y = 1, Z = 0~%uint8 SENSOR_Z=0~%uint8 SENSOR_Y=1~%uint8 SENSOR_X=2~%uint8 sensor_view_direction~%~%# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)~%float64 weight~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Constraints>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_constraints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position_constraints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'orientation_constraints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'visibility_constraints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Constraints>))
  "Converts a ROS message object to a list"
  (cl:list 'Constraints
    (cl:cons ':name (name msg))
    (cl:cons ':joint_constraints (joint_constraints msg))
    (cl:cons ':position_constraints (position_constraints msg))
    (cl:cons ':orientation_constraints (orientation_constraints msg))
    (cl:cons ':visibility_constraints (visibility_constraints msg))
))
