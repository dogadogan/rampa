using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class GetTransform : MonoBehaviour
{
    public Transform leftController;
    public Transform grabableCube;
    public ArticulationBody baseLink;

    public Slider shoulderSlider;

    private bool autoTransform = false;
    public TMP_Text debugText;
    
    void Start() {}
    
    void FixedUpdate()
    {
        if (autoTransform)
        {
            Quaternion baseLinkRotation = Quaternion.Euler(0, 108.99f, 0);
            debugText.text += "\n" + baseLinkRotation.eulerAngles;
            Quaternion shoulderLinkRotation = Quaternion.Euler(0, - shoulderSlider.value, 0);
            Quaternion rotation = shoulderLinkRotation * baseLinkRotation;

            baseLink.TeleportRoot(leftController.transform.position + 
                            (-0.012f * baseLink.transform.forward) + ( -0.123f * baseLink.transform.right) + (-0.28f * transform.up),
                             rotation);
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
