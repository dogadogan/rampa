;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::GetPlannerParams)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'GetPlannerParams (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::GETPLANNERPARAMS")
  (make-package "MOVEIT_MSGS::GETPLANNERPARAMS"))
(unless (find-package "MOVEIT_MSGS::GETPLANNERPARAMSREQUEST")
  (make-package "MOVEIT_MSGS::GETPLANNERPARAMSREQUEST"))
(unless (find-package "MOVEIT_MSGS::GETPLANNERPARAMSRESPONSE")
  (make-package "MOVEIT_MSGS::GETPLANNERPARAMSRESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::GetPlannerParamsRequest
  :super ros::object
  :slots (_planner_config _group ))

(defmethod moveit_msgs::GetPlannerParamsRequest
  (:init
   (&key
    ((:planner_config __planner_config) "")
    ((:group __group) "")
    )
   (send-super :init)
   (setq _planner_config (string __planner_config))
   (setq _group (string __group))
   self)
  (:planner_config
   (&optional __planner_config)
   (if __planner_config (setq _planner_config __planner_config)) _planner_config)
  (:group
   (&optional __group)
   (if __group (setq _group __group)) _group)
  (:serialization-length
   ()
   (+
    ;; string _planner_config
    4 (length _planner_config)
    ;; string _group
    4 (length _group)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _planner_config
       (write-long (length _planner_config) s) (princ _planner_config s)
     ;; string _group
       (write-long (length _group) s) (princ _group s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _planner_config
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _planner_config (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _group
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _group (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_msgs::GetPlannerParamsResponse
  :super ros::object
  :slots (_params ))

(defmethod moveit_msgs::GetPlannerParamsResponse
  (:init
   (&key
    ((:params __params) (instance moveit_msgs::PlannerParams :init))
    )
   (send-super :init)
   (setq _params __params)
   self)
  (:params
   (&rest __params)
   (if (keywordp (car __params))
       (send* _params __params)
     (progn
       (if __params (setq _params (car __params)))
       _params)))
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/PlannerParams _params
    (send _params :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/PlannerParams _params
       (send _params :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/PlannerParams _params
     (send _params :deserialize buf ptr-) (incf ptr- (send _params :serialization-length))
   ;;
   self)
  )

(defclass moveit_msgs::GetPlannerParams
  :super ros::object
  :slots ())

(setf (get moveit_msgs::GetPlannerParams :md5sum-) "b3ec1aca2b1471e3eea051c548c69810")
(setf (get moveit_msgs::GetPlannerParams :datatype-) "moveit_msgs/GetPlannerParams")
(setf (get moveit_msgs::GetPlannerParams :request) moveit_msgs::GetPlannerParamsRequest)
(setf (get moveit_msgs::GetPlannerParams :response) moveit_msgs::GetPlannerParamsResponse)

(defmethod moveit_msgs::GetPlannerParamsRequest
  (:response () (instance moveit_msgs::GetPlannerParamsResponse :init)))

(setf (get moveit_msgs::GetPlannerParamsRequest :md5sum-) "b3ec1aca2b1471e3eea051c548c69810")
(setf (get moveit_msgs::GetPlannerParamsRequest :datatype-) "moveit_msgs/GetPlannerParamsRequest")
(setf (get moveit_msgs::GetPlannerParamsRequest :definition-)
      "# Name of planning config
string planner_config

# Optional name of planning group (return global defaults if empty)
string group

---

# parameters as key-value pairs
PlannerParams params


================================================================================
MSG: moveit_msgs/PlannerParams
# parameter names (same size as values)
string[] keys

# parameter values (same size as keys)
string[] values

# parameter description (can be empty)
string[] descriptions
")

(setf (get moveit_msgs::GetPlannerParamsResponse :md5sum-) "b3ec1aca2b1471e3eea051c548c69810")
(setf (get moveit_msgs::GetPlannerParamsResponse :datatype-) "moveit_msgs/GetPlannerParamsResponse")
(setf (get moveit_msgs::GetPlannerParamsResponse :definition-)
      "# Name of planning config
string planner_config

# Optional name of planning group (return global defaults if empty)
string group

---

# parameters as key-value pairs
PlannerParams params


================================================================================
MSG: moveit_msgs/PlannerParams
# parameter names (same size as values)
string[] keys

# parameter values (same size as keys)
string[] values

# parameter description (can be empty)
string[] descriptions
")



(provide :moveit_msgs/GetPlannerParams "b3ec1aca2b1471e3eea051c548c69810")


