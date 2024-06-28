;; Auto-generated. Do not edit!


(when (boundp 'moveit_msgs::PlanningSceneComponents)
  (if (not (find-package "MOVEIT_MSGS"))
    (make-package "MOVEIT_MSGS"))
  (shadow 'PlanningSceneComponents (find-package "MOVEIT_MSGS")))
(unless (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS")
  (make-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))

(in-package "ROS")
;;//! \htmlinclude PlanningSceneComponents.msg.html


(intern "*SCENE_SETTINGS*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*SCENE_SETTINGS* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*SCENE_SETTINGS* 1)
(intern "*ROBOT_STATE*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*ROBOT_STATE* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*ROBOT_STATE* 2)
(intern "*ROBOT_STATE_ATTACHED_OBJECTS*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*ROBOT_STATE_ATTACHED_OBJECTS* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*ROBOT_STATE_ATTACHED_OBJECTS* 4)
(intern "*WORLD_OBJECT_NAMES*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*WORLD_OBJECT_NAMES* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*WORLD_OBJECT_NAMES* 8)
(intern "*WORLD_OBJECT_GEOMETRY*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*WORLD_OBJECT_GEOMETRY* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*WORLD_OBJECT_GEOMETRY* 16)
(intern "*OCTOMAP*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*OCTOMAP* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*OCTOMAP* 32)
(intern "*TRANSFORMS*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*TRANSFORMS* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*TRANSFORMS* 64)
(intern "*ALLOWED_COLLISION_MATRIX*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*ALLOWED_COLLISION_MATRIX* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*ALLOWED_COLLISION_MATRIX* 128)
(intern "*LINK_PADDING_AND_SCALING*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*LINK_PADDING_AND_SCALING* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*LINK_PADDING_AND_SCALING* 256)
(intern "*OBJECT_COLORS*" (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(shadow '*OBJECT_COLORS* (find-package "MOVEIT_MSGS::PLANNINGSCENECOMPONENTS"))
(defconstant moveit_msgs::PlanningSceneComponents::*OBJECT_COLORS* 512)

(defun moveit_msgs::PlanningSceneComponents-to-symbol (const)
  (cond
        ((= const 1) 'moveit_msgs::PlanningSceneComponents::*SCENE_SETTINGS*)
        ((= const 2) 'moveit_msgs::PlanningSceneComponents::*ROBOT_STATE*)
        ((= const 4) 'moveit_msgs::PlanningSceneComponents::*ROBOT_STATE_ATTACHED_OBJECTS*)
        ((= const 8) 'moveit_msgs::PlanningSceneComponents::*WORLD_OBJECT_NAMES*)
        ((= const 16) 'moveit_msgs::PlanningSceneComponents::*WORLD_OBJECT_GEOMETRY*)
        ((= const 32) 'moveit_msgs::PlanningSceneComponents::*OCTOMAP*)
        ((= const 64) 'moveit_msgs::PlanningSceneComponents::*TRANSFORMS*)
        ((= const 128) 'moveit_msgs::PlanningSceneComponents::*ALLOWED_COLLISION_MATRIX*)
        ((= const 256) 'moveit_msgs::PlanningSceneComponents::*LINK_PADDING_AND_SCALING*)
        ((= const 512) 'moveit_msgs::PlanningSceneComponents::*OBJECT_COLORS*)
        (t nil)))

(defclass moveit_msgs::PlanningSceneComponents
  :super ros::object
  :slots (_components ))

(defmethod moveit_msgs::PlanningSceneComponents
  (:init
   (&key
    ((:components __components) 0)
    )
   (send-super :init)
   (setq _components (round __components))
   self)
  (:components
   (&optional __components)
   (if __components (setq _components __components)) _components)
  (:serialization-length
   ()
   (+
    ;; uint32 _components
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _components
       (write-long _components s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _components
     (setq _components (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get moveit_msgs::PlanningSceneComponents :md5sum-) "bc993e784476960b918b6e7ad5bb58ce")
(setf (get moveit_msgs::PlanningSceneComponents :datatype-) "moveit_msgs/PlanningSceneComponents")
(setf (get moveit_msgs::PlanningSceneComponents :definition-)
      "# This message defines the components that make up the PlanningScene message.
# The values can be used as a bitfield to specify which parts of the PlanningScene message
# are of interest

# Scene name, model name, model root
uint32 SCENE_SETTINGS=1

# Joint values of the robot state
uint32 ROBOT_STATE=2

# Attached objects (including geometry) for the robot state
uint32 ROBOT_STATE_ATTACHED_OBJECTS=4

# The names of the world objects
uint32 WORLD_OBJECT_NAMES=8

# The geometry of the world objects
uint32 WORLD_OBJECT_GEOMETRY=16

# The maintained octomap 
uint32 OCTOMAP=32

# The maintained list of transforms
uint32 TRANSFORMS=64

# The allowed collision matrix
uint32 ALLOWED_COLLISION_MATRIX=128

# The default link padding and link scaling
uint32 LINK_PADDING_AND_SCALING=256

# The stored object colors
uint32 OBJECT_COLORS=512

# Bitfield combining options indicated above
uint32 components

")



(provide :moveit_msgs/PlanningSceneComponents "bc993e784476960b918b6e7ad5bb58ce")


