using UnityEngine;

public class CustomController : MonoBehaviour
{
    private ArticulationBody[] articulationChain;
    public float stiffness;
    public float damping;
    public float forceLimit;
    int defDyanmicVal;
    public ArticulationDriveType driveType = ArticulationDriveType.Force;
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
            currentDrive.driveType = driveType;
            joint.xDrive = currentDrive;
        }
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}