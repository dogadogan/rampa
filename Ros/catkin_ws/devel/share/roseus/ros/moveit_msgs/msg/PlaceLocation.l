;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::PlaceLocation)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'PlaceLocation (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::PLACELOCATION")
  (make-package "MOVEIT_MSGS::PLACELOCATION"))

(in-package "ROS")
;;//! \htmlinclude PlaceLocation.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass moveit_msgs::PlaceLocation
  :super ros::object
  :slots (_id _post_place_posture _place_pose _quality _pre_place_approach _post_place_retreat _allowed_touch_objects ))

(defmethod moveit_msgs::PlaceLocation
  (:init
   (&key
    ((:id __id) "")
    ((:post_place_posture __post_place_posture) (instance trajectory_msgs::JointTrajectory :init))
    ((:place_pose __place_pose) (instance geometry_msgs::PoseStamped :init))
    ((:quality __quality) 0.0)
    ((:pre_place_approach __pre_place_approach) (instance moveit_msgs::GripperTranslation :init))
    ((:post_place_retreat __post_place_retreat) (instance moveit_msgs::GripperTranslation :init))
    ((:allowed_touch_objects __allowed_touch_objects) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _post_place_posture __post_place_posture)
   (setq _place_pose __place_pose)
   (setq _quality (float __quality))
   (setq _pre_place_approach __pre_place_approach)
   (setq _post_place_retreat __post_place_retreat)
   (setq _allowed_touch_objects __allowed_touch_objects)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:post_place_posture
   (&rest __post_place_posture)
   (if (keywordp (car __post_place_posture))
       (send* _post_place_posture __post_place_posture)
     (progn
       (if __post_place_posture (setq _post_place_posture (car __post_place_posture)))
       _post_place_posture)))
  (:place_pose
   (&rest __place_pose)
   (if (keywordp (car __place_pose))
       (send* _place_pose __place_pose)
     (progn
       (if __place_pose (setq _place_pose (car __place_pose)))
       _place_pose)))
  (:quality
   (&optional __quality)
   (if __quality (setq _quality __quality)) _quality)
  (:pre_place_approach
   (&rest __pre_place_approach)
   (if (keywordp (car __pre_place_approach))
       (send* _pre_place_approach __pre_place_approach)
     (progn
       (if __pre_place_approach (setq _pre_place_approach (car __pre_place_approach)))
       _pre_place_approach)))
  (:post_place_retreat
   (&rest __post_place_retreat)
   (if (keywordp (car __post_place_retreat))
       (send* _post_place_retreat __post_place_retreat)
     (progn
       (if __post_place_retreat (setq _post_place_retreat (car __post_place_retreat)))
       _post_place_retreat)))
  (:allowed_touch_objects
   (&optional __allowed_touch_objects)
   (if __allowed_touch_objects (setq _allowed_touch_objects __allowed_touch_objects)) _allowed_touch_objects)
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; trajectory_msgs/JointTrajectory _post_place_posture
    (send _post_place_posture :serialization-length)
    ;; geometry_msgs/PoseStamped _place_pose
    (send _place_pose :serialization-length)
    ;; float64 _quality
    8
    ;; moveit_msgs/GripperTranslation _pre_place_approach
    (send _pre_place_approach :serialization-length)
    ;; moveit_msgs/GripperTranslation _post_place_retreat
    (send _post_place_retreat :serialization-length)
    ;; string[] _allowed_touch_objects
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _allowed_touch_objects)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; trajectory_msgs/JointTrajectory _post_place_posture
       (send _post_place_posture :serialize s)
     ;; geometry_msgs/PoseStamped _place_pose
       (send _place_pose :serialize s)
     ;; float64 _quality
       (sys::poke _quality (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; moveit_msgs/GripperTranslation _pre_place_approach
       (send _pre_place_approach :serialize s)
     ;; moveit_msgs/GripperTranslation _post_place_retreat
       (send _post_place_retreat :serialize s)
     ;; string[] _allowed_touch_objects
     (write-long (length _allowed_touch_objects) s)
     (dolist (elem _allowed_touch_objects)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; trajectory_msgs/JointTrajectory _post_place_posture
     (send _post_place_posture :deserialize buf ptr-) (incf ptr- (send _post_place_posture :serialization-length))
   ;; geometry_msgs/PoseStamped _place_pose
     (send _place_pose :deserialize buf ptr-) (incf ptr- (send _place_pose :serialization-length))
   ;; float64 _quality
     (setq _quality (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; moveit_msgs/GripperTranslation _pre_place_approach
     (send _pre_place_approach :deserialize buf ptr-) (incf ptr- (send _pre_place_approach :serialization-length))
   ;; moveit_msgs/GripperTranslation _post_place_retreat
     (send _post_place_retreat :deserialize buf ptr-) (incf ptr- (send _post_place_retreat :serialization-length))
   ;; string[] _allowed_touch_objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _allowed_touch_objects (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _allowed_touch_objects i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get moveit_msgs::PlaceLocation :md5sum-) "7b53f032c68481686026c3e9223d0713")
(setf (get moveit_msgs::PlaceLocation :datatype-) "moveit_msgs/PlaceLocation")
(setf (get moveit_msgs::PlaceLocation :definition-)
      "# A name for this grasp
string id

# The internal posture of the hand for the grasp
# positions and efforts are used
trajectory_msgs/JointTrajectory post_place_posture

# The position of the end-effector for the grasp relative to a reference frame 
# (that is always specified elsewhere, not in this message)
geometry_msgs/PoseStamped place_pose

# The estimated probability of success for this place, or some other
# measure of how \"good\" it is.
float64 quality

# The approach motion
GripperTranslation pre_place_approach

# The retreat motion
GripperTranslation post_place_retreat

# an optional list of obstacles that we have semantic information about
# and that can be touched/pushed/moved in the course of grasping
string[] allowed_touch_objects

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: moveit_msgs/GripperTranslation
# defines a translation for the gripper, used in pickup or place tasks
# for example for lifting an object off a table or approaching the table for placing

# the direction of the translation
geometry_msgs/Vector3Stamped direction

# the desired translation distance
float32 desired_distance

# the min distance that must be considered feasible before the
# grasp is even attempted
float32 min_distance

================================================================================
MSG: geometry_msgs/Vector3Stamped
# This represents a Vector3 with reference coordinate frame and timestamp
Header header
Vector3 vector

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :moveit_msgs/PlaceLocation "7b53f032c68481686026c3e9223d0713")


