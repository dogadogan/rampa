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
  :slots (_input_msg _start_point _end_point ))

(defmethod ur10_mover::SampleServiceRequest
  (:init
   (&key
    ((:input_msg __input_msg) "")
    ((:start_point __start_point) (instance geometry_msgs::Pose :init))
    ((:end_point __end_point) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _input_msg (string __input_msg))
   (setq _start_point __start_point)
   (setq _end_point __end_point)
   self)
  (:input_msg
   (&optional __input_msg)
   (if __input_msg (setq _input_msg __input_msg)) _input_msg)
  (:start_point
   (&rest __start_point)
   (if (keywordp (car __start_point))
       (send* _start_point __start_point)
     (progn
       (if __start_point (setq _start_point (car __start_point)))
       _start_point)))
  (:end_point
   (&rest __end_point)
   (if (keywordp (car __end_point))
       (send* _end_point __end_point)
     (progn
       (if __end_point (setq _end_point (car __end_point)))
       _end_point)))
  (:serialization-length
   ()
   (+
    ;; string _input_msg
    4 (length _input_msg)
    ;; geometry_msgs/Pose _start_point
    (send _start_point :serialization-length)
    ;; geometry_msgs/Pose _end_point
    (send _end_point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _input_msg
       (write-long (length _input_msg) s) (princ _input_msg s)
     ;; geometry_msgs/Pose _start_point
       (send _start_point :serialize s)
     ;; geometry_msgs/Pose _end_point
       (send _end_point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _input_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _input_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geometry_msgs/Pose _start_point
     (send _start_point :deserialize buf ptr-) (incf ptr- (send _start_point :serialization-length))
   ;; geometry_msgs/Pose _end_point
     (send _end_point :deserialize buf ptr-) (incf ptr- (send _end_point :serialization-length))
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

(setf (get ur10_mover::SampleService :md5sum-) "1dd2b2140805e81dd0283cb593e2adc5")
(setf (get ur10_mover::SampleService :datatype-) "ur10_mover/SampleService")
(setf (get ur10_mover::SampleService :request) ur10_mover::SampleServiceRequest)
(setf (get ur10_mover::SampleService :response) ur10_mover::SampleServiceResponse)

(defmethod ur10_mover::SampleServiceRequest
  (:response () (instance ur10_mover::SampleServiceResponse :init)))

(setf (get ur10_mover::SampleServiceRequest :md5sum-) "1dd2b2140805e81dd0283cb593e2adc5")
(setf (get ur10_mover::SampleServiceRequest :datatype-) "ur10_mover/SampleServiceRequest")
(setf (get ur10_mover::SampleServiceRequest :definition-)
      "string input_msg
geometry_msgs/Pose start_point
geometry_msgs/Pose end_point

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

(setf (get ur10_mover::SampleServiceResponse :md5sum-) "1dd2b2140805e81dd0283cb593e2adc5")
(setf (get ur10_mover::SampleServiceResponse :datatype-) "ur10_mover/SampleServiceResponse")
(setf (get ur10_mover::SampleServiceResponse :definition-)
      "string input_msg
geometry_msgs/Pose start_point
geometry_msgs/Pose end_point

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



(provide :ur10_mover/SampleService "1dd2b2140805e81dd0283cb593e2adc5")


