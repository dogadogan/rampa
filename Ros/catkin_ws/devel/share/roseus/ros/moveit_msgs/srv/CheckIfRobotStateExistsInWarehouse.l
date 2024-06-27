;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::CheckIfRobotStateExistsInWarehouse)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'CheckIfRobotStateExistsInWarehouse (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::CHECKIFROBOTSTATEEXISTSINWAREHOUSE")
  (make-package "MOVEIT_MSGS::CHECKIFROBOTSTATEEXISTSINWAREHOUSE"))
(unless (find-package "MOVEIT_MSGS::CHECKIFROBOTSTATEEXISTSINWAREHOUSEREQUEST")
  (make-package "MOVEIT_MSGS::CHECKIFROBOTSTATEEXISTSINWAREHOUSEREQUEST"))
(unless (find-package "MOVEIT_MSGS::CHECKIFROBOTSTATEEXISTSINWAREHOUSERESPONSE")
  (make-package "MOVEIT_MSGS::CHECKIFROBOTSTATEEXISTSINWAREHOUSERESPONSE"))

(in-package "ROS")





(defclass moveit_msgs::CheckIfRobotStateExistsInWarehouseRequest
  :super ros::object
  :slots (_name _robot ))

(defmethod moveit_msgs::CheckIfRobotStateExistsInWarehouseRequest
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

(defclass moveit_msgs::CheckIfRobotStateExistsInWarehouseResponse
  :super ros::object
  :slots (_exists ))

(defmethod moveit_msgs::CheckIfRobotStateExistsInWarehouseResponse
  (:init
   (&key
    ((:exists __exists) nil)
    )
   (send-super :init)
   (setq _exists __exists)
   self)
  (:exists
   (&optional (__exists :null))
   (if (not (eq __exists :null)) (setq _exists __exists)) _exists)
  (:serialization-length
   ()
   (+
    ;; bool _exists
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _exists
       (if _exists (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _exists
     (setq _exists (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass moveit_msgs::CheckIfRobotStateExistsInWarehouse
  :super ros::object
  :slots ())

(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouse :md5sum-) "3b47364b81dd44f643fa67c9cd127486")
(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouse :datatype-) "moveit_msgs/CheckIfRobotStateExistsInWarehouse")
(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouse :request) moveit_msgs::CheckIfRobotStateExistsInWarehouseRequest)
(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouse :response) moveit_msgs::CheckIfRobotStateExistsInWarehouseResponse)

(defmethod moveit_msgs::CheckIfRobotStateExistsInWarehouseRequest
  (:response () (instance moveit_msgs::CheckIfRobotStateExistsInWarehouseResponse :init)))

(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouseRequest :md5sum-) "3b47364b81dd44f643fa67c9cd127486")
(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouseRequest :datatype-) "moveit_msgs/CheckIfRobotStateExistsInWarehouseRequest")
(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouseRequest :definition-)
      "string name
string robot

---

bool exists

")

(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouseResponse :md5sum-) "3b47364b81dd44f643fa67c9cd127486")
(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouseResponse :datatype-) "moveit_msgs/CheckIfRobotStateExistsInWarehouseResponse")
(setf (get moveit_msgs::CheckIfRobotStateExistsInWarehouseResponse :definition-)
      "string name
string robot

---

bool exists

")



(provide :moveit_msgs/CheckIfRobotStateExistsInWarehouse "3b47364b81dd44f643fa67c9cd127486")


