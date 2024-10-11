;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::QueryPlannerInterfaces)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'QueryPlannerInterfaces (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::QUERYPLANNERINTERFACES")
  (make-package "MOVEIT_MSGS::QUERYPLANNERINTERFACES"))
(unless (find-package "MOVEIT_MSGS::QUERYPLANNERINTERFACESREQUEST")
  (make-package "MOVEIT_MSGS::QUERYPLANNERINTERFACESREQUEST"))
(unless (find-package "MOVEIT_MSGS::QUERYPLANNERINTERFACESRESPONSE")
  (make-package "MOVEIT_MSGS::QUERYPLANNERINTERFACESRESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::QueryPlannerInterfacesRequest
  :super ros::object
  :slots ())

(defmethod moveit_msgs::QueryPlannerInterfacesRequest
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

(defclass moveit_msgs::QueryPlannerInterfacesResponse
  :super ros::object
  :slots (_planner_interfaces ))

(defmethod moveit_msgs::QueryPlannerInterfacesResponse
  (:init
   (&key
    ((:planner_interfaces __planner_interfaces) ())
    )
   (send-super :init)
   (setq _planner_interfaces __planner_interfaces)
   self)
  (:planner_interfaces
   (&rest __planner_interfaces)
   (if (keywordp (car __planner_interfaces))
       (send* _planner_interfaces __planner_interfaces)
     (progn
       (if __planner_interfaces (setq _planner_interfaces (car __planner_interfaces)))
       _planner_interfaces)))
  (:serialization-length
   ()
   (+
    ;; moveit_msgs/PlannerInterfaceDescription[] _planner_interfaces
    (apply #'+ (send-all _planner_interfaces :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; moveit_msgs/PlannerInterfaceDescription[] _planner_interfaces
     (write-long (length _planner_interfaces) s)
     (dolist (elem _planner_interfaces)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; moveit_msgs/PlannerInterfaceDescription[] _planner_interfaces
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _planner_interfaces (let (r) (dotimes (i n) (push (instance moveit_msgs::PlannerInterfaceDescription :init) r)) r))
     (dolist (elem- _planner_interfaces)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass moveit_msgs::QueryPlannerInterfaces
  :super ros::object
  :slots ())

(setf (get moveit_msgs::QueryPlannerInterfaces :md5sum-) "acd3317a4c5631f33127fb428209db05")
(setf (get moveit_msgs::QueryPlannerInterfaces :datatype-) "moveit_msgs/QueryPlannerInterfaces")
(setf (get moveit_msgs::QueryPlannerInterfaces :request) moveit_msgs::QueryPlannerInterfacesRequest)
(setf (get moveit_msgs::QueryPlannerInterfaces :response) moveit_msgs::QueryPlannerInterfacesResponse)

(defmethod moveit_msgs::QueryPlannerInterfacesRequest
  (:response () (instance moveit_msgs::QueryPlannerInterfacesResponse :init)))

(setf (get moveit_msgs::QueryPlannerInterfacesRequest :md5sum-) "acd3317a4c5631f33127fb428209db05")
(setf (get moveit_msgs::QueryPlannerInterfacesRequest :datatype-) "moveit_msgs/QueryPlannerInterfacesRequest")
(setf (get moveit_msgs::QueryPlannerInterfacesRequest :definition-)
      "
---

# The planning instances that could be used in the benchmark
PlannerInterfaceDescription[] planner_interfaces


================================================================================
MSG: moveit_msgs/PlannerInterfaceDescription
# The name of the planner interface
string name

# The names of the planner ids within the interface
string[] planner_ids
")

(setf (get moveit_msgs::QueryPlannerInterfacesResponse :md5sum-) "acd3317a4c5631f33127fb428209db05")
(setf (get moveit_msgs::QueryPlannerInterfacesResponse :datatype-) "moveit_msgs/QueryPlannerInterfacesResponse")
(setf (get moveit_msgs::QueryPlannerInterfacesResponse :definition-)
      "
---

# The planning instances that could be used in the benchmark
PlannerInterfaceDescription[] planner_interfaces


================================================================================
MSG: moveit_msgs/PlannerInterfaceDescription
# The name of the planner interface
string name

# The names of the planner ids within the interface
string[] planner_ids
")



(provide :moveit_msgs/QueryPlannerInterfaces "acd3317a4c5631f33127fb428209db05")


