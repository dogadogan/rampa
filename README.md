# RAMPA: Robotic Augmented Reality for Machine Programming by Demonstration

This repository includes the source code for the paper "RAMPA: **R**obotic **A**ugmented Reality for **M**achine **P**rogramming by Demonstr**A**tion" by Fatih Dogangun, Serdar Bahar, Yigit Yildirim, Bora Toprak Temir, Emre Ugur, Mustafa Doga Dogan, members of the [CoLoRs Lab, Bogazici University](https://colors.cmpe.boun.edu.tr).

<p align="center">
<img width="400" alt="Introduction" src="https://github.com/user-attachments/assets/1828158f-2924-4065-ac3e-a80a64c5cc32">
</p>

RAMPA is an *end-to-end* AR-based PfD framework to enable the demonstration of robotic trajectories, training, and testing ML model augmented by real-time hand mimicry, visualization of the robot's motion, and trajectory adjustment in situ. By integrating in-situ simulation, real-time spatial understanding, and direct manipulation capabilities, RAMPA enhances the physical safety, flexibility of robotic operations, and efficiency of Programming from Demonstration (PfD) procedures, hence, the effectiveness and accessibility of human-robot collaboration. To assess the competence and performance of the RAMPA and compare it with kinesthetic control, manually moving the robot for demonstration, we conducted a comprehensive evaluation consisting of an experiment with three robotic tasks, 20 participants including both experienced and novice users, an extensive analysis using quantitative metrics such as task completion time and standard surveys concerning the usability, user experience, and task load. This work has been submitted to the *IEEE RA-L* for possible publication on **October 12, 2024**
   
The preprint: https://arxiv.org/abs/2410.13412

The video of the work: https://youtu.be/TEluXV2OGDo

## Comparison of RAMPA with other AR-based robotic programming frameworks

A comprehensive comparison with existing AR-based systems is provided in the table below, evaluating several key features among recent works in AR-based robotic programming.

| **Feature / Method**                             | **Quintero et al. [1]** | **Luebbers et al. [2]** | **Lotsaris et al. [3]** | **Chen et al. (Mr. LfD) [4]** | **Chen et al. (ARCap) [5]** | **RAMPA** |
|--------------------------------------------------|:-----------------------------------------------:|:---------------------------------------------:|:-------------------------:|:------------------------------:|:------------------------------:|:---------------------:|
| **End-to-End: Demonstration, Training and Deploy in AR** | No (AR trajectory definition only) | No (recording/training outside AR) | No  (training/deploy outside AR) | No (training/deploy outside AR) |No (training/deploy outside AR) | **Yes** |
| **Integrated ML System in AR: Training + Deployment**    | No (trajectory-based programming) | **Yes** (Supports offline training, limited with constraints-based LfD) | No (trajectory-based programming)  | No (Not integrated, but supports offline batch training of ML models after data collection) | No (Not integrated, but supports offline batch training of ML models after data collection) | **Yes** (Supports on-the-fly offline batch training within AR for LfD models)  |
| **Full Trajectory Modification: Rewinding, Redrawing Pre- and Post-Demonstration** | No (Allows users to revise and adjust trajectories in AR before deployment)  | No (Users can refine constraints to adjust learned skills within AR) | No (Allows users to revise and adjust trajectories in AR before deployment)| No (Focuses on demonstration capture)| No (Focuses on demonstration capture) | **Yes** (Supports rewinding, partial redrawing within AR, pre- and post-demonstration) |
| **Online Hand Mimicking by Simulated/Actual Robot**               | No                                              | No                                            | No                        | **Yes** (Online hand mimicking by real robot)                       | **Yes**  (Online hand mimicking by virtual robot)                      | **Yes** (Online hand mimicking by virtual robot)              |
| **Trajectory Visualization with Simulated Robot**                     | **Yes**   (Displays AR overlays with full kinematic simulation of the trajectory)                                      | Partial  (Displays AR overlays for constraints without full simulation)                                     | Partial (Uses a virtual gripper for demonstration)                  | No                             | **Yes** (Displays AR overlays without full kinematic simulation of the trajectory)                       | **Yes**  (Displays AR overlays with full kinematic simulation of the trajectory)             |
| **Is Headset and Robot Platform Sufficient?**                     | No (MYO Armband needed)                                         | **Yes**                                       | **Yes**                   | **Yes**                             |       Partial (possible to use with lacking features)  | **Yes**               |
| **Trajectory Drawing Method**                    | Point-based                                     | None                                          | Point-based               | Hand gestures                  | Hand gestures                  | Hand gestures         |

[1] C. P. Quintero, S. Li, M. K. Pan, W. P. Chan, H. M. Van der Loos, and E. Croft, “Robot programming through augmented trajectories in augmented reality,” in IROS. IEEE, 2018, pp. 1838–1844.

[2] M. B. Luebbers, C. Brooks, C. L. Mueller, D. Szafir, and B. Hayes, “Arc-lfd: Using augmented reality for interactive long-term robot skill maintenance via constrained learning from demonstration,” in ICRA, 2021, pp. 3794–3800.

[3] K. Lotsaris, C. Gkournelos, N. Fousekis, N. Kousi, and S. Makris, “Ar based robot programming using teaching by demonstration techniques,” Procedia CIRP, vol. 97, pp. 459–463, 01 2021.

[4] J. Chen, D. Salas, M. Bilal, Q. Zhou, and W. Johal, “Mr. lfd: A mixed reality interface for robot learning from demonstration,” 2024.

[5] S. Chen, C. Wang, K. Nguyen, L. Fei-Fei, and C. K. Liu, “Arcap: Collecting high-quality human demonstrations for robot learning with augmented reality feedback,” 2024.

## How to use RAMPA

### Drawing a trajectory
To start drawing a trajectory, click the "record trajectory" button on the main menu. The application will wait for you to pinch your right hand to draw a trajectory. If you select the "follow real-time" toggle in the main menu, the simulated robot will follow your hand as you draw the trajectory. Otherwise, it will simulate the entire trajectory after you finish drawing. From the orientation dropdown in the main menu, you can select whether you want to fix an orientation or record the orientation of your hand while drawing the trajectory. You can save the trajectory you've drawn by clicking the "add to training set".

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

#### Execution on the actual robot
You can execute the simulated trajectory on the actual robot by clicking "execute on real robot". At the moment the button is clicked, the joint trajectory will be published to the relevant rostopic, making the actual robot move. You can also execute the current trajectory after redrawing the trajectory. Please be mindful that clicking the button will cause the robot to move immediately.

### Training an ML model

You can train an ML model using your saved trajectories. Clicking the "train a new model" button will open the ML training menu. From the dropdown, you can see the currently implemented ML models. You can also implement the ML model you choose and add it here. To trigger training, click the "start training". The menu will inform you when the training is completed. 

<p align="center">
<img width="700" alt="Screenshot 2024-10-14 at 16 42 05" src="https://github.com/user-attachments/assets/9e1444a7-f072-40fb-83c1-8bceb5f8597c">
</p>
  
#### Testing the trained model

To condition the trained model and generate a new trajectory, enter the "Test Model" menu by clicking the "test trained model" button. Before generating a new trajectory, the start and end points of the desired trajectory should be specified. This is done by placing the virtual cubes at the desired positions with the correct orientations. The blue cube corresponds to the start point, and the green cube the end point. Way-points can be added using the "+/-" buttons in the "Test Model" menu. For each way-point added, the time stamp of all the waypoints is recalculated by evenly dividing the interval with the number of way-points. Also, to exactly specify an orientation regarding orientation indicators in the saved trajectories, (1) the arrow going out of the cube should be in the same direction as the indicator, (2) the side of the virtual cube that has a letter should be in the same direction as of the red side of the indicator. However, these are purely choices of implementations and can be changed easily from the corresponding scripts. After simulation, you can execute the returned trajectory on the actual robot by clicking "execute trajectory on the real robot".

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
