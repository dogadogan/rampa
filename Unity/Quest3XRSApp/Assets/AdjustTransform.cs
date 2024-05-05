using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AdjustTransform : MonoBehaviour
{
    public Slider slider1;
    public Slider slider2;
    public Slider slider3;

    public GameObject parent;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        Debug.LogWarning($"-----Y angle:" + parent.transform.rotation.eulerAngles.y);
        float cos = 0.5f * Mathf.Cos((parent.transform.rotation.eulerAngles.y + slider1.value) * Mathf.Deg2Rad);
        float sin = 0.5f *  Mathf.Sin((parent.transform.rotation.eulerAngles.y + slider1.value) * Mathf.Deg2Rad);
        transform.position =  parent.transform.position + new Vector3(cos,-0.4f,sin);
    }
}
