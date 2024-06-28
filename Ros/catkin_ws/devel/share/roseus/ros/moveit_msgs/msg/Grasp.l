;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::Grasp)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'Grasp (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::GRASP")
  (make-package "MOVEIT_MSGS::GRASP"))

(in-package "ROS")
;;//! \htmlinclude Grasp.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))


(defclass moveit_msgs::Grasp
  :super ros::object
  :slots (_id _pre_grasp_posture _grasp_posture _grasp_pose _grasp_quality _pre_grasp_approach _post_grasp_retreat _post_place_retreat _max_contact_force _allowed_touch_objects ))

(defmethod moveit_msgs::Grasp
  (:init
   (&key
    ((:id __id) "")
    ((:pre_grasp_posture __pre_grasp_posture) (instance trajectory_msgs::JointTrajectory :init))
    ((:grasp_posture __grasp_posture) (instance trajectory_msgs::JointTrajectory :init))
    ((:grasp_pose __grasp_pose) (instance geometry_msgs::PoseStamped :init))
    ((:grasp_quality __grasp_quality) 0.0)
    ((:pre_grasp_approach __pre_grasp_approach) (instance moveit_msgs::GripperTranslation :init))
    ((:post_grasp_retreat __post_grasp_retreat) (instance moveit_msgs::GripperTranslation :init))
    ((:post_place_retreat __post_place_retreat) (instance moveit_msgs::GripperTranslation :init))
    ((:max_contact_force __max_contact_force) 0.0)
    ((:allowed_touch_objects __allowed_touch_objects) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _pre_grasp_posture __pre_grasp_posture)
   (setq _grasp_posture __grasp_posture)
   (setq _grasp_pose __grasp_pose)
   (setq _grasp_quality (float __grasp_quality))
   (setq _pre_grasp_approach __pre_grasp_approach)
   (setq _post_grasp_retreat __post_grasp_retreat)
   (setq _post_place_retreat __post_place_retreat)
   (setq _max_contact_force (float __max_contact_force))
   (setq _allowed_touch_objects __allowed_touch_objects)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pre_grasp_posture
   (&rest __pre_grasp_posture)
   (if (keywordp (car __pre_grasp_posture))
       (send* _pre_grasp_posture __pre_grasp_posture)
     (progn
       (if __pre_grasp_posture (setq _pre_grasp_posture (car __pre_grasp_posture)))
       _pre_grasp_posture)))
  (:grasp_posture
   (&rest __grasp_posture)
   (if (keywordp (car __grasp_posture))
       (send* _grasp_posture __grasp_posture)
     (progn
       (if __grasp_posture (setq _grasp_posture (car __grasp_posture)))
       _grasp_posture)))
  (:grasp_pose
   (&rest __grasp_pose)
   (if (keywordp (car __grasp_pose))
       (send* _grasp_pose __grasp_pose)
     (progn
       (if __grasp_pose (setq _grasp_pose (car __grasp_pose)))
       _grasp_pose)))
  (:grasp_quality
   (&optional __grasp_quality)
   (if __grasp_quality (setq _grasp_quality __grasp_quality)) _grasp_quality)
  (:pre_grasp_approach
   (&rest __pre_grasp_approach)
   (if (keywordp (car __pre_grasp_approach))
       (send* _pre_grasp_approach __pre_grasp_approach)
     (progn
       (if __pre_grasp_approach (setq _pre_grasp_approach (car __pre_grasp_approach)))
       _pre_grasp_approach)))
  (:post_grasp_retreat
   (&rest __post_grasp_retreat)
   (if (keywordp (car __post_grasp_retreat))
       (send* _post_grasp_retreat __post_grasp_retreat)
     (progn
       (if __post_grasp_retreat (setq _post_grasp_retreat (car __post_grasp_retreat)))
       _post_grasp_retreat)))
  (:post_place_retreat
   (&rest __post_place_retreat)
   (if (keywordp (car __post_place_retreat))
       (send* _post_place_retreat __post_place_retreat)
     (progn
       (if __post_place_retreat (setq _post_place_retreat (car __post_place_retreat)))
       _post_place_retreat)))
  (:max_contact_force
   (&optional __max_contact_force)
   (if __max_contact_force (setq _max_contact_force __max_contact_force)) _max_contact_force)
  (:allowed_touch_objects
   (&optional __allowed_touch_objects)
   (if __allowed_touch_objects (setq _allowed_touch_objects __allowed_touch_objects)) _allowed_touch_objects)
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; trajectory_msgs/JointTrajectory _pre_grasp_posture
    (send _pre_grasp_posture :serialization-length)
    ;; trajectory_msgs/JointTrajectory _grasp_posture
    (send _grasp_posture :serialization-length)
    ;; geometry_msgs/PoseStamped _grasp_pose
    (send _grasp_pose :serialization-length)
    ;; float64 _grasp_quality
    8
    ;; moveit_msgs/GripperTranslation _pre_grasp_approach
    (send _pre_grasp_approach :serialization-length)
    ;; moveit_msgs/GripperTranslation _post_grasp_retreat
    (send _post_grasp_retreat :serialization-length)
    ;; moveit_msgs/GripperTranslation _post_place_retreat
    (send _post_place_retreat :serialization-length)
    ;; float32 _max_contact_force
    4
    ;; string[] _allowed_touch_objects
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _allowed_touch_objects)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; trajectory_msgs/JointTrajectory _pre_grasp_posture
       (send _pre_grasp_posture :serialize s)
     ;; trajectory_msgs/JointTrajectory _grasp_posture
       (send _grasp_posture :serialize s)
     ;; geometry_msgs/PoseStamped _grasp_pose
       (send _grasp_pose :serialize s)
     ;; float64 _grasp_quality
       (sys::poke _grasp_quality (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; moveit_msgs/GripperTranslation _pre_grasp_approach
       (send _pre_grasp_approach :serialize s)
     ;; moveit_msgs/GripperTranslation _post_grasp_retreat
       (send _post_grasp_retreat :serialize s)
     ;; moveit_msgs/GripperTranslation _post_place_retreat
       (send _post_place_retreat :serialize s)
     ;; float32 _max_contact_force
       (sys::poke _max_contact_force (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; trajectory_msgs/JointTrajectory _pre_grasp_posture
     (send _pre_grasp_posture :deserialize buf ptr-) (incf ptr- (send _pre_grasp_posture :serialization-length))
   ;; trajectory_msgs/JointTrajectory _grasp_posture
     (send _grasp_posture :deserialize buf ptr-) (incf ptr- (send _grasp_posture :serialization-length))
   ;; geometry_msgs/PoseStamped _grasp_pose
     (send _grasp_pose :deserialize buf ptr-) (incf ptr- (send _grasp_pose :serialization-length))
   ;; float64 _grasp_quality
     (setq _grasp_quality (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; moveit_msgs/GripperTranslation _pre_grasp_approach
     (send _pre_grasp_approach :deserialize buf ptr-) (incf ptr- (send _pre_grasp_approach :serialization-length))
   ;; moveit_msgs/GripperTranslation _post_grasp_retreat
     (send _post_grasp_retreat :deserialize buf ptr-) (incf ptr- (send _post_grasp_retreat :serialization-length))
   ;; moveit_msgs/GripperTranslation _post_place_retreat
     (send _post_place_retreat :deserialize buf ptr-) (incf ptr- (send _post_place_retreat :serialization-length))
   ;; float32 _max_contact_force
     (setq _max_contact_force (sys::peek buf ptr- :float)) (incf ptr- 4)
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

(setf (get moveit_msgs::Grasp :md5sum-) "e26c8fb64f589c33c5d5e54bd7b5e4cb")
(setf (get moveit_msgs::Grasp :datatype-) "moveit_msgs/Grasp")
(setf (get moveit_msgs::Grasp :definition-)
      "# This message contains a description of a grasp that would be used
# with a particular end-effector to grasp an object, including how to
# approach it, grip it, etc.  This message does not contain any
# information about a \"grasp point\" (a position ON the object).
# Whatever generates this message should have already combined
# information about grasp points with information about the geometry
# of the end-effector to compute the grasp_pose in this message.

# A name for this grasp
string id

# The internal posture of the hand for the pre-grasp
# only positions are used
trajectory_msgs/JointTrajectory pre_grasp_posture

# The internal posture of the hand for the grasp
# positions and efforts are used
trajectory_msgs/JointTrajectory grasp_posture

# The position of the end-effector for the grasp.  This is the pose of
# the \"parent_link\" of the end-effector, not actually the pose of any
# link *in* the end-effector.  Typically this would be the pose of the
# most distal wrist link before the hand (end-effector) links began.
geometry_msgs/PoseStamped grasp_pose

# The estimated probability of success for this grasp, or some other
# measure of how \"good\" it is.
float64 grasp_quality

# The approach direction to take before picking an object
GripperTranslation pre_grasp_approach

# The retreat direction to take after a grasp has been completed (object is attached)
GripperTranslation post_grasp_retreat

# The retreat motion to perform when releasing the object; this information
# is not necessary for the grasp itself, but when releasing the object,
# the information will be necessary. The grasp used to perform a pickup
# is returned as part of the result, so this information is available for 
# later use.
GripperTranslation post_place_retreat

# the maximum contact force to use while grasping (<=0 to disable)
float32 max_contact_force

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



(provide :moveit_msgs/Grasp "e26c8fb64f589c33c5d5e54bd7b5e4cb")


