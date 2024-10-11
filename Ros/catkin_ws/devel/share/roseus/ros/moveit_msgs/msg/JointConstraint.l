;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::JointConstraint)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'JointConstraint (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::JOINTCONSTRAINT")
  (make-package "MOVEIT_MSGS::JOINTCONSTRAINT"))

(in-package "ROS")
;;//! \htmlinclude JointConstraint.msg.html


(defclass moveit_msgs::JointConstraint
  :super ros::object
  :slots (_joint_name _position _tolerance_above _tolerance_below _weight ))

(defmethod moveit_msgs::JointConstraint
  (:init
   (&key
    ((:joint_name __joint_name) "")
    ((:position __position) 0.0)
    ((:tolerance_above __tolerance_above) 0.0)
    ((:tolerance_below __tolerance_below) 0.0)
    ((:weight __weight) 0.0)
    )
   (send-super :init)
   (setq _joint_name (string __joint_name))
   (setq _position (float __position))
   (setq _tolerance_above (float __tolerance_above))
   (setq _tolerance_below (float __tolerance_below))
   (setq _weight (float __weight))
   self)
  (:joint_name
   (&optional __joint_name)
   (if __joint_name (setq _joint_name __joint_name)) _joint_name)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:tolerance_above
   (&optional __tolerance_above)
   (if __tolerance_above (setq _tolerance_above __tolerance_above)) _tolerance_above)
  (:tolerance_below
   (&optional __tolerance_below)
   (if __tolerance_below (setq _tolerance_below __tolerance_below)) _tolerance_below)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:serialization-length
   ()
   (+
    ;; string _joint_name
    4 (length _joint_name)
    ;; float64 _position
    8
    ;; float64 _tolerance_above
    8
    ;; float64 _tolerance_below
    8
    ;; float64 _weight
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _joint_name
       (write-long (length _joint_name) s) (princ _joint_name s)
     ;; float64 _position
       (sys::poke _position (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tolerance_above
       (sys::poke _tolerance_above (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tolerance_below
       (sys::poke _tolerance_below (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _joint_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _joint_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _position
     (setq _position (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tolerance_above
     (setq _tolerance_above (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tolerance_below
     (setq _tolerance_below (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _weight
     (setq _weight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::JointConstraint :md5sum-) "c02a15146bec0ce13564807805b008f0")
(setf (get moveit_msgs::JointConstraint :datatype-) "moveit_msgs/JointConstraint")
(setf (get moveit_msgs::JointConstraint :definition-)
      "# Constrain the position of a joint to be within a certain bound
string joint_name

# the bound to be achieved is [position - tolerance_below, position + tolerance_above]
float64 position
float64 tolerance_above
float64 tolerance_below

# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
float64 weight
")



(provide :moveit_msgs/JointConstraint "c02a15146bec0ce13564807805b008f0")


