using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using UnityEngine;
using UnityEngine.UI;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using System.Linq;
using RosMessageTypes.Trajectory;
using TMPro;

public class TrajectoryHelperFunctions : MonoBehaviour
{
    public Slider[] Sliders;

    public ArticulationBody baseLink;
    private const float k_JointAssignmentWait = 0.1f;

    public TMP_Text debugText;
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
        debugText.text += "baseLink:  " + baseLink.transform.position;

        Vector3 direction = pose - baseLink.transform.position;

        // Create a rotation quaternion around the pivotPoint
        Quaternion baseReverseRotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0);
        // Rotate the direction vector
        Vector3 rotatedDirection = baseReverseRotation * direction;
        
        
        
        return new PoseMsg
        {
            position = rotatedDirection.To<FLU>(),
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
    
}
