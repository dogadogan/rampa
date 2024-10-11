using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;


public class HandleResume : MonoBehaviour
{
    public Toggle isRealTime;

    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;

    public TMP_Text debugText;

    public void handleClick() {
        if (isRealTime.isOn) {
            debugText.text += "Pause clicked\n";
            PlanRequestGeneratorRealTime.PauseTrajectory();
        } else {
            debugText.text += "Pause clicked\n";
            PlanRequestGeneratorWithPoses.PauseTrajectory();
        }
    }
    
}