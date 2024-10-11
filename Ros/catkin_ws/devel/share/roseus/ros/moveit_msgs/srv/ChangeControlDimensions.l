;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::ChangeControlDimensions)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'ChangeControlDimensions (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::CHANGECONTROLDIMENSIONS")
  (make-package "MOVEIT_MSGS::CHANGECONTROLDIMENSIONS"))
(unless (find-package "MOVEIT_MSGS::CHANGECONTROLDIMENSIONSREQUEST")
  (make-package "MOVEIT_MSGS::CHANGECONTROLDIMENSIONSREQUEST"))
(unless (find-package "MOVEIT_MSGS::CHANGECONTROLDIMENSIONSRESPONSE")
  (make-package "MOVEIT_MSGS::CHANGECONTROLDIMENSIONSRESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::ChangeControlDimensionsRequest
  :super ros::object
  :slots (_control_x_translation _control_y_translation _control_z_translation _control_x_rotation _control_y_rotation _control_z_rotation ))

(defmethod moveit_msgs::ChangeControlDimensionsRequest
  (:init
   (&key
    ((:control_x_translation __control_x_translation) nil)
    ((:control_y_translation __control_y_translation) nil)
    ((:control_z_translation __control_z_translation) nil)
    ((:control_x_rotation __control_x_rotation) nil)
    ((:control_y_rotation __control_y_rotation) nil)
    ((:control_z_rotation __control_z_rotation) nil)
    )
   (send-super :init)
   (setq _control_x_translation __control_x_translation)
   (setq _control_y_translation __control_y_translation)
   (setq _control_z_translation __control_z_translation)
   (setq _control_x_rotation __control_x_rotation)
   (setq _control_y_rotation __control_y_rotation)
   (setq _control_z_rotation __control_z_rotation)
   self)
  (:control_x_translation
   (&optional (__control_x_translation :null))
   (if (not (eq __control_x_translation :null)) (setq _control_x_translation __control_x_translation)) _control_x_translation)
  (:control_y_translation
   (&optional (__control_y_translation :null))
   (if (not (eq __control_y_translation :null)) (setq _control_y_translation __control_y_translation)) _control_y_translation)
  (:control_z_translation
   (&optional (__control_z_translation :null))
   (if (not (eq __control_z_translation :null)) (setq _control_z_translation __control_z_translation)) _control_z_translation)
  (:control_x_rotation
   (&optional (__control_x_rotation :null))
   (if (not (eq __control_x_rotation :null)) (setq _control_x_rotation __control_x_rotation)) _control_x_rotation)
  (:control_y_rotation
   (&optional (__control_y_rotation :null))
   (if (not (eq __control_y_rotation :null)) (setq _control_y_rotation __control_y_rotation)) _control_y_rotation)
  (:control_z_rotation
   (&optional (__control_z_rotation :null))
   (if (not (eq __control_z_rotation :null)) (setq _control_z_rotation __control_z_rotation)) _control_z_rotation)
  (:serialization-length
   ()
   (+
    ;; bool _control_x_translation
    1
    ;; bool _control_y_translation
    1
    ;; bool _control_z_translation
    1
    ;; bool _control_x_rotation
    1
    ;; bool _control_y_rotation
    1
    ;; bool _control_z_rotation
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _control_x_translation
       (if _control_x_translation (write-byte -1 s) (write-byte 0 s))
     ;; bool _control_y_translation
       (if _control_y_translation (write-byte -1 s) (write-byte 0 s))
     ;; bool _control_z_translation
       (if _control_z_translation (write-byte -1 s) (write-byte 0 s))
     ;; bool _control_x_rotation
       (if _control_x_rotation (write-byte -1 s) (write-byte 0 s))
     ;; bool _control_y_rotation
       (if _control_y_rotation (write-byte -1 s) (write-byte 0 s))
     ;; bool _control_z_rotation
       (if _control_z_rotation (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _control_x_translation
     (setq _control_x_translation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _control_y_translation
     (setq _control_y_translation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _control_z_translation
     (setq _control_z_translation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _control_x_rotation
     (setq _control_x_rotation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _control_y_rotation
     (setq _control_y_rotation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _control_z_rotation
     (setq _control_z_rotation (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass moveit_msgs::ChangeControlDimensionsResponse
  :super ros::object
  :slots (_success ))

(defmethod moveit_msgs::ChangeControlDimensionsResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass moveit_msgs::ChangeControlDimensions
  :super ros::object
  :slots ())

(setf (get moveit_msgs::ChangeControlDimensions :md5sum-) "35b43a24f32e4654e4afa7596399fc3c")
(setf (get moveit_msgs::ChangeControlDimensions :datatype-) "moveit_msgs/ChangeControlDimensions")
(setf (get moveit_msgs::ChangeControlDimensions :request) moveit_msgs::ChangeControlDimensionsRequest)
(setf (get moveit_msgs::ChangeControlDimensions :response) moveit_msgs::ChangeControlDimensionsResponse)

(defmethod moveit_msgs::ChangeControlDimensionsRequest
  (:response () (instance moveit_msgs::ChangeControlDimensionsResponse :init)))

(setf (get moveit_msgs::ChangeControlDimensionsRequest :md5sum-) "35b43a24f32e4654e4afa7596399fc3c")
(setf (get moveit_msgs::ChangeControlDimensionsRequest :datatype-) "moveit_msgs/ChangeControlDimensionsRequest")
(setf (get moveit_msgs::ChangeControlDimensionsRequest :definition-)
      "# For use with moveit_jog_arm Cartesian planner
#
# Turn on/off jogging along these dimensions.
# Give 'true' to enable jogging in the direction, 'false' to disable
bool control_x_translation
bool control_y_translation
bool control_z_translation
bool control_x_rotation
bool control_y_rotation
bool control_z_rotation
---
bool success

")

(setf (get moveit_msgs::ChangeControlDimensionsResponse :md5sum-) "35b43a24f32e4654e4afa7596399fc3c")
(setf (get moveit_msgs::ChangeControlDimensionsResponse :datatype-) "moveit_msgs/ChangeControlDimensionsResponse")
(setf (get moveit_msgs::ChangeControlDimensionsResponse :definition-)
      "# For use with moveit_jog_arm Cartesian planner
#
# Turn on/off jogging along these dimensions.
# Give 'true' to enable jogging in the direction, 'false' to disable
bool control_x_translation
bool control_y_translation
bool control_z_translation
bool control_x_rotation
bool control_y_rotation
bool control_z_rotation
---
bool success

")



(provide :moveit_msgs/ChangeControlDimensions "35b43a24f32e4654e4afa7596399fc3c")


