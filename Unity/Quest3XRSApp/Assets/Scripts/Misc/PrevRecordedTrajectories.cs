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

    public GameObject orientationArrowPrefab;

    // public List<List< (Vector3 position, double[] jointAngles)>> previousTrajectories 
    //    = new List<List<(Vector3 position, double[] jointAngles)>>();

    // private List<GameObject> lines = new List<GameObject>();

    // stores the points of trajectories relative to the baseLink
    private List<List<(Vector3, Quaternion)>> trajectories = new List<List<(Vector3, Quaternion)>>();
    // stores the points of trajectories relative to absolute world coordinates
    private List<GameObject> lines = new List<GameObject>();
    private List<GameObject> orientationArrows = new List<GameObject>();

    

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
    public void AddTrajectory(List<Vector3> poses, List<Quaternion> orientations, bool isPosesAbsolute = true) {
        // previousTrajectories.Add(trajectory);

        List<(Vector3, Quaternion)> trajectory = new List<(Vector3, Quaternion)>();

        debugText.text += "\n adding trajectory";

        for (int i = 0; i < poses.Count; i++) {

            var point = poses[i];
            // storing the point relative to the baseLink assuming the baseLink's y rotation is 0
            
            if (!isPosesAbsolute) {
                trajectory.Add((poses[i], orientations[i]));
                continue;
            }

            Vector3 direction = new Vector3((float) point.x - baseLink.transform.position.x, 
                                            (float) point.y - baseLink.transform.position.y, 
                                            (float) point.z - baseLink.transform.position.z);

            Quaternion orientation = new Quaternion((float) orientations[i].x, (float) orientations[i].y, 
                                            (float) orientations[i].z, (float) orientations[i].w);
            
            // rotating the point so that the baseLink's y rotation is 0
            Quaternion rotation = Quaternion.Euler(0, -baseLink.transform.eulerAngles.y, 0); // Create a rotation quaternion around the pivotPoint
            Vector3 rotatedDirection = rotation * direction; // Rotate the direction vector

            Quaternion rotatedOrientation = rotation * orientation;

            trajectory.Add((rotatedDirection, rotatedOrientation));
        }

        trajectories.Add(trajectory);

        if (trajectories.Count == 1) {
            trainAndTest.UpdateText();
        }

        if (buttonState == 1)
            ShowLine(trajectory);
    }


    public void ShowLine(List<(Vector3, Quaternion)> trajectory) {
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
            Vector3 rotatedPoint = baseLink.transform.position + rotation * trajectory[i].Item1;

            lr.SetPosition(i, rotatedPoint);

            Quaternion rotatedOrientation = rotation * trajectory[i].Item2;
            
                // create an arrow
            if (i % 3 == 0) {
                GameObject arrow = Instantiate(orientationArrowPrefab);
                arrow.transform.position = rotatedPoint;
                arrow.transform.rotation = rotatedOrientation;
                arrow.transform.parent = line.transform;
                orientationArrows.Add(arrow);
            }
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

        foreach (var arrow in orientationArrows) {
            Destroy(arrow);
        }
        orientationArrows.Clear();
        
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
