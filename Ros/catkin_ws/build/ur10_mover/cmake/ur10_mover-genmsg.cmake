# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ur10_mover: 2 messages, 9 services")

set(MSG_I_FLAGS "-Iur10_mover:/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Imoveit_msgs:/home/user/ARobot/Ros/catkin_ws/devel/share/moveit_msgs/msg;-Imoveit_msgs:/home/user/ARobot/Ros/catkin_ws/src/moveit_msgs/msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/noetic/share/trajectory_msgs/cmake/../msg;-Ishape_msgs:/opt/ros/noetic/share/shape_msgs/cmake/../msg;-Iobject_recognition_msgs:/opt/ros/noetic/share/object_recognition_msgs/cmake/../msg;-Ioctomap_msgs:/opt/ros/noetic/share/octomap_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ur10_mover_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg" ""
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg" "geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv" ""
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv" "ur10_mover/ListOfFloats"
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv" "geometry_msgs/Pose:ur10_mover/ListOfPoses:geometry_msgs/Point:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv" ""
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv" "trajectory_msgs/JointTrajectory:geometry_msgs/Quaternion:trajectory_msgs/MultiDOFJointTrajectoryPoint:geometry_msgs/Transform:geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Pose:trajectory_msgs/JointTrajectoryPoint:moveit_msgs/RobotTrajectory:trajectory_msgs/MultiDOFJointTrajectory:geometry_msgs/Point:geometry_msgs/Twist"
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv" "geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv" ""
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv" "geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/Quaternion"
)

get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv" NAME_WE)
add_custom_target(_ur10_mover_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ur10_mover" "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_msg_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)

### Generating Services
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv"
  "${MSG_I_FLAGS}"
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/user/ARobot/Ros/catkin_ws/src/moveit_msgs/msg/RobotTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)
_generate_srv_cpp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
)

### Generating Module File
_generate_module_cpp(ur10_mover
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ur10_mover_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ur10_mover_generate_messages ur10_mover_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_cpp _ur10_mover_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur10_mover_gencpp)
add_dependencies(ur10_mover_gencpp ur10_mover_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur10_mover_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_msg_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)

### Generating Services
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv"
  "${MSG_I_FLAGS}"
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/user/ARobot/Ros/catkin_ws/src/moveit_msgs/msg/RobotTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)
_generate_srv_eus(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
)

### Generating Module File
_generate_module_eus(ur10_mover
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ur10_mover_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ur10_mover_generate_messages ur10_mover_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_eus _ur10_mover_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur10_mover_geneus)
add_dependencies(ur10_mover_geneus ur10_mover_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur10_mover_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_msg_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)

### Generating Services
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv"
  "${MSG_I_FLAGS}"
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/user/ARobot/Ros/catkin_ws/src/moveit_msgs/msg/RobotTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)
_generate_srv_lisp(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
)

### Generating Module File
_generate_module_lisp(ur10_mover
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ur10_mover_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ur10_mover_generate_messages ur10_mover_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_lisp _ur10_mover_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur10_mover_genlisp)
add_dependencies(ur10_mover_genlisp ur10_mover_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur10_mover_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_msg_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)

### Generating Services
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv"
  "${MSG_I_FLAGS}"
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/user/ARobot/Ros/catkin_ws/src/moveit_msgs/msg/RobotTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)
_generate_srv_nodejs(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
)

### Generating Module File
_generate_module_nodejs(ur10_mover
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ur10_mover_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ur10_mover_generate_messages ur10_mover_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_nodejs _ur10_mover_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur10_mover_gennodejs)
add_dependencies(ur10_mover_gennodejs ur10_mover_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur10_mover_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_msg_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)

### Generating Services
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv"
  "${MSG_I_FLAGS}"
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectoryPoint.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/home/user/ARobot/Ros/catkin_ws/src/moveit_msgs/msg/RobotTrajectory.msg;/opt/ros/noetic/share/trajectory_msgs/cmake/../msg/MultiDOFJointTrajectory.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)
_generate_srv_py(ur10_mover
  "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
)

### Generating Module File
_generate_module_py(ur10_mover
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ur10_mover_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ur10_mover_generate_messages ur10_mover_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfFloats.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/msg/ListOfPoses.msg" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/DiscardService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/ExecutionService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GetTrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/GripperService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/PlannerService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/SampleService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/StateService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingDataService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/user/ARobot/Ros/catkin_ws/src/ur10_mover/srv/TrainingService.srv" NAME_WE)
add_dependencies(ur10_mover_generate_messages_py _ur10_mover_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ur10_mover_genpy)
add_dependencies(ur10_mover_genpy ur10_mover_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ur10_mover_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ur10_mover
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(ur10_mover_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ur10_mover_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET moveit_msgs_generate_messages_cpp)
  add_dependencies(ur10_mover_generate_messages_cpp moveit_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(ur10_mover_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ur10_mover
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(ur10_mover_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ur10_mover_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET moveit_msgs_generate_messages_eus)
  add_dependencies(ur10_mover_generate_messages_eus moveit_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(ur10_mover_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ur10_mover
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(ur10_mover_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ur10_mover_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET moveit_msgs_generate_messages_lisp)
  add_dependencies(ur10_mover_generate_messages_lisp moveit_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(ur10_mover_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ur10_mover
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(ur10_mover_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ur10_mover_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET moveit_msgs_generate_messages_nodejs)
  add_dependencies(ur10_mover_generate_messages_nodejs moveit_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(ur10_mover_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ur10_mover
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(ur10_mover_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ur10_mover_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET moveit_msgs_generate_messages_py)
  add_dependencies(ur10_mover_generate_messages_py moveit_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(ur10_mover_generate_messages_py sensor_msgs_generate_messages_py)
endif()
