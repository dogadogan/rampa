;; Auto-generated. Do not edit!


(when (boundp 'ur10_mover::DiscardService)
  (if (not (find-package "UR10_MOVER"))
    (make-package "UR10_MOVER"))
  (shadow 'DiscardService (find-package "UR10_MOVER")))
(unless (find-package "UR10_MOVER::DISCARDSERVICE")
  (make-package "UR10_MOVER::DISCARDSERVICE"))
(unless (find-package "UR10_MOVER::DISCARDSERVICEREQUEST")
  (make-package "UR10_MOVER::DISCARDSERVICEREQUEST"))
(unless (find-package "UR10_MOVER::DISCARDSERVICERESPONSE")
  (make-package "UR10_MOVER::DISCARDSERVICERESPONSE"))

(in-package "ROS")





(defclass ur10_mover::DiscardServiceRequest
  :super ros::object
  :slots (_input_msg ))

(defmethod ur10_mover::DiscardServiceRequest
  (:init
   (&key
    ((:input_msg __input_msg) "")
    )
   (send-super :init)
   (setq _input_msg (string __input_msg))
   self)
  (:input_msg
   (&optional __input_msg)
   (if __input_msg (setq _input_msg __input_msg)) _input_msg)
  (:serialization-length
   ()
   (+
    ;; string _input_msg
    4 (length _input_msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _input_msg
       (write-long (length _input_msg) s) (princ _input_msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _input_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _input_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ur10_mover::DiscardServiceResponse
  :super ros::object
  :slots (_output_msg ))

(defmethod ur10_mover::DiscardServiceResponse
  (:init
   (&key
    ((:output_msg __output_msg) "")
    )
   (send-super :init)
   (setq _output_msg (string __output_msg))
   self)
  (:output_msg
   (&optional __output_msg)
   (if __output_msg (setq _output_msg __output_msg)) _output_msg)
  (:serialization-length
   ()
   (+
    ;; string _output_msg
    4 (length _output_msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _output_msg
       (write-long (length _output_msg) s) (princ _output_msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _output_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _output_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass ur10_mover::DiscardService
  :super ros::object
  :slots ())

(setf (get ur10_mover::DiscardService :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::DiscardService :datatype-) "ur10_mover/DiscardService")
(setf (get ur10_mover::DiscardService :request) ur10_mover::DiscardServiceRequest)
(setf (get ur10_mover::DiscardService :response) ur10_mover::DiscardServiceResponse)

(defmethod ur10_mover::DiscardServiceRequest
  (:response () (instance ur10_mover::DiscardServiceResponse :init)))

(setf (get ur10_mover::DiscardServiceRequest :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::DiscardServiceRequest :datatype-) "ur10_mover/DiscardServiceRequest")
(setf (get ur10_mover::DiscardServiceRequest :definition-)
      "string input_msg
---
string output_msg
")

(setf (get ur10_mover::DiscardServiceResponse :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::DiscardServiceResponse :datatype-) "ur10_mover/DiscardServiceResponse")
(setf (get ur10_mover::DiscardServiceResponse :definition-)
      "string input_msg
---
string output_msg
")



(provide :ur10_mover/DiscardService "b57e415505eb1ef8a5131e05d03cd81c")


