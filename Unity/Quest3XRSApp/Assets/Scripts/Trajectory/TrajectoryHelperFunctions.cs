using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using UnityEngine;
using UnityEngine.UI;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using System.Linq;
using RosMessageTypes.Trajectory;
using TMPro;
using System;


public class TrajectoryHelperFunctions : MonoBehaviour
{
    public Slider[] Sliders;

    public ArticulationBody baseLink;
    private const float k_JointAssignmentWait = 0.1f;

    public TMP_Text debugText;

    public float OFFSET = 0.3f;
    public double[] CurrentJointConfig()
    {
        double[] joints = new double[Sliders.Length] ;

        for (var i = 0; i < Sliders.Length; i++)
        {
            joints[i] = Sliders[i].value * 360 * Mathf.Deg2Rad;
        }

        return joints;
    }

    public PoseMsg GeneratePoseMsg(Vector3 pose, Quaternion orientation, bool isTrainingSet = false)
    {   
        // debugText.text += "baseLink:  " + orientation.eulerAngles + "\n";

        Vector3 direction = pose - baseLink.transform.position;

        // Create a rotation quaternion around the pivotPoint
        Quaternion baseReverseRotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0);
        // Rotate the direction vector
        Vector3 rotatedDirection = baseReverseRotation * direction;

        // debugText.text += "y angle: " + baseLink.transform.eulerAngles.y + "\n";

        Quaternion rotatedOrientation = baseReverseRotation * orientation;

        // debugText.text += "rotatedOrientation:  " + rotatedOrientation.eulerAngles + "\n";

        if (isTrainingSet)
        {
            return new PoseMsg
            {
                position = rotatedDirection.To<FLU>(),
                orientation = rotatedOrientation.To<FLU>()
            };
        }

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
        // reverse the direction of orientation, and multiply it by the distance to get the new point
        
        Vector3 direction = orientation.normalized * Vector3.up;
        Vector3 reversedDirection = -direction * distance;
        return point + reversedDirection;
    }


    public void SetJointAngles(JointTrajectoryPointMsg t)
    {
        var jointPositions = t.positions;

        for (var i = 0; i < jointPositions.Length; i++)
        {
            if (jointPositions[i] > Mathf.PI)
            {
                jointPositions[i] = jointPositions[i] - 2 * Mathf.PI;
            }
            else if (jointPositions[i] < -Mathf.PI)
            {
                jointPositions[i] = jointPositions[i] + 2 * Mathf.PI;
            }
        }
        
        var result = jointPositions.Select(r => r * Mathf.Rad2Deg / 360).ToArray();
        SetSliders(result);
    }
    
    
    public double[] GetJointAngles(JointTrajectoryPointMsg t)
    {
        var jointPositions = t.positions;
        
        for (var i = 0; i < jointPositions.Length; i++)
        {
            if (jointPositions[i] > Mathf.PI)
            {
                jointPositions[i] = jointPositions[i] - 2 * Mathf.PI;
            }
            else if (jointPositions[i] < -Mathf.PI)
            {
                jointPositions[i] = jointPositions[i] + 2 * Mathf.PI;
            }
        }

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
