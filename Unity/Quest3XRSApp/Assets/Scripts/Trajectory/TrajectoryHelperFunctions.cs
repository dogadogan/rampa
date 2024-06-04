using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using UnityEngine;
using UnityEngine.UI;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using System.Linq;
using RosMessageTypes.Trajectory;

public class TrajectoryHelperFunctions : MonoBehaviour
{
    public Slider[] Sliders;
    public GameObject mainPanel;
    public GameObject popUpPanel;
    public ArticulationBody baseLink;
    private const float k_JointAssignmentWait = 0.1f;
    public double[] CurrentJointConfig()
    {
        double[] joints = new double[Sliders.Length] ;

        for (var i = 0; i < Sliders.Length; i++)
        {
            joints[i] = Sliders[i].value * 360 * Mathf.Deg2Rad;
        }

        return joints;
    }

    public PoseMsg GeneratePoseMsg(Vector3 pose)
    {
        Vector3 direction = pose - baseLink.transform.position;

        // Create a rotation quaternion around the pivotPoint
        Quaternion rotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0);

        // Rotate the direction vector
        Vector3 rotatedDirection = rotation * direction;

        Vector3 rotatedPoint = baseLink.transform.position + rotatedDirection;
        return new PoseMsg
        {
            position = (rotatedPoint- baseLink.transform.position).To<FLU>(),

            // The hardcoded x/z angles assure that the gripper is always positioned above the target cube before grasping.
            orientation = Quaternion.Euler(90, 0, 0).To<FLU>()
        };
        
    }
    
    public PoseMsg GeneratePoseMsgForTraining(Vector3 pose)
    {
        return new PoseMsg
        {
            position = new PointMsg(pose.x,pose.y,pose.z) ,
            // The hardcoded x/z angles assure that the gripper is always positioned above the target cube before grasping.
            orientation = Quaternion.Euler(90, 0, 0).To<FLU>()
        };
        
    }

    public void SetJointAngles(JointTrajectoryPointMsg t)
    {
        var jointPositions = t.positions;
        var result = jointPositions.Select(r => r * Mathf.Rad2Deg / 360).ToArray();
        SetSliders(result);
    }
    
    
    public double[] GetJointAngles(JointTrajectoryPointMsg t)
    {
        var jointPositions = t.positions;
        return  jointPositions.Select(r => r * Mathf.Rad2Deg / 360).ToArray();
    }
    
    public void SetSliders(double[] jointAngles)
    {
        for (var i = 0; i < Sliders.Length; i++)
        {
            Sliders[i].value = (float)jointAngles[i];
            
        }
    }

    public void openPopUp()
    {
        mainPanel.SetActive(false);
        popUpPanel.SetActive(true);
    }

    
}
