;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::GripperTranslation)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'GripperTranslation (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::GRIPPERTRANSLATION")
  (make-package "MOVEIT_MSGS::GRIPPERTRANSLATION"))

(in-package "ROS")
;;//! \htmlinclude GripperTranslation.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass moveit_msgs::GripperTranslation
  :super ros::object
  :slots (_direction _desired_distance _min_distance ))

(defmethod moveit_msgs::GripperTranslation
  (:init
   (&key
    ((:direction __direction) (instance geometry_msgs::Vector3Stamped :init))
    ((:desired_distance __desired_distance) 0.0)
    ((:min_distance __min_distance) 0.0)
    )
   (send-super :init)
   (setq _direction __direction)
   (setq _desired_distance (float __desired_distance))
   (setq _min_distance (float __min_distance))
   self)
  (:direction
   (&rest __direction)
   (if (keywordp (car __direction))
       (send* _direction __direction)
     (progn
       (if __direction (setq _direction (car __direction)))
       _direction)))
  (:desired_distance
   (&optional __desired_distance)
   (if __desired_distance (setq _desired_distance __desired_distance)) _desired_distance)
  (:min_distance
   (&optional __min_distance)
   (if __min_distance (setq _min_distance __min_distance)) _min_distance)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3Stamped _direction
    (send _direction :serialization-length)
    ;; float32 _desired_distance
    4
    ;; float32 _min_distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3Stamped _direction
       (send _direction :serialize s)
     ;; float32 _desired_distance
       (sys::poke _desired_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _min_distance
       (sys::poke _min_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3Stamped _direction
     (send _direction :deserialize buf ptr-) (incf ptr- (send _direction :serialization-length))
   ;; float32 _desired_distance
     (setq _desired_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _min_distance
     (setq _min_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get moveit_msgs::GripperTranslation :md5sum-) "b53bc0ad0f717cdec3b0e42dec300121")
(setf (get moveit_msgs::GripperTranslation :datatype-) "moveit_msgs/GripperTranslation")
(setf (get moveit_msgs::GripperTranslation :definition-)
      "# defines a translation for the gripper, used in pickup or place tasks
# for example for lifting an object off a table or approaching the table for placing

# the direction of the translation
geometry_msgs/Vector3Stamped direction

# the desired translation distance
float32 desired_distance

# the min distance that must be considered feasible before the
# grasp is even attempted
float32 min_distance

================================================================================
MSG: geometry_msgs/Vector3Stamped
# This represents a Vector3 with reference coordinate frame and timestamp
Header header
Vector3 vector

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



(provide :moveit_msgs/GripperTranslation "b53bc0ad0f717cdec3b0e42dec300121")


