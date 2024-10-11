using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class HandleTrainModelButton : MonoBehaviour
{
    public GameObject MainMenu;
    public GameObject TrajCaptureMenu;
    public GameObject MLTrainingMenu;

    public void handleClick() {
        MainMenu.SetActive(false);
        TrajCaptureMenu.SetActive(false);
        MLTrainingMenu.SetActive(true);
    }
    
}
