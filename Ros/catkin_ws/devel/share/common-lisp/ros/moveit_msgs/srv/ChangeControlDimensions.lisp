; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude ChangeControlDimensions-request.msg.html

(cl:defclass <ChangeControlDimensions-request> (roslisp-msg-protocol:ros-message)
  ((control_x_translation
    :reader control_x_translation
    :initarg :control_x_translation
    :type cl:boolean
    :initform cl:nil)
   (control_y_translation
    :reader control_y_translation
    :initarg :control_y_translation
    :type cl:boolean
    :initform cl:nil)
   (control_z_translation
    :reader control_z_translation
    :initarg :control_z_translation
    :type cl:boolean
    :initform cl:nil)
   (control_x_rotation
    :reader control_x_rotation
    :initarg :control_x_rotation
    :type cl:boolean
    :initform cl:nil)
   (control_y_rotation
    :reader control_y_rotation
    :initarg :control_y_rotation
    :type cl:boolean
    :initform cl:nil)
   (control_z_rotation
    :reader control_z_rotation
    :initarg :control_z_rotation
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ChangeControlDimensions-request (<ChangeControlDimensions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeControlDimensions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeControlDimensions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ChangeControlDimensions-request> is deprecated: use moveit_msgs-srv:ChangeControlDimensions-request instead.")))

(cl:ensure-generic-function 'control_x_translation-val :lambda-list '(m))
(cl:defmethod control_x_translation-val ((m <ChangeControlDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:control_x_translation-val is deprecated.  Use moveit_msgs-srv:control_x_translation instead.")
  (control_x_translation m))

(cl:ensure-generic-function 'control_y_translation-val :lambda-list '(m))
(cl:defmethod control_y_translation-val ((m <ChangeControlDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:control_y_translation-val is deprecated.  Use moveit_msgs-srv:control_y_translation instead.")
  (control_y_translation m))

(cl:ensure-generic-function 'control_z_translation-val :lambda-list '(m))
(cl:defmethod control_z_translation-val ((m <ChangeControlDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:control_z_translation-val is deprecated.  Use moveit_msgs-srv:control_z_translation instead.")
  (control_z_translation m))

(cl:ensure-generic-function 'control_x_rotation-val :lambda-list '(m))
(cl:defmethod control_x_rotation-val ((m <ChangeControlDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:control_x_rotation-val is deprecated.  Use moveit_msgs-srv:control_x_rotation instead.")
  (control_x_rotation m))

(cl:ensure-generic-function 'control_y_rotation-val :lambda-list '(m))
(cl:defmethod control_y_rotation-val ((m <ChangeControlDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:control_y_rotation-val is deprecated.  Use moveit_msgs-srv:control_y_rotation instead.")
  (control_y_rotation m))

(cl:ensure-generic-function 'control_z_rotation-val :lambda-list '(m))
(cl:defmethod control_z_rotation-val ((m <ChangeControlDimensions-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:control_z_rotation-val is deprecated.  Use moveit_msgs-srv:control_z_rotation instead.")
  (control_z_rotation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeControlDimensions-request>) ostream)
  "Serializes a message object of type '<ChangeControlDimensions-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_x_translation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_y_translation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_z_translation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_x_rotation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_y_rotation) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_z_rotation) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeControlDimensions-request>) istream)
  "Deserializes a message object of type '<ChangeControlDimensions-request>"
    (cl:setf (cl:slot-value msg 'control_x_translation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'control_y_translation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'control_z_translation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'control_x_rotation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'control_y_rotation) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'control_z_rotation) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeControlDimensions-request>)))
  "Returns string type for a service object of type '<ChangeControlDimensions-request>"
  "moveit_msgs/ChangeControlDimensionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeControlDimensions-request)))
  "Returns string type for a service object of type 'ChangeControlDimensions-request"
  "moveit_msgs/ChangeControlDimensionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeControlDimensions-request>)))
  "Returns md5sum for a message object of type '<ChangeControlDimensions-request>"
  "35b43a24f32e4654e4afa7596399fc3c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeControlDimensions-request)))
  "Returns md5sum for a message object of type 'ChangeControlDimensions-request"
  "35b43a24f32e4654e4afa7596399fc3c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeControlDimensions-request>)))
  "Returns full string definition for message of type '<ChangeControlDimensions-request>"
  (cl:format cl:nil "# For use with moveit_jog_arm Cartesian planner~%#~%# Turn on/off jogging along these dimensions.~%# Give 'true' to enable jogging in the direction, 'false' to disable~%bool control_x_translation~%bool control_y_translation~%bool control_z_translation~%bool control_x_rotation~%bool control_y_rotation~%bool control_z_rotation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeControlDimensions-request)))
  "Returns full string definition for message of type 'ChangeControlDimensions-request"
  (cl:format cl:nil "# For use with moveit_jog_arm Cartesian planner~%#~%# Turn on/off jogging along these dimensions.~%# Give 'true' to enable jogging in the direction, 'false' to disable~%bool control_x_translation~%bool control_y_translation~%bool control_z_translation~%bool control_x_rotation~%bool control_y_rotation~%bool control_z_rotation~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeControlDimensions-request>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeControlDimensions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeControlDimensions-request
    (cl:cons ':control_x_translation (control_x_translation msg))
    (cl:cons ':control_y_translation (control_y_translation msg))
    (cl:cons ':control_z_translation (control_z_translation msg))
    (cl:cons ':control_x_rotation (control_x_rotation msg))
    (cl:cons ':control_y_rotation (control_y_rotation msg))
    (cl:cons ':control_z_rotation (control_z_rotation msg))
))
;//! \htmlinclude ChangeControlDimensions-response.msg.html

(cl:defclass <ChangeControlDimensions-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ChangeControlDimensions-response (<ChangeControlDimensions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeControlDimensions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeControlDimensions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<ChangeControlDimensions-response> is deprecated: use moveit_msgs-srv:ChangeControlDimensions-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ChangeControlDimensions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:success-val is deprecated.  Use moveit_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeControlDimensions-response>) ostream)
  "Serializes a message object of type '<ChangeControlDimensions-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeControlDimensions-response>) istream)
  "Deserializes a message object of type '<ChangeControlDimensions-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeControlDimensions-response>)))
  "Returns string type for a service object of type '<ChangeControlDimensions-response>"
  "moveit_msgs/ChangeControlDimensionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeControlDimensions-response)))
  "Returns string type for a service object of type 'ChangeControlDimensions-response"
  "moveit_msgs/ChangeControlDimensionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeControlDimensions-response>)))
  "Returns md5sum for a message object of type '<ChangeControlDimensions-response>"
  "35b43a24f32e4654e4afa7596399fc3c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeControlDimensions-response)))
  "Returns md5sum for a message object of type 'ChangeControlDimensions-response"
  "35b43a24f32e4654e4afa7596399fc3c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeControlDimensions-response>)))
  "Returns full string definition for message of type '<ChangeControlDimensions-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeControlDimensions-response)))
  "Returns full string definition for message of type 'ChangeControlDimensions-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeControlDimensions-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeControlDimensions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeControlDimensions-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeControlDimensions)))
  'ChangeControlDimensions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeControlDimensions)))
  'ChangeControlDimensions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeControlDimensions)))
  "Returns string type for a service object of type '<ChangeControlDimensions>"
  "moveit_msgs/ChangeControlDimensions")