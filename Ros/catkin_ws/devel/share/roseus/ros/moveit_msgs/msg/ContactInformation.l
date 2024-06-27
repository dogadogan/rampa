;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::ContactInformation)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'ContactInformation (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::CONTACTINFORMATION")
  (make-package "MOVEIT_MSGS::CONTACTINFORMATION"))

(in-package "ROS")
;;//! \htmlinclude ContactInformation.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ROBOT_LINK*" (find-package "MOVEIT_MSGS::CONTACTINFORMATION"))
(shadow '*ROBOT_LINK* (find-package "MOVEIT_MSGS::CONTACTINFORMATION"))
(defconstant moveit_msgs::ContactInformation::*ROBOT_LINK* 0)
(intern "*WORLD_OBJECT*" (find-package "MOVEIT_MSGS::CONTACTINFORMATION"))
(shadow '*WORLD_OBJECT* (find-package "MOVEIT_MSGS::CONTACTINFORMATION"))
(defconstant moveit_msgs::ContactInformation::*WORLD_OBJECT* 1)
(intern "*ROBOT_ATTACHED*" (find-package "MOVEIT_MSGS::CONTACTINFORMATION"))
(shadow '*ROBOT_ATTACHED* (find-package "MOVEIT_MSGS::CONTACTINFORMATION"))
(defconstant moveit_msgs::ContactInformation::*ROBOT_ATTACHED* 2)

(defun moveit_msgs::ContactInformation-to-symbol (const)
  (cond
        ((= const 0) 'moveit_msgs::ContactInformation::*ROBOT_LINK*)
        ((= const 1) 'moveit_msgs::ContactInformation::*WORLD_OBJECT*)
        ((= const 2) 'moveit_msgs::ContactInformation::*ROBOT_ATTACHED*)
        (t nil)))

(defclass moveit_msgs::ContactInformation
  :super ros::object
  :slots (_header _position _normal _depth _contact_body_1 _body_type_1 _contact_body_2 _body_type_2 ))

(defmethod moveit_msgs::ContactInformation
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:normal __normal) (instance geometry_msgs::Vector3 :init))
    ((:depth __depth) 0.0)
    ((:contact_body_1 __contact_body_1) "")
    ((:body_type_1 __body_type_1) 0)
    ((:contact_body_2 __contact_body_2) "")
    ((:body_type_2 __body_type_2) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   (setq _normal __normal)
   (setq _depth (float __depth))
   (setq _contact_body_1 (string __contact_body_1))
   (setq _body_type_1 (round __body_type_1))
   (setq _contact_body_2 (string __contact_body_2))
   (setq _body_type_2 (round __body_type_2))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:normal
   (&rest __normal)
   (if (keywordp (car __normal))
       (send* _normal __normal)
     (progn
       (if __normal (setq _normal (car __normal)))
       _normal)))
  (:depth
   (&optional __depth)
   (if __depth (setq _depth __depth)) _depth)
  (:contact_body_1
   (&optional __contact_body_1)
   (if __contact_body_1 (setq _contact_body_1 __contact_body_1)) _contact_body_1)
  (:body_type_1
   (&optional __body_type_1)
   (if __body_type_1 (setq _body_type_1 __body_type_1)) _body_type_1)
  (:contact_body_2
   (&optional __contact_body_2)
   (if __contact_body_2 (setq _contact_body_2 __contact_body_2)) _contact_body_2)
  (:body_type_2
   (&optional __body_type_2)
   (if __body_type_2 (setq _body_type_2 __body_type_2)) _body_type_2)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; geometry_msgs/Vector3 _normal
    (send _normal :serialization-length)
    ;; float64 _depth
    8
    ;; string _contact_body_1
    4 (length _contact_body_1)
    ;; uint32 _body_type_1
    4
    ;; string _contact_body_2
    4 (length _contact_body_2)
    ;; uint32 _body_type_2
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; geometry_msgs/Vector3 _normal
       (send _normal :serialize s)
     ;; float64 _depth
       (sys::poke _depth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _contact_body_1
       (write-long (length _contact_body_1) s) (princ _contact_body_1 s)
     ;; uint32 _body_type_1
       (write-long _body_type_1 s)
     ;; string _contact_body_2
       (write-long (length _contact_body_2) s) (princ _contact_body_2 s)
     ;; uint32 _body_type_2
       (write-long _body_type_2 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geometry_msgs/Vector3 _normal
     (send _normal :deserialize buf ptr-) (incf ptr- (send _normal :serialization-length))
   ;; float64 _depth
     (setq _depth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _contact_body_1
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _contact_body_1 (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _body_type_1
     (setq _body_type_1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _contact_body_2
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _contact_body_2 (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _body_type_2
     (setq _body_type_2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get moveit_msgs::ContactInformation :md5sum-) "116228ca08b0c286ec5ca32a50fdc17b")
(setf (get moveit_msgs::ContactInformation :datatype-) "moveit_msgs/ContactInformation")
(setf (get moveit_msgs::ContactInformation :definition-)
      "# Standard ROS header contains information 
# about the frame in which this 
# contact is specified
Header header

# Position of the contact point
geometry_msgs/Point position

# Normal corresponding to the contact point
geometry_msgs/Vector3 normal 

# Depth of contact point
float64 depth

# Name of the first body that is in contact
# This could be a link or a namespace that represents a body
string contact_body_1
uint32 body_type_1

# Name of the second body that is in contact
# This could be a link or a namespace that represents a body
string contact_body_2
uint32 body_type_2

uint32 ROBOT_LINK=0
uint32 WORLD_OBJECT=1
uint32 ROBOT_ATTACHED=2

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

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



(provide :moveit_msgs/ContactInformation "116228ca08b0c286ec5ca32a50fdc17b")


