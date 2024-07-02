using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HandOrientation : MonoBehaviour
{
    
    public DrawServiceRealTime drawServiceRealTime;
    public DrawServiceWithInspect drawServiceWithInspect;
    
    public GameObject hand;
    GameObject handOrientationIndicator;
    
    public GameObject handOrientationIndicatorModel;


    void Start()
    {
        handOrientationIndicator = Instantiate(
            handOrientationIndicatorModel,
            hand.transform.position,
            Quaternion.identity
        );
        
        handOrientationIndicator.SetActive(false);
    }

    public void SetIndicator(bool set)
    {
        handOrientationIndicator.SetActive(set);
    }

    /*
     *  Takes the last drawn 2 points of the currently drawn trajectory, and calculates the mirror of the hand orientation
     *  with respect to the plane formed by the 2 points that are also perpendicular to the ground. Then updates the hand
     * orientation indicator to show the new mirrored orientation.
     */
    
    
    
    public void UpdateHandOrientationIndicator(Vector3 point1, Vector3 point2)
    {
        
        Vector3 trajectoryTangentVector = point1 - point2;
        
        // We take the cross product of the tangent vector and the upwards (0, 1, 0) vector so that the new vector is 
        // both perpendicular to the tangent vector and the ground.
        Vector3 planeNormal = Vector3.Cross(trajectoryTangentVector, new Vector3(0, 1, 0));
        planeNormal = planeNormal.normalized;

        handOrientationIndicator.transform.rotation = GetMirroredQuaternion(hand.transform.rotation, planeNormal);
        
    }
    
    /*
     *  Takes a quaternion and a normal vector of a plane, and returns the quaternion that is the mirror of the input quaternion
     *  with respect to the plane.
     */
    Quaternion GetMirroredQuaternion(Quaternion rotation, Vector3 planeNormal)
    {
        
        float x = planeNormal.x;
        float y = planeNormal.y;
        float z = planeNormal.z;
        
        // Create a reflection matrix based on the plane normal
        Matrix4x4 reflectionMatrix = new Matrix4x4(
            new Vector4(1 - 2 * x * x, -2 * x * y, -2 * x * z, 0),
            new Vector4(-2 * y * x, 1 - 2 * y * y, -2 * y * z, 0),
            new Vector4(-2 * z * x, -2 * z * y, 1 - 2 * z * z, 0),
            new Vector4(0, 0, 0, 1)
        );
        
        // Convert the quaternion to a rotation matrix
        Matrix4x4 quaternionMatrix = Matrix4x4.Rotate(rotation);
        
        // Multiply the reflection matrix with the quaternion matrix to get the mirrored rotation matrix
        Matrix4x4 mirroredMatrix = reflectionMatrix * quaternionMatrix;
        
        // Convert the mirrored rotation matrix back to a quaternion
        Quaternion mirroredRotation = Quaternion.LookRotation(mirroredMatrix.GetColumn(2), mirroredMatrix.GetColumn(1));

        return mirroredRotation;
    }

    public Quaternion GetQuaternion() {
        return handOrientationIndicator.transform.rotation;
    }
    
    
}
