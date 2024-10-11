;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::ObjectColor)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'ObjectColor (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::OBJECTCOLOR")
  (make-package "MOVEIT_MSGS::OBJECTCOLOR"))

(in-package "ROS")
;;//! \htmlinclude ObjectColor.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass moveit_msgs::ObjectColor
  :super ros::object
  :slots (_id _color ))

(defmethod moveit_msgs::ObjectColor
  (:init
   (&key
    ((:id __id) "")
    ((:color __color) (instance std_msgs::ColorRGBA :init))
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _color __color)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:color
   (&rest __color)
   (if (keywordp (car __color))
       (send* _color __color)
     (progn
       (if __color (setq _color (car __color)))
       _color)))
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; std_msgs/ColorRGBA _color
    (send _color :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; std_msgs/ColorRGBA _color
       (send _color :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; std_msgs/ColorRGBA _color
     (send _color :deserialize buf ptr-) (incf ptr- (send _color :serialization-length))
   ;;
   self)
  )

(setf (get moveit_msgs::ObjectColor :md5sum-) "ec3bd6f103430e64b2ae706a67d8488e")
(setf (get moveit_msgs::ObjectColor :datatype-) "moveit_msgs/ObjectColor")
(setf (get moveit_msgs::ObjectColor :definition-)
      "# The object id for which we specify color
string id

# The value of the color
std_msgs/ColorRGBA color

================================================================================
MSG: std_msgs/ColorRGBA
float32 r
float32 g
float32 b
float32 a

")



(provide :moveit_msgs/ObjectColor "ec3bd6f103430e64b2ae706a67d8488e")


