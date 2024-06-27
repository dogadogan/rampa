;; Auto-generated. Do not edit!


(when (boundp 'ur10_mover::TrainingService)
  (if (not (find-package "UR10_MOVER"))
    (make-package "UR10_MOVER"))
  (shadow 'TrainingService (find-package "UR10_MOVER")))
(unless (find-package "UR10_MOVER::TRAININGSERVICE")
  (make-package "UR10_MOVER::TRAININGSERVICE"))
(unless (find-package "UR10_MOVER::TRAININGSERVICEREQUEST")
  (make-package "UR10_MOVER::TRAININGSERVICEREQUEST"))
(unless (find-package "UR10_MOVER::TRAININGSERVICERESPONSE")
  (make-package "UR10_MOVER::TRAININGSERVICERESPONSE"))

(in-package "ROS")





(defclass ur10_mover::TrainingServiceRequest
  :super ros::object
  :slots (_input_msg ))

(defmethod ur10_mover::TrainingServiceRequest
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

(defclass ur10_mover::TrainingServiceResponse
  :super ros::object
  :slots (_output_msg ))

(defmethod ur10_mover::TrainingServiceResponse
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

(defclass ur10_mover::TrainingService
  :super ros::object
  :slots ())

(setf (get ur10_mover::TrainingService :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::TrainingService :datatype-) "ur10_mover/TrainingService")
(setf (get ur10_mover::TrainingService :request) ur10_mover::TrainingServiceRequest)
(setf (get ur10_mover::TrainingService :response) ur10_mover::TrainingServiceResponse)

(defmethod ur10_mover::TrainingServiceRequest
  (:response () (instance ur10_mover::TrainingServiceResponse :init)))

(setf (get ur10_mover::TrainingServiceRequest :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::TrainingServiceRequest :datatype-) "ur10_mover/TrainingServiceRequest")
(setf (get ur10_mover::TrainingServiceRequest :definition-)
      "string input_msg
---
string output_msg
")

(setf (get ur10_mover::TrainingServiceResponse :md5sum-) "b57e415505eb1ef8a5131e05d03cd81c")
(setf (get ur10_mover::TrainingServiceResponse :datatype-) "ur10_mover/TrainingServiceResponse")
(setf (get ur10_mover::TrainingServiceResponse :definition-)
      "string input_msg
---
string output_msg
")



(provide :ur10_mover/TrainingService "b57e415505eb1ef8a5131e05d03cd81c")


