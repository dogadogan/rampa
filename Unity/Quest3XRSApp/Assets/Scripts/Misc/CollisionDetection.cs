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
        debugText.text += "Collision detected\n";
        debugText.text += "Collision game object: " + collision.gameObject.name + "\n";

        Vector3 collisionPoint = collision.contacts[0].point;

        if (trainAndTest.isTesting())
        {
            trainAndTest.SetCollisionDetected(collisionPoint);
        }
        else if (isRealTime.isOn)
        {
            drawServiceRealTime.SetCollisionDetected(collisionPoint);
        }
        else
        {
            drawServiceWithInspect.SetCollisionDetected(collisionPoint);
        }
    }
}
