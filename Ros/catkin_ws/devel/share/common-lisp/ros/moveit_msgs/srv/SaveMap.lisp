; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude SaveMap-request.msg.html

(cl:defclass <SaveMap-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass SaveMap-request (<SaveMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<SaveMap-request> is deprecated: use moveit_msgs-srv:SaveMap-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <SaveMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:filename-val is deprecated.  Use moveit_msgs-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveMap-request>) ostream)
  "Serializes a message object of type '<SaveMap-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveMap-request>) istream)
  "Deserializes a message object of type '<SaveMap-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveMap-request>)))
  "Returns string type for a service object of type '<SaveMap-request>"
  "moveit_msgs/SaveMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveMap-request)))
  "Returns string type for a service object of type 'SaveMap-request"
  "moveit_msgs/SaveMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveMap-request>)))
  "Returns md5sum for a message object of type '<SaveMap-request>"
  "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveMap-request)))
  "Returns md5sum for a message object of type 'SaveMap-request"
  "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveMap-request>)))
  "Returns full string definition for message of type '<SaveMap-request>"
  (cl:format cl:nil "string filename~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveMap-request)))
  "Returns full string definition for message of type 'SaveMap-request"
  (cl:format cl:nil "string filename~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveMap-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveMap-request
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude SaveMap-response.msg.html

(cl:defclass <SaveMap-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveMap-response (<SaveMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<SaveMap-response> is deprecated: use moveit_msgs-srv:SaveMap-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SaveMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:success-val is deprecated.  Use moveit_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveMap-response>) ostream)
  "Serializes a message object of type '<SaveMap-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveMap-response>) istream)
  "Deserializes a message object of type '<SaveMap-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveMap-response>)))
  "Returns string type for a service object of type '<SaveMap-response>"
  "moveit_msgs/SaveMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveMap-response)))
  "Returns string type for a service object of type 'SaveMap-response"
  "moveit_msgs/SaveMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveMap-response>)))
  "Returns md5sum for a message object of type '<SaveMap-response>"
  "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveMap-response)))
  "Returns md5sum for a message object of type 'SaveMap-response"
  "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveMap-response>)))
  "Returns full string definition for message of type '<SaveMap-response>"
  (cl:format cl:nil "~%bool success~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveMap-response)))
  "Returns full string definition for message of type 'SaveMap-response"
  (cl:format cl:nil "~%bool success~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveMap-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveMap-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveMap)))
  'SaveMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveMap)))
  'SaveMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveMap)))
  "Returns string type for a service object of type '<SaveMap>"
  "moveit_msgs/SaveMap")