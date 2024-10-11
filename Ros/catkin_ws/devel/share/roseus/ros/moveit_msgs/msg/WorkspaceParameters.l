;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::WorkspaceParameters)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'WorkspaceParameters (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::WORKSPACEPARAMETERS")
  (make-package "MOVEIT_MSGS::WORKSPACEPARAMETERS"))

(in-package "ROS")
;;//! \htmlinclude WorkspaceParameters.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass moveit_msgs::WorkspaceParameters
  :super ros::object
  :slots (_header _min_corner _max_corner ))

(defmethod moveit_msgs::WorkspaceParameters
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:min_corner __min_corner) (instance geometry_msgs::Vector3 :init))
    ((:max_corner __max_corner) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _min_corner __min_corner)
   (setq _max_corner __max_corner)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:min_corner
   (&rest __min_corner)
   (if (keywordp (car __min_corner))
       (send* _min_corner __min_corner)
     (progn
       (if __min_corner (setq _min_corner (car __min_corner)))
       _min_corner)))
  (:max_corner
   (&rest __max_corner)
   (if (keywordp (car __max_corner))
       (send* _max_corner __max_corner)
     (progn
       (if __max_corner (setq _max_corner (car __max_corner)))
       _max_corner)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _min_corner
    (send _min_corner :serialization-length)
    ;; geometry_msgs/Vector3 _max_corner
    (send _max_corner :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _min_corner
       (send _min_corner :serialize s)
     ;; geometry_msgs/Vector3 _max_corner
       (send _max_corner :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _min_corner
     (send _min_corner :deserialize buf ptr-) (incf ptr- (send _min_corner :serialization-length))
   ;; geometry_msgs/Vector3 _max_corner
     (send _max_corner :deserialize buf ptr-) (incf ptr- (send _max_corner :serialization-length))
   ;;
   self)
  )

(setf (get moveit_msgs::WorkspaceParameters :md5sum-) "d639a834e7b1f927e9f1d6c30e920016")
(setf (get moveit_msgs::WorkspaceParameters :datatype-) "moveit_msgs/WorkspaceParameters")
(setf (get moveit_msgs::WorkspaceParameters :definition-)
      "# This message contains a set of parameters useful in
# setting up the volume (a box) in which the robot is allowed to move.
# This is useful only when planning for mobile parts of 
# the robot as well.

# Define the frame of reference for the box corners
Header header

# The minumum corner of the box, with respect to the robot starting pose
geometry_msgs/Vector3 min_corner

# The maximum corner of the box, with respect to the robot starting pose
geometry_msgs/Vector3 max_corner

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
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :moveit_msgs/WorkspaceParameters "d639a834e7b1f927e9f1d6c30e920016")


