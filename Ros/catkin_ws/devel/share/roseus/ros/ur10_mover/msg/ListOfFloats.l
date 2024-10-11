;; Auto-generated. Do not edit!


(when (boundp 'ur10_mover::ListOfFloats)
  (if (not (find-package "UR10_MOVER"))
    (make-package "UR10_MOVER"))
  (shadow 'ListOfFloats (find-package "UR10_MOVER")))
(unless (find-package "UR10_MOVER::LISTOFFLOATS")
  (make-package "UR10_MOVER::LISTOFFLOATS"))

(in-package "ROS")
;;//! \htmlinclude ListOfFloats.msg.html


(defclass ur10_mover::ListOfFloats
  :super ros::object
  :slots (_list ))

(defmethod ur10_mover::ListOfFloats
  (:init
   (&key
    ((:list __list) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _list __list)
   self)
  (:list
   (&optional __list)
   (if __list (setq _list __list)) _list)
  (:serialization-length
   ()
   (+
    ;; float64[] _list
    (* 8    (length _list)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _list
     (write-long (length _list) s)
     (dotimes (i (length _list))
       (sys::poke (elt _list i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _list (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _list i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get ur10_mover::ListOfFloats :md5sum-) "c927dcaf1d3ff0b9aa7fd844cd956a22")
(setf (get ur10_mover::ListOfFloats :datatype-) "ur10_mover/ListOfFloats")
(setf (get ur10_mover::ListOfFloats :definition-)
      "float64[] list
")



(provide :ur10_mover/ListOfFloats "c927dcaf1d3ff0b9aa7fd844cd956a22")


