using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class HandleContextIncDec : MonoBehaviour
{
    public Toggle isRealtimeToggle;

    public DrawServiceWithInspect drawServiceWithInspect;
    public DrawServiceRealTime drawServiceRealTime;

    public TMP_Text debugText;

    public void IncX() {
        debugText.text += "\nIncX";
        if (isRealtimeToggle.isOn) {
            drawServiceRealTime.IncXScale();
        } else {
            drawServiceWithInspect.IncXScale();
        }
    }

    public void DecX() {
        if (isRealtimeToggle.isOn) {
            drawServiceRealTime.DecXScale();
        } else {
            drawServiceWithInspect.DecXScale();
        }
    }

    public void IncY() {
        if (isRealtimeToggle.isOn) {
            drawServiceRealTime.IncYScale();
        } else {
            drawServiceWithInspect.IncYScale();
        }
    }

    public void DecY() {
        if (isRealtimeToggle.isOn) {
            drawServiceRealTime.DecYScale();
        } else {
            drawServiceWithInspect.DecYScale();
        }
    }

    public void IncZ() {
        if (isRealtimeToggle.isOn) {
            drawServiceRealTime.IncZScale();
        } else {
            drawServiceWithInspect.IncZScale();
        }
    }
    public void DecZ() {
        if (isRealtimeToggle.isOn) {
            drawServiceRealTime.DecZScale();
        } else {
            drawServiceWithInspect.DecZScale();
        }
    }

    public void AddContext() {
        if (isRealtimeToggle.isOn) {
            drawServiceRealTime.HandleAddContextButton();
        } else {
            drawServiceWithInspect.HandleAddContextButton();
        }
    }
}
