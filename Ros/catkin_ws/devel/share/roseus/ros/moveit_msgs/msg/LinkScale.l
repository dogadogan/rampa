;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::LinkScale)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'LinkScale (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::LINKSCALE")
  (make-package "MOVEIT_MSGS::LINKSCALE"))

(in-package "ROS")
;;//! \htmlinclude LinkScale.msg.html


(defclass moveit_msgs::LinkScale
  :super ros::object
  :slots (_link_name _scale ))

(defmethod moveit_msgs::LinkScale
  (:init
   (&key
    ((:link_name __link_name) "")
    ((:scale __scale) 0.0)
    )
   (send-super :init)
   (setq _link_name (string __link_name))
   (setq _scale (float __scale))
   self)
  (:link_name
   (&optional __link_name)
   (if __link_name (setq _link_name __link_name)) _link_name)
  (:scale
   (&optional __scale)
   (if __scale (setq _scale __scale)) _scale)
  (:serialization-length
   ()
   (+
    ;; string _link_name
    4 (length _link_name)
    ;; float64 _scale
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _link_name
       (write-long (length _link_name) s) (princ _link_name s)
     ;; float64 _scale
       (sys::poke _scale (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _link_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _link_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _scale
     (setq _scale (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::LinkScale :md5sum-) "19faf226446bfb2f645a4da6f2a56166")
(setf (get moveit_msgs::LinkScale :datatype-) "moveit_msgs/LinkScale")
(setf (get moveit_msgs::LinkScale :definition-)
      "#name for the link
string link_name

# scaling to apply to the link
float64 scale

")



(provide :moveit_msgs/LinkScale "19faf226446bfb2f645a4da6f2a56166")


