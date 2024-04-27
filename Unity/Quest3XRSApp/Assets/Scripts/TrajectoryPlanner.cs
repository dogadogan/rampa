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
    private string m_RosServiceName = "niryo_moveit";
    

    public GameObject baseLink;
    

    public GameObject m_Target;
    

    // Articulation Bodies
    public ArticulationBody[] m_JointArticulationBodies;

    // ROS Connector
    ROSConnection m_Ros;
    public Slider[] Sliders;
    public GameObject[] objectsToRemoveColliders;
    public Text text;
    public LineRenderer line;
    public DrawService drawService;
    public Transform handTransform;

    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<MoverServiceRequest, MoverServiceResponse>(m_RosServiceName);
    }
    
    double[] CurrentJointConfig()
    {
        double[] joints = new double[k_NumRobotJoints] ;

        for (var i = 0; i < k_NumRobotJoints; i++)
        {
            joints[i] = m_JointArticulationBodies[i].xDrive.target * Mathf.Deg2Rad;
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
        
        var request = new MoverServiceRequest();
        request.joints_input = CurrentJointConfig();
        

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
        
        foreach (var removeObject in objectsToRemoveColliders)
        {
            Debug.Log(removeObject.GetComponent<BoxCollider>().name);
            removeObject.GetComponent<BoxCollider>().enabled = false;
        }
        
        if (response.trajectories.Length > 0)
        {
            StartCoroutine(ExecuteTrajectories(response));
        }
        else
        {
            Debug.LogError("No trajectory returned from MoverService.");
            text.text = "No trajectory returned";
            foreach (var removeObject in objectsToRemoveColliders)
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

                    // Set the joint values for every joint
                    for (var joint = 0; joint < m_JointArticulationBodies.Length; joint++)
                    {
                        Sliders[joint].value = result[joint] / 360;
                    }

                    // Wait for robot to achieve pose for all joint assignments
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
                
                // Wait for the robot to achieve the final pose from joint assignment
                yield return new WaitForSeconds(k_PoseAssignmentWait);
            }

            // All trajectories have been executed, open the gripper to place the target cube
            // OpenGripper();
        }
        foreach (var removeObject in objectsToRemoveColliders)
        {
            removeObject.GetComponent<Collider>().enabled = true;
        }
        line.positionCount = 0;
        text.text = "Ready for another execution";

    }
}