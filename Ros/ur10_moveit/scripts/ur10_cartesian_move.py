#this example uses the interface with Moveit installed
from ur10_robot import UR10
import rospy

rospy.init_node("ur10moving")
rospy.sleep(2.0)
robot = UR10()
rospy.sleep(2.0)

print('press enter button to go table pose')
input()

c_position = robot.get_cartesian_position()
print("Initial Position")
print(c_position)

# target_pose1 = [0.1, 0.2, 0.3, 0.0, 0.0, 0.0, 1.0]
# robot.set_cartesian_position(target_pose1)

# target_pose1 = [0.1, 0.2, 0.3, 0.0, 0.0, 0.0, 1.0]
# target_pose2 = [0.2, 0.2, 0.2, 0.0, 0.0, 0.0, 1.0]
# robot.set_multi_cartesian_position([target_pose1,target_pose2])

target_pose1 = [0.1, 0.2, 0.3, 0.0, 0.0, 0.0, 1.0]
target_pose2 = [0.2, 0.2, 0.2, 0.0, 0.0, 0.0, 1.0]
target_pose3 = [0.2, 0.2, 0.05, 0.0, 0.0, 0.0, 1.0]
target_pose4 = [0.2, 0.2, 0.5, 0.0, 0.0, 0.0, 1.0]
target_poses = [target_pose1,target_pose2,target_pose3,target_pose4]
robot.set_multi_cartesian_position(target_poses)

# target_pose1 = [0.08, 0.05, 0.05, 0.0, 0.0, 0.0, 1.0]
# target_pose2 = [0.05, 0.05, 0.8, 0.0, 0.0, 0.0, 1.0]
# target_pose3 = [0.05, 0.8, 0.05, 0.0, 0.0, 0.0, 1.0]
# target_pose4 = [0.05, 0.05, 0.05, 0.0, 0.0, 0.0, 1.0]
# target_poses = [target_pose1,target_pose2]
# robot.set_multi_cartesian_position(target_poses)

rospy.sleep(8.0)

c_position = robot.get_cartesian_position()
print("Final Position")
print(c_position)

# robot.table_pose()
# rospy.sleep(2.0)

# print("going to zero pose")
# robot.zero_pose()
