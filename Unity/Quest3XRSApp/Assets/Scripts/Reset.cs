using UnityEngine;

public class Reset : MonoBehaviour
{
    public TrajectoryPlanner trajectoryPlanner;
    public DrawService drawService;
    
    public void ResetSystem()
    {
        trajectoryPlanner.ResetSliders();
        drawService.ResetDrawingState();
    }
}
