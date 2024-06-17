using System.Collections;
using UnityEngine;
using System;
using UnityEngine.UI;

public class DrawServiceRealTime: MonoBehaviour
{
    public OVRHand hand;
    public LineRenderer lineRenderer;
    public Text InfoText; 
    public Button primalButton;
    public Text ButtonText;
    
    public PlanRequestGeneratorRealTime planRequestGeneratorRealTime;
    public TrainAndTest trainAndTest;
    
    private State state = State.Initial;
    private float threshold = 0.01f;

    
    IEnumerator DrawTrajectory(float interval)
    {
        InfoText.text = "Drawing trajectory";
        int numberOfPoints = lineRenderer.positionCount;
        Vector3 prevPoint = Vector3.zero;
        int totalIter = 0;
        bool isFirstPart = true;
        while (true)
        {
            totalIter += 1;
            if (totalIter == 30)
            {
                isFirstPart = false;
            }
            if (numberOfPoints % 5 == 0)
            {
                if (numberOfPoints != 0 && Vector3.Distance(prevPoint, hand.PointerPose.position) < threshold && !isFirstPart)
                {
                    UpdateDrawingState();
                    break;
                }
                prevPoint = hand.PointerPose.position;
            }
            if (numberOfPoints % 10 == 0)
            {
                planRequestGeneratorRealTime.AddRequestToQueue(hand.PointerPose.position);
            }
            
            numberOfPoints++;
            lineRenderer.positionCount = numberOfPoints;
            lineRenderer.SetPosition(numberOfPoints - 1,  hand.PointerPose.position);
            

            yield return new WaitForSeconds(interval);
        }
    }
    
    
    // No need for countdown, just start drawing the trajectory with pinching
    
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

    
    public void UpdateDrawingState(bool finalized = false)
    {
        switch (state)
        {
            case State.Initial:
                state = State.DrawTrajectory;
                primalButton.interactable = false;
                lineRenderer.positionCount = 0;
                
                // StartCoroutine(CountdownCoroutine());
                StartCoroutine(DrawTrajectory(0.05f));

                break;
            case State.DrawTrajectory:
                state = State.InspectTrajectory;
                
                // primalButton.gameObject.SetActive(false);
                // activateDisactivateButtons(true);

                planRequestGeneratorRealTime.SetCurrentIndexPointer();
                break;
            case State.InspectTrajectory:
                if (finalized)
                {
                    state = State.Initial;
                    ResetDrawingState();
                }
                else
                {

                    // enters here when the user clicks on "redraw from current waypoint" button
                    state = State.DrawTrajectory;
                    primalButton.gameObject.SetActive(true);
                    activateDisactivateButtons(false);
                    double remainingPointsRate = (double) planRequestGeneratorRealTime.currentIndexPointer  / planRequestGeneratorRealTime.previousPoints.Count;
                    int remainingPoints = (int)Math.Floor(lineRenderer.positionCount * remainingPointsRate);
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
                
                    //StartCoroutine(CountdownCoroutine());
                    StartCoroutine(DrawTrajectory(0.05f));
                }

                break;
        }
        
    }

    public void ResetDrawingState()
    {
        state = State.Initial;
        ButtonText.text = "Record a trajectory with hand following";
        InfoText.text = "";
        primalButton.interactable = true;
        lineRenderer.positionCount = 0;
        primalButton.gameObject.SetActive(true);
        primalButton.interactable= true;
        activateDisactivateButtons(false);
        planRequestGeneratorRealTime.ResetGenerator();
        
    }

    public void SendTrainingData()
    {
        trainAndTest.SendTrainingData(planRequestGeneratorRealTime.previousPoints);
        planRequestGeneratorRealTime.ResetGenerator();
        UpdateDrawingState(true);
    }
    private enum State
    {
        Initial,
        DrawTrajectory,
        InspectTrajectory
    }

    private void activateDisactivateButtons(bool activate)
    {
        planRequestGeneratorRealTime.backButton.gameObject.SetActive(activate);
        planRequestGeneratorRealTime.nextButton.gameObject.SetActive(activate);
        planRequestGeneratorRealTime.drawButton.gameObject.SetActive(activate);
        planRequestGeneratorRealTime.trainButton.gameObject.SetActive(activate);
        planRequestGeneratorRealTime.testButton.gameObject.SetActive(activate);
    }
}