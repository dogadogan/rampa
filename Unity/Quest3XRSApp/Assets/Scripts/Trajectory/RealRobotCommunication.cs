using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;

public class RealRobotCommunication : MonoBehaviour
{
    
        
    private string m_RosServiceName_Execute = "execute";
    private string m_RosServiceName_Discard = "discard";
    ROSConnection m_Ros;
    public GameObject mainPanel;
    public GameObject popUpPanel;
    
    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<ExecutionServiceRequest, ExecutionServiceResponse>(m_RosServiceName_Execute);
        m_Ros.RegisterRosService<DiscardServiceRequest, DiscardServiceResponse>(m_RosServiceName_Discard);
    }

    public void DiscardTrajectory()
    {
        var request = new DiscardServiceRequest();
        m_Ros.SendServiceMessage<DiscardServiceResponse>(m_RosServiceName_Discard, request, handleDiscardResponse);
    }

    public void ApproveTrajectory()
    {
        var request = new ExecutionServiceRequest();
        m_Ros.SendServiceMessage<ExecutionServiceResponse>(m_RosServiceName_Execute, request, handleExecuteResponse);
    }

    private void handleExecuteResponse(ExecutionServiceResponse response)
    {
        popUpPanel.SetActive(false);
        mainPanel.SetActive(true);
    }
    
    private void handleDiscardResponse(DiscardServiceResponse response)
    {
        popUpPanel.SetActive(false);
        mainPanel.SetActive(true);
        
    }
    
    
    
}
