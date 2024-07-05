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

    public DrawServiceRealTime DrawServiceRealTime;
    public RealRobotCommunication RealRobotCommunication;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;
    public PrevRecordedTrajectories PrevRecordedTrajectories;
    private Queue<double[]> requestQueue = new Queue<double[]>();
    private bool waitingForResponse = false;
    public List<double[]> previousPoints = new List<double[]>();
    public List<Vector3> previousPoses = new List<Vector3>();
    public List<Quaternion> previousOrientations = new List<Quaternion>();
    
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

    public GameObject executeOnRealRobotButton;


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

    public void AddRequestToQueue(double[] poseInfo)
    {
        Debug.LogWarning("target added " + poseInfo);
        requestQueue.Enqueue(poseInfo);
    } 
    private IEnumerator ProcessRequests()
    {
        while (true)
        {
            if (requestQueue.Count > 0 && !waitingForResponse)
            {
                waitingForResponse = true;
                double[] poseInfo = requestQueue.Dequeue();
                Vector3 pose = new Vector3((float)poseInfo[0], (float)poseInfo[1], (float)poseInfo[2]);
                Quaternion orientation = new Quaternion((float)poseInfo[3], (float)poseInfo[4], (float)poseInfo[5], (float)poseInfo[6]);
                Debug.LogWarning("target popped " + pose);
                GenerateRequest(pose, orientation);
            }
            yield return new WaitForSeconds(0.1f);
        }
        
    }

    private void GenerateRequest(Vector3 pose, Quaternion orientation)
    {
        var request = new PlannerServiceRequest();
        request.request_type = "realTime";
        request.joints_input = jointConfig;

        previousPoses.Add(pose);

        // orientation = Quaternion.Euler(180, 0,0);
        previousOrientations.Add(orientation);
        
        PoseMsg[] pose_list = new PoseMsg[1];
        pose_list[0] = HelperFunctions.GeneratePoseMsg(pose, orientation);
        request.pose_list = pose_list;
        Debug.LogWarning("Request Sent");
        Debug.LogWarning(request);
        TrajectoryPlanner.SendRequest(request);
    } 
    
    public void ProcessResponse(PlannerServiceResponse response)
    {

        if (response.output_msg == "Timeout")
        {
            if (DrawServiceRealTime.isStateDrawTrajectory())
                DrawServiceRealTime.UpdateDrawingState(true);
        }
        else {
            jointConfig = response.trajectories[0].joint_trajectory.points.Last().positions;
            StartCoroutine(ExecuteTrajectories(response));
        }

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
                    
                    previousPoints.Add(HelperFunctions.GetJointAngles(t));
                }

                HelperFunctions.SetJointAngles(t);
               
                yield return new WaitForSeconds(k_JointAssignmentWait);
                waitingForResponse = false;
            }
        }
        
    }
    
    IEnumerator ExecuteTrajectory(double[] trajectory)
    {
        HelperFunctions.SetSliders(trajectory);
        yield return new WaitForSeconds(k_JointAssignmentWait);
    }
    
    
    

    public void ResetGenerator(bool addToTrainingSet = false)
    {

        if (addToTrainingSet) {
            // store the current trajectory
            if (previousPoints.Count > 0) {
                PrevRecordedTrajectories.AddTrajectory(previousPoses);
                executeOnRealRobotButton.SetActive(true);
            }

            // handle show-traj buttons
            PrevRecordedTrajectories.HandleButtons();
        }


        //why?
        jointConfig = HelperFunctions.CurrentJointConfig();

        waitingForResponse = false;
        requestQueue.Clear();

        previousPoints.Clear();
        previousPoses.Clear();
        previousOrientations.Clear();

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

        UpdateSliderHandle();
            
        StartCoroutine(ExecuteTrajectory(previousPoints[currentIndexPointer]));
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

        UpdateSliderHandle();

        StartCoroutine(ExecuteTrajectory(previousPoints[currentIndexPointer]));

    }

    // coroutine to play the rest of the trajectory
    IEnumerator PlayRestOfTrajectoryCoroutine() {

        playButton.SetActive(false);
        pauseButton.SetActive(true);

        backButton.interactable = false;
        nextButton.interactable = false;

        for (; currentIndexPointer < previousPoints.Count - 1; currentIndexPointer++){

            StartCoroutine(ExecuteTrajectory(previousPoints[currentIndexPointer+1]));

            UpdateSliderHandle();

            yield return new WaitForSeconds(k_JointAssignmentWait);
        }

        UpdateSliderHandle();

        playButton.SetActive(true);
        playButton.GetComponent<Button>().interactable = false;
        pauseButton.SetActive(false);
        backButton.interactable = true;
        nextButton.interactable = false;

    }

    public void PlayRestOfTrajectory() {
        StartCoroutine(PlayRestOfTrajectoryCoroutine());
    }

    public void PauseTrajectory() {
        StopAllCoroutines();
        UpdateSliderHandle();
        playButton.SetActive(true);
        pauseButton.SetActive(false);

        if (currentIndexPointer < previousPoints.Count - 1) {
            playButton.GetComponent<Button>().interactable = true;
            nextButton.interactable = true;
        }
        else {
            playButton.GetComponent<Button>().interactable = false;
        }
        backButton.interactable = true;
    }




    public void SetCurrentIndexPointer()
    {
        currentIndexPointer = previousPoints.Count - 1;
    }

    public void EmptyQueue()
    {
        requestQueue.Clear();
    }

    public bool isWaitingForResponse()
    {
        return waitingForResponse;
    }

    private void UpdateSliderHandle() {
        Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
        currRectTransform.x = 
            (bar.GetComponent<RectTransform>().sizeDelta.x) * (currentIndexPointer / ((float)previousPoints.Count - 1)) - bar.GetComponent<RectTransform>().sizeDelta.x / 2;
        sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
    }
    
    
    

}