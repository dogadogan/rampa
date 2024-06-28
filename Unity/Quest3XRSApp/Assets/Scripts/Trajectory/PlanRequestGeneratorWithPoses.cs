using System.Collections;
using System.Collections.Generic;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.Ur10Mover;
using UnityEngine;
using UnityEngine.UI;

public class PlanRequestGeneratorWithPoses : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.1f;
    public DrawServiceWithInspect drawService;
    public RealRobotCommunication realRobotCommunication;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;

    // new instance variables for inspecting trajectory
    public PrevRecordedTrajectories PrevRecordedTrajectories;

    public List<double[]> previousPoints = new List<double[]>();

    public List<Vector3> previousPoses = new List<Vector3>();

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
    
    
    public void GenerateRequest(List<Vector3> poseList)
    {
        var request = new PlannerServiceRequest();

        for (int i = 0; i < poseList.Count; i++)
        {
            previousPoses.Add(poseList[i]);
        }

        Vector3[] poses = poseList.ToArray();

        request.request_type = "poses";
        request.joints_input =  HelperFunctions.CurrentJointConfig();

        PoseMsg[] pose_list = new PoseMsg[poses.Length];
        for (int i = 0; i < poses.Length; i++)
        {
            pose_list[i] = HelperFunctions.GeneratePoseMsg(poses[i]);
        }
        request.pose_list = pose_list;
        TrajectoryPlanner.SendRequest(request);
    } 
    
    public void ProcessResponse(PlannerServiceResponse response, bool fromTraining = false)
    {

        if (response.output_msg == "Timeout") {
            drawService.UpdateDrawingState(true);
        }
        else {
            
            if (fromTraining) {
                StartCoroutine(ExecuteTrajectories(response, true));
            }
            else {
                drawService.UpdateDrawingState();
                StartCoroutine(ExecuteTrajectories(response));
            }

            
            
        }
    }
    
    
    IEnumerator ExecuteTrajectories(PlannerServiceResponse response, bool fromTraining = false)
    {

        if (response.trajectories != null)
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
                    previousPoints.Add( HelperFunctions.GetJointAngles(t));
                }

                    HelperFunctions.SetJointAngles(t);
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
            }
            
            
        }
        if (fromTraining) {
            drawService.trainAndTest.SetAllButtonsInteractable(true);
        }
        else {
            drawService.UpdateDrawingState();
        }
    }


    IEnumerator ExecuteTrajectory(double[] trajectory)
    {
        HelperFunctions.SetSliders(trajectory);
        yield return new WaitForSeconds(k_JointAssignmentWait);
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

        for (; currentIndexPointer < previousPoints.Count - 1 ; currentIndexPointer++){

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
       
        // if stopCoroutine(PlayRestOfTrajectoryCoroutine() is called, continues to play the rest of the trajectory, why?
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
        // jointConfig = HelperFunctions.CurrentJointConfig();

        // newly added, isn't it needed?
        previousPoints.Clear();
        previousPoses.Clear();

        currentIndexPointer = 0;

    }

    public void SetCurrentIndexPointer()
    {
        currentIndexPointer = previousPoints.Count - 1;
    }
    
    private void UpdateSliderHandle() {
        Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
        currRectTransform.x = 
            (bar.GetComponent<RectTransform>().sizeDelta.x) * (currentIndexPointer / ((float)previousPoints.Count - 1)) - bar.GetComponent<RectTransform>().sizeDelta.x / 2;
        sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
    }


}