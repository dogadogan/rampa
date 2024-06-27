; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude ContactInformation.msg.html

(cl:defclass <ContactInformation> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (normal
    :reader normal
    :initarg :normal
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (depth
    :reader depth
    :initarg :depth
    :type cl:float
    :initform 0.0)
   (contact_body_1
    :reader contact_body_1
    :initarg :contact_body_1
    :type cl:string
    :initform "")
   (body_type_1
    :reader body_type_1
    :initarg :body_type_1
    :type cl:integer
    :initform 0)
   (contact_body_2
    :reader contact_body_2
    :initarg :contact_body_2
    :type cl:string
    :initform "")
   (body_type_2
    :reader body_type_2
    :initarg :body_type_2
    :type cl:integer
    :initform 0))
)

(cl:defclass ContactInformation (<ContactInformation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ContactInformation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ContactInformation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<ContactInformation> is deprecated: use moveit_msgs-msg:ContactInformation instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:header-val is deprecated.  Use moveit_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:position-val is deprecated.  Use moveit_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'normal-val :lambda-list '(m))
(cl:defmethod normal-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:normal-val is deprecated.  Use moveit_msgs-msg:normal instead.")
  (normal m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:depth-val is deprecated.  Use moveit_msgs-msg:depth instead.")
  (depth m))

(cl:ensure-generic-function 'contact_body_1-val :lambda-list '(m))
(cl:defmethod contact_body_1-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:contact_body_1-val is deprecated.  Use moveit_msgs-msg:contact_body_1 instead.")
  (contact_body_1 m))

(cl:ensure-generic-function 'body_type_1-val :lambda-list '(m))
(cl:defmethod body_type_1-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:body_type_1-val is deprecated.  Use moveit_msgs-msg:body_type_1 instead.")
  (body_type_1 m))

(cl:ensure-generic-function 'contact_body_2-val :lambda-list '(m))
(cl:defmethod contact_body_2-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:contact_body_2-val is deprecated.  Use moveit_msgs-msg:contact_body_2 instead.")
  (contact_body_2 m))

(cl:ensure-generic-function 'body_type_2-val :lambda-list '(m))
(cl:defmethod body_type_2-val ((m <ContactInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:body_type_2-val is deprecated.  Use moveit_msgs-msg:body_type_2 instead.")
  (body_type_2 m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ContactInformation>)))
    "Constants for message type '<ContactInformation>"
  '((:ROBOT_LINK . 0)
    (:WORLD_OBJECT . 1)
    (:ROBOT_ATTACHED . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ContactInformation)))
    "Constants for message type 'ContactInformation"
  '((:ROBOT_LINK . 0)
    (:WORLD_OBJECT . 1)
    (:ROBOT_ATTACHED . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ContactInformation>) ostream)
  "Serializes a message object of type '<ContactInformation>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'normal) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'contact_body_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'contact_body_1))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'body_type_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'body_type_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'body_type_1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'body_type_1)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'contact_body_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'contact_body_2))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'body_type_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'body_type_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'body_type_2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'body_type_2)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ContactInformation>) istream)
  "Deserializes a message object of type '<ContactInformation>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'normal) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'contact_body_1) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'contact_body_1) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'body_type_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'body_type_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'body_type_1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'body_type_1)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'contact_body_2) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'contact_body_2) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'body_type_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'body_type_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'body_type_2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'body_type_2)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ContactInformation>)))
  "Returns string type for a message object of type '<ContactInformation>"
  "moveit_msgs/ContactInformation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ContactInformation)))
  "Returns string type for a message object of type 'ContactInformation"
  "moveit_msgs/ContactInformation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ContactInformation>)))
  "Returns md5sum for a message object of type '<ContactInformation>"
  "116228ca08b0c286ec5ca32a50fdc17b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ContactInformation)))
  "Returns md5sum for a message object of type 'ContactInformation"
  "116228ca08b0c286ec5ca32a50fdc17b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ContactInformation>)))
  "Returns full string definition for message of type '<ContactInformation>"
  (cl:format cl:nil "# Standard ROS header contains information ~%# about the frame in which this ~%# contact is specified~%Header header~%~%# Position of the contact point~%geometry_msgs/Point position~%~%# Normal corresponding to the contact point~%geometry_msgs/Vector3 normal ~%~%# Depth of contact point~%float64 depth~%~%# Name of the first body that is in contact~%# This could be a link or a namespace that represents a body~%string contact_body_1~%uint32 body_type_1~%~%# Name of the second body that is in contact~%# This could be a link or a namespace that represents a body~%string contact_body_2~%uint32 body_type_2~%~%uint32 ROBOT_LINK=0~%uint32 WORLD_OBJECT=1~%uint32 ROBOT_ATTACHED=2~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ContactInformation)))
  "Returns full string definition for message of type 'ContactInformation"
  (cl:format cl:nil "# Standard ROS header contains information ~%# about the frame in which this ~%# contact is specified~%Header header~%~%# Position of the contact point~%geometry_msgs/Point position~%~%# Normal corresponding to the contact point~%geometry_msgs/Vector3 normal ~%~%# Depth of contact point~%float64 depth~%~%# Name of the first body that is in contact~%# This could be a link or a namespace that represents a body~%string contact_body_1~%uint32 body_type_1~%~%# Name of the second body that is in contact~%# This could be a link or a namespace that represents a body~%string contact_body_2~%uint32 body_type_2~%~%uint32 ROBOT_LINK=0~%uint32 WORLD_OBJECT=1~%uint32 ROBOT_ATTACHED=2~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ContactInformation>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'normal))
     8
     4 (cl:length (cl:slot-value msg 'contact_body_1))
     4
     4 (cl:length (cl:slot-value msg 'contact_body_2))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ContactInformation>))
  "Converts a ROS message object to a list"
  (cl:list 'ContactInformation
    (cl:cons ':header (header msg))
    (cl:cons ':position (position msg))
    (cl:cons ':normal (normal msg))
    (cl:cons ':depth (depth msg))
    (cl:cons ':contact_body_1 (contact_body_1 msg))
    (cl:cons ':body_type_1 (body_type_1 msg))
    (cl:cons ':contact_body_2 (contact_body_2 msg))
    (cl:cons ':body_type_2 (body_type_2 msg))
))
