;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::CartesianTrajectoryPoint)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'CartesianTrajectoryPoint (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::CARTESIANTRAJECTORYPOINT")
  (make-package "MOVEIT_MSGS::CARTESIANTRAJECTORYPOINT"))

(in-package "ROS")
;;//! \htmlinclude CartesianTrajectoryPoint.msg.html


(defclass moveit_msgs::CartesianTrajectoryPoint
  :super ros::object
  :slots (_point _time_from_start ))

(defmethod moveit_msgs::CartesianTrajectoryPoint
  (:init
   (&key
    ((:point __point) (instance moveit_msgs::CartesianPoint :init))
    ((:time_from_start __time_from_start) (instance ros::time :init))
    )
   (send-super :init)
   (setq _point __point)
   (setq _time_from_start __time_from_start)
   self)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:time_from_start
   (&optional __time_from_start)
   (if __time_from_start (setq _time_from_start __time_from_start)) _time_from_start)
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/CartesianPoint _point
    (send _point :serialization-length)
    ;; duration _time_from_start
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/CartesianPoint _point
       (send _point :serialize s)
     ;; duration _time_from_start
       (write-long (send _time_from_start :sec) s) (write-long (send _time_from_start :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/CartesianPoint _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; duration _time_from_start
     (send _time_from_start :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time_from_start :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get moveit_msgs::CartesianTrajectoryPoint :md5sum-) "e996ea294f646e6911b3e85e624f5acf")
(setf (get moveit_msgs::CartesianTrajectoryPoint :datatype-) "moveit_msgs/CartesianTrajectoryPoint")
(setf (get moveit_msgs::CartesianTrajectoryPoint :definition-)
      "# The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,
# following the pattern of the JointTrajectory message
CartesianPoint point

duration time_from_start

================================================================================
MSG: moveit_msgs/CartesianPoint
# This message defines a point in a cartesian trajectory
geometry_msgs/Pose pose
geometry_msgs/Twist velocity
geometry_msgs/Accel acceleration
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
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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
================================================================================
MSG: geometry_msgs/Accel
# This expresses acceleration in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

")



(provide :moveit_msgs/CartesianTrajectoryPoint "e996ea294f646e6911b3e85e624f5acf")


