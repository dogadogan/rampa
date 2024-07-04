using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Unity.VisualScripting;
using UnityEngine.Serialization;

public class DrawServiceWithInspect : MonoBehaviour
{
    public OVRHand hand;
    public LineRenderer lineRenderer;
    private Color lineColor = Color.magenta;
    private float lineWidth = 0.015f;
    private List<Vector3> targetPoints = new List<Vector3>();
    private List<Quaternion> targetOrientations = new List<Quaternion>();
    private Vector3 trajectorySamplePoints_point1;
    private Vector3 trajectorySamplePoints_point2;
    private State state;


    public Toggle recordOrientationToggle;
    public HandOrientation handOrientation;
    public OVRInput.Controller controller;
    public GameObject bar;
    public GameObject sliderPosition;
    public GameObject loadingText;
    public GameObject playButton;
    public GameObject pauseButton;
    public Button backButton;
    public Button nextButton;
    public Button redrawButton;
    public GameObject executeButton;
    public Button addToTrainingButton;
    public GameObject anotherTrajectoryButton;
    public GameObject executeOnRealRobotButton;

    


    public TMP_Text debugText;
    
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
        
        anotherTrajectoryButton.SetActive(false);
        executeOnRealRobotButton.SetActive(false);
        
        trajectorySamplePoints_point1 = new Vector3(0, 0, 0);
        trajectorySamplePoints_point2 = new Vector3(0, 0, 0);

        ResetDrawingState();
    }
    IEnumerator DrawTrajectory(float interval)
    {
        int numberOfPoints = lineRenderer.positionCount;
        bool isFirstPart = true;
        loadingText.GetComponent<TMP_Text>().text = "pinch to start drawing";
        while (true)
        {
            if (!recordOrientationToggle.isOn) {
                if (hand.GetFingerIsPinching(OVRHand.HandFinger.Index))
                {
        
                    isFirstPart = false;
                    loadingText.GetComponent<TMP_Text>().text = "drawing trajectory";
                }
            }
            else {
                if (OVRInput.Get(OVRInput.Button.One))
                {
                    isFirstPart = false;
                    loadingText.GetComponent<TMP_Text>().text = "drawing trajectory";
                    handOrientation.ShowIndicator(true);
                }
            }
            if (numberOfPoints % 5 == 0) // add new point to trajectory every 5 points
            {        
                
                if (!recordOrientationToggle.isOn) {
                    if (!hand.GetFingerIsPinching(OVRHand.HandFinger.Index) && !isFirstPart)
                    {
                        UpdateDrawingState();
                        break;
                    }
                }
                else {
                    if (!OVRInput.Get(OVRInput.Button.One) && !isFirstPart)
                    {
                        handOrientation.ShowIndicator(false);
                        UpdateDrawingState();
                        break;
                    }
                }

                if (!isFirstPart) {
                    
                    if (recordOrientationToggle.isOn) {
                        targetOrientations.Add(handOrientation.GetRotation());
                        targetPoints.Add(OVRInput.GetLocalControllerPosition(controller));
                    }
                    else {
                        targetOrientations.Add(Quaternion.Euler(90,0,0));
                        targetPoints.Add(hand.PointerPose.position);
                    }
                }
            }
            if (!isFirstPart) // update lineRenderer and handOrientation indicator
            { 
                numberOfPoints++;
                lineRenderer.positionCount = numberOfPoints;
                if (!recordOrientationToggle.isOn) {
                    lineRenderer.SetPosition(numberOfPoints - 1,  hand.PointerPose.position);
                }
                else {
                    lineRenderer.SetPosition(numberOfPoints - 1, OVRInput.GetLocalControllerPosition(controller));
                }
                if (recordOrientationToggle.isOn && numberOfPoints > 1) {
                    if (Vector3.Distance(trajectorySamplePoints_point1, lineRenderer.GetPosition(numberOfPoints - 1)) > 0.007) {
                        trajectorySamplePoints_point2 = trajectorySamplePoints_point1;
                        trajectorySamplePoints_point1 = lineRenderer.GetPosition(numberOfPoints - 1);
                        handOrientation.UpdateHandOrientationIndicator(trajectorySamplePoints_point1, trajectorySamplePoints_point2);
                    } 
                }
            }
            yield return new WaitForSeconds(interval);
        }
    }
    

    private void TriggerPublishMethod()
    {
        PlanRequestGeneratorWithPoses.GenerateRequest(targetPoints, targetOrientations);
    } 

    public void UpdateDrawingState(bool finalized = false)
    {
        switch (state)
        {
            case State.Initial:
                state = State.DrawTrajectory;

                lineRenderer.positionCount = 0;
                handleMenu(true);

                anotherTrajectoryButton.SetActive(false);
                executeOnRealRobotButton.SetActive(false);
                executeButton.SetActive(true);

                StartCoroutine(DrawTrajectory(0.05f));
                break;

            case State.DrawTrajectory:
                state = State.WaitingForExecution;
                handOrientation.ShowIndicator(false);
                executeButton.GetComponent<Button>().interactable = true;
                PlanRequestGeneratorWithPoses.PrevRecordedTrajectories.SetInteractable(true);
                loadingText.GetComponent<TMP_Text>().text = "trajectory recorded";
                break;

            case State.WaitingForExecution:
                // enters here when execute trajectory is pressed
                state = State.WaitingForResponse;
                executeButton.GetComponent<Button>().interactable = false;
                loadingText.GetComponent<TMP_Text>().text = "waiting for response";
                TriggerPublishMethod();
                break;

            case State.WaitingForResponse:
                if (finalized) {
                    // no solution found
                    loadingText.GetComponent<TMP_Text>().text = "no solution found";
                    ResetDrawingState(true);
                }
                else {
                    state = State.ExecuteTrajectory;
                }
                break;

            case  State.ExecuteTrajectory:
                state = State.InspectTrajectory;

                PlanRequestGeneratorWithPoses.SetCurrentIndexPointer();
                targetPoints.Clear();
                handleMenu(false);
                redrawButton.interactable = true;
                break;

            case State.InspectTrajectory:
                if (finalized) {
                    // add to training is clicked
                    ResetDrawingState(true);
                }
                else {
                    // redraw from current waypoint is clicked
                    state = State.DrawTrajectory;

                    
                    handleMenu(true);
                    redrawButton.interactable = false;

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

                    PlanRequestGeneratorWithPoses.previousPoses =
                        PlanRequestGeneratorWithPoses.previousPoses.GetRange(0,
                            PlanRequestGeneratorWithPoses.currentIndexPointer);
                
                    StartCoroutine(DrawTrajectory(0.05f));
                }
                break;
        }
        
    }

    public void ResetDrawingState(bool anotherTrajectory = false)
    {
        state = State.Initial;
        
        PlanRequestGeneratorWithPoses.ResetGenerator();

        lineRenderer.positionCount = 0;

        StopAllCoroutines();
        targetPoints.Clear();


        // set the buttons to be non-interactable in the initial state
        playButton.GetComponent<Button>().interactable = false;
        pauseButton.SetActive(false);
        backButton.interactable = false;
        nextButton.interactable = false;
        redrawButton.interactable = false;
        executeButton.GetComponent<Button>().interactable = false;
        addToTrainingButton.interactable = false;
        PlanRequestGeneratorWithPoses.PrevRecordedTrajectories.SetInteractable(true);

        anotherTrajectoryButton.SetActive(anotherTrajectory);

        // do not set active if no solution found 
        

        executeButton.SetActive(!anotherTrajectory);

        

        // also reset the slider handle position to middle
        Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
        currRectTransform.x = 0;
        sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
    }

    private void handleMenu(bool loading)
    {
        bar.SetActive(!loading);

        backButton.interactable = !loading;

        loadingText.SetActive(loading);

        PlanRequestGeneratorWithPoses.PrevRecordedTrajectories.SetInteractable(!loading);

        addToTrainingButton.interactable = !loading;

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
        trainAndTest.SendTrainingData(PlanRequestGeneratorWithPoses.previousPoses, PlanRequestGeneratorWithPoses.previousOrientations);
        PlanRequestGeneratorWithPoses.ResetGenerator(true);
        UpdateDrawingState(true);
    }


}