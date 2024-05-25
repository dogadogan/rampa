using System.Collections;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using UnityEngine;

public class PlanRequestGeneratorWithPoses : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.1f;
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
            pose_list[i] = HelperFunctions.GeneratePoseMsg(poses[i]);
        }
        request.pose_list = pose_list;
        TrajectoryPlanner.SendRequest(request);
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
                    HelperFunctions.SetJointAngles(t);
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
            }
            
            
        }
        drawService.UpdateDrawingState();
        HelperFunctions.openPopUp();
        
    }
    
}