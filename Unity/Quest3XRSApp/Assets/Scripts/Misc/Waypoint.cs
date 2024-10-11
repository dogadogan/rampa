using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Waypoint : MonoBehaviour
{
    public GameObject MenuPrefab;

    public GameObject WaypointPrefab;

    public GameObject WaypointObject;
    public GameObject MenuObject;

    public PlanRequestGeneratorWithTarget planRequestGeneratorWithTarget;

    public TMP_Text debugText;


    // joint angles
    public double[] jointAngles = {0, 0, 0, 0, 0, 0};

    public void Start() {
        // load prefabs from Prefabs folder

        debugText = GameObject.Find("DebugText").GetComponent<TMP_Text>();
        planRequestGeneratorWithTarget = GameObject.Find("Publisher").GetComponent<PlanRequestGeneratorWithTarget>();

        if (MenuPrefab == null)
        {
            debugText.text += "\nFailed to load MenuPrefab. Make sure the prefab exists in Resources/Prefabs.";
        }
        if (WaypointPrefab == null)
        {
            debugText.text += "\nFailed to load MenuPrefab. Make sure the prefab exists in Resources/Prefabs.";
        }


    }



    public void Instantiate() {
        GameObject MenuObject = Instantiate(MenuPrefab, new Vector3(0, 0, 0), Quaternion.identity);

        GameObject WaypointObject = Instantiate(WaypointPrefab, new Vector3(0, 0, 0), Quaternion.identity);
        
        MenuObject.SetActive(false);

        MenuObject.transform.position = WaypointObject.transform.position;
    }

    public void ShowMenu() {
        MenuObject.SetActive(true);
    }

    public void HideMenu() {
        MenuObject.SetActive(false);
    }

    public void SendRequestForWaypoint() {
        // send request for waypoint
        planRequestGeneratorWithTarget.GenerateRequest(WaypointObject);

    }




}
