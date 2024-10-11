;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::CostSource)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'CostSource (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::COSTSOURCE")
  (make-package "MOVEIT_MSGS::COSTSOURCE"))

(in-package "ROS")
;;//! \htmlinclude CostSource.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass moveit_msgs::CostSource
  :super ros::object
  :slots (_cost_density _aabb_min _aabb_max ))

(defmethod moveit_msgs::CostSource
  (:init
   (&key
    ((:cost_density __cost_density) 0.0)
    ((:aabb_min __aabb_min) (instance geometry_msgs::Vector3 :init))
    ((:aabb_max __aabb_max) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _cost_density (float __cost_density))
   (setq _aabb_min __aabb_min)
   (setq _aabb_max __aabb_max)
   self)
  (:cost_density
   (&optional __cost_density)
   (if __cost_density (setq _cost_density __cost_density)) _cost_density)
  (:aabb_min
   (&rest __aabb_min)
   (if (keywordp (car __aabb_min))
       (send* _aabb_min __aabb_min)
     (progn
       (if __aabb_min (setq _aabb_min (car __aabb_min)))
       _aabb_min)))
  (:aabb_max
   (&rest __aabb_max)
   (if (keywordp (car __aabb_max))
       (send* _aabb_max __aabb_max)
     (progn
       (if __aabb_max (setq _aabb_max (car __aabb_max)))
       _aabb_max)))
  (:serialization-length
   ()
   (+
    ;; float64 _cost_density
    8
    ;; geometry_msgs/Vector3 _aabb_min
    (send _aabb_min :serialization-length)
    ;; geometry_msgs/Vector3 _aabb_max
    (send _aabb_max :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _cost_density
       (sys::poke _cost_density (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Vector3 _aabb_min
       (send _aabb_min :serialize s)
     ;; geometry_msgs/Vector3 _aabb_max
       (send _aabb_max :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _cost_density
     (setq _cost_density (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Vector3 _aabb_min
     (send _aabb_min :deserialize buf ptr-) (incf ptr- (send _aabb_min :serialization-length))
   ;; geometry_msgs/Vector3 _aabb_max
     (send _aabb_max :deserialize buf ptr-) (incf ptr- (send _aabb_max :serialization-length))
   ;;
   self)
  )

(setf (get moveit_msgs::CostSource :md5sum-) "abb7e013237dacaaa8b97e704102f908")
(setf (get moveit_msgs::CostSource :datatype-) "moveit_msgs/CostSource")
(setf (get moveit_msgs::CostSource :definition-)
      "# The density of the cost source
float64 cost_density

# The volume of the cost source is represented as an
# axis-aligned bounding box (AABB)
# The AABB is specified by two of its opposite corners

geometry_msgs/Vector3 aabb_min

geometry_msgs/Vector3 aabb_max

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



(provide :moveit_msgs/CostSource "abb7e013237dacaaa8b97e704102f908")


