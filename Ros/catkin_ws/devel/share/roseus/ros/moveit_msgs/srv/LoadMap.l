;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::LoadMap)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'LoadMap (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::LOADMAP")
  (make-package "MOVEIT_MSGS::LOADMAP"))
(unless (find-package "MOVEIT_MSGS::LOADMAPREQUEST")
  (make-package "MOVEIT_MSGS::LOADMAPREQUEST"))
(unless (find-package "MOVEIT_MSGS::LOADMAPRESPONSE")
  (make-package "MOVEIT_MSGS::LOADMAPRESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::LoadMapRequest
  :super ros::object
  :slots (_filename ))

(defmethod moveit_msgs::LoadMapRequest
  (:init
   (&key
    ((:filename __filename) "")
    )
   (send-super :init)
   (setq _filename (string __filename))
   self)
  (:filename
   (&optional __filename)
   (if __filename (setq _filename __filename)) _filename)
  (:serialization-length
   ()
   (+
    ;; string _filename
    4 (length _filename)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filename
       (write-long (length _filename) s) (princ _filename s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filename
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filename (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_msgs::LoadMapResponse
  :super ros::object
  :slots (_success ))

(defmethod moveit_msgs::LoadMapResponse
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

(defclass moveit_msgs::LoadMap
  :super ros::object
  :slots ())

(setf (get moveit_msgs::LoadMap :md5sum-) "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(setf (get moveit_msgs::LoadMap :datatype-) "moveit_msgs/LoadMap")
(setf (get moveit_msgs::LoadMap :request) moveit_msgs::LoadMapRequest)
(setf (get moveit_msgs::LoadMap :response) moveit_msgs::LoadMapResponse)

(defmethod moveit_msgs::LoadMapRequest
  (:response () (instance moveit_msgs::LoadMapResponse :init)))

(setf (get moveit_msgs::LoadMapRequest :md5sum-) "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(setf (get moveit_msgs::LoadMapRequest :datatype-) "moveit_msgs/LoadMapRequest")
(setf (get moveit_msgs::LoadMapRequest :definition-)
      "string filename
---
bool success
")

(setf (get moveit_msgs::LoadMapResponse :md5sum-) "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(setf (get moveit_msgs::LoadMapResponse :datatype-) "moveit_msgs/LoadMapResponse")
(setf (get moveit_msgs::LoadMapResponse :definition-)
      "string filename
---
bool success
")



(provide :moveit_msgs/LoadMap "93a4bc4c60dc17e2a69e3fcaaa25d69d")


