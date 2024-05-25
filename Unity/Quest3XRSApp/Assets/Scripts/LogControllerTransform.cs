using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class LogControllerTransform : MonoBehaviour
{
    public GameObject bu;

    public GameObject cube;

    public Slider Slider;
    // Start is called before the first frame update
    private void Start()
    {
        StartCoroutine(LogPositionPeriodically());
    }

    private IEnumerator LogPositionPeriodically()
    {
        while (true)
        {
            // Log the position
            Debug.LogWarning("Position of " + bu.name + ": " + bu.transform.position + " rot: " + bu.transform.rotation.eulerAngles);

            // Wait for the specified interval
            yield return new WaitForSeconds(2);
        }
    }

    public void Update()
    {
        var angle = (bu.transform.rotation.eulerAngles.y - 68) % 360;
        float  a = Mathf.Cos(angle * Mathf.Deg2Rad);
        float b = Mathf.Sin(angle * Mathf.Deg2Rad);
        Debug.LogWarning("x: " +a + "y:" + b );
        cube.transform.position = bu.transform.position + new Vector3( 0.2f * a,-0.4f,0.2f * b);
        Vector3 rot= new Vector3(0, bu.transform.rotation.eulerAngles.y - 139, 0);
        cube.transform.rotation = Quaternion.Euler(rot);
    }
}
