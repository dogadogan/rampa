using System;
using System.Collections;
using System.Collections.Generic;
using System.Numerics;
using UnityEngine;
using Matrix4x4 = UnityEngine.Matrix4x4;
using Quaternion = UnityEngine.Quaternion;
using Vector3 = UnityEngine.Vector3;
using Vector4 = UnityEngine.Vector4;

public class HandOrientation : MonoBehaviour
{
    
    public DrawServiceRealTime drawServiceRealTime;
    public DrawServiceWithInspect drawServiceWithInspect;
    
    public OVRHand hand;
    GameObject handOrientationIndicator;
    
    public GameObject handOrientationIndicatorModel;

    public OVRInput.Controller controller;


    void Start()
    {
        handOrientationIndicator = Instantiate(
            handOrientationIndicatorModel,
            hand.PointerPose.position,
            Quaternion.identity
        );
        
        handOrientationIndicator.SetActive(false);


    }

    public void ShowIndicator(bool set)
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
        
        if (OVRInput.GetLocalControllerVelocity(controller).magnitude < 0.1)
        {
            // don't touch the rotation if the controller is moving slowly
            handOrientationIndicator.transform.position = OVRInput.GetLocalControllerPosition(controller);
            return;
        }
        
        Vector3 trajectoryTangentVector = point1 - point2;
        Vector3 trajectoryTangentWithoutY = new Vector3(trajectoryTangentVector.x, 0, trajectoryTangentVector.z);

        Vector3 planeNormal;
        if (trajectoryTangentWithoutY.magnitude < 0.01) // if the trajectory is vertical use the x axis as the normal
        {
            planeNormal = Vector3.Cross(trajectoryTangentVector, new Vector3(1, 0, 0));
        }
        else // otherwise use the y axis as the normal
        { 
            planeNormal = Vector3.Cross(trajectoryTangentVector, new Vector3(0, 1, 0));   
        }
        
        planeNormal = planeNormal.normalized;

        handOrientationIndicator.transform.rotation = GetMirroredQuaternion(OVRInput.GetLocalControllerRotation(controller), planeNormal);
        handOrientationIndicator.transform.position = OVRInput.GetLocalControllerPosition(controller);
        
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

    public Quaternion GetRotation() {
        return handOrientationIndicator.transform.rotation;
    }
    
    
}
