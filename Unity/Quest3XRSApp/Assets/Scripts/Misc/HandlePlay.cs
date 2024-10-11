using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;


public class HandlePlay : MonoBehaviour
{
    public Toggle isRealTime;

    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;

    public TMP_Text debugText;

    public void handleClick() {
        if (isRealTime.isOn) {
            debugText.text += "Play clicked\n";
            PlanRequestGeneratorRealTime.PlayRestOfTrajectory();
        } else {
            debugText.text += "Play clicked\n";
            PlanRequestGeneratorWithPoses.PlayRestOfTrajectory();
        }
    }
    
}