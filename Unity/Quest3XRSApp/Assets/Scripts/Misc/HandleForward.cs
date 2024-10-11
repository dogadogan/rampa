using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;


public class HandleForward : MonoBehaviour
{
    public Toggle isRealTime;

    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;

    public TMP_Text debugText;

    public void handleClick() {
        if (isRealTime.isOn) {
            debugText.text += "Forward clicked\n";
            PlanRequestGeneratorRealTime.GetOnePointNext();
        } else {
            debugText.text += "Forward clicked\n";
            PlanRequestGeneratorWithPoses.GetOnePointNext();
        }
    }
    
}