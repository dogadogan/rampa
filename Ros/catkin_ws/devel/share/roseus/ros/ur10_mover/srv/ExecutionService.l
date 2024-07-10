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
  :slots (_joint_states ))

(defmethod ur10_mover::ExecutionServiceRequest
  (:init
   (&key
    ((:joint_states __joint_states) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _joint_states __joint_states)
   self)
  (:joint_states
   (&optional __joint_states)
   (if __joint_states (setq _joint_states __joint_states)) _joint_states)
  (:serialization-length
   ()
   (+
    ;; float64[] _joint_states
    (* 8    (length _joint_states)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _joint_states
     (write-long (length _joint_states) s)
     (dotimes (i (length _joint_states))
       (sys::poke (elt _joint_states i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _joint_states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_states (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_states i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
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

(setf (get ur10_mover::ExecutionService :md5sum-) "5c9003936ef71c09a5e049f44ee8dd53")
(setf (get ur10_mover::ExecutionService :datatype-) "ur10_mover/ExecutionService")
(setf (get ur10_mover::ExecutionService :request) ur10_mover::ExecutionServiceRequest)
(setf (get ur10_mover::ExecutionService :response) ur10_mover::ExecutionServiceResponse)

(defmethod ur10_mover::ExecutionServiceRequest
  (:response () (instance ur10_mover::ExecutionServiceResponse :init)))

(setf (get ur10_mover::ExecutionServiceRequest :md5sum-) "5c9003936ef71c09a5e049f44ee8dd53")
(setf (get ur10_mover::ExecutionServiceRequest :datatype-) "ur10_mover/ExecutionServiceRequest")
(setf (get ur10_mover::ExecutionServiceRequest :definition-)
      "float64[] joint_states
---
string output_msg

")

(setf (get ur10_mover::ExecutionServiceResponse :md5sum-) "5c9003936ef71c09a5e049f44ee8dd53")
(setf (get ur10_mover::ExecutionServiceResponse :datatype-) "ur10_mover/ExecutionServiceResponse")
(setf (get ur10_mover::ExecutionServiceResponse :definition-)
      "float64[] joint_states
---
string output_msg

")



(provide :ur10_mover/ExecutionService "5c9003936ef71c09a5e049f44ee8dd53")


