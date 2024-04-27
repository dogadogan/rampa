using UnityEngine;
using UnityEngine.UI;

public class Reset : MonoBehaviour
{
    public TrajectoryPlanner trajectoryPlanner;
    
    public void ResetSystem()
    {
        trajectoryPlanner.ResetSliders();
    }
}
