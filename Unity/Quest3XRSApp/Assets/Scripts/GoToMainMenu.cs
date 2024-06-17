using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GoToMainMenu : MonoBehaviour
{
    public GameObject MainMenu;
    public GameObject TrajCaptureMenu;

    public GameObject MLTrainingMenu;

    public void GoToMainMenuFunc()
    {
        MainMenu.SetActive(true);
        TrajCaptureMenu.SetActive(false);
        MLTrainingMenu.SetActive(false);
    }
    
}
