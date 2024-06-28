; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude ChangeDriftDimensions-request.msg.html

(cl:defclass <ChangeDriftDimensions-request> (roslisp-msg-protocol:ros-message)
  ((drift_x_translation
    :reader drift_x_translation
    :initarg :drift_x_translation
    :type cl:boolean
    :initform cl:nil)
   (drift_y_translation
    :reader drift_y_translation
    :initarg :drift_y_translation
    :type cl:boolean
    :initform cl:nil)
   (drift_z_translation
    :reader drift_z_translation
    :initarg :drift_z_translation
    :type cl:boolean
    :initform cl:nil)
   (drift_x_rotation
    :reader drift_x_rotation
    :initarg :drift_x_rotation
    :type cl:boolean
    :initform cl:nil)
   (drift_y_rotation
    :reader drift_y_rotation
    :initarg :drift_y_rotation
    :type cl:boolean
    :initform cl:nil)
   (drift_z_rotation
    :reader drift_z_rotation
    :initarg :drift_z_rotation
    :type cl:boolean
    :initform cl:nil)
   (transform_jog_frame_to_drift_frame
    :reader transform_jog_frame_to_drift_frame
    :initarg :transform_jog_frame_to_drift_frame
    :type geometry_msgs-msg:Transform
    :initform (cl:make-instance 'geometry_msgs-msg:Transform)))
)

(cl:defclass ChangeDriftDimensions-request (<ChangeDriftDimensions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeDriftDimensions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeDriftDimensions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ChangeDriftDimensions-request> is deprecated: use moveit_msgs-srv:ChangeDriftDimensions-request instead.")))

(cl:ensure-generic-function 'drift_x_translation-val :lambda-list '(m))
(cl:defmethod drift_x_translation-val ((m <ChangeDriftDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:drift_x_translation-val is deprecated.  Use moveit_msgs-srv:drift_x_translation instead.")
  (drift_x_translation m))

(cl:ensure-generic-function 'drift_y_translation-val :lambda-list '(m))
(cl:defmethod drift_y_translation-val ((m <ChangeDriftDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:drift_y_translation-val is deprecated.  Use moveit_msgs-srv:drift_y_translation instead.")
  (drift_y_translation m))

(cl:ensure-generic-function 'drift_z_translation-val :lambda-list '(m))
(cl:defmethod drift_z_translation-val ((m <ChangeDriftDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:drift_z_translation-val is deprecated.  Use moveit_msgs-srv:drift_z_translation instead.")
  (drift_z_translation m))

(cl:ensure-generic-function 'drift_x_rotation-val :lambda-list '(m))
(cl:defmethod drift_x_rotation-val ((m <ChangeDriftDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:drift_x_rotation-val is deprecated.  Use moveit_msgs-srv:drift_x_rotation instead.")
  (drift_x_rotation m))

(cl:ensure-generic-function 'drift_y_rotation-val :lambda-list '(m))
(cl:defmethod drift_y_rotation-val ((m <ChangeDriftDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:drift_y_rotation-val is deprecated.  Use moveit_msgs-srv:drift_y_rotation instead.")
  (drift_y_rotation m))

(cl:ensure-generic-function 'drift_z_rotation-val :lambda-list '(m))
(cl:defmethod drift_z_rotation-val ((m <ChangeDriftDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:drift_z_rotation-val is deprecated.  Use moveit_msgs-srv:drift_z_rotation instead.")
  (drift_z_rotation m))

(cl:ensure-generic-function 'transform_jog_frame_to_drift_frame-val :lambda-list '(m))
(cl:defmethod transform_jog_frame_to_drift_frame-val ((m <ChangeDriftDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:transform_jog_frame_to_drift_frame-val is deprecated.  Use moveit_msgs-srv:transform_jog_frame_to_drift_frame instead.")
  (transform_jog_frame_to_drift_frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeDriftDimensions-request>) ostream)
  "Serializes a message object of type '<ChangeDriftDimensions-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'drift_x_translation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'drift_y_translation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'drift_z_translation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'drift_x_rotation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'drift_y_rotation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'drift_z_rotation) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'transform_jog_frame_to_drift_frame) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeDriftDimensions-request>) istream)
  "Deserializes a message object of type '<ChangeDriftDimensions-request>"
    (cl:setf (cl:slot-value msg 'drift_x_translation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'drift_y_translation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'drift_z_translation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'drift_x_rotation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'drift_y_rotation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'drift_z_rotation) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'transform_jog_frame_to_drift_frame) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeDriftDimensions-request>)))
  "Returns string type for a service object of type '<ChangeDriftDimensions-request>"
  "moveit_msgs/ChangeDriftDimensionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeDriftDimensions-request)))
  "Returns string type for a service object of type 'ChangeDriftDimensions-request"
  "moveit_msgs/ChangeDriftDimensionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeDriftDimensions-request>)))
  "Returns md5sum for a message object of type '<ChangeDriftDimensions-request>"
  "0d34c8d563fea2efff65829c37132a15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeDriftDimensions-request)))
  "Returns md5sum for a message object of type 'ChangeDriftDimensions-request"
  "0d34c8d563fea2efff65829c37132a15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeDriftDimensions-request>)))
  "Returns full string definition for message of type '<ChangeDriftDimensions-request>"
  (cl:format cl:nil "# For use with moveit_jog_arm Cartesian planner~%#~%# Allow the robot to drift along these dimensions in a smooth but unregulated way.~%# Give 'true' to enable drift in the direction, 'false' to disable.~%# For example, may allow wrist rotation by drift_x_rotation == true.~%bool drift_x_translation~%bool drift_y_translation~%bool drift_z_translation~%bool drift_x_rotation~%bool drift_y_rotation~%bool drift_z_rotation~%~%# Not implemented as of Jan 2020 (for now assumed to be the identity matrix). In the future it will allow us to transform~%# from the jog control frame to a unique drift frame, so the robot can drift along off-principal axes~%geometry_msgs/Transform transform_jog_frame_to_drift_frame~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeDriftDimensions-request)))
  "Returns full string definition for message of type 'ChangeDriftDimensions-request"
  (cl:format cl:nil "# For use with moveit_jog_arm Cartesian planner~%#~%# Allow the robot to drift along these dimensions in a smooth but unregulated way.~%# Give 'true' to enable drift in the direction, 'false' to disable.~%# For example, may allow wrist rotation by drift_x_rotation == true.~%bool drift_x_translation~%bool drift_y_translation~%bool drift_z_translation~%bool drift_x_rotation~%bool drift_y_rotation~%bool drift_z_rotation~%~%# Not implemented as of Jan 2020 (for now assumed to be the identity matrix). In the future it will allow us to transform~%# from the jog control frame to a unique drift frame, so the robot can drift along off-principal axes~%geometry_msgs/Transform transform_jog_frame_to_drift_frame~%~%================================================================================~%MSG: geometry_msgs/Transform~%# This represents the transform between two coordinate frames in free space.~%~%Vector3 translation~%Quaternion rotation~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeDriftDimensions-request>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'transform_jog_frame_to_drift_frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeDriftDimensions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeDriftDimensions-request
    (cl:cons ':drift_x_translation (drift_x_translation msg))
    (cl:cons ':drift_y_translation (drift_y_translation msg))
    (cl:cons ':drift_z_translation (drift_z_translation msg))
    (cl:cons ':drift_x_rotation (drift_x_rotation msg))
    (cl:cons ':drift_y_rotation (drift_y_rotation msg))
    (cl:cons ':drift_z_rotation (drift_z_rotation msg))
    (cl:cons ':transform_jog_frame_to_drift_frame (transform_jog_frame_to_drift_frame msg))
))
;//! \htmlinclude ChangeDriftDimensions-response.msg.html

(cl:defclass <ChangeDriftDimensions-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ChangeDriftDimensions-response (<ChangeDriftDimensions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeDriftDimensions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeDriftDimensions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ChangeDriftDimensions-response> is deprecated: use moveit_msgs-srv:ChangeDriftDimensions-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ChangeDriftDimensions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:success-val is deprecated.  Use moveit_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeDriftDimensions-response>) ostream)
  "Serializes a message object of type '<ChangeDriftDimensions-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeDriftDimensions-response>) istream)
  "Deserializes a message object of type '<ChangeDriftDimensions-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeDriftDimensions-response>)))
  "Returns string type for a service object of type '<ChangeDriftDimensions-response>"
  "moveit_msgs/ChangeDriftDimensionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeDriftDimensions-response)))
  "Returns string type for a service object of type 'ChangeDriftDimensions-response"
  "moveit_msgs/ChangeDriftDimensionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeDriftDimensions-response>)))
  "Returns md5sum for a message object of type '<ChangeDriftDimensions-response>"
  "0d34c8d563fea2efff65829c37132a15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeDriftDimensions-response)))
  "Returns md5sum for a message object of type 'ChangeDriftDimensions-response"
  "0d34c8d563fea2efff65829c37132a15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeDriftDimensions-response>)))
  "Returns full string definition for message of type '<ChangeDriftDimensions-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeDriftDimensions-response)))
  "Returns full string definition for message of type 'ChangeDriftDimensions-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeDriftDimensions-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeDriftDimensions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeDriftDimensions-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeDriftDimensions)))
  'ChangeDriftDimensions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeDriftDimensions)))
  'ChangeDriftDimensions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeDriftDimensions)))
  "Returns string type for a service object of type '<ChangeDriftDimensions>"
  "moveit_msgs/ChangeDriftDimensions")