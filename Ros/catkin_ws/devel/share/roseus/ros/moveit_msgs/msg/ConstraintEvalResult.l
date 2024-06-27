;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::ConstraintEvalResult)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'ConstraintEvalResult (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::CONSTRAINTEVALRESULT")
  (make-package "MOVEIT_MSGS::CONSTRAINTEVALRESULT"))

(in-package "ROS")
;;//! \htmlinclude ConstraintEvalResult.msg.html


(defclass moveit_msgs::ConstraintEvalResult
  :super ros::object
  :slots (_result _distance ))

(defmethod moveit_msgs::ConstraintEvalResult
  (:init
   (&key
    ((:result __result) nil)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _result __result)
   (setq _distance (float __distance))
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ;; float64 _distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::ConstraintEvalResult :md5sum-) "093643083d24f6488cb5a868bd47c090")
(setf (get moveit_msgs::ConstraintEvalResult :datatype-) "moveit_msgs/ConstraintEvalResult")
(setf (get moveit_msgs::ConstraintEvalResult :definition-)
      "# This message contains result from constraint evaluation
# result specifies the result of constraint evaluation 
# (true indicates state satisfies constraint, false indicates state violates constraint)
# if false, distance specifies a measure of the distance of the state from the constraint
# if true, distance is set to zero
bool result
float64 distance

")



(provide :moveit_msgs/ConstraintEvalResult "093643083d24f6488cb5a868bd47c090")


