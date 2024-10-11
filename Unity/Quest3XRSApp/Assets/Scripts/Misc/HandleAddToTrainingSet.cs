using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HandleAddToTrainingSet : MonoBehaviour
{
    public Toggle isRealTime;

    public DrawServiceRealTime drawServiceRealTime;
    public DrawServiceWithInspect drawServiceWithInspect;

    public void handleClick() {
        if (isRealTime.isOn) {
            drawServiceRealTime.SendTrainingData();
        } else {
            drawServiceWithInspect.SendTrainingData();
        }
    }
}
