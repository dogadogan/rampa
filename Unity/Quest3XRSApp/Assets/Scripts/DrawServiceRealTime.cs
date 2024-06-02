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
    
    private State state = State.Initial;
    
    private float threshold = 0.01f;

    
    IEnumerator DrawTrajectory(float interval)
    {
        InfoText.text = "Drawing trajectory";
        int numberOfPoints = lineRenderer.positionCount;
        Vector3 prevPoint = Vector3.zero;
        while (true)
        {
            if (numberOfPoints % 5 == 0)
            {
                if (numberOfPoints != 0 && Vector3.Distance(prevPoint, hand.PointerPose.position) < threshold)
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
    
    public void UpdateDrawingState()
    {
        switch (state)
        {
            case State.Initial:
                state = State.DrawTrajectory;
                primalButton.interactable = false;
                lineRenderer.positionCount = 0;
                StartCoroutine(CountdownCoroutine());
                break;
            case State.DrawTrajectory:
                state = State.InspectTrajectory;
                primalButton.gameObject.SetActive(false);
                planRequestGeneratorRealTime.backButton.gameObject.SetActive(true);
                planRequestGeneratorRealTime.nextButton.gameObject.SetActive(true);
                planRequestGeneratorRealTime.drawButton.gameObject.SetActive(true);
                planRequestGeneratorRealTime.SetCurrentIndexPointer();
                break;
            case State.InspectTrajectory:
                state = State.DrawTrajectory;
                primalButton.gameObject.SetActive(true);
                planRequestGeneratorRealTime.backButton.gameObject.SetActive(false);
                planRequestGeneratorRealTime.nextButton.gameObject.SetActive(false);
                planRequestGeneratorRealTime.drawButton.gameObject.SetActive(false);
                double remainingPointsRate = (double) planRequestGeneratorRealTime.currentIndexPointer  / planRequestGeneratorRealTime.previousPoints.Count;
                Debug.LogWarning("asd all points "+ lineRenderer.positionCount);
                Debug.LogWarning("asd currentIndexPointer "+ planRequestGeneratorRealTime.currentIndexPointer);
                Debug.LogWarning("asd list length "+ planRequestGeneratorRealTime.previousPoints.Count);
                int remainingPoints = (int)Math.Floor(lineRenderer.positionCount * remainingPointsRate);
                Debug.LogWarning("asd remainingPoints "+ remainingPoints);
                Vector3[] newPositions = new Vector3[remainingPoints];
                for (int i = 0; i < remainingPoints; i++)
                {
                    newPositions[i] = lineRenderer.GetPosition(i);
                }

                lineRenderer.positionCount = remainingPoints;
                lineRenderer.SetPositions(newPositions);
                
                StartCoroutine(CountdownCoroutine());
                break;
        }
        
    }

    public void ResetDrawingState()
    {
        state = State.Initial;
        ButtonText.text = "Real Time Execution";
        InfoText.text = "";
        primalButton.interactable = true;
        lineRenderer.positionCount = 0;
        primalButton.gameObject.SetActive(true);
        primalButton.interactable= true;
        planRequestGeneratorRealTime.backButton.gameObject.SetActive(false);
        planRequestGeneratorRealTime.nextButton.gameObject.SetActive(false);
        planRequestGeneratorRealTime.drawButton.gameObject.SetActive(false);
        planRequestGeneratorRealTime.ResetGenerator();
        
    }
    private enum State
    {
        Initial,
        DrawTrajectory,
        InspectTrajectory
    }
}