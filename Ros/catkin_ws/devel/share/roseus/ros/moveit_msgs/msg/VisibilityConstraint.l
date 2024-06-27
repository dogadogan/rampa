;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::VisibilityConstraint)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'VisibilityConstraint (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT")
  (make-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT"))

(in-package "ROS")
;;//! \htmlinclude VisibilityConstraint.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(intern "*SENSOR_Z*" (find-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT"))
(shadow '*SENSOR_Z* (find-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT"))
(defconstant moveit_msgs::VisibilityConstraint::*SENSOR_Z* 0)
(intern "*SENSOR_Y*" (find-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT"))
(shadow '*SENSOR_Y* (find-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT"))
(defconstant moveit_msgs::VisibilityConstraint::*SENSOR_Y* 1)
(intern "*SENSOR_X*" (find-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT"))
(shadow '*SENSOR_X* (find-package "MOVEIT_MSGS::VISIBILITYCONSTRAINT"))
(defconstant moveit_msgs::VisibilityConstraint::*SENSOR_X* 2)

(defun moveit_msgs::VisibilityConstraint-to-symbol (const)
  (cond
        ((= const 0) 'moveit_msgs::VisibilityConstraint::*SENSOR_Z*)
        ((= const 1) 'moveit_msgs::VisibilityConstraint::*SENSOR_Y*)
        ((= const 2) 'moveit_msgs::VisibilityConstraint::*SENSOR_X*)
        (t nil)))

(defclass moveit_msgs::VisibilityConstraint
  :super ros::object
  :slots (_target_radius _target_pose _cone_sides _sensor_pose _max_view_angle _max_range_angle _sensor_view_direction _weight ))

(defmethod moveit_msgs::VisibilityConstraint
  (:init
   (&key
    ((:target_radius __target_radius) 0.0)
    ((:target_pose __target_pose) (instance geometry_msgs::PoseStamped :init))
    ((:cone_sides __cone_sides) 0)
    ((:sensor_pose __sensor_pose) (instance geometry_msgs::PoseStamped :init))
    ((:max_view_angle __max_view_angle) 0.0)
    ((:max_range_angle __max_range_angle) 0.0)
    ((:sensor_view_direction __sensor_view_direction) 0)
    ((:weight __weight) 0.0)
    )
   (send-super :init)
   (setq _target_radius (float __target_radius))
   (setq _target_pose __target_pose)
   (setq _cone_sides (round __cone_sides))
   (setq _sensor_pose __sensor_pose)
   (setq _max_view_angle (float __max_view_angle))
   (setq _max_range_angle (float __max_range_angle))
   (setq _sensor_view_direction (round __sensor_view_direction))
   (setq _weight (float __weight))
   self)
  (:target_radius
   (&optional __target_radius)
   (if __target_radius (setq _target_radius __target_radius)) _target_radius)
  (:target_pose
   (&rest __target_pose)
   (if (keywordp (car __target_pose))
       (send* _target_pose __target_pose)
     (progn
       (if __target_pose (setq _target_pose (car __target_pose)))
       _target_pose)))
  (:cone_sides
   (&optional __cone_sides)
   (if __cone_sides (setq _cone_sides __cone_sides)) _cone_sides)
  (:sensor_pose
   (&rest __sensor_pose)
   (if (keywordp (car __sensor_pose))
       (send* _sensor_pose __sensor_pose)
     (progn
       (if __sensor_pose (setq _sensor_pose (car __sensor_pose)))
       _sensor_pose)))
  (:max_view_angle
   (&optional __max_view_angle)
   (if __max_view_angle (setq _max_view_angle __max_view_angle)) _max_view_angle)
  (:max_range_angle
   (&optional __max_range_angle)
   (if __max_range_angle (setq _max_range_angle __max_range_angle)) _max_range_angle)
  (:sensor_view_direction
   (&optional __sensor_view_direction)
   (if __sensor_view_direction (setq _sensor_view_direction __sensor_view_direction)) _sensor_view_direction)
  (:weight
   (&optional __weight)
   (if __weight (setq _weight __weight)) _weight)
  (:serialization-length
   ()
   (+
    ;; float64 _target_radius
    8
    ;; geometry_msgs/PoseStamped _target_pose
    (send _target_pose :serialization-length)
    ;; int32 _cone_sides
    4
    ;; geometry_msgs/PoseStamped _sensor_pose
    (send _sensor_pose :serialization-length)
    ;; float64 _max_view_angle
    8
    ;; float64 _max_range_angle
    8
    ;; uint8 _sensor_view_direction
    1
    ;; float64 _weight
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _target_radius
       (sys::poke _target_radius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/PoseStamped _target_pose
       (send _target_pose :serialize s)
     ;; int32 _cone_sides
       (write-long _cone_sides s)
     ;; geometry_msgs/PoseStamped _sensor_pose
       (send _sensor_pose :serialize s)
     ;; float64 _max_view_angle
       (sys::poke _max_view_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_range_angle
       (sys::poke _max_range_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _sensor_view_direction
       (write-byte _sensor_view_direction s)
     ;; float64 _weight
       (sys::poke _weight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _target_radius
     (setq _target_radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/PoseStamped _target_pose
     (send _target_pose :deserialize buf ptr-) (incf ptr- (send _target_pose :serialization-length))
   ;; int32 _cone_sides
     (setq _cone_sides (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/PoseStamped _sensor_pose
     (send _sensor_pose :deserialize buf ptr-) (incf ptr- (send _sensor_pose :serialization-length))
   ;; float64 _max_view_angle
     (setq _max_view_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_range_angle
     (setq _max_range_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _sensor_view_direction
     (setq _sensor_view_direction (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _weight
     (setq _weight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get moveit_msgs::VisibilityConstraint :md5sum-) "62cda903bfe31ff2e5fcdc3810d577ad")
(setf (get moveit_msgs::VisibilityConstraint :datatype-) "moveit_msgs/VisibilityConstraint")
(setf (get moveit_msgs::VisibilityConstraint :definition-)
      "# The constraint is useful to maintain visibility to a disc (the target) in a particular frame.
# This disc forms the base of a visibiliy cone whose tip is at the origin of the sensor.
# Maintaining visibility is done by ensuring the robot does not obstruct the visibility cone.
# Note:
# This constraint does NOT enforce minimum or maximum distances between the sensor
# and the target, nor does it enforce the target to be in the field of view of
# the sensor. A PositionConstraint can (and probably should) be used for such purposes.

# The radius of the disc that should be maintained visible 
float64 target_radius

# The pose of the disc; as the robot moves, the pose of the disc may change as well
# This can be in the frame of a particular robot link, for example
geometry_msgs/PoseStamped target_pose

# From the sensor origin towards the target, the disc forms a visibility cone
# This cone is approximated using many sides. For example, when using 4 sides, 
# that in fact makes the visibility region be a pyramid.
# This value should always be 3 or more.
int32 cone_sides

# The pose in which visibility is to be maintained.
# The frame id should represent the robot link to which the sensor is attached.
# It is assumed the sensor can look directly at the target, in any direction.
# This assumption is usually not true, but additional PositionConstraints
# can resolve this issue.
geometry_msgs/PoseStamped sensor_pose

# Even though the disc is maintained visible, the visibility cone can be very small
# because of the orientation of the disc with respect to the sensor. It is possible
# for example to view the disk almost from a side, in which case the visibility cone 
# can end up having close to 0 volume. The view angle is defined to be the angle between
# the normal to the visibility disc and the direction vector from the sensor origin.
# The value below represents the minimum desired view angle. For a perfect view,
# this value will be 0 (the two vectors are exact opposites). For a completely obstructed view
# this value will be Pi/2 (the vectors are perpendicular). This value defined below 
# is the maximum view angle to be maintained. This should be a value in the open interval
# (0, Pi/2). If 0 is set, the view angle is NOT enforced.
float64 max_view_angle

# This angle is used similarly to max_view_angle but limits the maximum angle
# between the sensor origin direction vector and the axis that connects the
# sensor origin to the target frame origin. The value is again in the range (0, Pi/2)
# and is NOT enforced if set to 0.
float64 max_range_angle

# The axis that is assumed to indicate the direction of view for the sensor
# X = 2, Y = 1, Z = 0
uint8 SENSOR_Z=0
uint8 SENSOR_Y=1
uint8 SENSOR_X=2
uint8 sensor_view_direction

# A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
float64 weight

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

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

")



(provide :moveit_msgs/VisibilityConstraint "62cda903bfe31ff2e5fcdc3810d577ad")


