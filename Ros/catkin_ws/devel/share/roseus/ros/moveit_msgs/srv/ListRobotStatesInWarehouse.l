;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::ListRobotStatesInWarehouse)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'ListRobotStatesInWarehouse (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::LISTROBOTSTATESINWAREHOUSE")
  (make-package "MOVEIT_MSGS::LISTROBOTSTATESINWAREHOUSE"))
(unless (find-package "MOVEIT_MSGS::LISTROBOTSTATESINWAREHOUSEREQUEST")
  (make-package "MOVEIT_MSGS::LISTROBOTSTATESINWAREHOUSEREQUEST"))
(unless (find-package "MOVEIT_MSGS::LISTROBOTSTATESINWAREHOUSERESPONSE")
  (make-package "MOVEIT_MSGS::LISTROBOTSTATESINWAREHOUSERESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::ListRobotStatesInWarehouseRequest
  :super ros::object
  :slots (_regex _robot ))

(defmethod moveit_msgs::ListRobotStatesInWarehouseRequest
  (:init
   (&key
    ((:regex __regex) "")
    ((:robot __robot) "")
    )
   (send-super :init)
   (setq _regex (string __regex))
   (setq _robot (string __robot))
   self)
  (:regex
   (&optional __regex)
   (if __regex (setq _regex __regex)) _regex)
  (:robot
   (&optional __robot)
   (if __robot (setq _robot __robot)) _robot)
  (:serialization-length
   ()
   (+
    ;; string _regex
    4 (length _regex)
    ;; string _robot
    4 (length _robot)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _regex
       (write-long (length _regex) s) (princ _regex s)
     ;; string _robot
       (write-long (length _robot) s) (princ _robot s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _regex
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _regex (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_msgs::ListRobotStatesInWarehouseResponse
  :super ros::object
  :slots (_states ))

(defmethod moveit_msgs::ListRobotStatesInWarehouseResponse
  (:init
   (&key
    ((:states __states) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _states __states)
   self)
  (:states
   (&optional __states)
   (if __states (setq _states __states)) _states)
  (:serialization-length
   ()
   (+
    ;; string[] _states
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _states)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _states
     (write-long (length _states) s)
     (dolist (elem _states)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _states
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _states (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _states i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass moveit_msgs::ListRobotStatesInWarehouse
  :super ros::object
  :slots ())

(setf (get moveit_msgs::ListRobotStatesInWarehouse :md5sum-) "dc02fa289e68670e9d392985a0235ee6")
(setf (get moveit_msgs::ListRobotStatesInWarehouse :datatype-) "moveit_msgs/ListRobotStatesInWarehouse")
(setf (get moveit_msgs::ListRobotStatesInWarehouse :request) moveit_msgs::ListRobotStatesInWarehouseRequest)
(setf (get moveit_msgs::ListRobotStatesInWarehouse :response) moveit_msgs::ListRobotStatesInWarehouseResponse)

(defmethod moveit_msgs::ListRobotStatesInWarehouseRequest
  (:response () (instance moveit_msgs::ListRobotStatesInWarehouseResponse :init)))

(setf (get moveit_msgs::ListRobotStatesInWarehouseRequest :md5sum-) "dc02fa289e68670e9d392985a0235ee6")
(setf (get moveit_msgs::ListRobotStatesInWarehouseRequest :datatype-) "moveit_msgs/ListRobotStatesInWarehouseRequest")
(setf (get moveit_msgs::ListRobotStatesInWarehouseRequest :definition-)
      "string regex
string robot

---

string[] states

")

(setf (get moveit_msgs::ListRobotStatesInWarehouseResponse :md5sum-) "dc02fa289e68670e9d392985a0235ee6")
(setf (get moveit_msgs::ListRobotStatesInWarehouseResponse :datatype-) "moveit_msgs/ListRobotStatesInWarehouseResponse")
(setf (get moveit_msgs::ListRobotStatesInWarehouseResponse :definition-)
      "string regex
string robot

---

string[] states

")



(provide :moveit_msgs/ListRobotStatesInWarehouse "dc02fa289e68670e9d392985a0235ee6")


