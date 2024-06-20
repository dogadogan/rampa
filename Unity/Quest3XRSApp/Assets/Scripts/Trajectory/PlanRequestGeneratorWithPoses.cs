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
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;


    // new instance variables for inspecting trajectory
    public PrevRecordedTrajectories PrevRecordedTrajectories;

    public List<( Vector3 position, double[] jointAngles)> previousPoints = new List<( Vector3 position, double[] jointAngles)>();

    public int currentIndexPointer = 0;
    public Button backButton;
    public Button nextButton;

    // bar to show the current position while inspecting trajectory
    public GameObject sliderPosition;
    public GameObject bar;

    // buttons for play/pause trajectory
    public GameObject playButton;
    public GameObject pauseButton;
    
    
    public void GenerateRequest(Vector3[] poses)
    {
        var request = new PlannerServiceRequest();
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
    
    public void ProcessResponse(PlannerServiceResponse response)
    {
        drawService.UpdateDrawingState();
        StartCoroutine(ExecuteTrajectories(response));
    }
    
    
    IEnumerator ExecuteTrajectories(PlannerServiceResponse response)
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
                    var lastPointInfo = response.pose_list.Last().position;
                    var point = new Vector3((float)lastPointInfo.x, (float)lastPointInfo.y, (float)lastPointInfo.z);
                    
                    previousPoints.Add((point, HelperFunctions.GetJointAngles(t)));
                }

                    HelperFunctions.SetJointAngles(t);
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
            }
            
            
        }
        drawService.UpdateDrawingState();
        HelperFunctions.openPopUp();
        
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



        public void ResetGenerator()
    {
        // store the current trajectory
        if (previousPoints.Count > 0)
            PrevRecordedTrajectories.AddTrajectory(previousPoints);

        // handle show-traj buttons
        PrevRecordedTrajectories.HandleButtons();

        //why?
        // jointConfig = HelperFunctions.CurrentJointConfig();

        currentIndexPointer = 0;

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