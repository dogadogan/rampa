;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::KinematicSolverInfo)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'KinematicSolverInfo (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::KINEMATICSOLVERINFO")
  (make-package "MOVEIT_MSGS::KINEMATICSOLVERINFO"))

(in-package "ROS")
;;//! \htmlinclude KinematicSolverInfo.msg.html


(defclass moveit_msgs::KinematicSolverInfo
  :super ros::object
  :slots (_joint_names _limits _link_names ))

(defmethod moveit_msgs::KinematicSolverInfo
  (:init
   (&key
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:limits __limits) ())
    ((:link_names __link_names) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _joint_names __joint_names)
   (setq _limits __limits)
   (setq _link_names __link_names)
   self)
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:limits
   (&rest __limits)
   (if (keywordp (car __limits))
       (send* _limits __limits)
     (progn
       (if __limits (setq _limits (car __limits)))
       _limits)))
  (:link_names
   (&optional __link_names)
   (if __link_names (setq _link_names __link_names)) _link_names)
  (:serialization-length
   ()
   (+
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; moveit_msgs/JointLimits[] _limits
    (apply #'+ (send-all _limits :serialization-length)) 4
    ;; string[] _link_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _link_names)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _joint_names
     (write-long (length _joint_names) s)
     (dolist (elem _joint_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; moveit_msgs/JointLimits[] _limits
     (write-long (length _limits) s)
     (dolist (elem _limits)
       (send elem :serialize s)
       )
     ;; string[] _link_names
     (write-long (length _link_names) s)
     (dolist (elem _link_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _joint_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _joint_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; moveit_msgs/JointLimits[] _limits
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _limits (let (r) (dotimes (i n) (push (instance moveit_msgs::JointLimits :init) r)) r))
     (dolist (elem- _limits)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _link_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _link_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _link_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::KinematicSolverInfo :md5sum-) "cc048557c0f9795c392dd80f8bb00489")
(setf (get moveit_msgs::KinematicSolverInfo :datatype-) "moveit_msgs/KinematicSolverInfo")
(setf (get moveit_msgs::KinematicSolverInfo :definition-)
      "# A list of joints in the kinematic tree
string[] joint_names
# A list of joint limits corresponding to the joint names
moveit_msgs/JointLimits[] limits
# A list of links that the kinematics node provides solutions for
string[] link_names

================================================================================
MSG: moveit_msgs/JointLimits
# This message contains information about limits of a particular joint (or control dimension)
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



(provide :moveit_msgs/KinematicSolverInfo "cc048557c0f9795c392dd80f8bb00489")


