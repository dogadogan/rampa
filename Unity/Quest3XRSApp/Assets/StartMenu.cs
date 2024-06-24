using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StartMenu : MonoBehaviour
{

    public GameObject mainMenu;
    public GameObject trajCaptureMenu;
    public GameObject mlTrainingMenu;
    // Start is called before the first frame update
    void Start()
    {
        mainMenu.SetActive(true);
        trajCaptureMenu.SetActive(false);
        mlTrainingMenu.SetActive(false);
    }
}
