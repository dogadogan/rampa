;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::SetPlannerParams)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'SetPlannerParams (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::SETPLANNERPARAMS")
  (make-package "MOVEIT_MSGS::SETPLANNERPARAMS"))
(unless (find-package "MOVEIT_MSGS::SETPLANNERPARAMSREQUEST")
  (make-package "MOVEIT_MSGS::SETPLANNERPARAMSREQUEST"))
(unless (find-package "MOVEIT_MSGS::SETPLANNERPARAMSRESPONSE")
  (make-package "MOVEIT_MSGS::SETPLANNERPARAMSRESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::SetPlannerParamsRequest
  :super ros::object
  :slots (_planner_config _group _params _replace ))

(defmethod moveit_msgs::SetPlannerParamsRequest
  (:init
   (&key
    ((:planner_config __planner_config) "")
    ((:group __group) "")
    ((:params __params) (instance moveit_msgs::PlannerParams :init))
    ((:replace __replace) nil)
    )
   (send-super :init)
   (setq _planner_config (string __planner_config))
   (setq _group (string __group))
   (setq _params __params)
   (setq _replace __replace)
   self)
  (:planner_config
   (&optional __planner_config)
   (if __planner_config (setq _planner_config __planner_config)) _planner_config)
  (:group
   (&optional __group)
   (if __group (setq _group __group)) _group)
  (:params
   (&rest __params)
   (if (keywordp (car __params))
       (send* _params __params)
     (progn
       (if __params (setq _params (car __params)))
       _params)))
  (:replace
   (&optional (__replace :null))
   (if (not (eq __replace :null)) (setq _replace __replace)) _replace)
  (:serialization-length
   ()
   (+
    ;; string _planner_config
    4 (length _planner_config)
    ;; string _group
    4 (length _group)
    ;; moveit_msgs/PlannerParams _params
    (send _params :serialization-length)
    ;; bool _replace
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _planner_config
       (write-long (length _planner_config) s) (princ _planner_config s)
     ;; string _group
       (write-long (length _group) s) (princ _group s)
     ;; moveit_msgs/PlannerParams _params
       (send _params :serialize s)
     ;; bool _replace
       (if _replace (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _planner_config
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _planner_config (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _group
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _group (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; moveit_msgs/PlannerParams _params
     (send _params :deserialize buf ptr-) (incf ptr- (send _params :serialization-length))
   ;; bool _replace
     (setq _replace (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass moveit_msgs::SetPlannerParamsResponse
  :super ros::object
  :slots ())

(defmethod moveit_msgs::SetPlannerParamsResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass moveit_msgs::SetPlannerParams
  :super ros::object
  :slots ())

(setf (get moveit_msgs::SetPlannerParams :md5sum-) "86762d89189c5f52cda7680fdbceb1db")
(setf (get moveit_msgs::SetPlannerParams :datatype-) "moveit_msgs/SetPlannerParams")
(setf (get moveit_msgs::SetPlannerParams :request) moveit_msgs::SetPlannerParamsRequest)
(setf (get moveit_msgs::SetPlannerParams :response) moveit_msgs::SetPlannerParamsResponse)

(defmethod moveit_msgs::SetPlannerParamsRequest
  (:response () (instance moveit_msgs::SetPlannerParamsResponse :init)))

(setf (get moveit_msgs::SetPlannerParamsRequest :md5sum-) "86762d89189c5f52cda7680fdbceb1db")
(setf (get moveit_msgs::SetPlannerParamsRequest :datatype-) "moveit_msgs/SetPlannerParamsRequest")
(setf (get moveit_msgs::SetPlannerParamsRequest :definition-)
      "# Name of planning config
string planner_config

# Optional name of planning group (set global defaults if empty)
string group

# parameters as key-value pairs
PlannerParams params

# replace params or augment existing ones?
bool replace


================================================================================
MSG: moveit_msgs/PlannerParams
# parameter names (same size as values)
string[] keys

# parameter values (same size as keys)
string[] values

# parameter description (can be empty)
string[] descriptions
---


")

(setf (get moveit_msgs::SetPlannerParamsResponse :md5sum-) "86762d89189c5f52cda7680fdbceb1db")
(setf (get moveit_msgs::SetPlannerParamsResponse :datatype-) "moveit_msgs/SetPlannerParamsResponse")
(setf (get moveit_msgs::SetPlannerParamsResponse :definition-)
      "# Name of planning config
string planner_config

# Optional name of planning group (set global defaults if empty)
string group

# parameters as key-value pairs
PlannerParams params

# replace params or augment existing ones?
bool replace


================================================================================
MSG: moveit_msgs/PlannerParams
# parameter names (same size as values)
string[] keys

# parameter values (same size as keys)
string[] values

# parameter description (can be empty)
string[] descriptions
---


")



(provide :moveit_msgs/SetPlannerParams "86762d89189c5f52cda7680fdbceb1db")


