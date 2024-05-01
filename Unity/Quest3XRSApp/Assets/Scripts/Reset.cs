using UnityEngine;
using RosMessageTypes.NiryoMoveit;
using Unity.Robotics.ROSTCPConnector;

public class Reset : MonoBehaviour
{
    public TrajectoryPlanner trajectoryPlanner;
    public DrawService drawService;
    ROSConnection m_Ros;
    private string m_RosServiceName = "get_joint_state";
    
    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<StateServiceRequest, StateServiceResponse>(m_RosServiceName);
    }
    public void ResetSystem()
    {

        SendJointStateRequest();
        drawService.ResetDrawingState();
    }
    
    public void SendJointStateRequest()
    {
        var request = new StateServiceRequest();
        m_Ros.SendServiceMessage<StateServiceResponse>(m_RosServiceName, request, JointStateResponse);
    }

    private void JointStateResponse(StateServiceResponse response)
    {
        trajectoryPlanner.ResetSliders(response.current_joint_angles);
    }
}
