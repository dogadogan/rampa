using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PrevRecordedTrajectories : MonoBehaviour
{
    public PlanRequestGeneratorRealTime planRequestGeneratorRealTime;

    public TrainAndTest trainAndTest;

    public Button showTrajectoriesinMainMenu;
    public Button showTrajectoriesinTrajCaptureMenu;

    private TMP_Text showTrajectoriesTextinMainMenu;
    private TMP_Text showTrajectoriesTextinTrajCaptureMenu;

    public ArticulationBody baseLink;

    public TMP_Text debugText;

    private int buttonState;

    
    // public List<List< (Vector3 position, double[] jointAngles)>> previousTrajectories 
    //    = new List<List<(Vector3 position, double[] jointAngles)>>();

    private List<GameObject> lines = new List<GameObject>();

    public void Start() {
        showTrajectoriesTextinMainMenu = showTrajectoriesinMainMenu.GetComponentInChildren<TMP_Text>();
        showTrajectoriesTextinTrajCaptureMenu = showTrajectoriesinTrajCaptureMenu.GetComponentInChildren<TMP_Text>();
        
        buttonState = 0;

        // TODO: implement ROS service to get training data
        trainAndTest.GetTrainingData();
    
    }


    public void DeletePrevTrajectories() {
        
        // previousTrajectories.Clear();
        foreach (GameObject line in lines) {
            Destroy(line);
        }
        lines.Clear();

        showTrajectoriesinMainMenu.interactable = false;
        showTrajectoriesinTrajCaptureMenu.interactable = false;

        
        showTrajectoriesTextinMainMenu.text = "show training set (0)";
        showTrajectoriesTextinTrajCaptureMenu.text = "show training set (0)";

        buttonState = 0;

        // also trigger deletion in ROS
        trainAndTest.TriggerDelete();

    }

    // handle show-traj buttons
    public void HandleButtons() {

        SetInteractable(true);

        if (buttonState == 0) {

            debugText.text += "lines.Count: " + lines.Count + "\n";
            showTrajectoriesTextinMainMenu.text = "show training set (" + lines.Count + ")";
            showTrajectoriesTextinTrajCaptureMenu.text = "show training set (" + lines.Count + ")";
        }
        else {
            showTrajectoriesTextinMainMenu.text = "hide training set (" + lines.Count + ")";
            showTrajectoriesTextinTrajCaptureMenu.text = "hide training set (" + lines.Count + ")";
    
        }

    }

    public void AddTrajectory(List<Vector3> poses) {
        // previousTrajectories.Add(trajectory);

        GameObject line = new GameObject();
        line.AddComponent<LineRenderer>();

        line.SetActive(false);

        line.GetComponent<LineRenderer>().startWidth = 0.01f;
        line.GetComponent<LineRenderer>().endWidth = 0.01f;
        line.GetComponent<LineRenderer>().material = new Material(Shader.Find("Sprites/Default"));
        line.GetComponent<LineRenderer>().startColor = Color.yellow;
        line.GetComponent<LineRenderer>().endColor = Color.yellow;
        line.GetComponent<LineRenderer>().positionCount = 0;

        Quaternion rotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0);
        rotation = Quaternion.Inverse(rotation);

        debugText.text += "\n adding trajectory";

        foreach (var point in poses) {

            debugText.text += "\n adding point" + point;
            
            line.GetComponent<LineRenderer>().positionCount++;

            
            
            Vector3 newPoint = new Vector3((float) point.x - baseLink.transform.position.x, 
                                            (float) point.y - baseLink.transform.position.y, 
                                            (float) point.z - baseLink.transform.position.z);

            debugText.text += "\n newPoint: " + newPoint;


            line.GetComponent<LineRenderer>().SetPosition(line.GetComponent<LineRenderer>().positionCount - 1, newPoint);
        }
        lines.Add(line);

        if (buttonState == 1) {
            line.transform.position = line.transform.position + baseLink.transform.position;
            line.SetActive(true);
        }

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
            debugText.text += "baselink position: " + baseLink.transform.position;
            line.transform.position += baseLink.transform.position;
            line.gameObject.SetActive(true);
        }

        showTrajectoriesTextinTrajCaptureMenu.text = "hide training set (" + lines.Count + ")";
        showTrajectoriesTextinMainMenu.text = "hide training set (" + lines.Count + ")";
        buttonState = 1;
    }

    public void HideTrajectories() {
        foreach (var line in lines) {
            debugText.text += "baselink position: " + baseLink.transform.position;
            line.transform.position -= baseLink.transform.position;
            line.gameObject.SetActive(false);
        }

        showTrajectoriesTextinTrajCaptureMenu.text = "show training set (" + lines.Count + ")";
        showTrajectoriesTextinMainMenu.text = "show training set (" + lines.Count + ")";
        buttonState = 0;
    }

    public void SetInteractable(bool interactable) {
        
        if (lines.Count == 0) {
            showTrajectoriesinMainMenu.interactable = false;
            showTrajectoriesinTrajCaptureMenu.interactable = false;
            return;
        }
        showTrajectoriesinMainMenu.interactable = interactable;
        showTrajectoriesinTrajCaptureMenu.interactable = interactable;
    }





    


}
