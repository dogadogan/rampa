using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class TrajectoryPlanner : MonoBehaviour
{
    
    
    private string m_RosServiceName = "planner";
    ROSConnection m_Ros;

    public TMP_Text debugText;
    
    public PlanRequestGeneratorWithTarget PlanRequestGeneratorWithTarget;
    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;

    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<PlannerServiceRequest, PlannerServiceResponse>(m_RosServiceName);
    }
    
    public void SendRequest(PlannerServiceRequest request)
    {
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