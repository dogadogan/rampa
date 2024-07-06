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

    int OFFSET = 1.0f;
    public double[] CurrentJointConfig()
    {
        double[] joints = new double[Sliders.Length] ;

        for (var i = 0; i < Sliders.Length; i++)
        {
            joints[i] = Sliders[i].value * 360 * Mathf.Deg2Rad;
        }

        return joints;
    }

    public PoseMsg GeneratePoseMsg(Vector3 pose, Quaternion orientation)
    {
        debugText.text += "baseLink:  " + baseLink.transform.position;

        Vector3 direction = pose - baseLink.transform.position;

        // Create a rotation quaternion around the pivotPoint
        Quaternion baseReverseRotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0);
        // Rotate the direction vector
        Vector3 rotatedDirection = baseReverseRotation * direction;

        Quaternion rotatedOrientation = orientation * baseReverseRotation;

        Vector3 rotatedDirectionWithOffset = TranslatePointInReverseDirection(rotatedDirection, rotatedOrientation, OFFSET);

        return new PoseMsg
        {
            position = rotatedDirectionWithOffset.To<FLU>(),
            // orientation = orientation.To<FLU>()
            orientation = rotatedOrientation.To<FLU>()
        };
        
    }
 
    public Vector3 TranslatePointInReverseDirection(Vector3 point, Quaternion orientation, float distance)
    {
        // reverse the direction of orientation relative to origin
        
        Quaternion normalizedOrientation = orientation.normalized;
        Vector3 unitDirectionVector = new Vector3(normalizedOrientation.x, normalizedOrientation.y, normalizedOrientation.z);
        Vector3 reversedUnitDirectionVector = -unitDirectionVector;
        Vector3 reversedDirection = reversedUnitDirectionVector * distance;
        return point + reversedDirection;
     
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
