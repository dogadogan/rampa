; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-msg)


;//! \htmlinclude AllowedCollisionMatrix.msg.html

(cl:defclass <AllowedCollisionMatrix> (roslisp-msg-protocol:ros-message)
  ((entry_names
    :reader entry_names
    :initarg :entry_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (entry_values
    :reader entry_values
    :initarg :entry_values
    :type (cl:vector moveit_msgs-msg:AllowedCollisionEntry)
   :initform (cl:make-array 0 :element-type 'moveit_msgs-msg:AllowedCollisionEntry :initial-element (cl:make-instance 'moveit_msgs-msg:AllowedCollisionEntry)))
   (default_entry_names
    :reader default_entry_names
    :initarg :default_entry_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (default_entry_values
    :reader default_entry_values
    :initarg :default_entry_values
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass AllowedCollisionMatrix (<AllowedCollisionMatrix>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AllowedCollisionMatrix>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AllowedCollisionMatrix)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-msg:<AllowedCollisionMatrix> is deprecated: use moveit_msgs-msg:AllowedCollisionMatrix instead.")))

(cl:ensure-generic-function 'entry_names-val :lambda-list '(m))
(cl:defmethod entry_names-val ((m <AllowedCollisionMatrix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:entry_names-val is deprecated.  Use moveit_msgs-msg:entry_names instead.")
  (entry_names m))

(cl:ensure-generic-function 'entry_values-val :lambda-list '(m))
(cl:defmethod entry_values-val ((m <AllowedCollisionMatrix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:entry_values-val is deprecated.  Use moveit_msgs-msg:entry_values instead.")
  (entry_values m))

(cl:ensure-generic-function 'default_entry_names-val :lambda-list '(m))
(cl:defmethod default_entry_names-val ((m <AllowedCollisionMatrix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:default_entry_names-val is deprecated.  Use moveit_msgs-msg:default_entry_names instead.")
  (default_entry_names m))

(cl:ensure-generic-function 'default_entry_values-val :lambda-list '(m))
(cl:defmethod default_entry_values-val ((m <AllowedCollisionMatrix>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-msg:default_entry_values-val is deprecated.  Use moveit_msgs-msg:default_entry_values instead.")
  (default_entry_values m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AllowedCollisionMatrix>) ostream)
  "Serializes a message object of type '<AllowedCollisionMatrix>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'entry_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'entry_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'entry_values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'entry_values))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'default_entry_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'default_entry_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'default_entry_values))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'default_entry_values))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AllowedCollisionMatrix>) istream)
  "Deserializes a message object of type '<AllowedCollisionMatrix>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'entry_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'entry_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'entry_values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'entry_values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'moveit_msgs-msg:AllowedCollisionEntry))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'default_entry_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'default_entry_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'default_entry_values) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'default_entry_values)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AllowedCollisionMatrix>)))
  "Returns string type for a message object of type '<AllowedCollisionMatrix>"
  "moveit_msgs/AllowedCollisionMatrix")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AllowedCollisionMatrix)))
  "Returns string type for a message object of type 'AllowedCollisionMatrix"
  "moveit_msgs/AllowedCollisionMatrix")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AllowedCollisionMatrix>)))
  "Returns md5sum for a message object of type '<AllowedCollisionMatrix>"
  "aedce13587eef0d79165a075659c1879")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AllowedCollisionMatrix)))
  "Returns md5sum for a message object of type 'AllowedCollisionMatrix"
  "aedce13587eef0d79165a075659c1879")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AllowedCollisionMatrix>)))
  "Returns full string definition for message of type '<AllowedCollisionMatrix>"
  (cl:format cl:nil "# The list of entry names in the matrix~%string[] entry_names~%~%# The individual entries in the allowed collision matrix~%# square, symmetric, with same order as entry_names~%AllowedCollisionEntry[] entry_values~%~%# In addition to the collision matrix itself, we also have ~%# the default entry value for each entry name.~%~%# If the allowed collision flag is queried for a pair of names (n1, n2)~%# that is not found in the collision matrix itself, the value of~%# the collision flag is considered to be that of the entry (n1 or n2)~%# specified in the list below. If both n1 and n2 are found in the list ~%# of defaults, the result is computed with an AND operation~%~%string[] default_entry_names~%bool[] default_entry_values~%~%================================================================================~%MSG: moveit_msgs/AllowedCollisionEntry~%# whether or not collision checking is enabled~%bool[] enabled~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AllowedCollisionMatrix)))
  "Returns full string definition for message of type 'AllowedCollisionMatrix"
  (cl:format cl:nil "# The list of entry names in the matrix~%string[] entry_names~%~%# The individual entries in the allowed collision matrix~%# square, symmetric, with same order as entry_names~%AllowedCollisionEntry[] entry_values~%~%# In addition to the collision matrix itself, we also have ~%# the default entry value for each entry name.~%~%# If the allowed collision flag is queried for a pair of names (n1, n2)~%# that is not found in the collision matrix itself, the value of~%# the collision flag is considered to be that of the entry (n1 or n2)~%# specified in the list below. If both n1 and n2 are found in the list ~%# of defaults, the result is computed with an AND operation~%~%string[] default_entry_names~%bool[] default_entry_values~%~%================================================================================~%MSG: moveit_msgs/AllowedCollisionEntry~%# whether or not collision checking is enabled~%bool[] enabled~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AllowedCollisionMatrix>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'entry_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'entry_values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'default_entry_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'default_entry_values) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AllowedCollisionMatrix>))
  "Converts a ROS message object to a list"
  (cl:list 'AllowedCollisionMatrix
    (cl:cons ':entry_names (entry_names msg))
    (cl:cons ':entry_values (entry_values msg))
    (cl:cons ':default_entry_names (default_entry_names msg))
    (cl:cons ':default_entry_values (default_entry_values msg))
))
