using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HandleRedrawButton : MonoBehaviour
{
    
    public Toggle isRealTime;

    public DrawServiceWithInspect drawServiceWithInspect;
    public DrawServiceRealTime drawServiceRealTime;
    
    public void handleClick() {
        if (isRealTime.isOn) {
            drawServiceRealTime.UpdateDrawingState();
        } else {
            drawServiceWithInspect.UpdateDrawingState();
        }
    }
}
