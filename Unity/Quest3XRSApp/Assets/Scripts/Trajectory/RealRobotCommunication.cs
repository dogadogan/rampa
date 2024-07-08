using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;
using System.Collections;
using TMPro;

public class RealRobotCommunication : MonoBehaviour
{
    
    private string m_RosServiceName_Execute = "execute";
    private string m_RosServiceName_Discard = "discard";
    ROSConnection m_Ros;
    public TMP_Text debugText;

    public TrajectoryHelperFunctions trajectoryHelperFunctions;
    
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
        StartCoroutine(SetSlidersCoroutine(response));
    }
    
    IEnumerator SetSlidersCoroutine(ExecutionServiceResponse response)
    {
        // response.joint_states is JointTrajectoryPointMsg[]
        for (int i = 0; i < response.joint_states.Length; i++)
        {
            debugText.text += "\n Setting joint angles...";
            trajectoryHelperFunctions.SetJointAngles(response.joint_states[i]);
        }
        yield return new WaitForSeconds(0.1f);
    }


    private void handleDiscardResponse(DiscardServiceResponse response)
    {
        /*
        popUpPanel.SetActive(false);
        mainPanel.SetActive(true);
        */
        
    }
    
    
    
    
}
