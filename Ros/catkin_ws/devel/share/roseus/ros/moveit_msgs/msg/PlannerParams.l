;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::PlannerParams)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'PlannerParams (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::PLANNERPARAMS")
  (make-package "MOVEIT_MSGS::PLANNERPARAMS"))

(in-package "ROS")
;;//! \htmlinclude PlannerParams.msg.html


(defclass moveit_msgs::PlannerParams
  :super ros::object
  :slots (_keys _values _descriptions ))

(defmethod moveit_msgs::PlannerParams
  (:init
   (&key
    ((:keys __keys) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:values __values) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:descriptions __descriptions) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _keys __keys)
   (setq _values __values)
   (setq _descriptions __descriptions)
   self)
  (:keys
   (&optional __keys)
   (if __keys (setq _keys __keys)) _keys)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:descriptions
   (&optional __descriptions)
   (if __descriptions (setq _descriptions __descriptions)) _descriptions)
  (:serialization-length
   ()
   (+
    ;; string[] _keys
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _keys)) 4
    ;; string[] _values
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _values)) 4
    ;; string[] _descriptions
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _descriptions)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _keys
     (write-long (length _keys) s)
     (dolist (elem _keys)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _values
     (write-long (length _values) s)
     (dolist (elem _values)
       (write-long (length elem) s) (princ elem s)
       )
     ;; string[] _descriptions
     (write-long (length _descriptions) s)
     (dolist (elem _descriptions)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _keys
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _keys (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _keys i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _values i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; string[] _descriptions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _descriptions (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _descriptions i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::PlannerParams :md5sum-) "cebdf4927996b9026bcf59a160d64145")
(setf (get moveit_msgs::PlannerParams :datatype-) "moveit_msgs/PlannerParams")
(setf (get moveit_msgs::PlannerParams :definition-)
      "# parameter names (same size as values)
string[] keys

# parameter values (same size as keys)
string[] values

# parameter description (can be empty)
string[] descriptions

")



(provide :moveit_msgs/PlannerParams "cebdf4927996b9026bcf59a160d64145")


