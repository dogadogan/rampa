;; Auto-generated. Do not edit!


(when (boundp 'ur10_mover::SampleService)
  (if (not (find-package "UR10_MOVER"))
    (make-package "UR10_MOVER"))
  (shadow 'SampleService (find-package "UR10_MOVER")))
(unless (find-package "UR10_MOVER::SAMPLESERVICE")
  (make-package "UR10_MOVER::SAMPLESERVICE"))
(unless (find-package "UR10_MOVER::SAMPLESERVICEREQUEST")
  (make-package "UR10_MOVER::SAMPLESERVICEREQUEST"))
(unless (find-package "UR10_MOVER::SAMPLESERVICERESPONSE")
  (make-package "UR10_MOVER::SAMPLESERVICERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass ur10_mover::SampleServiceRequest
  :super ros::object
  :slots (_input_msg _condition_poses _context ))

(defmethod ur10_mover::SampleServiceRequest
  (:init
   (&key
    ((:input_msg __input_msg) "")
    ((:condition_poses __condition_poses) ())
    ((:context __context) 0.0)
    )
   (send-super :init)
   (setq _input_msg (string __input_msg))
   (setq _condition_poses __condition_poses)
   (setq _context (float __context))
   self)
  (:input_msg
   (&optional __input_msg)
   (if __input_msg (setq _input_msg __input_msg)) _input_msg)
  (:condition_poses
   (&rest __condition_poses)
   (if (keywordp (car __condition_poses))
       (send* _condition_poses __condition_poses)
     (progn
       (if __condition_poses (setq _condition_poses (car __condition_poses)))
       _condition_poses)))
  (:context
   (&optional __context)
   (if __context (setq _context __context)) _context)
  (:serialization-length
   ()
   (+
    ;; string _input_msg
    4 (length _input_msg)
    ;; geometry_msgs/Pose[] _condition_poses
    (apply #'+ (send-all _condition_poses :serialization-length)) 4
    ;; float64 _context
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _input_msg
       (write-long (length _input_msg) s) (princ _input_msg s)
     ;; geometry_msgs/Pose[] _condition_poses
     (write-long (length _condition_poses) s)
     (dolist (elem _condition_poses)
       (send elem :serialize s)
       )
     ;; float64 _context
       (sys::poke _context (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _input_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _input_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose[] _condition_poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _condition_poses (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _condition_poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _context
     (setq _context (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ur10_mover::SampleServiceResponse
  :super ros::object
  :slots (_output_msg _sampled_trajectory ))

(defmethod ur10_mover::SampleServiceResponse
  (:init
   (&key
    ((:output_msg __output_msg) "")
    ((:sampled_trajectory __sampled_trajectory) ())
    )
   (send-super :init)
   (setq _output_msg (string __output_msg))
   (setq _sampled_trajectory __sampled_trajectory)
   self)
  (:output_msg
   (&optional __output_msg)
   (if __output_msg (setq _output_msg __output_msg)) _output_msg)
  (:sampled_trajectory
   (&rest __sampled_trajectory)
   (if (keywordp (car __sampled_trajectory))
       (send* _sampled_trajectory __sampled_trajectory)
     (progn
       (if __sampled_trajectory (setq _sampled_trajectory (car __sampled_trajectory)))
       _sampled_trajectory)))
  (:serialization-length
   ()
   (+
    ;; string _output_msg
    4 (length _output_msg)
    ;; geometry_msgs/Pose[] _sampled_trajectory
    (apply #'+ (send-all _sampled_trajectory :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _output_msg
       (write-long (length _output_msg) s) (princ _output_msg s)
     ;; geometry_msgs/Pose[] _sampled_trajectory
     (write-long (length _sampled_trajectory) s)
     (dolist (elem _sampled_trajectory)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _output_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _output_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose[] _sampled_trajectory
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sampled_trajectory (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _sampled_trajectory)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass ur10_mover::SampleService
  :super ros::object
  :slots ())

(setf (get ur10_mover::SampleService :md5sum-) "1d1a2b8ec8f0aacf9f57d31767f2b42d")
(setf (get ur10_mover::SampleService :datatype-) "ur10_mover/SampleService")
(setf (get ur10_mover::SampleService :request) ur10_mover::SampleServiceRequest)
(setf (get ur10_mover::SampleService :response) ur10_mover::SampleServiceResponse)

(defmethod ur10_mover::SampleServiceRequest
  (:response () (instance ur10_mover::SampleServiceResponse :init)))

(setf (get ur10_mover::SampleServiceRequest :md5sum-) "1d1a2b8ec8f0aacf9f57d31767f2b42d")
(setf (get ur10_mover::SampleServiceRequest :datatype-) "ur10_mover/SampleServiceRequest")
(setf (get ur10_mover::SampleServiceRequest :definition-)
      "string input_msg
geometry_msgs/Pose[] condition_poses
float64 context

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
---
string output_msg
geometry_msgs/Pose[] sampled_trajectory

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

(setf (get ur10_mover::SampleServiceResponse :md5sum-) "1d1a2b8ec8f0aacf9f57d31767f2b42d")
(setf (get ur10_mover::SampleServiceResponse :datatype-) "ur10_mover/SampleServiceResponse")
(setf (get ur10_mover::SampleServiceResponse :definition-)
      "string input_msg
geometry_msgs/Pose[] condition_poses
float64 context

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
---
string output_msg
geometry_msgs/Pose[] sampled_trajectory

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



(provide :ur10_mover/SampleService "1d1a2b8ec8f0aacf9f57d31767f2b42d")


