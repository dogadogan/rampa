using UnityEngine;
using UnityEngine.UI;

public class RotateJoints : MonoBehaviour

{
    private ArticulationBody joint ;
    public Slider slider ;
    
    // Start is called before the first frame update
    void Start()

    {
        joint = this.GetComponent<ArticulationBody>();

    }

    // Update is called once per frame
    void FixedUpdate()
    {
        
        ArticulationDrive currentDrive = joint.xDrive;
        currentDrive.target = slider.value * 360;
        joint.xDrive = currentDrive;
        
    }
}