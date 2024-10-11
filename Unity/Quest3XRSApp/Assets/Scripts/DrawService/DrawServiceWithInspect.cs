using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Unity.VisualScripting;
using UnityEngine.Serialization;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using RosMessageTypes.Trajectory;
using RosMessageTypes.Geometry;

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
    public TMP_Dropdown recordOrientationDropdown;
    public HandOrientation handOrientation;
    public OVRInput.Controller controllerOrientation;
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
    public GameObject executeOnRealRobotButton;

    public GameObject collisionWarning;
    private bool collisionDetectedinTrajectory = false;
    public TMP_Text debugText;
    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;

    public TrainAndTest trainAndTest;

    public Button addContextButton;
    public GameObject contextPrefab;
    private GameObject obstacle;
    public Button[] contextMenu;
    private bool isContextual = false;
    public GameObject collisionIndicatorPrefab;
    public List<GameObject> collisionIndicators = new List<GameObject>();

    // Start is called before the first frame update
    void Start()
    {
        // Set line properties
        lineRenderer.startWidth = lineWidth;
        lineRenderer.endWidth = lineWidth;
        lineRenderer.material = new Material(Shader.Find("Sprites/Default"));
        lineRenderer.startColor = lineColor;
        lineRenderer.endColor = lineColor;
        
        executeOnRealRobotButton.SetActive(false);
        
        trajectorySamplePoints_point1 = new Vector3(0, 0, 0);
        trajectorySamplePoints_point2 = new Vector3(0, 0, 0);

        ResetDrawingState();
    }

    public void HandleAddContextButton() {
        if (!isContextual) {
            isContextual = true;
            foreach (var button in contextMenu)
            {
                button.interactable = true;
            }
            obstacle = Instantiate(contextPrefab, new Vector3(0, 0, 0), Quaternion.identity);
            addContextButton.GetComponentInChildren<TMP_Text>().text = "remove context";
        }
        else {
            isContextual = false;
            Destroy(obstacle);
            foreach (var button in contextMenu)
            {
                button.interactable = false;
            }
            addContextButton.GetComponentInChildren<TMP_Text>().text = "add context";
        }
    }

    public void IncXScale() {
        obstacle.transform.localScale += new Vector3(0.02f, 0, 0);
    }
    public void DecXScale() {
        if (obstacle.transform.localScale.x > 0.03f)
            obstacle.transform.localScale -= new Vector3(0.02f, 0, 0);
        
    }
    public void IncYScale() {
        obstacle.transform.localScale += new Vector3(0, 0.02f, 0);
    }
    public void DecYScale() {
        if (obstacle.transform.localScale.y > 0.03f)
            obstacle.transform.localScale -= new Vector3(0, 0.02f, 0);
    }
    public void IncZScale() {
        obstacle.transform.localScale += new Vector3(0, 0, 0.02f);
    }
    public void DecZScale() {
        if (obstacle.transform.localScale.z > 0.03f)
            obstacle.transform.localScale -= new Vector3(0, 0, 0.02f);
    }

    IEnumerator DrawTrajectory(float interval)
    {
        int numberOfPoints = lineRenderer.positionCount;
        bool isFirstPart = true;
        loadingText.GetComponent<TMP_Text>().text = "pinch to start drawing";
        while (true)
        {
            if (recordOrientationDropdown.value == 0) {
                if (hand.GetFingerIsPinching(OVRHand.HandFinger.Index))
                {
                    isFirstPart = false;
                    addContextButton.interactable = false;
                    loadingText.GetComponent<TMP_Text>().text = "drawing trajectory";
                }
            }
            else {
                if (OVRInput.Get(OVRInput.Button.One))
                {
                    isFirstPart = false;
                    addContextButton.interactable = false;
                    loadingText.GetComponent<TMP_Text>().text = "drawing trajectory";
                    handOrientation.ShowIndicator(true);
                }
            }
            if (numberOfPoints % 5 == 0) // add new point to trajectory every 5 points
            {        
                
                if (recordOrientationDropdown.value == 0) {
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
                    
                    if (recordOrientationDropdown.value == 1 || recordOrientationDropdown.value == 2) {
                        if (recordOrientationDropdown.value == 1) {
                        // not important
                        handOrientation.UpdateHandOrientationIndicator(hand.PointerPose.position, hand.PointerPose.position);
                        }
                        targetOrientations.Add(handOrientation.GetRotation());
                        debugText.text += "targetOrientation: " + handOrientation.GetRotation().eulerAngles + "\n";
                        targetPoints.Add(hand.PointerPose.position);
                    }
                    else {
                        if (recordOrientationDropdown.value == 0) {
                            // down orientation
                            targetOrientations.Add(Quaternion.Euler(180,0,0));
                            targetPoints.Add(hand.PointerPose.position);
                        }
                        else {
                            // hook orientation
                            targetOrientations.Add(Quaternion.Euler(180,0,0));
                            targetPoints.Add(hand.PointerPose.position);
                        }
                    }
                }
            }
            if (!isFirstPart) // update lineRenderer and handOrientation indicator
            { 
                numberOfPoints++;
                lineRenderer.positionCount = numberOfPoints;
                lineRenderer.SetPosition(numberOfPoints - 1,  hand.PointerPose.position);
                
                if (recordOrientationDropdown.value == 2) {
                    if (Vector3.Distance(trajectorySamplePoints_point1, lineRenderer.GetPosition(numberOfPoints - 1)) > 0.05 || numberOfPoints == 0) {
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
                foreach (var button in contextMenu)
                {
                    button.interactable = false;
                }

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
                    loadingText.GetComponent<TMP_Text>().text = "executing trajectory";
                }
                break;

            case  State.ExecuteTrajectory:
                state = State.InspectTrajectory;
                PlanRequestGeneratorWithPoses.SetJointAnglesForRealRobot();
                executeOnRealRobotButton.SetActive(true);

                PlanRequestGeneratorWithPoses.SetCurrentIndexPointer();
                targetPoints.Clear();
                targetOrientations.Clear();
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
                
                    double rate = ((double) PlanRequestGeneratorWithPoses.currentIndexPointer) / (double)PlanRequestGeneratorWithPoses.previousPoints.Count;
                    int remainingPoints = Convert.ToInt32(rate * lineRenderer.positionCount);
                    Vector3[] newPositions = new Vector3[remainingPoints];
                    debugText.text += "currentIndexPointer: " + PlanRequestGeneratorWithPoses.currentIndexPointer + "\n";
                    debugText.text += "rate: " + rate + "\n";
                    debugText.text += "remaining points: " + remainingPoints + "\n";
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
        
        ClearCollisionIndicators();

        if (!anotherTrajectory) {
            if (isContextual) {
                Destroy(obstacle);
            }
            foreach (var button in contextMenu)
            {
                button.interactable = false;
            }
            isContextual = false;
            addContextButton.GetComponentInChildren<TMP_Text>().text = "add context";
        }

        state = State.Initial;

        collisionDetectedinTrajectory = false;
        collisionWarning.SetActive(false);

        handOrientation.ResetFilter();
        
        PlanRequestGeneratorWithPoses.ResetGenerator();

        lineRenderer.positionCount = 0;

        StopAllCoroutines();
        targetPoints.Clear();
        targetOrientations.Clear();


        // set the buttons to be non-interactable in the initial state
        playButton.GetComponent<Button>().interactable = false;
        pauseButton.SetActive(false);
        backButton.interactable = false;
        nextButton.interactable = false;
        redrawButton.interactable = false;
        executeButton.GetComponent<Button>().interactable = false;
        addToTrainingButton.interactable = false;
        PlanRequestGeneratorWithPoses.PrevRecordedTrajectories.SetInteractable(true);

        addContextButton.interactable = true;

        // do not set active if no solution found 
        

        executeButton.SetActive(!anotherTrajectory);

        

        // also reset the slider handle position to middle
        Vector3 currRectTransform = sliderPosition.GetComponent<RectTransform>().anchoredPosition;
        currRectTransform.x = 0;
        sliderPosition.GetComponent<RectTransform>().anchoredPosition = currRectTransform;
    }

    private void handleMenu(bool loading) {
    
        if (collisionDetectedinTrajectory)
            collisionWarning.SetActive(true);
        
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

    public void SetCollisionDetected(Vector3 contactPoint)
    {
        if (state == State.ExecuteTrajectory) {
            collisionDetectedinTrajectory = true;
        }
        GameObject collisionIndicator = Instantiate(collisionIndicatorPrefab, contactPoint, Quaternion.identity);
        collisionIndicators.Add(collisionIndicator);
        
    }

    private void ClearCollisionIndicators() {
        foreach (GameObject collisionIndicator in collisionIndicators) {
            Destroy(collisionIndicator);
        }
        collisionIndicators.Clear();
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
        if (isContextual) 
            trainAndTest.SendTrainingData(PlanRequestGeneratorWithPoses.previousPoses, PlanRequestGeneratorWithPoses.previousOrientations, obstacle.transform.localScale.y);
        else 
            trainAndTest.SendTrainingData(PlanRequestGeneratorWithPoses.previousPoses, PlanRequestGeneratorWithPoses.previousOrientations);
        PlanRequestGeneratorWithPoses.ResetGenerator(true);
        UpdateDrawingState(true);
    }


}