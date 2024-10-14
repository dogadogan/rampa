# RAMPA
Robotic Augmented Reality for Machine Programming and Automation

## Getting Started
### Requirements
The entire project is developed with
1. Python 3.8
2. Unity 2022.3.22f1

### Running
1. Clone the repo
2. Set up the Unity client
   a. Open Unity > Quest3XRSApp from the repo in a new project in Unity Hub.
   b. Make sure you have the necessary Unity packages downloaded.
   c. From Robotics > ROS Settings, change ROS IP Address to the IP of the ROS Master you are going to use
   d. Build the project into your Meta Quest 3 headset.
3. Set up the ROS client
   a. Build the catkin workspace provided in Ros > catkin_ws in the repo.
4. Run the application
   a. Run the UR10 driver
   b. Run the MoveIt Planner: roslaunch ur10_moveit_config moveit_planning_execution.launch
   c. Run the following command: roslaunch ur10_mover server.launch tcp_ip:=TCP_IP_HERE tcp_port:=10000
   d. Using your headset, open the Unity application you built. ur10_mover server will inform you when a connection is established. The application is ready to use.


