using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateJoints : MonoBehaviour

{
    
    public float speed ;
    public ArticulationBody joint;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        ArticulationDrive currentDrive = joint.xDrive;
        float newTargetDelta = 1 * Time.fixedDeltaTime * speed;
        if (newTargetDelta + currentDrive.target > currentDrive.upperLimit)
        {
            currentDrive.target = currentDrive.upperLimit;
        }
        else if (newTargetDelta + currentDrive.target < currentDrive.lowerLimit)
        {
            currentDrive.target = currentDrive.lowerLimit;
        }
        else
        {
            currentDrive.target += newTargetDelta;
        }
        
        joint.xDrive = currentDrive;
        
    }
}
