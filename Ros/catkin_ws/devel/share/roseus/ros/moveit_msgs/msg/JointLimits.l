;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::JointLimits)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'JointLimits (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::JOINTLIMITS")
  (make-package "MOVEIT_MSGS::JOINTLIMITS"))

(in-package "ROS")
;;//! \htmlinclude JointLimits.msg.html


(defclass moveit_msgs::JointLimits
  :super ros::object
  :slots (_joint_name _has_position_limits _min_position _max_position _has_velocity_limits _max_velocity _has_acceleration_limits _max_acceleration ))

(defmethod moveit_msgs::JointLimits
  (:init
   (&key
    ((:joint_name __joint_name) "")
    ((:has_position_limits __has_position_limits) nil)
    ((:min_position __min_position) 0.0)
    ((:max_position __max_position) 0.0)
    ((:has_velocity_limits __has_velocity_limits) nil)
    ((:max_velocity __max_velocity) 0.0)
    ((:has_acceleration_limits __has_acceleration_limits) nil)
    ((:max_acceleration __max_acceleration) 0.0)
    )
   (send-super :init)
   (setq _joint_name (string __joint_name))
   (setq _has_position_limits __has_position_limits)
   (setq _min_position (float __min_position))
   (setq _max_position (float __max_position))
   (setq _has_velocity_limits __has_velocity_limits)
   (setq _max_velocity (float __max_velocity))
   (setq _has_acceleration_limits __has_acceleration_limits)
   (setq _max_acceleration (float __max_acceleration))
   self)
  (:joint_name
   (&optional __joint_name)
   (if __joint_name (setq _joint_name __joint_name)) _joint_name)
  (:has_position_limits
   (&optional (__has_position_limits :null))
   (if (not (eq __has_position_limits :null)) (setq _has_position_limits __has_position_limits)) _has_position_limits)
  (:min_position
   (&optional __min_position)
   (if __min_position (setq _min_position __min_position)) _min_position)
  (:max_position
   (&optional __max_position)
   (if __max_position (setq _max_position __max_position)) _max_position)
  (:has_velocity_limits
   (&optional (__has_velocity_limits :null))
   (if (not (eq __has_velocity_limits :null)) (setq _has_velocity_limits __has_velocity_limits)) _has_velocity_limits)
  (:max_velocity
   (&optional __max_velocity)
   (if __max_velocity (setq _max_velocity __max_velocity)) _max_velocity)
  (:has_acceleration_limits
   (&optional (__has_acceleration_limits :null))
   (if (not (eq __has_acceleration_limits :null)) (setq _has_acceleration_limits __has_acceleration_limits)) _has_acceleration_limits)
  (:max_acceleration
   (&optional __max_acceleration)
   (if __max_acceleration (setq _max_acceleration __max_acceleration)) _max_acceleration)
  (:serialization-length
   ()
   (+
    ;; string _joint_name
    4 (length _joint_name)
    ;; bool _has_position_limits
    1
    ;; float64 _min_position
    8
    ;; float64 _max_position
    8
    ;; bool _has_velocity_limits
    1
    ;; float64 _max_velocity
    8
    ;; bool _has_acceleration_limits
    1
    ;; float64 _max_acceleration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _joint_name
       (write-long (length _joint_name) s) (princ _joint_name s)
     ;; bool _has_position_limits
       (if _has_position_limits (write-byte -1 s) (write-byte 0 s))
     ;; float64 _min_position
       (sys::poke _min_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_position
       (sys::poke _max_position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _has_velocity_limits
       (if _has_velocity_limits (write-byte -1 s) (write-byte 0 s))
     ;; float64 _max_velocity
       (sys::poke _max_velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _has_acceleration_limits
       (if _has_acceleration_limits (write-byte -1 s) (write-byte 0 s))
     ;; float64 _max_acceleration
       (sys::poke _max_acceleration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _joint_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _joint_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _has_position_limits
     (setq _has_position_limits (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _min_position
     (setq _min_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_position
     (setq _max_position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _has_velocity_limits
     (setq _has_velocity_limits (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _max_velocity
     (setq _max_velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _has_acceleration_limits
     (setq _has_acceleration_limits (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _max_acceleration
     (setq _max_acceleration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::JointLimits :md5sum-) "8ca618c7329ea46142cbc864a2efe856")
(setf (get moveit_msgs::JointLimits :datatype-) "moveit_msgs/JointLimits")
(setf (get moveit_msgs::JointLimits :definition-)
      "# This message contains information about limits of a particular joint (or control dimension)
string joint_name

# true if the joint has position limits
bool has_position_limits

# min and max position limits
float64 min_position
float64 max_position

# true if joint has velocity limits
bool has_velocity_limits

# max velocity limit
float64 max_velocity
# min_velocity is assumed to be -max_velocity

# true if joint has acceleration limits
bool has_acceleration_limits
# max acceleration limit
float64 max_acceleration
# min_acceleration is assumed to be -max_acceleration

")



(provide :moveit_msgs/JointLimits "8ca618c7329ea46142cbc864a2efe856")


