using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CustomController : MonoBehaviour
{
    private ArticulationBody[] articulationChain;
    public float stiffness;
    public float damping;
    public float forceLimit;
    public float speed = 5f; // Units: degree/s
    public float torque = 100f; // Units: Nm or N
    public float acceleration = 5f;// Units: m/s^2 / degree/s^2
    int defDyanmicVal = 10;
    void Start()
    
    {
        articulationChain = this.GetComponentsInChildren<ArticulationBody>();
            
        foreach (ArticulationBody joint in articulationChain)
        {
            joint.jointFriction = defDyanmicVal;
            joint.angularDamping = defDyanmicVal;
            ArticulationDrive currentDrive = joint.xDrive;
            currentDrive.forceLimit = forceLimit;
            currentDrive.damping = damping;
            currentDrive.stiffness = stiffness;
            joint.xDrive = currentDrive;
        }
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}