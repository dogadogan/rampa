using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PrevRecordedTrajectories : MonoBehaviour
{
    public PlanRequestGeneratorRealTime planRequestGeneratorRealTime;

    public Button showTrajectoriesinMainMenu;
    public Button showTrajectoriesinTrajCaptureMenu;

    private TextMeshProUGUI showTrajectoriesTextinMainMenu;
    private TextMeshProUGUI showTrajectoriesTextinTrajCaptureMenu;

    private int buttonState;

    
    // public List<List< (Vector3 position, double[] jointAngles)>> previousTrajectories 
    //    = new List<List<(Vector3 position, double[] jointAngles)>>();

    private List<GameObject> lines = new List<GameObject>();


    public void Start() {
        showTrajectoriesinMainMenu.interactable = false;
        showTrajectoriesinTrajCaptureMenu.interactable = false;
        showTrajectoriesTextinMainMenu = showTrajectoriesinMainMenu.GetComponentInChildren<TextMeshProUGUI>();
        showTrajectoriesTextinTrajCaptureMenu = showTrajectoriesinTrajCaptureMenu.GetComponentInChildren<TextMeshProUGUI>();
        buttonState = 0;
    }


    public void DeletePrevTrajectories() {
        
        // previousTrajectories.Clear();
        lines.Clear();

        showTrajectoriesinMainMenu.interactable = false;
        showTrajectoriesinTrajCaptureMenu.interactable = false;

        showTrajectoriesTextinMainMenu.text = "Show previously recorded trajectories (0)";
        showTrajectoriesTextinTrajCaptureMenu.text = "Show previously recorded trajectories (0)";
    }

    // handle show-traj buttons
    public void HandleButtons() {

        showTrajectoriesinMainMenu.interactable = true;
        showTrajectoriesinTrajCaptureMenu.interactable = true;

        showTrajectoriesTextinMainMenu.text = "Show previously recorded trajectories (" + lines.Count + ")";
        showTrajectoriesTextinTrajCaptureMenu.text = "Show previously recorded trajectories (" + lines.Count + ")";

    }

    public void AddTrajectory(List<(Vector3 position, double[] jointAngles)> trajectory) {
        // previousTrajectories.Add(trajectory);

        GameObject line = new GameObject();
        line.AddComponent<LineRenderer>();
        line.SetActive(false);

        line.GetComponent<LineRenderer>().startWidth = 0.01f;
        line.GetComponent<LineRenderer>().endWidth = 0.01f;
        line.GetComponent<LineRenderer>().material = new Material(Shader.Find("Sprites/Default"));
        line.GetComponent<LineRenderer>().startColor = Color.red;
        line.GetComponent<LineRenderer>().endColor = Color.red;


        foreach (var point in trajectory) {
            line.GetComponent<LineRenderer>().positionCount++;
            line.GetComponent<LineRenderer>().SetPosition(line.GetComponent<LineRenderer>().positionCount - 1, point.position);
        }

        lines.Add(line);

    }


    public void HandleShowTrajButton() {
        if (buttonState == 0) {
            ShowTrajectories();
        } else {
            HideTrajectories();
        }
    }

    public void ShowTrajectories() {
        foreach (var line in lines) {
            line.gameObject.SetActive(true);
        }

        showTrajectoriesTextinTrajCaptureMenu.text = "Hide previously recorded trajectories (" + lines.Count + ")";
        buttonState = 1;
    }

    public void HideTrajectories() {
        foreach (var line in lines) {
            line.gameObject.SetActive(false);
        }

        showTrajectoriesTextinTrajCaptureMenu.text = "Show previously recorded trajectories (" + lines.Count + ")";
        buttonState = 0;
    }






    


}
