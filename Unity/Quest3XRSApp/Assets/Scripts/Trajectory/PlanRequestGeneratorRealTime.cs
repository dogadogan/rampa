using System.Collections;
using System.Collections.Generic;
using System.Linq;
using RosMessageTypes.Ur10Mover;
using UnityEngine;
using RosMessageTypes.Geometry;
using UnityEngine.UI;
using TMPro;

public class PlanRequestGeneratorRealTime : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.05f;
    public Text text;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;
    public PrevRecordedTrajectories PrevRecordedTrajectories;
    private Queue<Vector3> requestQueue = new Queue<Vector3>();
    private bool waitingForResponse = false;
    public List<( Vector3 position, double[] jointAngles)> previousPoints = new List<( Vector3 position, double[] jointAngles)>();
    
    private double[] jointConfig;
    public int currentIndexPointer = 0;
    public Button backButton;
    public Button nextButton;

    // bar to show the current position while inspecting trajectory
    public GameObject sliderPosition;
    public GameObject bar;

    // buttons for play/pause trajectory
    public GameObject playButton;
    public GameObject pauseButton;

    // no need
    /*
    public Button drawButton;
    public Button trainButton;
    public Button testButton;
    */

    public void Start()
    {
        jointConfig = HelperFunctions.CurrentJointConfig();
        StartCoroutine(ProcessRequests());

    }

    public void AddRequestToQueue(Vector3 target)
    {
        Debug.LogWarning("target added " + target);
        requestQueue.Enqueue(target);
    } 
    private IEnumerator ProcessRequests()
    {
        while (true)
        {
            if (requestQueue.Count > 0 && !waitingForResponse)
            {
                waitingForResponse = true;
                Vector3 pose = requestQueue.Dequeue();
                Debug.LogWarning("target popped " + pose);
                GenerateRequest(pose);
            }
            yield return new WaitForSeconds(0.1f);
        }
        
    }

    private void GenerateRequest(Vector3 pose)
    {
        var request = new PlannerServiceRequest();
        request.request_type = "realTime";
        request.joints_input = jointConfig;
        
        PoseMsg[] pose_list = new PoseMsg[1];
        pose_list[0] = HelperFunctions.GeneratePoseMsg(pose);
        request.pose_list = pose_list;
        Debug.LogWarning("Request Sent");
        Debug.LogWarning(request);
        TrajectoryPlanner.SendRequest(request);
    } 
    
    public void ProcessResponse(PlannerServiceResponse response)
    {
        jointConfig = response.trajectories[0].joint_trajectory.points.Last().positions;
        StartCoroutine(ExecuteTrajectories(response));

    }
    
    IEnumerator ExecuteTrajectories(PlannerServiceResponse response)
    {


        // For every trajectory plan returned
        for (var poseIndex = 0; poseIndex < response.trajectories.Length; poseIndex++)
        {
            var lastPoint = response.trajectories[poseIndex].joint_trajectory.points.Last();
            // For every robot pose in trajectory plan
            foreach (var t in response.trajectories[poseIndex].joint_trajectory.points)
            {
                if (t == lastPoint)
                {
                    var lastPointInfo = response.pose_list.Last().position;
                    var point = new Vector3((float)lastPointInfo.x, (float)lastPointInfo.y, (float)lastPointInfo.z);
                    
                    previousPoints.Add((point, HelperFunctions.GetJointAngles(t)));
                }

                HelperFunctions.SetJointAngles(t);
               
                yield return new WaitForSeconds(k_JointAssignmentWait);
                waitingForResponse = false;
            }
        }
        
        text.text = "Ready for another execution";
    }
    
    IEnumerator ExecuteTrajectory(double[] trajectory)
    {
        HelperFunctions.SetSliders(trajectory);
        yield return new WaitForSeconds(k_JointAssignmentWait);
    }
    
    
    

    public void ResetGenerator()
    {

        // store the current trajectory
        if (previousPoints.Count > 0)
            PrevRecordedTrajectories.AddTrajectory(previousPoints);

        // handle show-traj buttons
        PrevRecordedTrajectories.HandleButtons();

        //why?
        jointConfig = HelperFunctions.CurrentJointConfig();

        waitingForResponse = false;
        requestQueue.Clear();
        previousPoints.Clear();
        currentIndexPointer = 0;

    }


    public void GetOnePointBack()
    {
        
        currentIndexPointer -= 1;
        
        nextButton.interactable = true;
        playButton.GetComponent<Button>().interactable = true;

        if (currentIndexPointer == 0)
        {
            backButton.interactable = false;
        }

        UpdateSliderHandle(false);
            
        StartCoroutine(ExecuteTrajectory(previousPoints[currentIndexPointer].jointAngles));
    }
    
    public void GetOnePointNext()
    {
        currentIndexPointer += 1;
        backButton.interactable = true;
        if (currentIndexPointer == previousPoints.Count - 1)
        {
            playButton.GetComponent<Button>().interactable = false;
            nextButton.interactable = false;
        }

        UpdateSliderHandle(true);

        StartCoroutine(ExecuteTrajectory(previousPoints[currentIndexPointer].jointAngles));

    }

    // coroutine to play the rest of the trajectory
    IEnumerator PlayRestOfTrajectoryCoroutine() {

        playButton.SetActive(false);
        pauseButton.SetActive(true);

        backButton.interactable = false;
        nextButton.interactable = false;

        for (; currentIndexPointer < previousPoints.Count ; currentIndexPointer++){

            StartCoroutine(ExecuteTrajectory(previousPoints[currentIndexPointer].jointAngles));
            yield return new WaitForSeconds(k_JointAssignmentWait);
        }

        playButton.SetActive(true);
        playButton.GetComponent<Button>().interactable = false;
        pauseButton.SetActive(false);

    }

    public void PlayRestOfTrajectory() {
        StartCoroutine(PlayRestOfTrajectoryCoroutine());
    }

    public void PauseTrajectory() {
        StopCoroutine(PlayRestOfTrajectoryCoroutine());
        playButton.SetActive(true);
        pauseButton.SetActive(false);

        if (currentIndexPointer < previousPoints.Count - 1) {
            nextButton.interactable = true;
        }
        backButton.interactable = true;
    }




    public void SetCurrentIndexPointer()
    {
        currentIndexPointer = previousPoints.Count - 1;
    }

    private void UpdateSliderHandle(bool forward) {
        Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
        float offset = bar.GetComponent<RectTransform>().sizeDelta.x / (previousPoints.Count - 1);
        if (forward)
            currRectTransform.x += offset;
        else
            currRectTransform.x -= offset;
        sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
    }
    
    
    

}