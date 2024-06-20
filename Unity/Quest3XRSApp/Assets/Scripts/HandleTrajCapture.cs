using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HandleTrajCapture : MonoBehaviour
{
    public Toggle isRealTime;

    public GameObject TrajCaptureMenu;
    public GameObject MainMenu;

    public DrawServiceWithInspect drawServiceWithInspect;

    public DrawServiceRealTime drawServiceRealTime;

    public GameObject executeTrajectoryButton;

    public void HandleClick() {
        if (isRealTime.isOn) {
            GoToTrajCapture();
            drawServiceRealTime.UpdateDrawingState();
            executeTrajectoryButton.SetActive(false);
        } else {
            GoToTrajCapture();
            drawServiceWithInspect.UpdateDrawingState();
            executeTrajectoryButton.SetActive(true);
        }
    }

    public void GoToTrajCapture()
    {
        MainMenu.SetActive(false);
        TrajCaptureMenu.SetActive(true);
    }

}
