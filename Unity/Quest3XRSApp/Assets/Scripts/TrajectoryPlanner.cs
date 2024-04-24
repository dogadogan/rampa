using System.Collections;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.Ros;
using Unity.Robotics.ROSTCPConnector;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using UnityEngine;
using UnityEngine.UI;

public class TrajectoryPlanner : MonoBehaviour
{
    // Hardcoded variables
    const int k_NumRobotJoints = 6;
    const float k_JointAssignmentWait = 0.1f;
    const float k_PoseAssignmentWait = 0.5f;

    // Variables required for ROS communication
    [SerializeField]
    string m_RosServiceName = "niryo_moveit";
    public string RosServiceName { get => m_RosServiceName; set => m_RosServiceName = value; }
    

    public GameObject baseLink;

    //public GameObject NiryoOne { get => m_UR10; set => m_UR10 = value; }
    [SerializeField]
    GameObject m_Target;
    public GameObject Target { get => m_Target; set => m_Target = value; }
    [SerializeField]
    GameObject m_TargetPlacement;
    public GameObject TargetPlacement { get => m_TargetPlacement; set => m_TargetPlacement = value; }

    // Assures that the gripper is always positioned above the m_Target cube before grasping.
    readonly Quaternion m_PickOrientation = Quaternion.Euler(90, 90, 0);
    readonly Vector3 m_PickPoseOffset = Vector3.up * 0.1f;

    // Articulation Bodies
    public ArticulationBody[] m_JointArticulationBodies;
    // ArticulationBody m_LeftGripper;
    // ArticulationBody m_RightGripper;

    // ROS Connector
    ROSConnection m_Ros;
    public Slider[] Sliders;
    public GameObject[] objectsToBeRemoveColliders;
    public Text text;
    public LineRenderer line;
    public DrawService drawService;
    public Transform handTransform;

    /// <summary>
    ///     Find all robot joints in Awake() and add them to the jointArticulationBodies array.
    ///     Find left and right finger joints and assign them to their respective articulation body objects.
    /// </summary>
    void Start()
    {
        // Get ROS connection static instance
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<MoverServiceRequest, MoverServiceResponse>(m_RosServiceName);

        //m_JointArticulationBodies = new ArticulationBody[k_NumRobotJoints];

        /*var linkName = string.Empty;
        for (var i = 0; i < k_NumRobotJoints; i++)
        {
            linkName += SourceDestinationPublisher.LinkNames[i];
            m_JointArticulationBodies[i] = m_UR10.transform.Find(linkName).GetComponent<ArticulationBody>();
            Debug.Log( m_UR10.transform.Find(linkName));
           
        }*/
        

        // Find left and right fingers
        // var rightGripper = linkName + "/tool_link/gripper_base/servo_head/control_rod_right/right_gripper";
        // var leftGripper = linkName + "/tool_link/gripper_base/servo_head/control_rod_left/left_gripper";

        // m_RightGripper = m_NiryoOne.transform.Find(rightGripper).GetComponent<ArticulationBody>();
        // m_LeftGripper = m_NiryoOne.transform.Find(leftGripper).GetComponent<ArticulationBody>();
    }

    /// <summary>
    ///     Close the gripper
    /// </summary>
    // void CloseGripper()
    // {
    //     var leftDrive = m_LeftGripper.xDrive;
    //     var rightDrive = m_RightGripper.xDrive;
    //
    //     leftDrive.target = -0.01f;
    //     rightDrive.target = 0.01f;
    //
    //     m_LeftGripper.xDrive = leftDrive;
    //     m_RightGripper.xDrive = rightDrive;
    // }

    /// <summary>
    ///     Open the gripper
    /// </summary>
    // void OpenGripper()
    // {
    //     var leftDrive = m_LeftGripper.xDrive;
    //     var rightDrive = m_RightGripper.xDrive;
    //
    //     leftDrive.target = 0.01f;
    //     rightDrive.target = -0.01f;
    //
    //     m_LeftGripper.xDrive = leftDrive;
    //     m_RightGripper.xDrive = rightDrive;
    // }

    /// <summary>
    ///     Get the current values of the robot's joint angles.
    /// </summary>
    /// <returns>NiryoMoveitJoints</returns>
    double[] CurrentJointConfig()
    {
        double[] joints = new double[k_NumRobotJoints] ;

        for (var i = 0; i < k_NumRobotJoints; i++)
        {
            joints[i] = m_JointArticulationBodies[i].xDrive.target * Mathf.Deg2Rad;
            //Debug.LogWarning(i);
            //Debug.LogWarning(m_JointArticulationBodies[i].name);
        }

        return joints;
    }

    /// <summary>
    ///     Create a new MoverServiceRequest with the current values of the robot's joint angles,
    ///     the target cube's current position and rotation, and the targetPlacement position and rotation.
    ///     Call the MoverService using the ROSConnection and if a trajectory is successfully planned,
    ///     execute the trajectories in a coroutine.
    /// </summary>
    public void PublishJoints()
    {

        line.positionCount = 0;

       // Debug.LogWarning("in publish joints");
        var request = new MoverServiceRequest();
        request.joints_input = CurrentJointConfig();

        // Pick Pose

        PoseMsg[] pose_list = new PoseMsg[1];
        pose_list[0] = new PoseMsg
        {
            position = (m_Target.transform.position - baseLink.transform.position).To<FLU>(),

            // The hardcoded x/z angles assure that the gripper is always positioned above the target cube before grasping.
            orientation = Quaternion.Euler(90, m_Target.transform.eulerAngles.y, 0).To<FLU>()
        };
        request.pose_list = pose_list;
        
        text.text = "Waiting for the response...";
        m_Ros.SendServiceMessage<MoverServiceResponse>(m_RosServiceName, request, TrajectoryResponse);
    }


    public void PublishJointsWithPoses(Vector3[] poses)
    {
        Debug.LogWarning("--------inside PublishJointsWithPoses --------");
        Debug.LogWarning(poses);
        var request = new MoverServiceRequest();
        request.joints_input = CurrentJointConfig();

        PoseMsg[] pose_list = new PoseMsg[poses.Length];
        for (int i = 0; i < poses.Length; i++)
        {
            pose_list[i] = new PoseMsg
            {
                position = (poses[i] - baseLink.transform.position).To<FLU>(),

                // The hardcoded x/z angles assure that the gripper is always positioned above the target cube before grasping.
                orientation = Quaternion.Euler(90, m_Target.transform.eulerAngles.y, 0).To<FLU>()
            };
        }
        
        request.pose_list = pose_list;
        
        text.text = "Waiting for the response...";
        m_Ros.SendServiceMessage<MoverServiceResponse>(m_RosServiceName, request, TrajectoryResponse);
    } 
    
    

    void TrajectoryResponse(MoverServiceResponse response)
    {
        text.text = "Trajectory calculated";
        
        foreach (var removeObject in objectsToBeRemoveColliders)
        {
            Debug.Log(removeObject.GetComponent<BoxCollider>().name);
            removeObject.GetComponent<BoxCollider>().enabled = false;
        }
        
        if (response.trajectories.Length > 0)
        {
            //Debug.Log("Trajectory returned.");
            StartCoroutine(ExecuteTrajectories(response));
        }
        else
        {
            Debug.LogError("No trajectory returned from MoverService.");
            text.text = "No trajectory returned";
            foreach (var removeObject in objectsToBeRemoveColliders)
            {
                removeObject.GetComponent<Collider>().enabled = true;
            }

            text.text = response.output_msg ;
            
            line.positionCount = 0;
        }
        drawService.state = DrawService.State.DrawTrajectory;
    }

    /// <summary>
    ///     Execute the returned trajectories from the MoverService.
    ///     The expectation is that the MoverService will return four trajectory plans,
    ///     PreGrasp, Grasp, PickUp, and Place,
    ///     where each plan is an array of robot poses. A robot pose is the joint angle values
    ///     of the six robot joints.
    ///     Executing a single trajectory will iterate through every robot pose in the array while updating the
    ///     joint values on the robot.
    /// </summary>
    /// <param name="response"> MoverServiceResponse received from niryo_moveit mover service running in ROS</param>
    /// <returns></returns>
    IEnumerator ExecuteTrajectories(MoverServiceResponse response)
    {
        if (response.trajectories != null)
        {
            // For every trajectory plan returned
            for (var poseIndex = 0; poseIndex < response.trajectories.Length; poseIndex++)
                
            { 
                // For every robot pose in trajectory plan
                foreach (var t in response.trajectories[poseIndex].joint_trajectory.points)
                {
                    var jointPositions = t.positions;
                    var result = jointPositions.Select(r => (float)r * Mathf.Rad2Deg).ToArray();
                    //Debug.LogWarning("------------");
                    //Debug.LogWarning(string.Join(", ", result)  + " joint angles in degrees");

                    // Set the joint values for every joint
                    for (var joint = 0; joint < m_JointArticulationBodies.Length; joint++)
                    {
                        ArticulationDrive joint1XDrive = m_JointArticulationBodies[joint].xDrive;
                        
                        //Debug.LogWarning(joint);
                        //Debug.LogWarning(joint1XDrive.target);
                        //Debug.LogWarning(result[joint] + "before assigning");
                        // joint1XDrive.target = result[joint];
                        Sliders[joint].value = result[joint] / 360;
                        //Debug.LogWarning(result[joint] + "after assigning");
                        //Debug.LogWarning("------------");
                        //m_JointArticulationBodies[joint].xDrive = joint1XDrive;
                    }

                    // Wait for robot to achieve pose for all joint assignments
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }

                // Close the gripper if completed executing the trajectory for the Grasp pose
                // if (poseIndex == (int)Poses.Grasp)
                // {
                //     CloseGripper();
                // }

                // Wait for the robot to achieve the final pose from joint assignment
                yield return new WaitForSeconds(k_PoseAssignmentWait);
            }

            // All trajectories have been executed, open the gripper to place the target cube
            // OpenGripper();
        }
        foreach (var removeObject in objectsToBeRemoveColliders)
        {
            removeObject.GetComponent<Collider>().enabled = true;
        }
        line.positionCount = 0;
        text.text = "Ready for another execution";

    }

    // enum Poses
    // {
    //     PreGrasp,
    //     Grasp,
    //     PickUp,
    //     Place
    // }
}