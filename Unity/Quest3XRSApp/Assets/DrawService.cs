using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.UIElements;
using Random = UnityEngine.Random;


public class DrawService : MonoBehaviour
{
    public OVRHand hand;
    public LineRenderer lineRenderer;
    public Text counter;
    private Color lineColor = Color.magenta;
    private float lineWidth = 0.005f;
    private List<Vector3> targetPoints = new List<Vector3>();
    public float threshold = 0.01f;
    public Text ButtonText;
    public TrajectoryPlanner trajectoryPlanner;
    public enum State
    {
        DrawTrajectory,
        ExecuteTrajectory
        
    }

    public State state = State.DrawTrajectory; 

    // Start is called before the first frame update
    void Start()
    {
        // Set line properties
        lineRenderer.startWidth = lineWidth;
        lineRenderer.endWidth = lineWidth;
        lineRenderer.material = new Material(Shader.Find("Sprites/Default"));
        lineRenderer.startColor = lineColor;
        lineRenderer.endColor = lineColor;
    }

    private void Update()
    {
        if (state == State.DrawTrajectory)
        {
            ButtonText.text = "Record a trajectory";
        }
        else if (state == State.ExecuteTrajectory)
        {
            ButtonText.text = "Execute the trajectory";

        }
    }

    IEnumerator LogPositionPeriodically(float interval)
    {
        counter.text = "Drawing trajectory";
        int numberOfPoints = 0;
        while (true)
        {
            if (numberOfPoints % 5 == 0)
            {
                if (targetPoints.Count != 0 && Vector3.Distance(targetPoints[targetPoints.Count - 1], hand.PointerPose.position) < threshold)
                {
                    counter.text = "Trajectory recorded";
                    state = State.ExecuteTrajectory;
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
    
    
    IEnumerator CountdownCoroutine()
    {
        int currentTime = 3;

        while (currentTime > 0)
        {
            currentTime -= 1; // Decrease the current time by 1 second
            counter.text = currentTime.ToString();
            yield return new WaitForSeconds(1f); // Wait for 1 second
            
            // Optionally, you can update UI or perform other actions here
            Debug.Log("Time left: " + currentTime.ToString("0"));
        }
        
        // When the countdown is finished
        Debug.Log("Countdown finished!");
        StartCoroutine(LogPositionPeriodically(0.05f));
    }
    
    

    public void EnableTrajectory()
    {
        switch (state)
        {
            case State.DrawTrajectory:
                StartCoroutine(CountdownCoroutine());
                break;
            case  State.ExecuteTrajectory:
                TriggerPublishMethod();
                break;
        }
    }

    public void TriggerPublishMethod()
    {
        Debug.LogWarning("--------TriggerPublishMethod --------");
        Vector3[] poses = targetPoints.ToArray();
        targetPoints.Clear();
        trajectoryPlanner.PublishJointsWithPoses(poses);
    }
    
}