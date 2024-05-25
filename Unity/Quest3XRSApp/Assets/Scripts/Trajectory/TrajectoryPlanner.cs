using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;
using UnityEngine.UI;

public class TrajectoryPlanner : MonoBehaviour
{
    
    
    private string m_RosServiceName = "planner";
    ROSConnection m_Ros;
    
    public Text text;
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
        text.text = "Waiting for the response...";
        m_Ros.SendServiceMessage<PlannerServiceResponse>(m_RosServiceName, request, TrajectoryResponse);
    }
    
    void TrajectoryResponse(PlannerServiceResponse response)
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
    
    
}