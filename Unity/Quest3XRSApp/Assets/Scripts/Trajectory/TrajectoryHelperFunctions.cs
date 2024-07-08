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

    float OFFSET = 0.1f;
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


        debugText.text += "baseLink:  " + orientation.eulerAngles + "\n";

        Vector3 direction = pose - baseLink.transform.position;

        // Create a rotation quaternion around the pivotPoint
        Quaternion baseReverseRotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0);
        // Rotate the direction vector
        Vector3 rotatedDirection = baseReverseRotation * direction;

        debugText.text += "y angle: " + baseLink.transform.eulerAngles.y + "\n";

        Quaternion rotatedOrientation = baseReverseRotation * orientation;

        debugText.text += "rotatedOrientation:  " + rotatedOrientation.eulerAngles + "\n";

        Vector3 rotatedDirectionWithOffset = TranslatePointInReverseDirection(rotatedDirection, rotatedOrientation, OFFSET);

        return new PoseMsg
        {
            position = rotatedDirectionWithOffset.To<FLU>(),
            // orientation = orientation.To<FLU>()
            orientation = rotatedOrientation.To<FLU>()
        };
        
    }


    public Vector3 ToXYZ(Quaternion q) {
        var angles = new Vector3();

        // roll / x
        double sinr_cosp = 2 * (q.w * q.x + q.y * q.z);
        double cosr_cosp = 1 - 2 * (q.x * q.x + q.y * q.y);
        angles.x = (float)Math.Atan2(sinr_cosp, cosr_cosp);

        // pitch / y
        float sinp = 2 * (q.w * q.y - q.z * q.x);
        if (Math.Abs(sinp) >= 1) {
            angles.y = (float)((sinp < 0 ? -1 : 1) * Math.PI / 2);
        } else {
            angles.y = (float)Math.Asin(sinp);
        }

        // yaw / z
        double siny_cosp = 2 * (q.w * q.z + q.x * q.y);
        double cosy_cosp = 1 - 2 * (q.y * q.y + q.z * q.z);
        angles.z = (float)Math.Atan2(siny_cosp, cosy_cosp);

        return angles * 180 / (float)Math.PI;
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
