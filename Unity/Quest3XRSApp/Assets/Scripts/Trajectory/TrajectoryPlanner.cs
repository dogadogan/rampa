using System.Collections;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.NiryoMoveit;
using Unity.Robotics.ROSTCPConnector;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using UnityEngine;
using UnityEngine.UI;

public class TrajectoryPlanner : MonoBehaviour
{
    // Hardcoded variables
    const int k_NumRobotJoints = 6;
    const float k_JointAssignmentWait = 0.1f;
    //const float k_PoseAssignmentWait = 0.5f;

    // Variables required for ROS communication
    private string m_RosServiceName = "niryo_moveit";


    // ROS Connector
    ROSConnection m_Ros;
    
    public Text text;
    public DrawService drawService;
    public int requestNumber = 0;
    public TrajectoryHelperFunctions HelperFunctions;
    public PlanRequestGeneratorWithTarget PlanRequestGeneratorWithTarget;
    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;

    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<MoverServiceRequest, MoverServiceResponse>(m_RosServiceName);
    }
    


    /// <summary>
    ///     Create a new MoverServiceRequest with the current values of the robot's joint angles,
    ///     the target cube's current position and rotation, and the targetPlacement position and rotation.
    ///     Call the MoverService using the ROSConnection and if a trajectory is successfully planned,
    ///     execute the trajectories in a coroutine.
    /// </summary>
    public void SendRquest(MoverServiceRequest request)
    {
        text.text = "Waiting for the response...";
        m_Ros.SendServiceMessage<MoverServiceResponse>(m_RosServiceName, request, TrajectoryResponse);
    }
    
    void TrajectoryResponse(MoverServiceResponse response)
    {
        text.text = "Trajectory calculated";
        switch (response.request_type)
        {
            case "target":
                PlanRequestGeneratorWithTarget.ProcessResponse(response);
                break;
            case "poses":
                PlanRequestGeneratorWithPoses.ProcessResponse(response);    
                break;
            case "realTime":
                PlanRequestGeneratorRealTime.ProcessResponse(response);    
                break;
        }
        
        if (response.trajectories.Length == 0)
        {
            Debug.LogError("No trajectory returned from MoverService.");
            text.text = "No trajectory returned";
        }

    }
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
                    var result = jointPositions.Select(r => r * Mathf.Rad2Deg).ToArray();
                    HelperFunctions.SetSliders(result);
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
            }
            
            
        }
        requestNumber += 1;
        text.text = "Ready for another execution";
        if (response.trajectories.Length > 1)
        {
            //drawService.UpdateDrawingState();
        }
        
    }
    
}