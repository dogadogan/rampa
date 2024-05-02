using UnityEngine;
using UnityEngine.UI;

public class TrajectoryHelperFunctions : MonoBehaviour
{
    public Slider[] Sliders;
    
    public double[] CurrentJointConfig()
    {
        double[] joints = new double[Sliders.Length] ;

        for (var i = 0; i < Sliders.Length; i++)
        {
            joints[i] = Sliders[i].value * Mathf.Deg2Rad;
        }

        return joints;
    }
    
    public void SetSliders(double[] jointAngles)
    {
        for (int i = 0; i < Sliders.Length; i++)
        {
            Sliders[i].value = (float)jointAngles[i];
            
        }
    }

    
}
