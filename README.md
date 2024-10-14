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
<p align="center">
<img width="400" align="center" alt="Screenshot 2024-10-14 at 10 21 22" src="https://github.com/user-attachments/assets/3b02b442-c713-403b-93f0-60d23f3acef0">
</p>

### Drawing a trajectory
To start drawing a trajectory, press "record trajectory" button on the main menu. The application will wait for you to pinch your right hand to start drawing a trajectory. If you select the "follow real-time" toggle in the main menu, the simulated robot will follow your hand as you draw the trajectory, otherwise, it will simulate the entire trajectory after you finish drawing. From the orientation dropdown in the main menu you can select whether you want to fix an orientation, or to also record your orientation of your hand while drawing the trajectory. You can save the trajectory you've drawn with pressing "add to training set".

#### Inspecting the trajectory
Use the backward, forward and play buttons provided in the trajectory capture menu to inspect the trajectory you've drawn. Pressing "redraw from current waypoint" will erase the trajectory after the current waypoint and the application will expect you to draw the rest of the trajectory.

<p align="center">
<img width="400" alt="Screenshot 2024-10-14 at 12 47 07" src="https://github.com/user-attachments/assets/2b1a563b-8b26-4def-a2b2-22c17869582e">
</p>

#### Auto-calibration
Selecting the "auto-transform" toggle will teleport the base of the simulated robot to the left controller with a relative offset. With a tool as shown above, and changing the offset values manually, you can also co-locate the simulated robot with your actual robot.

### Training an ML model

You can train an ML model using your saved trajectories. Pressing "train a new model" button will open the ML training menu. From the dropdown, you can see the currently implemented ML models. You can also implement the ML model you choose and it here. To trigger training, press "start training", the menu will inform you when the training is completed. 

#### Testing the trained model


