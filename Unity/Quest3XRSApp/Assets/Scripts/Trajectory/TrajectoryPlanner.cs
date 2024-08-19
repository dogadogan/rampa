using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using RosMessageTypes.Trajectory;
using RosMessageTypes.Geometry;

public class TrajectoryPlanner : MonoBehaviour
{
    
    
    private string m_RosServiceName = "planner";
    ROSConnection m_Ros;

    public TMP_Text debugText;
    
    public PlanRequestGeneratorWithTarget PlanRequestGeneratorWithTarget;
    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;
    public TrajectoryHelperFunctions TrajectoryHelperFunctions;

    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<PlannerServiceRequest, PlannerServiceResponse>(m_RosServiceName);
    }
    
    public void SendRequest(PlannerServiceRequest request)
    {

        if (request.request_type == "poses_training") {

            var oldPoses = request.pose_list;
            request.pose_list = new PoseMsg[oldPoses.Length];
            debugText.text += "\n Transforming poses to FLU";
            for (int i = 0; i < request.pose_list.Length; i++) {
                Quaternion or = oldPoses[i].orientation.From<FLU>();
                Vector3 pos = oldPoses[i].position.From<FLU>();
                Vector3 posWithOffset = TrajectoryHelperFunctions.TranslatePointInReverseDirection(pos, or, TrajectoryHelperFunctions.OFFSET);
                request.pose_list[i] = new PoseMsg
                {
                    position = posWithOffset.To<FLU>(),
                    orientation = or.To<FLU>()
                };
            }
        }

        m_Ros.SendServiceMessage<PlannerServiceResponse>(m_RosServiceName, request, TrajectoryResponse);
    }
    
    void TrajectoryResponse(PlannerServiceResponse response)
    {
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
            case "poses_training":
                PlanRequestGeneratorWithPoses.ProcessResponse(response, true);
                break;
        }
        
        if (response.output_msg == "Timeout")
        {
            debugText.text += "Timeout\n";
        }

    }
    
    
}