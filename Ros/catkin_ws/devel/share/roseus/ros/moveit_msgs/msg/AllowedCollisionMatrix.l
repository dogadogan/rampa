;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::AllowedCollisionMatrix)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'AllowedCollisionMatrix (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::ALLOWEDCOLLISIONMATRIX")
  (make-package "MOVEIT_MSGS::ALLOWEDCOLLISIONMATRIX"))

(in-package "ROS")
;;//! \htmlinclude AllowedCollisionMatrix.msg.html


(defclass moveit_msgs::AllowedCollisionMatrix
  :super ros::object
  :slots (_entry_names _entry_values _default_entry_names _default_entry_values ))

(defmethod moveit_msgs::AllowedCollisionMatrix
  (:init
   (&key
    ((:entry_names __entry_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:entry_values __entry_values) ())
    ((:default_entry_names __default_entry_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:default_entry_values __default_entry_values) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _entry_names __entry_names)
   (setq _entry_values __entry_values)
   (setq _default_entry_names __default_entry_names)
   (setq _default_entry_values __default_entry_values)
   self)
  (:entry_names
   (&optional __entry_names)
   (if __entry_names (setq _entry_names __entry_names)) _entry_names)
  (:entry_values
   (&rest __entry_values)
   (if (keywordp (car __entry_values))
       (send* _entry_values __entry_values)
     (progn
       (if __entry_values (setq _entry_values (car __entry_values)))
       _entry_values)))
  (:default_entry_names
   (&optional __default_entry_names)
   (if __default_entry_names (setq _default_entry_names __default_entry_names)) _default_entry_names)
  (:default_entry_values
   (&optional __default_entry_values)
   (if __default_entry_values (setq _default_entry_values __default_entry_values)) _default_entry_values)
  (:serialization-length
   ()
   (+
    ;; string[] _entry_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _entry_names)) 4
    ;; moveit_msgs/AllowedCollisionEntry[] _entry_values
    (apply #'+ (send-all _entry_values :serialization-length)) 4
    ;; string[] _default_entry_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _default_entry_names)) 4
    ;; bool[] _default_entry_values
    (* 1    (length _default_entry_values)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _entry_names
     (write-long (length _entry_names) s)
     (dolist (elem _entry_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; moveit_msgs/AllowedCollisionEntry[] _entry_values
     (write-long (length _entry_values) s)
     (dolist (elem _entry_values)
       (send elem :serialize s)
       )
     ;; string[] _default_entry_names
     (write-long (length _default_entry_names) s)
     (dolist (elem _default_entry_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; bool[] _default_entry_values
     (write-long (length _default_entry_values) s)
     (dotimes (i (length _default_entry_values))
       (if (elt _default_entry_values i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _entry_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _entry_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _entry_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; moveit_msgs/AllowedCollisionEntry[] _entry_values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _entry_values (let (r) (dotimes (i n) (push (instance moveit_msgs::AllowedCollisionEntry :init) r)) r))
     (dolist (elem- _entry_values)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string[] _default_entry_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _default_entry_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _default_entry_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; bool[] _default_entry_values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _default_entry_values (make-list n))
     (dotimes (i n)
     (setf (elt _default_entry_values i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::AllowedCollisionMatrix :md5sum-) "aedce13587eef0d79165a075659c1879")
(setf (get moveit_msgs::AllowedCollisionMatrix :datatype-) "moveit_msgs/AllowedCollisionMatrix")
(setf (get moveit_msgs::AllowedCollisionMatrix :definition-)
      "# The list of entry names in the matrix
string[] entry_names

# The individual entries in the allowed collision matrix
# square, symmetric, with same order as entry_names
AllowedCollisionEntry[] entry_values

# In addition to the collision matrix itself, we also have 
# the default entry value for each entry name.

# If the allowed collision flag is queried for a pair of names (n1, n2)
# that is not found in the collision matrix itself, the value of
# the collision flag is considered to be that of the entry (n1 or n2)
# specified in the list below. If both n1 and n2 are found in the list 
# of defaults, the result is computed with an AND operation

string[] default_entry_names
bool[] default_entry_values

================================================================================
MSG: moveit_msgs/AllowedCollisionEntry
# whether or not collision checking is enabled
bool[] enabled

")



(provide :moveit_msgs/AllowedCollisionMatrix "aedce13587eef0d79165a075659c1879")


