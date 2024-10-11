using System.Collections;
using System.Collections.Generic;
using Unity.Robotics.ROSTCPConnector;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEditor;

public class ResetandReturn : MonoBehaviour
{
    public Toggle isRealTime; // used in returning from TrajCaptureMenu to MainMenu
    public GameObject MainMenu;
    public GameObject TrajCaptureMenu;
    public GameObject TestModelMenu;
    public GameObject MLTrainingMenu;

    public TrainAndTest TrainAndTest;

    // public PlanRequestGeneratorRealTime planRequestGeneratorRealTime;
    public TrajectoryPlanner trajectoryPlanner;
    public DrawServiceRealTime drawServiceRealTime;

    public DrawServiceWithInspect drawServiceWithInspect;
    ROSConnection m_Ros;
    public TrajectoryHelperFunctions HelperFunctions;
    private double[] _resetCondition = {0f, -0.25f, 0f, -0.25f, 0f, 0f};

    public TMP_Text debugText;
    
    public enum Mode {
        TrajCapturetoMainMenu,
        MLTrainingtoMainMenu,
        TestModelMenuToMainMenu,
        JointReset
    }
    public Mode mode;

    public void handleReset() {
        switch (mode) {
            case Mode.TrajCapturetoMainMenu:

                if (isRealTime.isOn) {
                    drawServiceRealTime.ResetDrawingState();
                } else {
                    drawServiceWithInspect.ResetDrawingState();
                }
                goToMainMenuFunc();
                setSliders();
                break;
            
            case Mode.MLTrainingtoMainMenu:
                
                goToMainMenuFunc();

                // TODO: what happens if a training model is running?

                break;
            
            case Mode.TestModelMenuToMainMenu:

                TrainAndTest.SetExecutionPermissionOnRealRobot(false); // disable the button for future menu uses
                TrainAndTest.ClearWaypoints();
                TrainAndTest.CloseWarning();
                goToMainMenuFunc();
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
        TestModelMenu.SetActive(false);
    }

    public void setSliders() {
        HelperFunctions.SetSliders(_resetCondition);
    }
    
    
}
