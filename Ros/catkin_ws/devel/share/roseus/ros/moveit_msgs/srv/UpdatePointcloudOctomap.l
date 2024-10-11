;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::UpdatePointcloudOctomap)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'UpdatePointcloudOctomap (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::UPDATEPOINTCLOUDOCTOMAP")
  (make-package "MOVEIT_MSGS::UPDATEPOINTCLOUDOCTOMAP"))
(unless (find-package "MOVEIT_MSGS::UPDATEPOINTCLOUDOCTOMAPREQUEST")
  (make-package "MOVEIT_MSGS::UPDATEPOINTCLOUDOCTOMAPREQUEST"))
(unless (find-package "MOVEIT_MSGS::UPDATEPOINTCLOUDOCTOMAPRESPONSE")
  (make-package "MOVEIT_MSGS::UPDATEPOINTCLOUDOCTOMAPRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass moveit_msgs::UpdatePointcloudOctomapRequest
  :super ros::object
  :slots (_cloud ))

(defmethod moveit_msgs::UpdatePointcloudOctomapRequest
  (:init
   (&key
    ((:cloud __cloud) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _cloud __cloud)
   self)
  (:cloud
   (&rest __cloud)
   (if (keywordp (car __cloud))
       (send* _cloud __cloud)
     (progn
       (if __cloud (setq _cloud (car __cloud)))
       _cloud)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/PointCloud2 _cloud
    (send _cloud :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/PointCloud2 _cloud
       (send _cloud :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/PointCloud2 _cloud
     (send _cloud :deserialize buf ptr-) (incf ptr- (send _cloud :serialization-length))
   ;;
   self)
  )

(defclass moveit_msgs::UpdatePointcloudOctomapResponse
  :super ros::object
  :slots (_success ))

(defmethod moveit_msgs::UpdatePointcloudOctomapResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass moveit_msgs::UpdatePointcloudOctomap
  :super ros::object
  :slots ())

(setf (get moveit_msgs::UpdatePointcloudOctomap :md5sum-) "82b89aaa2577411dc97de3a584f0ee5d")
(setf (get moveit_msgs::UpdatePointcloudOctomap :datatype-) "moveit_msgs/UpdatePointcloudOctomap")
(setf (get moveit_msgs::UpdatePointcloudOctomap :request) moveit_msgs::UpdatePointcloudOctomapRequest)
(setf (get moveit_msgs::UpdatePointcloudOctomap :response) moveit_msgs::UpdatePointcloudOctomapResponse)

(defmethod moveit_msgs::UpdatePointcloudOctomapRequest
  (:response () (instance moveit_msgs::UpdatePointcloudOctomapResponse :init)))

(setf (get moveit_msgs::UpdatePointcloudOctomapRequest :md5sum-) "82b89aaa2577411dc97de3a584f0ee5d")
(setf (get moveit_msgs::UpdatePointcloudOctomapRequest :datatype-) "moveit_msgs/UpdatePointcloudOctomapRequest")
(setf (get moveit_msgs::UpdatePointcloudOctomapRequest :definition-)
      "sensor_msgs/PointCloud2 cloud

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

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
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
bool success

")

(setf (get moveit_msgs::UpdatePointcloudOctomapResponse :md5sum-) "82b89aaa2577411dc97de3a584f0ee5d")
(setf (get moveit_msgs::UpdatePointcloudOctomapResponse :datatype-) "moveit_msgs/UpdatePointcloudOctomapResponse")
(setf (get moveit_msgs::UpdatePointcloudOctomapResponse :definition-)
      "sensor_msgs/PointCloud2 cloud

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

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
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field
---
bool success

")



(provide :moveit_msgs/UpdatePointcloudOctomap "82b89aaa2577411dc97de3a584f0ee5d")


