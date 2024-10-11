;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::AllowedCollisionEntry)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'AllowedCollisionEntry (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::ALLOWEDCOLLISIONENTRY")
  (make-package "MOVEIT_MSGS::ALLOWEDCOLLISIONENTRY"))

(in-package "ROS")
;;//! \htmlinclude AllowedCollisionEntry.msg.html


(defclass moveit_msgs::AllowedCollisionEntry
  :super ros::object
  :slots (_enabled ))

(defmethod moveit_msgs::AllowedCollisionEntry
  (:init
   (&key
    ((:enabled __enabled) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _enabled __enabled)
   self)
  (:enabled
   (&optional __enabled)
   (if __enabled (setq _enabled __enabled)) _enabled)
  (:serialization-length
   ()
   (+
    ;; bool[] _enabled
    (* 1    (length _enabled)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool[] _enabled
     (write-long (length _enabled) s)
     (dotimes (i (length _enabled))
       (if (elt _enabled i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool[] _enabled
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _enabled (make-list n))
     (dotimes (i n)
     (setf (elt _enabled i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::AllowedCollisionEntry :md5sum-) "90d1ae1850840724bb043562fe3285fc")
(setf (get moveit_msgs::AllowedCollisionEntry :datatype-) "moveit_msgs/AllowedCollisionEntry")
(setf (get moveit_msgs::AllowedCollisionEntry :definition-)
      "# whether or not collision checking is enabled
bool[] enabled

")



(provide :moveit_msgs/AllowedCollisionEntry "90d1ae1850840724bb043562fe3285fc")


