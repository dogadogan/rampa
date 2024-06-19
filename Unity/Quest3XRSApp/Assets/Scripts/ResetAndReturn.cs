using System.Collections;
using System.Collections.Generic;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;

public class ResetandReturn : MonoBehaviour
{
    public GameObject MainMenu;
    public GameObject TrajCaptureMenu;

    public GameObject MLTrainingMenu;

    public PlanRequestGeneratorRealTime planRequestGeneratorRealTime;
    public TrajectoryPlanner trajectoryPlanner;
    public DrawServiceRealTime drawServiceRealTime;
    ROSConnection m_Ros;
    public TrajectoryHelperFunctions HelperFunctions;
    private double[] _resetCondition = {0f, -0.25f, 0f, -0.25f, 0f, 0f};
    
    public enum Mode {
        TrajCapturetoMainMenu,
        MLTrainingtoMainMenu,
        JointReset
    }
    public Mode mode;


    public void handleReset() {
        switch (mode) {
            case Mode.TrajCapturetoMainMenu:

                drawServiceRealTime.ResetDrawingState();
                goToMainMenuFunc();
                setSliders();

                break;
            case Mode.MLTrainingtoMainMenu:
                // TODO
                break;

            case Mode.JointReset:

                setSliders();
                break;
        }
    }




    public void goToMainMenuFunc()
    {
        MainMenu.SetActive(true);
        TrajCaptureMenu.SetActive(false);
        MLTrainingMenu.SetActive(false);
    }

    public void setSliders() {
        HelperFunctions.SetSliders(_resetCondition);
    }



    
}
