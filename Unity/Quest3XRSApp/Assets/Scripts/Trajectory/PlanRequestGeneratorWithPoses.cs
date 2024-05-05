using System.Collections;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using UnityEngine;
using UnityEngine.UI;

public class PlanRequestGeneratorWithPoses : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.1f;
    public GameObject baseLink;
    public GameObject m_Target;
    public Text text;
    public DrawService drawService;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;
    
    
    
    public void GenerateRequest(Vector3[] poses)
    {
        var request = new PlannerServiceRequest();
        request.request_type = "poses";
        request.joints_input =  HelperFunctions.CurrentJointConfig();

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
        TrajectoryPlanner.SendRquest(request);
    } 
    
    public void ProcessResponse(PlannerServiceResponse response)
    {
        drawService.UpdateDrawingState();
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
                    HelperFunctions.SetSliders(result);
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
            }
            
            
        }
        drawService.UpdateDrawingState();
        HelperFunctions.openPopUp();
        
    }
    
}