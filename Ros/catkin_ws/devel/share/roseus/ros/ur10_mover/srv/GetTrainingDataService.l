;; Auto-generated. Do not edit!


(when (boundp 'ur10_mover::GetTrainingDataService)
  (if (not (find-package "UR10_MOVER"))
    (make-package "UR10_MOVER"))
  (shadow 'GetTrainingDataService (find-package "UR10_MOVER")))
(unless (find-package "UR10_MOVER::GETTRAININGDATASERVICE")
  (make-package "UR10_MOVER::GETTRAININGDATASERVICE"))
(unless (find-package "UR10_MOVER::GETTRAININGDATASERVICEREQUEST")
  (make-package "UR10_MOVER::GETTRAININGDATASERVICEREQUEST"))
(unless (find-package "UR10_MOVER::GETTRAININGDATASERVICERESPONSE")
  (make-package "UR10_MOVER::GETTRAININGDATASERVICERESPONSE"))

(in-package "ROS")





(defclass ur10_mover::GetTrainingDataServiceRequest
  :super ros::object
  :slots (_input_msg ))

(defmethod ur10_mover::GetTrainingDataServiceRequest
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

(defclass ur10_mover::GetTrainingDataServiceResponse
  :super ros::object
  :slots (_trajectoryList ))

(defmethod ur10_mover::GetTrainingDataServiceResponse
  (:init
   (&key
    ((:trajectoryList __trajectoryList) ())
    )
   (send-super :init)
   (setq _trajectoryList __trajectoryList)
   self)
  (:trajectoryList
   (&rest __trajectoryList)
   (if (keywordp (car __trajectoryList))
       (send* _trajectoryList __trajectoryList)
     (progn
       (if __trajectoryList (setq _trajectoryList (car __trajectoryList)))
       _trajectoryList)))
  (:serialization-length
   ()
   (+
    ;; ur10_mover/ListOfPoses[] _trajectoryList
    (apply #'+ (send-all _trajectoryList :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ur10_mover/ListOfPoses[] _trajectoryList
     (write-long (length _trajectoryList) s)
     (dolist (elem _trajectoryList)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ur10_mover/ListOfPoses[] _trajectoryList
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _trajectoryList (let (r) (dotimes (i n) (push (instance ur10_mover::ListOfPoses :init) r)) r))
     (dolist (elem- _trajectoryList)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ur10_mover::GetTrainingDataService
  :super ros::object
  :slots ())

(setf (get ur10_mover::GetTrainingDataService :md5sum-) "a23732bf635c86b0cb4cf0b1248e70e9")
(setf (get ur10_mover::GetTrainingDataService :datatype-) "ur10_mover/GetTrainingDataService")
(setf (get ur10_mover::GetTrainingDataService :request) ur10_mover::GetTrainingDataServiceRequest)
(setf (get ur10_mover::GetTrainingDataService :response) ur10_mover::GetTrainingDataServiceResponse)

(defmethod ur10_mover::GetTrainingDataServiceRequest
  (:response () (instance ur10_mover::GetTrainingDataServiceResponse :init)))

(setf (get ur10_mover::GetTrainingDataServiceRequest :md5sum-) "a23732bf635c86b0cb4cf0b1248e70e9")
(setf (get ur10_mover::GetTrainingDataServiceRequest :datatype-) "ur10_mover/GetTrainingDataServiceRequest")
(setf (get ur10_mover::GetTrainingDataServiceRequest :definition-)
      "string input_msg
---
ur10_mover/ListOfPoses[] trajectoryList


================================================================================
MSG: ur10_mover/ListOfPoses
geometry_msgs/Pose[] pose_list

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")

(setf (get ur10_mover::GetTrainingDataServiceResponse :md5sum-) "a23732bf635c86b0cb4cf0b1248e70e9")
(setf (get ur10_mover::GetTrainingDataServiceResponse :datatype-) "ur10_mover/GetTrainingDataServiceResponse")
(setf (get ur10_mover::GetTrainingDataServiceResponse :definition-)
      "string input_msg
---
ur10_mover/ListOfPoses[] trajectoryList


================================================================================
MSG: ur10_mover/ListOfPoses
geometry_msgs/Pose[] pose_list

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
")



(provide :ur10_mover/GetTrainingDataService "a23732bf635c86b0cb4cf0b1248e70e9")


