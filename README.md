# RAMPA Robotic Augmented Reality for Machine Programming and Automation

This repository includes the source code for the paper "RAMPA: **R**obotic **A**ugmented Reality for **M**achine **P**rogramming and **A**utomation" by Fatih Dogangun, Serdar Bahar, Yigit Yildirim, Bora Toprak Temir, Emre Ugur, Mustafa Doga Dogan, members of the [CoLoRs Lab, Bogazici University](https://colors.cmpe.boun.edu.tr).

<p align="center">
<img width="400" alt="Introduction" src="https://github.com/user-attachments/assets/1828158f-2924-4065-ac3e-a80a64c5cc32">
</p>

<!--RAMPA is an *end-to-end* AR-based PfD framework to enable the demonstration of robotic trajectories, training, and testing ML model augmented by real-time hand mimicry, visualization of the robot's motion, and trajectory adjustment in situ. By integrating in-situ simulation, real-time spatial understanding, and direct manipulation capabilities, RAMPA enhances the physical safety, flexibility of robotic operations, and efficiency of Programming from Demonstration (PfD) procedures, hence, the effectiveness of human-robot collaboration. 

Our comprehensive evaluation includes the experiment consisting of three robotic tasks and extensive analysis using quantitative metrics, incorporating standard surveys.  



This work has been submitted to the *IEEE RA-L* for possible publication on **October 12, 2024-->

<!--  The video of the work : 
      The preprint :-->
## How to use RAMPA

### Drawing a trajectory
To start drawing a trajectory, click the "record trajectory" button on the main menu. The application will wait for you to pinch your right hand to draw a trajectory. If you select the "follow real-time" toggle in the main menu, the simulated robot will follow your hand as you draw the trajectory. Otherwise, it will simulate the entire trajectory after you finish drawing. From the orientation dropdown in the main menu, you can select whether you want to fix an orientation or record the orientation of your hand while drawing the trajectory. You can save the trajectory you've drawn by clicking "add to training set".

<p align="center">
<img width="400" alt="Screenshot 2024-10-14 at 16 43 10" src="https://github.com/user-attachments/assets/a184748a-105a-4110-836e-780c0ad89bd1">
</p>

#### Inspecting the trajectory
Use the backward, forward, and play buttons provided in the trajectory capture menu to inspect the trajectory you've drawn. Clicking "redraw from current waypoint" will erase the trajectory after the current waypoint, and the application will expect you to draw the rest of the trajectory.

<p align="center">
<img width="400" alt="Screenshot 2024-10-14 at 12 47 07" src="https://github.com/user-attachments/assets/2b1a563b-8b26-4def-a2b2-22c17869582e">
</p>

#### Auto-calibration
Selecting the "auto-transform" toggle will teleport the base of the simulated robot to the left controller with a relative offset. With a tool as shown above and changing the offset values manually, you can also co-locate the simulated robot with your actual robot.

### Training an ML model

You can train an ML model using your saved trajectories. Clicking the "train a new model" button will open the ML training menu. From the dropdown, you can see the currently implemented ML models. You can also implement the ML model you choose and add it here. To trigger training, click the "start training". The menu will inform you when the training is completed. 

<p align="center">
<img width="700" alt="Screenshot 2024-10-14 at 16 42 05" src="https://github.com/user-attachments/assets/9e1444a7-f072-40fb-83c1-8bceb5f8597c">
</p>
  
#### Testing the trained model

To condition the trained model and generate a new trajectory, enter the "Test Model" menu by clicking the "test trained model" button. Before generating a new trajectory, the start and end points of the desired trajectory should be specified. This is done by placing the virtual cubes at the desired positions with the correct orientations. The blue cube corresponds to the start point, and the green cube the end point. Way-points can be added using the "+/-" buttons in the "Test Model" menu. For each way-point added, the time stamp of all the waypoints is recalculated by evenly dividing the interval with the number of way-points. Also, to exactly specify an orientation regarding orientation indicators in the saved trajectories, (1) the arrow going out of the cube should be in the same direction as the indicator, (2) the side of the virtual cube that has a letter should be in the same direction as of the red side of the indicator. However, these are purely choices of implementations and can be changed easily from the corresponding scripts.

## Getting Started
### Requirements
The entire project is developed with
1. Python 3.8
2. Unity 2022.3.22f1
3. Hardware for AR: Meta Quest 3
4. Robotic Hardware: Universal Robots UR10

### Running
1. Clone the repo
2. Set up the Unity client
   - Open Unity > Quest3XRSApp from the repo in a new project in Unity Hub.
   - Make sure you have downloaded the necessary Unity packages.
   - From Robotics > ROS Settings, change the ROS IP Address to the IP of the ROS Master you are going to use
   - Build the project into your Meta Quest 3 headset.
3. Set up the ROS client
   - Build the catkin workspace provided in Ros > catkin_ws in the repo.
4. Run the application
   -  Run the UR10 driver
   -   Run the MoveIt Planner: roslaunch ur10_moveit_config moveit_planning_execution.launch
   -   Run the following command: roslaunch ur10_mover server.launch tcp_ip:=TCP_IP_HERE tcp_port:=10000
   -   Using your headset, open the Unity application you built. ur10_mover server will inform you when a connection is established. The application is now ready to use.
