using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class DrawServiceRealTime: MonoBehaviour
{
    public OVRHand hand;
    public LineRenderer lineRenderer;
    public Text InfoText; 
    public Button button;
    public Text ButtonText;
    public PlanRequestGeneratorRealTime PlanRequestGeneratorRealTime;
    
    private State state = State.Initial;
    
    private float threshold = 0.01f;

    
    IEnumerator DrawTrajectory(float interval)
    {
        InfoText.text = "Drawing trajectory";
        int numberOfPoints = 0;
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
                PlanRequestGeneratorRealTime.AddRequestToQueue(hand.PointerPose.position);
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
                button.interactable = false;
                lineRenderer.positionCount = 0;
                StartCoroutine(CountdownCoroutine());
                break;
            case State.DrawTrajectory:
                ResetDrawingState();
                break;
        }
        
    }

    public void ResetDrawingState()
    {
        state = State.Initial;
        ButtonText.text = "Real Time Execution";
        InfoText.text = "";
        button.interactable = true;
        lineRenderer.positionCount = 0;
        PlanRequestGeneratorRealTime.ResetGenerator();
        
    }
    private enum State
    {
        Initial,
        DrawTrajectory,
    }
}