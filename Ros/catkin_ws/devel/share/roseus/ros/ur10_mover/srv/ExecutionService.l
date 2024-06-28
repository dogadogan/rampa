;; Auto-generated. Do not edit!


(when (boundp 'ur10_mover::ExecutionService)
  (if (not (find-package "UR10_MOVER"))
    (make-package "UR10_MOVER"))
  (shadow 'ExecutionService (find-package "UR10_MOVER")))
(unless (find-package "UR10_MOVER::EXECUTIONSERVICE")
  (make-package "UR10_MOVER::EXECUTIONSERVICE"))
(unless (find-package "UR10_MOVER::EXECUTIONSERVICEREQUEST")
  (make-package "UR10_MOVER::EXECUTIONSERVICEREQUEST"))
(unless (find-package "UR10_MOVER::EXECUTIONSERVICERESPONSE")
  (make-package "UR10_MOVER::EXECUTIONSERVICERESPONSE"))

(in-package "ROS")





(defclass ur10_mover::ExecutionServiceRequest
  :super ros::object
  :slots (_input_msg ))

(defmethod ur10_mover::ExecutionServiceRequest
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

(defclass ur10_mover::ExecutionServiceResponse
  :super ros::object
  :slots (_output_msg ))

(defmethod ur10_mover::ExecutionServiceResponse
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

(defclass ur10_mover::ExecutionService
  :super ros::object
  :slots ())

(setf (get ur10_mover::ExecutionService :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::ExecutionService :datatype-) "ur10_mover/ExecutionService")
(setf (get ur10_mover::ExecutionService :request) ur10_mover::ExecutionServiceRequest)
(setf (get ur10_mover::ExecutionService :response) ur10_mover::ExecutionServiceResponse)

(defmethod ur10_mover::ExecutionServiceRequest
  (:response () (instance ur10_mover::ExecutionServiceResponse :init)))

(setf (get ur10_mover::ExecutionServiceRequest :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::ExecutionServiceRequest :datatype-) "ur10_mover/ExecutionServiceRequest")
(setf (get ur10_mover::ExecutionServiceRequest :definition-)
      "string input_msg
---
string output_msg
")

(setf (get ur10_mover::ExecutionServiceResponse :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::ExecutionServiceResponse :datatype-) "ur10_mover/ExecutionServiceResponse")
(setf (get ur10_mover::ExecutionServiceResponse :definition-)
      "string input_msg
---
string output_msg
")



(provide :ur10_mover/ExecutionService "b57e415505eb1ef8a5131e05d03cd81c")


