using System.Collections;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.NiryoMoveit;
using Unity.Robotics.ROSTCPConnector;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using UnityEditor.Compilation;
using UnityEngine;
using UnityEngine.UI;

public class PlanRequestGeneratorWithTarget : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.1f;
    //const float k_PoseAssignmentWait = 0.5f;

    // Variables required for ROS communication
    private string m_RosServiceName = "niryo_moveit";
    

    public GameObject baseLink;
    

    public GameObject m_Target;

    // ROS Connector
    ROSConnection m_Ros;
    public GameObject[] objectsToRemoveColliders;
    public Text text;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;

    void Start()
    {

    }
    
    public void GenerateRequest()
    {
        var request = new MoverServiceRequest();
        request.joints_input = HelperFunctions.CurrentJointConfig();
        

        PoseMsg[] pose_list = new PoseMsg[1];
        pose_list[0] = new PoseMsg
        {
            position = (m_Target.transform.position - baseLink.transform.position).To<FLU>(),

            // The hardcoded x/z angles assure that the gripper is always positioned above the target cube before grasping.
            orientation = Quaternion.Euler(90, m_Target.transform.eulerAngles.y, 0).To<FLU>()
        };
        request.pose_list = pose_list;
        TrajectoryPlanner.SendRquest(request);
    }


    public void ProcessResponse(MoverServiceResponse response)
    {
        StartCoroutine(ExecuteTrajectories());
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
        foreach (var removeObject in objectsToRemoveColliders)
        {
            removeObject.GetComponent<Collider>().enabled = true;
        }
        text.text = "Ready for another execution";
        
    }
}