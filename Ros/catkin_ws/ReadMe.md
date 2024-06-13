# Source catkin workspace
source catkin_ws/devel/setup.bash

# Acticate python environment
conda activate ur10_py3.9

# Calibrate ur10 driver
roslaunch ur_calibration calibration_correction.launch target_filename:=ur10colors_calibration.yaml robot_ip:=192.168.0.111

# Start UR10 driver
roslaunch ur_robot_driver ur10_bringup.launch robot_ip:=192.168.0.111 kinematics_config:=ur10colors_calibration.yaml

# Start moveit Planner
roslaunch ur10_moveit_config moveit_planning_execution.launch

# Build catkin workspace using base python environment
catkin_make -DPYTHON_EXECUTABLE=/usr/bin/python3

# Start ur10_mover server
roslaunch ur10_mover server.launch tcp_ip:=192.168.0.134 tcp_port:=10000

# Start gripper
roslaunch robotiq_3f_driver listener.launch ip_address:=192.168.0.11


# Important notes

- Every workspace except ur10_mover server has to be called with ur10_py3 environment and sourced from base catkin_ws.
- To start ur10_mover server, you need to source batuhan/catkin_ws.
- To build ur10_mover server, use catkin_make with the -DPYTHON_EXECUTABLE=/usr/bin/python3 to python files that are downloaded to base files.
- Ips are given in these commands but if any Ip changes in the network, these commands must also update.
- To successfully run ur10_mover server, you must also start ur10 driver, moveit planner and gripper. All these programs must be using python ur10_py3.9 env and sourced from base catkin_ws
- Github version of the project is for simulated robot. You can use real robot modified program on the computer connected to real robot.