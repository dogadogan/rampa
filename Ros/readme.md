# UR10 controller with (x,y,z) coordinate 

## Overview

This package is for moving UR10 with giving (x,y,z) for destination point.
And there is no launch files, only contain node files. The source code written by Python 2.7.  

It is working on Gazebo simulation and real robot.  
Script is from [ur3-moveit-test](https://github.com/MrLacquer/ur3-moveit-test) project.

## Installation
- Before do this, please backup important files.

### Dependencies

This software is built on the Robotic Operating System ([ROS](http://wiki.ros.org/ROS/Installation)).

- Follow [this tutorial](http://wiki.ros.org/noetic/Installation/Ubuntu) for installation of ros and catkin.

- Follow [this tutorial](https://ros-planning.github.io/moveit_tutorials/doc/getting_started/getting_started.html) for installation of moveit. However DO NOT REMOVE moveit_tutorials folder with the given ```wstool remove moveit_tutorials``` as we will be using the default one.

- Clone [this repository](https://github.com/ros-industrial/universal_robot) and follow the instructions given.


## How to start?

```
- Bring up Gazebo and the URx manipulator:
$ roslaunch ur_gazebo ur10.launch
$ roslaunch ur10_moveit_config ur10_moveit_planning_execution.launch sim:=true
$ roslaunch ur10_moveit_config moveit_rviz.launch config:=true

- Bring up Real URx manipulator:
$ roslaunch ur_modern_driver ur3_bringup.launch robot_ip:=IP_OF_THE_ROBOT 
$ roslaunch ur3_moveit_config ur3_moveit_planning_execution.launch

- Registration
$ cd ~/catkin_ws/src/ur3-moveit-test/ur3_moveit/script
$ chmod +x ur3_move.py
$ chmod +x ur3_demo.py 

- Controlling the URx manipulator:
$ rosrun ur10_moveit ur10_move.py 
```




