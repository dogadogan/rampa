using System.Collections;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using UnityEngine;
using UnityEngine.UI;

public class PlanRequestGeneratorWithTarget : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.1f;
    public GameObject baseLink;
    public GameObject m_Target;
    public Text text;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;
    public void GenerateRequest()
    {
        var request = new PlannerServiceRequest();
        request.request_type = "target";
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


    public void ProcessResponse(PlannerServiceResponse response)
    {
        StartCoroutine(ExecuteTrajectories(response));
    }
    
    IEnumerator ExecuteTrajectories(PlannerServiceResponse response)
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
                    var result = jointPositions.Select(r => r * Mathf.Rad2Deg / 360).ToArray();
                    Debug.LogWarning(result);
                    HelperFunctions.SetSliders(result);
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
            }
        }
        HelperFunctions.openPopUp();
        text.text = "Ready for another execution";
        
    }
}