using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GoToTrajCaptureMenu : MonoBehaviour
{
    public GameObject TrajCaptureMenu;
    public GameObject MainMenu;

    public void GoToTrajCapture()
    {
        MainMenu.SetActive(false);
        TrajCaptureMenu.SetActive(true);
    }
    
}
