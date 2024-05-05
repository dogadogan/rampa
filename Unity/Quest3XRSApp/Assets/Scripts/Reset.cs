using UnityEngine;
using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine.UI;
using System.Linq;

public class Reset : MonoBehaviour
{
    public TrajectoryPlanner trajectoryPlanner;
    public DrawService drawService;
    ROSConnection m_Ros;
    private string m_RosServiceName = "get_joint_state";
    public TrajectoryHelperFunctions HelperFunctions;
    private double[] _resetCondition = {0f, -0.25f, 0f, -0.25f, 0f, 0f};
    public Text text;
    void Start()
    {
        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<StateServiceRequest, StateServiceResponse>(m_RosServiceName);
    }
    public void ResetSystem()
    {

        // SendJointStateRequest();
        HelperFunctions.SetSliders(_resetCondition);
        text.text = "Ready for execution";
        drawService.ResetDrawingState();
        
    }
    
    public void SendJointStateRequest()
    {
        var request = new StateServiceRequest();
        m_Ros.SendServiceMessage<StateServiceResponse>(m_RosServiceName, request, JointStateResponse);
    }

    private void JointStateResponse(StateServiceResponse response)
    {
        var result = response.current_joint_angles.Select(r => r * Mathf.Rad2Deg / 360).ToArray();
        HelperFunctions.SetSliders(result);
    }
}
