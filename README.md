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
   - Open Unity > Quest3XRSApp from the repo in a new project in Unity Hub.
   - Make sure you have the necessary Unity packages downloaded.
   - From Robotics > ROS Settings, change ROS IP Address to the IP of the ROS Master you are going to use
   - Build the project into your Meta Quest 3 headset.
3. Set up the ROS client
   - Build the catkin workspace provided in Ros > catkin_ws in the repo.
4. Run the application
   -  Run the UR10 driver
   -   Run the MoveIt Planner: roslaunch ur10_moveit_config moveit_planning_execution.launch
   -   Run the following command: roslaunch ur10_mover server.launch tcp_ip:=TCP_IP_HERE tcp_port:=10000
   -   Using your headset, open the Unity application you built. ur10_mover server will inform you when a connection is established. The application is ready to use.


## How to use RAMPA
<img width="736" alt="Screenshot 2024-10-14 at 10 21 22" src="https://github.com/user-attachments/assets/3b02b442-c713-403b-93f0-60d23f3acef0">

### Drawing a trajectory
To start drawing a trajectory, press "record trajectory" button on the main menu. The application will wait for you to pinch your right hand to start drawing a trajectory. If you select the "follow real-time" toggle in the main menu, 

### Training an ML model
