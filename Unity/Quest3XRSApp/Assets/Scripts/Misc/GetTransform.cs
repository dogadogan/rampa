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

    public bool isFirst = false;

    public Quaternion orientation;
    public Vector3 position;

    private int counter = 0;
    
    void Start() {}
    
    void FixedUpdate()
    {
        if (autoTransform) {
            if (isFirst) {
                Quaternion baseLinkRotation = Quaternion.Euler(0, leftController.transform.rotation.eulerAngles.y + 29.5f, 0);
                orientation = baseLinkRotation;
                
                Vector3 baseLinkPosition = leftController.transform.position + 
                            (-0.012f * baseLink.transform.forward) + ( -0.123f * baseLink.transform.right) + (-0.28f * transform.up);

                position = baseLinkPosition;
                

                //isFirst = false;
                baseLink.TeleportRoot(position, orientation);
                counter++;
                if (counter > 1000) {
                    isFirst = false;
                    counter = 0;
                }
            }
            baseLink.TeleportRoot(position, orientation);
        }
        else
        {
            isFirst = true;
            baseLink.TeleportRoot(grabableCube.position + new Vector3(0,0.1f,0),grabableCube.rotation);
        }

    }

    public void ChangeTransformType()
    {
        autoTransform = !autoTransform;
    }
    
}
