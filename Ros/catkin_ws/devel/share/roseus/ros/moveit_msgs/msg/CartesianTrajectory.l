;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::CartesianTrajectory)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'CartesianTrajectory (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::CARTESIANTRAJECTORY")
  (make-package "MOVEIT_MSGS::CARTESIANTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude CartesianTrajectory.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass moveit_msgs::CartesianTrajectory
  :super ros::object
  :slots (_header _tracked_frame _points ))

(defmethod moveit_msgs::CartesianTrajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tracked_frame __tracked_frame) "")
    ((:points __points) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _tracked_frame (string __tracked_frame))
   (setq _points __points)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tracked_frame
   (&optional __tracked_frame)
   (if __tracked_frame (setq _tracked_frame __tracked_frame)) _tracked_frame)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _tracked_frame
    4 (length _tracked_frame)
    ;; moveit_msgs/CartesianTrajectoryPoint[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _tracked_frame
       (write-long (length _tracked_frame) s) (princ _tracked_frame s)
     ;; moveit_msgs/CartesianTrajectoryPoint[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _tracked_frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _tracked_frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; moveit_msgs/CartesianTrajectoryPoint[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance moveit_msgs::CartesianTrajectoryPoint :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::CartesianTrajectory :md5sum-) "4886769850ce858fcceba546fd5c793b")
(setf (get moveit_msgs::CartesianTrajectory :datatype-) "moveit_msgs/CartesianTrajectory")
(setf (get moveit_msgs::CartesianTrajectory :definition-)
      "# This message describes the trajectory of a tracked frame in task-space
Header header

# The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id
string tracked_frame

CartesianTrajectoryPoint[] points

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
MSG: moveit_msgs/CartesianTrajectoryPoint
# The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,
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



(provide :moveit_msgs/CartesianTrajectory "4886769850ce858fcceba546fd5c793b")


