using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GetTransform : MonoBehaviour
{
    public Transform leftController;
    public ArticulationBody ab;

    public Slider slider1;
    public Slider slider2;
    public Slider slider3;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        
        Vector3 rot= new Vector3(0, leftController.transform.rotation.eulerAngles.y - 139, 0);
        
        float cos = 0.1f * Mathf.Cos((leftController.transform.rotation.eulerAngles.y + 110) * Mathf.Deg2Rad);
        float sin = 0.1f *  Mathf.Sin((leftController.transform.rotation.eulerAngles.y +  110) * Mathf.Deg2Rad);
        Debug.LogWarning($"-----Y angle:" + leftController.transform.rotation.eulerAngles.y);
        Debug.LogWarning($"-----Positon:" + leftController.transform.position); 
        ab.TeleportRoot(leftController.transform.position + new Vector3(cos,-0.3f,sin),Quaternion.Euler(rot));
    }
    
}
