;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::SaveMap)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'SaveMap (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::SAVEMAP")
  (make-package "MOVEIT_MSGS::SAVEMAP"))
(unless (find-package "MOVEIT_MSGS::SAVEMAPREQUEST")
  (make-package "MOVEIT_MSGS::SAVEMAPREQUEST"))
(unless (find-package "MOVEIT_MSGS::SAVEMAPRESPONSE")
  (make-package "MOVEIT_MSGS::SAVEMAPRESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::SaveMapRequest
  :super ros::object
  :slots (_filename ))

(defmethod moveit_msgs::SaveMapRequest
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

(defclass moveit_msgs::SaveMapResponse
  :super ros::object
  :slots (_success ))

(defmethod moveit_msgs::SaveMapResponse
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

(defclass moveit_msgs::SaveMap
  :super ros::object
  :slots ())

(setf (get moveit_msgs::SaveMap :md5sum-) "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(setf (get moveit_msgs::SaveMap :datatype-) "moveit_msgs/SaveMap")
(setf (get moveit_msgs::SaveMap :request) moveit_msgs::SaveMapRequest)
(setf (get moveit_msgs::SaveMap :response) moveit_msgs::SaveMapResponse)

(defmethod moveit_msgs::SaveMapRequest
  (:response () (instance moveit_msgs::SaveMapResponse :init)))

(setf (get moveit_msgs::SaveMapRequest :md5sum-) "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(setf (get moveit_msgs::SaveMapRequest :datatype-) "moveit_msgs/SaveMapRequest")
(setf (get moveit_msgs::SaveMapRequest :definition-)
      "string filename

---

bool success



")

(setf (get moveit_msgs::SaveMapResponse :md5sum-) "93a4bc4c60dc17e2a69e3fcaaa25d69d")
(setf (get moveit_msgs::SaveMapResponse :datatype-) "moveit_msgs/SaveMapResponse")
(setf (get moveit_msgs::SaveMapResponse :definition-)
      "string filename

---

bool success



")



(provide :moveit_msgs/SaveMap "93a4bc4c60dc17e2a69e3fcaaa25d69d")


