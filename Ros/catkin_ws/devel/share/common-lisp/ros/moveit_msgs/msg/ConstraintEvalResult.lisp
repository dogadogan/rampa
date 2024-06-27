; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude ConstraintEvalResult.msg.html

(cl:defclass <ConstraintEvalResult> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil)
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass ConstraintEvalResult (<ConstraintEvalResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConstraintEvalResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConstraintEvalResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<ConstraintEvalResult> is deprecated: use moveit_msgs-msg:ConstraintEvalResult instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ConstraintEvalResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:result-val is deprecated.  Use moveit_msgs-msg:result instead.")
  (result m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <ConstraintEvalResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:distance-val is deprecated.  Use moveit_msgs-msg:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConstraintEvalResult>) ostream)
  "Serializes a message object of type '<ConstraintEvalResult>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConstraintEvalResult>) istream)
  "Deserializes a message object of type '<ConstraintEvalResult>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConstraintEvalResult>)))
  "Returns string type for a message object of type '<ConstraintEvalResult>"
  "moveit_msgs/ConstraintEvalResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConstraintEvalResult)))
  "Returns string type for a message object of type 'ConstraintEvalResult"
  "moveit_msgs/ConstraintEvalResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConstraintEvalResult>)))
  "Returns md5sum for a message object of type '<ConstraintEvalResult>"
  "093643083d24f6488cb5a868bd47c090")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConstraintEvalResult)))
  "Returns md5sum for a message object of type 'ConstraintEvalResult"
  "093643083d24f6488cb5a868bd47c090")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConstraintEvalResult>)))
  "Returns full string definition for message of type '<ConstraintEvalResult>"
  (cl:format cl:nil "# This message contains result from constraint evaluation~%# result specifies the result of constraint evaluation ~%# (true indicates state satisfies constraint, false indicates state violates constraint)~%# if false, distance specifies a measure of the distance of the state from the constraint~%# if true, distance is set to zero~%bool result~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConstraintEvalResult)))
  "Returns full string definition for message of type 'ConstraintEvalResult"
  (cl:format cl:nil "# This message contains result from constraint evaluation~%# result specifies the result of constraint evaluation ~%# (true indicates state satisfies constraint, false indicates state violates constraint)~%# if false, distance specifies a measure of the distance of the state from the constraint~%# if true, distance is set to zero~%bool result~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConstraintEvalResult>))
  (cl:+ 0
     1
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConstraintEvalResult>))
  "Converts a ROS message object to a list"
  (cl:list 'ConstraintEvalResult
    (cl:cons ':result (result msg))
    (cl:cons ':distance (distance msg))
))
