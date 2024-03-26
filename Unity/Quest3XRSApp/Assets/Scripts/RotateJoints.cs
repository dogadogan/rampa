using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RotateJoints : MonoBehaviour

{
    
    public float speed ;
    public ArticulationBody joint;
    public Slider slider ;
    
    // Start is called before the first frame update
    void Start()

    {
        ArticulationDrive currentDrive = joint.xDrive;
        currentDrive.stiffness = 10f;
        currentDrive.damping = 10f;
        joint.xDrive = currentDrive;

    }

    // Update is called once per frame
    void FixedUpdate()
    {
        
        ArticulationDrive currentDrive = joint.xDrive;
        float newTargetDelta = slider.value * Time.fixedDeltaTime * speed;
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