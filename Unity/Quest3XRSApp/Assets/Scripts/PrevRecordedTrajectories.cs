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

    // private List<GameObject> lines = new List<GameObject>();

    // stores the points of trajectories relative to the baseLink
    private List<List<Vector3>> trajectories = new List<List<Vector3>>();
    // stores the points of trajectories relative to absolute world coordinates
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

        trajectories.Clear();

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

            debugText.text += "trajectories.Count: " + trajectories.Count + "\n";
            showTrajectoriesTextinMainMenu.text = "show training set (" + trajectories.Count + ")";
            showTrajectoriesTextinTrajCaptureMenu.text = "show training set (" + trajectories.Count + ")";
        }
        else {
            showTrajectoriesTextinMainMenu.text = "hide training set (" + trajectories.Count + ")";
            showTrajectoriesTextinTrajCaptureMenu.text = "hide training set (" + trajectories.Count + ")";
    
        }

    }

    // isPosesAbsolute = true implies that the poses are in absolute world coordinates, otherwise they are relative to the baseLink
    public void AddTrajectory(List<Vector3> poses, bool isPosesAbsolute = true) {
        // previousTrajectories.Add(trajectory);

        List<Vector3> trajectory = new List<Vector3>();

        debugText.text += "\n adding trajectory";

        foreach (var point in poses) {

            // storing the point relative to the baseLink assuming the baseLink's y rotation is 0
            
            if (!isPosesAbsolute) {
                trajectory.Add(point);
                continue;
            }

            Vector3 direction = new Vector3((float) point.x - baseLink.transform.position.x, 
                                            (float) point.y - baseLink.transform.position.y, 
                                            (float) point.z - baseLink.transform.position.z);

            
            // rotating the point so that the baseLink's y rotation is 0
            Quaternion rotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0); // Create a rotation quaternion around the pivotPoint
            Vector3 rotatedDirection = rotation * direction; // Rotate the direction vector

            trajectory.Add(rotatedDirection);
        }

        trajectories.Add(trajectory);

        if (trajectories.Count == 1) {
            trainAndTest.UpdateText();
        }

        if (buttonState == 1)
            ShowLine(trajectory);

        

    }


    public void ShowLine(List<Vector3> trajectory) {
        GameObject line = new GameObject();
        line.AddComponent<LineRenderer>();
        LineRenderer lr = line.GetComponent<LineRenderer>();
        lr.material = new Material(Shader.Find("Sprites/Default"));
        lr.startColor = Color.yellow;
        lr.endColor = Color.yellow;
        lr.startWidth = 0.01f;
        lr.endWidth = 0.01f;
        
        for (int i = 0; i < trajectory.Count; i++) {
            
            lr.positionCount = i + 1;

            Quaternion rotation = Quaternion.Euler(0, baseLink.transform.eulerAngles.y, 0);
            Vector3 rotatedPoint = baseLink.transform.position + rotation * trajectory[i];

            lr.SetPosition(i, rotatedPoint);
        }


        line.SetActive(true);
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
        foreach (var trajectory in trajectories) {
            ShowLine(trajectory);
        }

        showTrajectoriesTextinTrajCaptureMenu.text = "hide training set (" + trajectories.Count + ")";
        showTrajectoriesTextinMainMenu.text = "hide training set (" + trajectories.Count + ")";
        buttonState = 1;
    }

    public void HideTrajectories() {
        foreach (var line in lines) {
            Destroy(line);
        }
        lines.Clear();
        

        showTrajectoriesTextinTrajCaptureMenu.text = "show training set (" + trajectories.Count + ")";
        showTrajectoriesTextinMainMenu.text = "show training set (" + trajectories.Count + ")";
        buttonState = 0;
    }

    public void SetInteractable(bool interactable) {
        
        if (trajectories.Count == 0) {
            showTrajectoriesinMainMenu.interactable = false;
            showTrajectoriesinTrajCaptureMenu.interactable = false;
            return;
        }
        showTrajectoriesinMainMenu.interactable = interactable;
        showTrajectoriesinTrajCaptureMenu.interactable = interactable;
    }

    public int GetTrajectoriesCount() {
        return trajectories.Count;
    }





    


}
