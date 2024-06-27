;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::OrientedBoundingBox)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'OrientedBoundingBox (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::ORIENTEDBOUNDINGBOX")
  (make-package "MOVEIT_MSGS::ORIENTEDBOUNDINGBOX"))

(in-package "ROS")
;;//! \htmlinclude OrientedBoundingBox.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass moveit_msgs::OrientedBoundingBox
  :super ros::object
  :slots (_pose _extents ))

(defmethod moveit_msgs::OrientedBoundingBox
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:extents __extents) (instance geometry_msgs::Point32 :init))
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _extents __extents)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:extents
   (&rest __extents)
   (if (keywordp (car __extents))
       (send* _extents __extents)
     (progn
       (if __extents (setq _extents (car __extents)))
       _extents)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; geometry_msgs/Point32 _extents
    (send _extents :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; geometry_msgs/Point32 _extents
       (send _extents :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; geometry_msgs/Point32 _extents
     (send _extents :deserialize buf ptr-) (incf ptr- (send _extents :serialization-length))
   ;;
   self)
  )

(setf (get moveit_msgs::OrientedBoundingBox :md5sum-) "da3bd98e7cb14efa4141367a9d886ee7")
(setf (get moveit_msgs::OrientedBoundingBox :datatype-) "moveit_msgs/OrientedBoundingBox")
(setf (get moveit_msgs::OrientedBoundingBox :definition-)
      "# the pose of the box
geometry_msgs/Pose pose

# the extents of the box, assuming the center is at the origin
geometry_msgs/Point32 extents

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
")



(provide :moveit_msgs/OrientedBoundingBox "da3bd98e7cb14efa4141367a9d886ee7")


