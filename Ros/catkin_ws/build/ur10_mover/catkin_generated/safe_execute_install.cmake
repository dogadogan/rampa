execute_process(COMMAND "/home/user/ARobot/Ros/catkin_ws/build/ur10_mover/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/user/ARobot/Ros/catkin_ws/build/ur10_mover/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
