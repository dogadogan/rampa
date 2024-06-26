using System.Collections;
using UnityEngine;
using System;
using UnityEngine.UI;
using TMPro;

public class DrawServiceRealTime: MonoBehaviour
{
    public OVRHand hand;
    public LineRenderer lineRenderer;
    private Color lineColor = Color.magenta;
    private float lineWidth = 0.015f;
    public PlanRequestGeneratorRealTime planRequestGeneratorRealTime;
    public TrainAndTest trainAndTest;
    public GameObject bar;
    public GameObject sliderPosition;
    public GameObject loadingText;
    public GameObject playButton;
    public GameObject pauseButton;
    public Button backButton;
    public Button nextButton;
    public Button redrawButton;
    public Button addToTrainingButton;
    public GameObject anotherTrajectoryButton;
    public GameObject executeOnRealRobotButton;

    public TMP_Text debugText;

    private State state;
    // private float threshold = 0.01f;

    private int WAY_POINT_FREQ = 10;



// TODO - record hand orientation as well


    private void Start() {
        
        lineRenderer.startWidth = lineWidth;
        lineRenderer.endWidth = lineWidth;
        lineRenderer.material = new Material(Shader.Find("Sprites/Default"));
        lineRenderer.startColor = lineColor;
        lineRenderer.endColor = lineColor;
        

        loadingText.GetComponent<TMP_Text>().text = "pinch to start drawing";

        anotherTrajectoryButton.SetActive(false);
        executeOnRealRobotButton.SetActive(false);

        ResetDrawingState();
    }


    IEnumerator DrawTrajectory(float interval)
    {
        int numberOfPoints = lineRenderer.positionCount;
        bool isFirstPart = true;
        loadingText.GetComponent<TMP_Text>().text = "pinch to start drawing";

        while (true)
        {

            if (hand.GetFingerIsPinching(OVRHand.HandFinger.Index))
            {
                isFirstPart = false;
                loadingText.GetComponent<TMP_Text>().text = "drawing trajectory";
            }
            if (numberOfPoints % 5 == 0 && numberOfPoints != 0) 
            {
            
                if (!hand.GetFingerIsPinching(OVRHand.HandFinger.Index) && !isFirstPart)
                {
                    
                    if (!planRequestGeneratorRealTime.isWaitingForResponse()) {
                        UpdateDrawingState();
                        break;
                    }
                    
                }

            }
            // do not add points to the line renderer if isFirstPart is true
            if (numberOfPoints % WAY_POINT_FREQ == 0 && !isFirstPart)
            {
                planRequestGeneratorRealTime.AddRequestToQueue(hand.PointerPose.position);
            }
            
            if (!isFirstPart) {
                numberOfPoints++;
                lineRenderer.positionCount = numberOfPoints;
                lineRenderer.SetPosition(numberOfPoints - 1,  hand.PointerPose.position);
            }
    
            yield return new WaitForSeconds(interval);
        }
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
            
                StartCoroutine(DrawTrajectory(0.05f));
                break;

            case State.DrawTrajectory:
                if (finalized) {
                    loadingText.GetComponent<TMP_Text>().text = "no solution found";
                    ResetDrawingState(true);
                }
                else {
                    state = State.InspectTrajectory;
                    planRequestGeneratorRealTime.SetCurrentIndexPointer();
                    handleMenu(false);
                }
                
                
                break;
            case State.InspectTrajectory:
                if (finalized)
                {
                    // add to training is clicked
                    ResetDrawingState(true);
                }
                else
                {

                    // enters here when the user clicks on "redraw from current waypoint" button
                    state = State.DrawTrajectory;
                    
                    handleMenu(true);
                    redrawButton.interactable = false;

                    //empty queue
                    planRequestGeneratorRealTime.EmptyQueue();
                    /*
                    double remainingPointsRate = (double) planRequestGeneratorRealTime.currentIndexPointer  / planRequestGeneratorRealTime.previousPoints.Count;
                    int remainingPoints = (int)Math.Floor(lineRenderer.positionCount * remainingPointsRate);    
                    */
                    int remainingPoints = planRequestGeneratorRealTime.currentIndexPointer * WAY_POINT_FREQ;
                    Vector3[] newPositions = new Vector3[remainingPoints];
                    for (int i = 0; i < remainingPoints; i++)
                    {
                        newPositions[i] = lineRenderer.GetPosition(i);
                    }

                    lineRenderer.positionCount = remainingPoints;
                    lineRenderer.SetPositions(newPositions);
                    planRequestGeneratorRealTime.previousPoints =
                        planRequestGeneratorRealTime.previousPoints.GetRange(0,
                            planRequestGeneratorRealTime.currentIndexPointer);

                    planRequestGeneratorRealTime.previousPoses =
                        planRequestGeneratorRealTime.previousPoses.GetRange(0,
                            planRequestGeneratorRealTime.currentIndexPointer);

                    StartCoroutine(DrawTrajectory(0.05f));
                    
                }

                break;
        }
        
    }


    public void ResetDrawingState(bool anotherTrajectory = false)
    {
        state = State.Initial;

        planRequestGeneratorRealTime.ResetGenerator();
        lineRenderer.positionCount = 0;
        

        StopAllCoroutines();

        // set the buttons to be non-interactable in the initial state
        playButton.GetComponent<Button>().interactable = false;
        pauseButton.SetActive(false);
        backButton.interactable = false;
        nextButton.interactable = false;
        redrawButton.interactable = false;
        addToTrainingButton.interactable = false;
        planRequestGeneratorRealTime.PrevRecordedTrajectories.SetInteractable(true);
        
        anotherTrajectoryButton.SetActive(anotherTrajectory);
        


        // also reset the slider handle position to middle
        Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
        currRectTransform.x = 0;
        sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
    }

    public void SendTrainingData()
    {
        trainAndTest.SendTrainingData(planRequestGeneratorRealTime.previousPoses);
        planRequestGeneratorRealTime.ResetGenerator(true);
        UpdateDrawingState(true);
    }
    private enum State
    {
        Initial,
        DrawTrajectory,
        InspectTrajectory
    }


    // handle the bar and the loading text while drawing and inspecting the trajectory
    private void handleMenu(bool loading)
    {
        bar.SetActive(!loading);
        loadingText.SetActive(loading);
        planRequestGeneratorRealTime.PrevRecordedTrajectories.SetInteractable(!loading);
        
        redrawButton.interactable = !loading;
        backButton.interactable = !loading;
        addToTrainingButton.interactable = !loading;

        if (!loading) {
            // set slider position to end of bar
            Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
            currRectTransform.x = bar.GetComponent<RectTransform>().sizeDelta.x / 2;
            sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
        }
    
    }

    public bool isStateDrawTrajectory()
    {
        return state == State.DrawTrajectory;
    }
}