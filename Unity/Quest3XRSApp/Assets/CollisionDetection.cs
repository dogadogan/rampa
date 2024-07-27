using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class CollisionDetection : MonoBehaviour
{

    public DrawServiceWithInspect drawServiceWithInspect;
    public DrawServiceRealTime drawServiceRealTime;
    public TrainAndTest trainAndTest;

    public Toggle isRealTime;  

    public TMP_Text debugText;

    void OnCollisionEnter(Collision collision)
    {
        debugText.text += "\n Collision detected";

        debugText.text += "\n" + collision.body.name;
        debugText.text += "\n" + collision.collider.name;

        debugText.text += "\n";

        
        if (trainAndTest.isTesting()) {
            trainAndTest.SetCollisionDetected(collision);
        }
        else if (isRealTime.isOn)
        {
            drawServiceRealTime.SetCollisionDetected(collision);
        }
        else
        {
            drawServiceWithInspect.SetCollisionDetected(collision);
        }
        
        

    }
}
