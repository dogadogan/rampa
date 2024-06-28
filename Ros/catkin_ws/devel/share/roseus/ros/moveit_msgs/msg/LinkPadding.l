;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::LinkPadding)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'LinkPadding (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::LINKPADDING")
  (make-package "MOVEIT_MSGS::LINKPADDING"))

(in-package "ROS")
;;//! \htmlinclude LinkPadding.msg.html


(defclass moveit_msgs::LinkPadding
  :super ros::object
  :slots (_link_name _padding ))

(defmethod moveit_msgs::LinkPadding
  (:init
   (&key
    ((:link_name __link_name) "")
    ((:padding __padding) 0.0)
    )
   (send-super :init)
   (setq _link_name (string __link_name))
   (setq _padding (float __padding))
   self)
  (:link_name
   (&optional __link_name)
   (if __link_name (setq _link_name __link_name)) _link_name)
  (:padding
   (&optional __padding)
   (if __padding (setq _padding __padding)) _padding)
  (:serialization-length
   ()
   (+
    ;; string _link_name
    4 (length _link_name)
    ;; float64 _padding
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _link_name
       (write-long (length _link_name) s) (princ _link_name s)
     ;; float64 _padding
       (sys::poke _padding (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _link_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _link_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _padding
     (setq _padding (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::LinkPadding :md5sum-) "b3ea75670df55c696fedee97774d5947")
(setf (get moveit_msgs::LinkPadding :datatype-) "moveit_msgs/LinkPadding")
(setf (get moveit_msgs::LinkPadding :definition-)
      "#name for the link
string link_name

# padding to apply to the link
float64 padding

")



(provide :moveit_msgs/LinkPadding "b3ea75670df55c696fedee97774d5947")


