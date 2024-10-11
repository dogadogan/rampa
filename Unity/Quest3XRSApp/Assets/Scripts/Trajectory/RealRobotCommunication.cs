using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;
using System.Collections;
using TMPro;
using System.Collections.Generic;

public class RealRobotCommunication : MonoBehaviour
{
    
    private string m_RosServiceName_Execute = "execute";
    private string m_RosServiceName_Discard = "discard";
    ROSConnection m_Ros;
    public TMP_Text debugText;
    public List<double[]> jointAngles = new List<double[]>();

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

        request.joint_states = new ListOfFloatsMsg[jointAngles.Count];
        for (int i = 0; i < jointAngles.Count; i++) {
            request.joint_states[i] = new ListOfFloatsMsg();
            request.joint_states[i].list = new double[jointAngles[i].Length];
            for (int j = 0; j < jointAngles[i].Length; j++) {
                request.joint_states[i].list[j] = jointAngles[i][j] * 360 * Mathf.Deg2Rad;
            }
        }

        foreach (var joint in request.joint_states)
        {
            foreach (var angle in joint.list)
            {
                debugText.text += angle + " ";
            }
            debugText.text += "\n";
        }
        debugText.text += "\n";

        m_Ros.SendServiceMessage<ExecutionServiceResponse>(m_RosServiceName_Execute, request, handleExecuteResponse);
    }

    private void handleExecuteResponse(ExecutionServiceResponse response)
    {}
    

    private void handleDiscardResponse(DiscardServiceResponse response)
    {
        /*
        popUpPanel.SetActive(false);
        mainPanel.SetActive(true);
        */
        
    }

    public void setJointAngles(List<double[]> jointAngles)
    {
        // deep copy
        this.jointAngles = new List<double[]>(jointAngles);
    }
    
    
    
    
}
