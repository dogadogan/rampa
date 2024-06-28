;; Auto-generated. Do not edit!


(when (boundp 'ur10_mover::StateService)
  (if (not (find-package "UR10_MOVER"))
    (make-package "UR10_MOVER"))
  (shadow 'StateService (find-package "UR10_MOVER")))
(unless (find-package "UR10_MOVER::STATESERVICE")
  (make-package "UR10_MOVER::STATESERVICE"))
(unless (find-package "UR10_MOVER::STATESERVICEREQUEST")
  (make-package "UR10_MOVER::STATESERVICEREQUEST"))
(unless (find-package "UR10_MOVER::STATESERVICERESPONSE")
  (make-package "UR10_MOVER::STATESERVICERESPONSE"))

(in-package "ROS")





(defclass ur10_mover::StateServiceRequest
  :super ros::object
  :slots (_input_msg ))

(defmethod ur10_mover::StateServiceRequest
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

(defclass ur10_mover::StateServiceResponse
  :super ros::object
  :slots (_output_msg _current_joint_angles ))

(defmethod ur10_mover::StateServiceResponse
  (:init
   (&key
    ((:output_msg __output_msg) "")
    ((:current_joint_angles __current_joint_angles) (make-array 6 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _output_msg (string __output_msg))
   (setq _current_joint_angles __current_joint_angles)
   self)
  (:output_msg
   (&optional __output_msg)
   (if __output_msg (setq _output_msg __output_msg)) _output_msg)
  (:current_joint_angles
   (&optional __current_joint_angles)
   (if __current_joint_angles (setq _current_joint_angles __current_joint_angles)) _current_joint_angles)
  (:serialization-length
   ()
   (+
    ;; string _output_msg
    4 (length _output_msg)
    ;; float64[6] _current_joint_angles
    (* 8    6)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _output_msg
       (write-long (length _output_msg) s) (princ _output_msg s)
     ;; float64[6] _current_joint_angles
     (dotimes (i 6)
       (sys::poke (elt _current_joint_angles i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _output_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _output_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64[6] _current_joint_angles
   (dotimes (i (length _current_joint_angles))
     (setf (elt _current_joint_angles i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass ur10_mover::StateService
  :super ros::object
  :slots ())

(setf (get ur10_mover::StateService :md5sum-) "30fae736b7734374461e907d8c1eb052")
(setf (get ur10_mover::StateService :datatype-) "ur10_mover/StateService")
(setf (get ur10_mover::StateService :request) ur10_mover::StateServiceRequest)
(setf (get ur10_mover::StateService :response) ur10_mover::StateServiceResponse)

(defmethod ur10_mover::StateServiceRequest
  (:response () (instance ur10_mover::StateServiceResponse :init)))

(setf (get ur10_mover::StateServiceRequest :md5sum-) "30fae736b7734374461e907d8c1eb052")
(setf (get ur10_mover::StateServiceRequest :datatype-) "ur10_mover/StateServiceRequest")
(setf (get ur10_mover::StateServiceRequest :definition-)
      "string input_msg
---
string output_msg
float64[6] current_joint_angles
")

(setf (get ur10_mover::StateServiceResponse :md5sum-) "30fae736b7734374461e907d8c1eb052")
(setf (get ur10_mover::StateServiceResponse :datatype-) "ur10_mover/StateServiceResponse")
(setf (get ur10_mover::StateServiceResponse :definition-)
      "string input_msg
---
string output_msg
float64[6] current_joint_angles
")



(provide :ur10_mover/StateService "30fae736b7734374461e907d8c1eb052")


