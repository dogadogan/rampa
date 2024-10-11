;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::DeleteRobotStateFromWarehouse)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'DeleteRobotStateFromWarehouse (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::DELETEROBOTSTATEFROMWAREHOUSE")
  (make-package "MOVEIT_MSGS::DELETEROBOTSTATEFROMWAREHOUSE"))
(unless (find-package "MOVEIT_MSGS::DELETEROBOTSTATEFROMWAREHOUSEREQUEST")
  (make-package "MOVEIT_MSGS::DELETEROBOTSTATEFROMWAREHOUSEREQUEST"))
(unless (find-package "MOVEIT_MSGS::DELETEROBOTSTATEFROMWAREHOUSERESPONSE")
  (make-package "MOVEIT_MSGS::DELETEROBOTSTATEFROMWAREHOUSERESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::DeleteRobotStateFromWarehouseRequest
  :super ros::object
  :slots (_name _robot ))

(defmethod moveit_msgs::DeleteRobotStateFromWarehouseRequest
  (:init
   (&key
    ((:name __name) "")
    ((:robot __robot) "")
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _robot (string __robot))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:robot
   (&optional __robot)
   (if __robot (setq _robot __robot)) _robot)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; string _robot
    4 (length _robot)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; string _robot
       (write-long (length _robot) s) (princ _robot s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass moveit_msgs::DeleteRobotStateFromWarehouseResponse
  :super ros::object
  :slots ())

(defmethod moveit_msgs::DeleteRobotStateFromWarehouseResponse
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

(defclass moveit_msgs::DeleteRobotStateFromWarehouse
  :super ros::object
  :slots ())

(setf (get moveit_msgs::DeleteRobotStateFromWarehouse :md5sum-) "dab44354403f811c40b84964e068219c")
(setf (get moveit_msgs::DeleteRobotStateFromWarehouse :datatype-) "moveit_msgs/DeleteRobotStateFromWarehouse")
(setf (get moveit_msgs::DeleteRobotStateFromWarehouse :request) moveit_msgs::DeleteRobotStateFromWarehouseRequest)
(setf (get moveit_msgs::DeleteRobotStateFromWarehouse :response) moveit_msgs::DeleteRobotStateFromWarehouseResponse)

(defmethod moveit_msgs::DeleteRobotStateFromWarehouseRequest
  (:response () (instance moveit_msgs::DeleteRobotStateFromWarehouseResponse :init)))

(setf (get moveit_msgs::DeleteRobotStateFromWarehouseRequest :md5sum-) "dab44354403f811c40b84964e068219c")
(setf (get moveit_msgs::DeleteRobotStateFromWarehouseRequest :datatype-) "moveit_msgs/DeleteRobotStateFromWarehouseRequest")
(setf (get moveit_msgs::DeleteRobotStateFromWarehouseRequest :definition-)
      "string name
string robot

---

")

(setf (get moveit_msgs::DeleteRobotStateFromWarehouseResponse :md5sum-) "dab44354403f811c40b84964e068219c")
(setf (get moveit_msgs::DeleteRobotStateFromWarehouseResponse :datatype-) "moveit_msgs/DeleteRobotStateFromWarehouseResponse")
(setf (get moveit_msgs::DeleteRobotStateFromWarehouseResponse :definition-)
      "string name
string robot

---

")



(provide :moveit_msgs/DeleteRobotStateFromWarehouse "dab44354403f811c40b84964e068219c")


