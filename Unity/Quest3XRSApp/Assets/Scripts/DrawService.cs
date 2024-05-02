using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DrawService : MonoBehaviour
{
    public OVRHand hand;
    public LineRenderer lineRenderer;
    public Text InfoText;
    private Color lineColor = Color.magenta;
    private float lineWidth = 0.005f;
    private List<Vector3> targetPoints = new List<Vector3>();
    private float threshold = 0.01f;
    public TrajectoryPlanner trajectoryPlanner;
    private State state;
    public Button button;
    public Text ButtonText;
    public PlanRequestGeneratorWithPoses PlanRequestGeneratorWithPoses;

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
        int numberOfPoints = 0;
        while (true)
        {
            if (numberOfPoints % 5 == 0)
            {
                if (targetPoints.Count != 0 && Vector3.Distance(targetPoints[targetPoints.Count - 1], hand.PointerPose.position) < threshold)
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
    
    
    IEnumerator CountdownCoroutine(DrawingType type)
    {
        int currentTime = 3;

        while (currentTime > 0)
        {
            currentTime -= 1; // Decrease the current time by 1 second
            InfoText.text = currentTime.ToString();
            yield return new WaitForSeconds(1f); // Wait for 1 second
        }

        if (type == DrawingType.PreDrawn)
        {
            StartCoroutine(DrawTrajectory(0.05f));
        }
        else
        {
            StartCoroutine(FollowTrajectory(0.05f));
        }
        

    }
    
    private void TriggerPublishMethod()
    {
        Debug.LogWarning("--------TriggerPublishMethod --------");
        Vector3[] poses = targetPoints.ToArray();
        PlanRequestGeneratorWithPoses.GenerateRequest(poses);
    } 

    public void UpdateDrawingState()
    {
        switch (state)
        {
            case State.Initial:
                state = State.DrawTrajectory;
                button.interactable = false;
                lineRenderer.positionCount = 0;
                StartCoroutine(CountdownCoroutine(DrawingType.PreDrawn));
                break;
            case State.DrawTrajectory:
                state = State.WaitingForExecution;
                InfoText.text = "Trajectory Recorded";
                ButtonText.text = "Execute the trajectory";
                button.interactable = true;
                break;
            case State.WaitingForExecution:
                state = State.WaitingForResponse;
                TriggerPublishMethod();
                InfoText.text = "Waiting for calculations";
                button.interactable = false;
                break;
            case State.WaitingForResponse:
                state = State.ExecuteTrajectory;
                InfoText.text = "Executing Trajectory";
                button.interactable = false;
                break;
            case  State.ExecuteTrajectory:
                state = State.Initial;
                ButtonText.text = "Record a trajectory";
                button.interactable = true;
                InfoText.text = "";
                targetPoints.Clear();
                break;
        }
        
    }

    public void ResetDrawingState()
    {
        state = State.Initial;
        ButtonText.text = "Record a trajectory";
        InfoText.text = "";
        button.interactable = true;
        targetPoints.Clear();
        lineRenderer.positionCount = 0;
    }
    private enum State
    {
        Initial,
        DrawTrajectory,
        WaitingForExecution,
        WaitingForResponse,
        ExecuteTrajectory,
    }
    
    public enum DrawingType
    {
        PreDrawn,
        RealTime
    }
    
    
    
    IEnumerator FollowTrajectory(float interval)
    {
        InfoText.text = "Following trajectory";
        int numberOfPoints = 0;
        while (true)
        {
            if (numberOfPoints % 10 == 0)
            {
                if (targetPoints.Count != 0 && Vector3.Distance(targetPoints[targetPoints.Count - 1], hand.PointerPose.position) < threshold)
                {
                    InfoText.text = "done";
                    targetPoints.Clear();
                    break;
                }
                targetPoints.Add(hand.PointerPose.position);
                Vector3[] pose = { hand.PointerPose.position};
                TriggerPublishMethodForRealTimeExecution(pose,targetPoints.Count - 1);
            }

            numberOfPoints++;
            lineRenderer.positionCount = numberOfPoints;
            lineRenderer.SetPosition(numberOfPoints - 1,  hand.PointerPose.position);
            

            yield return new WaitForSeconds(interval);
        }
    }


    public void TriggerRealTimeExecution()
    {
        lineRenderer.positionCount = 0;
        StartCoroutine(CountdownCoroutine(DrawingType.RealTime));
    }
    
    private void TriggerPublishMethodForRealTimeExecution(Vector3[] pose,int requestNumber)
    {
        waitForTheTurn(requestNumber,pose);
    }

    private IEnumerator waitForTheTurn(int requestNumber,Vector3[] pose)
    {
            InfoText.text = "Following trajectory " + trajectoryPlanner.requestNumber;
            Debug.LogWarning("---" + requestNumber + "---");
            Debug.LogWarning("---" + trajectoryPlanner.requestNumber + "---");
            while (trajectoryPlanner.requestNumber != requestNumber)
            {
                yield return null;
            }
            trajectoryPlanner.PublishJointsWithPoses(pose);

    }
}