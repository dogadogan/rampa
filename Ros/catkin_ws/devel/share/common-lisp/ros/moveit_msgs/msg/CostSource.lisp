; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude CostSource.msg.html

(cl:defclass <CostSource> (roslisp-msg-protocol:ros-message)
  ((cost_density
    :reader cost_density
    :initarg :cost_density
    :type cl:float
    :initform 0.0)
   (aabb_min
    :reader aabb_min
    :initarg :aabb_min
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (aabb_max
    :reader aabb_max
    :initarg :aabb_max
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass CostSource (<CostSource>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CostSource>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CostSource)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<CostSource> is deprecated: use moveit_msgs-msg:CostSource instead.")))

(cl:ensure-generic-function 'cost_density-val :lambda-list '(m))
(cl:defmethod cost_density-val ((m <CostSource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:cost_density-val is deprecated.  Use moveit_msgs-msg:cost_density instead.")
  (cost_density m))

(cl:ensure-generic-function 'aabb_min-val :lambda-list '(m))
(cl:defmethod aabb_min-val ((m <CostSource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:aabb_min-val is deprecated.  Use moveit_msgs-msg:aabb_min instead.")
  (aabb_min m))

(cl:ensure-generic-function 'aabb_max-val :lambda-list '(m))
(cl:defmethod aabb_max-val ((m <CostSource>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:aabb_max-val is deprecated.  Use moveit_msgs-msg:aabb_max instead.")
  (aabb_max m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CostSource>) ostream)
  "Serializes a message object of type '<CostSource>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'cost_density))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'aabb_min) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'aabb_max) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CostSource>) istream)
  "Deserializes a message object of type '<CostSource>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cost_density) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'aabb_min) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'aabb_max) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CostSource>)))
  "Returns string type for a message object of type '<CostSource>"
  "moveit_msgs/CostSource")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CostSource)))
  "Returns string type for a message object of type 'CostSource"
  "moveit_msgs/CostSource")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CostSource>)))
  "Returns md5sum for a message object of type '<CostSource>"
  "abb7e013237dacaaa8b97e704102f908")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CostSource)))
  "Returns md5sum for a message object of type 'CostSource"
  "abb7e013237dacaaa8b97e704102f908")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CostSource>)))
  "Returns full string definition for message of type '<CostSource>"
  (cl:format cl:nil "# The density of the cost source~%float64 cost_density~%~%# The volume of the cost source is represented as an~%# axis-aligned bounding box (AABB)~%# The AABB is specified by two of its opposite corners~%~%geometry_msgs/Vector3 aabb_min~%~%geometry_msgs/Vector3 aabb_max~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CostSource)))
  "Returns full string definition for message of type 'CostSource"
  (cl:format cl:nil "# The density of the cost source~%float64 cost_density~%~%# The volume of the cost source is represented as an~%# axis-aligned bounding box (AABB)~%# The AABB is specified by two of its opposite corners~%~%geometry_msgs/Vector3 aabb_min~%~%geometry_msgs/Vector3 aabb_max~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CostSource>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'aabb_min))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'aabb_max))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CostSource>))
  "Converts a ROS message object to a list"
  (cl:list 'CostSource
    (cl:cons ':cost_density (cost_density msg))
    (cl:cons ':aabb_min (aabb_min msg))
    (cl:cons ':aabb_max (aabb_max msg))
))
