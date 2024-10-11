using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;


public class HandleRewind : MonoBehaviour
{
    public Toggle isRealTime;

    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;

    public TMP_Text debugText;

    public void handleClick() {
        if (isRealTime.isOn) {
            debugText.text += "Rewind clicked\n";
            PlanRequestGeneratorRealTime.GetOnePointBack();
        } else {
            debugText.text += "Rewind clicked\n";
            PlanRequestGeneratorWithPoses.GetOnePointBack();
        }
    }
    
}
