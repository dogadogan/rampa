using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HandleTestModelButtonClick : MonoBehaviour
{

    public GameObject MainMenu;
    public GameObject TestModelMenu;

    public void GoToTestModelMenu()
    {
        MainMenu.SetActive(false);
        TestModelMenu.SetActive(true);
    }
}
