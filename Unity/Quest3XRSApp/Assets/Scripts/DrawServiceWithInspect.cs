using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;
using UnityEngine.UI;

public class DrawServiceWithInspect : MonoBehaviour
{
    public OVRHand hand;
    public LineRenderer lineRenderer;
    public Text InfoText;
    private Color lineColor = Color.magenta;
    private float lineWidth = 0.015f;
    private List<Vector3> targetPoints = new List<Vector3>();
    private State state;

    public GameObject bar;
    public GameObject sliderPosition;
    public GameObject loadingText;
    public GameObject playButton;
    public GameObject pauseButton;
    public Button backButton;
    public Button nextButton;
    public Button redrawButton;
    public Button executeButton;
    
    // public Text ButtonText;
    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;

    public TrainAndTest trainAndTest;



    // Start is called before the first frame update
    void Start()
    {
        // Set line properties
        lineRenderer.startWidth = lineWidth;
        lineRenderer.endWidth = lineWidth;
        lineRenderer.material = new Material(Shader.Find("Sprites/Default"));
        lineRenderer.startColor = lineColor;
        lineRenderer.endColor = lineColor;
        ResetDrawingState();
    }
    IEnumerator DrawTrajectory(float interval)
    {
        InfoText.text = "Drawing trajectory";
        int numberOfPoints = lineRenderer.positionCount;
        int totalIter = 0;
        bool isFirstPart = true;
        while (true)
        {
            totalIter++;
            
            if (totalIter == 30 || hand.GetFingerIsPinching(OVRHand.HandFinger.Index))
            {
                isFirstPart = false;
            }

            if (numberOfPoints % 5 == 0 && targetPoints.Count != 0)
            {
                // if (targetPoints.Count != 0 && Vector3.Distance(targetPoints[targetPoints.Count - 1], hand.PointerPose.position) < threshold)
                if (!hand.GetFingerIsPinching(OVRHand.HandFinger.Index) && !isFirstPart)
                {
                    UpdateDrawingState();
                    break;
                }
                targetPoints.Add(hand.PointerPose.position);
            }

            numberOfPoints++;
            lineRenderer.positionCount = numberOfPoints;
            lineRenderer.SetPosition(numberOfPoints - 1,  hand.PointerPose.position);
            

            yield return new WaitForSeconds(interval);
        }
    }
    


    /*
    IEnumerator CountdownCoroutine()
    {
        int currentTime = 3;

        while (currentTime > 0)
        {
            currentTime -= 1; // Decrease the current time by 1 second
            InfoText.text = currentTime.ToString();
            yield return new WaitForSeconds(1f); // Wait for 1 second
        }

        StartCoroutine(DrawTrajectory(0.05f));
        

    }
    */
    
    private void TriggerPublishMethod()
    {
        Vector3[] poses = targetPoints.ToArray();
        PlanRequestGeneratorWithPoses.GenerateRequest(poses);
    } 

    public void UpdateDrawingState(bool finalized = false)
    {
        switch (state)
        {
            case State.Initial:
                state = State.DrawTrajectory;
                
                // button.interactable = false;

                lineRenderer.positionCount = 0;
                
                // StartCoroutine(CountdownCoroutine());
                StartCoroutine(DrawTrajectory(0.05f));

                handleMenu(true);

                break;
            case State.DrawTrajectory:
                state = State.WaitingForExecution;
                executeButton.interactable = true;
                // InfoText.text = "Trajectory Recorded";
                // ButtonText.text = "Execute the trajectory";
                // button.interactable = true;
                break;
            case State.WaitingForExecution:
                // enters here when execute trajectory is pressed
                state = State.WaitingForResponse;
                TriggerPublishMethod();
                // InfoText.text = "Waiting for calculations";
                // button.interactable = false;
                break;
            case State.WaitingForResponse:
                state = State.ExecuteTrajectory;
                // InfoText.text = "Executing Trajectory";
                // button.interactable = false;
                break;
            case  State.ExecuteTrajectory:
                state = State.InspectTrajectory;
                // ButtonText.text = "Record a trajectory";
                // button.interactable = true;
                // InfoText.text = "";
                
                targetPoints.Clear();
                handleMenu(false);
                redrawButton.interactable = true;
                executeButton.interactable = false;
                break;
            case State.InspectTrajectory:
                if (finalized) {
                    ResetDrawingState();
                }
                else {
                    // redraw from current waypoint is clicked
                    state = State.DrawTrajectory;
                    
                    
                    handleMenu(true);
                    redrawButton.interactable = false;
                    executeButton.interactable = false;

                    // update line renderer
                    double remainingPointsRate = (double) PlanRequestGeneratorWithPoses.currentIndexPointer  / PlanRequestGeneratorWithPoses.previousPoints.Count;
                    int remainingPoints = (int)Math.Floor(lineRenderer.positionCount * remainingPointsRate);
                    Vector3[] newPositions = new Vector3[remainingPoints];
                    for (int i = 0; i < remainingPoints; i++)
                    {
                        newPositions[i] = lineRenderer.GetPosition(i);
                    }

                    lineRenderer.positionCount = remainingPoints;
                    lineRenderer.SetPositions(newPositions);
                    PlanRequestGeneratorWithPoses.previousPoints =
                        PlanRequestGeneratorWithPoses.previousPoints.GetRange(0,
                            PlanRequestGeneratorWithPoses.currentIndexPointer);
                
                    StartCoroutine(DrawTrajectory(0.05f));
                }
                break;
        }
        
    }

    public void ResetDrawingState()
    {
        state = State.Initial;
        PlanRequestGeneratorWithPoses.ResetGenerator();
        lineRenderer.positionCount = 0;

        // set the buttons to be non-interactable in the initial state
        playButton.GetComponent<Button>().interactable = false;
        pauseButton.SetActive(false);
        backButton.interactable = false;
        nextButton.interactable = false;
        redrawButton.interactable = false;
        executeButton.interactable = false;

        // also reset the slider handle position to middle
        Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
        currRectTransform.x = 0;
        sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
    }

    private void handleMenu(bool loading)
    {
        bar.SetActive(!loading);
        loadingText.SetActive(loading);
        PlanRequestGeneratorWithPoses.PrevRecordedTrajectories.showTrajectoriesinMainMenu.interactable = !loading;
        

        backButton.interactable = !loading;

        if (!loading) {
            // set slider position to end of bar
            Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
            currRectTransform.x = bar.GetComponent<RectTransform>().sizeDelta.x / 2;
            sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
        }
    
    }

    private enum State
    {
        Initial,
        DrawTrajectory,
        WaitingForExecution,
        WaitingForResponse,
        ExecuteTrajectory,
        InspectTrajectory
    }

    public void SendTrainingData()
    {
        trainAndTest.SendTrainingData(PlanRequestGeneratorWithPoses.previousPoints);
        PlanRequestGeneratorWithPoses.ResetGenerator();
        UpdateDrawingState(true);
    }


}