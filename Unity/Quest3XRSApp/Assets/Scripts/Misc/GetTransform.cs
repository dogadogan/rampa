using UnityEngine;
using UnityEngine.UI;

public class GetTransform : MonoBehaviour
{
    public Transform leftController;
    public Transform grabableCube;
    public ArticulationBody baseLink;
    private bool autoTransform = false;
    
    void Start() {}
    
    void FixedUpdate()
    {
        if (autoTransform)
        {
            Vector3 rot= new Vector3(0, leftController.transform.rotation.eulerAngles.y - 139, 0);
            baseLink.TeleportRoot(leftController.transform.position + (-0.01206f * baseLink.transform.forward) + ( -0.0946f * baseLink.transform.right) - (0.3f * transform.up),Quaternion.Euler(rot));
        }
        else
        {
            baseLink.TeleportRoot(grabableCube.position + new Vector3(0,0.1f,0),grabableCube.rotation);
        }

    }
    
    public void ChangeTransformType()
    {
        autoTransform = !autoTransform;
    }
    
}
