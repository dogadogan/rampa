; Auto-generated. Do not edit!


(cl:in-package moveit_msgs-srv)


;//! \htmlinclude UpdatePointcloudOctomap-request.msg.html

(cl:defclass <UpdatePointcloudOctomap-request> (roslisp-msg-protocol:ros-message)
  ((cloud
    :reader cloud
    :initarg :cloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass UpdatePointcloudOctomap-request (<UpdatePointcloudOctomap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdatePointcloudOctomap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdatePointcloudOctomap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<UpdatePointcloudOctomap-request> is deprecated: use moveit_msgs-srv:UpdatePointcloudOctomap-request instead.")))

(cl:ensure-generic-function 'cloud-val :lambda-list '(m))
(cl:defmethod cloud-val ((m <UpdatePointcloudOctomap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:cloud-val is deprecated.  Use moveit_msgs-srv:cloud instead.")
  (cloud m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdatePointcloudOctomap-request>) ostream)
  "Serializes a message object of type '<UpdatePointcloudOctomap-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'cloud) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdatePointcloudOctomap-request>) istream)
  "Deserializes a message object of type '<UpdatePointcloudOctomap-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'cloud) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdatePointcloudOctomap-request>)))
  "Returns string type for a service object of type '<UpdatePointcloudOctomap-request>"
  "moveit_msgs/UpdatePointcloudOctomapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdatePointcloudOctomap-request)))
  "Returns string type for a service object of type 'UpdatePointcloudOctomap-request"
  "moveit_msgs/UpdatePointcloudOctomapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdatePointcloudOctomap-request>)))
  "Returns md5sum for a message object of type '<UpdatePointcloudOctomap-request>"
  "82b89aaa2577411dc97de3a584f0ee5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdatePointcloudOctomap-request)))
  "Returns md5sum for a message object of type 'UpdatePointcloudOctomap-request"
  "82b89aaa2577411dc97de3a584f0ee5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdatePointcloudOctomap-request>)))
  "Returns full string definition for message of type '<UpdatePointcloudOctomap-request>"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cloud~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdatePointcloudOctomap-request)))
  "Returns full string definition for message of type 'UpdatePointcloudOctomap-request"
  (cl:format cl:nil "sensor_msgs/PointCloud2 cloud~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdatePointcloudOctomap-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'cloud))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdatePointcloudOctomap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdatePointcloudOctomap-request
    (cl:cons ':cloud (cloud msg))
))
;//! \htmlinclude UpdatePointcloudOctomap-response.msg.html

(cl:defclass <UpdatePointcloudOctomap-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass UpdatePointcloudOctomap-response (<UpdatePointcloudOctomap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdatePointcloudOctomap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdatePointcloudOctomap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name moveit_msgs-srv:<UpdatePointcloudOctomap-response> is deprecated: use moveit_msgs-srv:UpdatePointcloudOctomap-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <UpdatePointcloudOctomap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader moveit_msgs-srv:success-val is deprecated.  Use moveit_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdatePointcloudOctomap-response>) ostream)
  "Serializes a message object of type '<UpdatePointcloudOctomap-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdatePointcloudOctomap-response>) istream)
  "Deserializes a message object of type '<UpdatePointcloudOctomap-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdatePointcloudOctomap-response>)))
  "Returns string type for a service object of type '<UpdatePointcloudOctomap-response>"
  "moveit_msgs/UpdatePointcloudOctomapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdatePointcloudOctomap-response)))
  "Returns string type for a service object of type 'UpdatePointcloudOctomap-response"
  "moveit_msgs/UpdatePointcloudOctomapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdatePointcloudOctomap-response>)))
  "Returns md5sum for a message object of type '<UpdatePointcloudOctomap-response>"
  "82b89aaa2577411dc97de3a584f0ee5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdatePointcloudOctomap-response)))
  "Returns md5sum for a message object of type 'UpdatePointcloudOctomap-response"
  "82b89aaa2577411dc97de3a584f0ee5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdatePointcloudOctomap-response>)))
  "Returns full string definition for message of type '<UpdatePointcloudOctomap-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdatePointcloudOctomap-response)))
  "Returns full string definition for message of type 'UpdatePointcloudOctomap-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdatePointcloudOctomap-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdatePointcloudOctomap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdatePointcloudOctomap-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'UpdatePointcloudOctomap)))
  'UpdatePointcloudOctomap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'UpdatePointcloudOctomap)))
  'UpdatePointcloudOctomap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdatePointcloudOctomap)))
  "Returns string type for a service object of type '<UpdatePointcloudOctomap>"
  "moveit_msgs/UpdatePointcloudOctomap")