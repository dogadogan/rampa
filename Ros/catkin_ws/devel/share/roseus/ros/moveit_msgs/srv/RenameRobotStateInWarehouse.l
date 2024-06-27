;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::RenameRobotStateInWarehouse)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'RenameRobotStateInWarehouse (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::RENAMEROBOTSTATEINWAREHOUSE")
  (make-package "MOVEIT_MSGS::RENAMEROBOTSTATEINWAREHOUSE"))
(unless (find-package "MOVEIT_MSGS::RENAMEROBOTSTATEINWAREHOUSEREQUEST")
  (make-package "MOVEIT_MSGS::RENAMEROBOTSTATEINWAREHOUSEREQUEST"))
(unless (find-package "MOVEIT_MSGS::RENAMEROBOTSTATEINWAREHOUSERESPONSE")
  (make-package "MOVEIT_MSGS::RENAMEROBOTSTATEINWAREHOUSERESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::RenameRobotStateInWarehouseRequest
  :super ros::object
  :slots (_old_name _new_name _robot ))

(defmethod moveit_msgs::RenameRobotStateInWarehouseRequest
  (:init
   (&key
    ((:old_name __old_name) "")
    ((:new_name __new_name) "")
    ((:robot __robot) "")
    )
   (send-super :init)
   (setq _old_name (string __old_name))
   (setq _new_name (string __new_name))
   (setq _robot (string __robot))
   self)
  (:old_name
   (&optional __old_name)
   (if __old_name (setq _old_name __old_name)) _old_name)
  (:new_name
   (&optional __new_name)
   (if __new_name (setq _new_name __new_name)) _new_name)
  (:robot
   (&optional __robot)
   (if __robot (setq _robot __robot)) _robot)
  (:serialization-length
   ()
   (+
    ;; string _old_name
    4 (length _old_name)
    ;; string _new_name
    4 (length _new_name)
    ;; string _robot
    4 (length _robot)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _old_name
       (write-long (length _old_name) s) (princ _old_name s)
     ;; string _new_name
       (write-long (length _new_name) s) (princ _new_name s)
     ;; string _robot
       (write-long (length _robot) s) (princ _robot s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _old_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _old_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _new_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _new_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_msgs::RenameRobotStateInWarehouseResponse
  :super ros::object
  :slots ())

(defmethod moveit_msgs::RenameRobotStateInWarehouseResponse
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

(defclass moveit_msgs::RenameRobotStateInWarehouse
  :super ros::object
  :slots ())

(setf (get moveit_msgs::RenameRobotStateInWarehouse :md5sum-) "073dc05c3fd313b947cea483c25c46b0")
(setf (get moveit_msgs::RenameRobotStateInWarehouse :datatype-) "moveit_msgs/RenameRobotStateInWarehouse")
(setf (get moveit_msgs::RenameRobotStateInWarehouse :request) moveit_msgs::RenameRobotStateInWarehouseRequest)
(setf (get moveit_msgs::RenameRobotStateInWarehouse :response) moveit_msgs::RenameRobotStateInWarehouseResponse)

(defmethod moveit_msgs::RenameRobotStateInWarehouseRequest
  (:response () (instance moveit_msgs::RenameRobotStateInWarehouseResponse :init)))

(setf (get moveit_msgs::RenameRobotStateInWarehouseRequest :md5sum-) "073dc05c3fd313b947cea483c25c46b0")
(setf (get moveit_msgs::RenameRobotStateInWarehouseRequest :datatype-) "moveit_msgs/RenameRobotStateInWarehouseRequest")
(setf (get moveit_msgs::RenameRobotStateInWarehouseRequest :definition-)
      "string old_name
string new_name
string robot
---

")

(setf (get moveit_msgs::RenameRobotStateInWarehouseResponse :md5sum-) "073dc05c3fd313b947cea483c25c46b0")
(setf (get moveit_msgs::RenameRobotStateInWarehouseResponse :datatype-) "moveit_msgs/RenameRobotStateInWarehouseResponse")
(setf (get moveit_msgs::RenameRobotStateInWarehouseResponse :definition-)
      "string old_name
string new_name
string robot
---

")



(provide :moveit_msgs/RenameRobotStateInWarehouse "073dc05c3fd313b947cea483c25c46b0")


