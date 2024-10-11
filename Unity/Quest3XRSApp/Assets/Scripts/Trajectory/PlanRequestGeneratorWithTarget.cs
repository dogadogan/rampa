using System.Collections;
using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using UnityEngine;
using UnityEngine.UI;

public class PlanRequestGeneratorWithTarget : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.1f;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;
    public void GenerateRequest(GameObject m_Target)
    {
        var request = new PlannerServiceRequest();
        
        request.request_type = "target";
        request.joints_input = HelperFunctions.CurrentJointConfig();

        PoseMsg[] pose_list = new PoseMsg[1];
        pose_list[0] = HelperFunctions.GeneratePoseMsg(m_Target.transform.position, m_Target.transform.rotation);
        request.pose_list = pose_list;
        
        TrajectoryPlanner.SendRequest(request);
    }


    public void ProcessResponse(PlannerServiceResponse response)
    {
        StartCoroutine(ExecuteTrajectories(response));
    }
    
    IEnumerator ExecuteTrajectories(PlannerServiceResponse response)
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
}