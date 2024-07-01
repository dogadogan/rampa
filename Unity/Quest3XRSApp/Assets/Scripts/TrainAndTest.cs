using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using RosMessageTypes.Geometry;
using System.Collections;
using JetBrains.Annotations;
using TMPro;
using UnityEngine.UI;

public class TrainAndTest : MonoBehaviour
{
    
    private string collectDataService = "save_training_data";
    private string trainTriggerService = "start_training";
    private string testService = "sample";
    private string deleteService = "delete_training_data";

    private string getTrainingDataService = "get_training_data";

    ROSConnection m_Ros;
    public TrajectoryHelperFunctions HelperFunctions;
    public GameObject source;
    public GameObject target;


    private List<GameObject> waypoints = new List<GameObject>();

    private List<double[]> jointAngles = new List<double[]>();
    
    public GameObject conditionPrefab;
    public TrajectoryPlanner trajectoryPlanner;
    public PrevRecordedTrajectories prevRecordedTrajectories;

    public Button testButtoninMainMenu;   

    private enum State {
        Untrained,
        Training,
        Trained
    }
    private State state;

    public TMP_Text loadingText;

    public TMP_Text debugText;

    public List<Button> TestMenu_ButtonsList;
    public Button TestMenu_ExecuteOnRealRobotButton;

    public TMP_Dropdown modelDropdown;
    
    // Start is called before the first frame update
    void Start()
    {
        
        state = State.Untrained;

        debugText.text += "start";

        debugText.text += "waypoints count: " + waypoints.Count;

        testButtoninMainMenu.interactable = false;

        loadingText.text = "no training data";
        

        m_Ros = ROSConnection.GetOrCreateInstance();
        m_Ros.RegisterRosService<TrainingDataServiceRequest, TrainingDataServiceResponse>(collectDataService);
        m_Ros.RegisterRosService<TrainingServiceRequest, TrainingServiceResponse>(trainTriggerService);
        m_Ros.RegisterRosService<SampleServiceRequest, SampleServiceResponse>(testService);
        m_Ros.RegisterRosService<TrainingServiceRequest, TrainingServiceResponse>(deleteService);

        m_Ros.RegisterRosService<GetTrainingDataServiceRequest, GetTrainingDataServiceResponse>(getTrainingDataService);

    }
    
    public void SendTrainingData( List<Vector3> poses)
    {
        var request = new TrainingDataServiceRequest();
        Debug.LogWarning("asd in function");
        Debug.LogWarning("asd count:" + poses.Count);
        
        PoseMsg[] pose_list = new PoseMsg[poses.Count];
        for (int i = 0; i < poses.Count; i++)
        {
            pose_list[i] = HelperFunctions.GeneratePoseMsgForTraining(poses[i]);
            Debug.LogWarning("asd pose:" + pose_list[i].position);
        }
        request.pose_list = pose_list;
        m_Ros.SendServiceMessage<TrainingDataServiceResponse>(collectDataService, request, SendTrainingDataResponse);
        
    }

    void SendTrainingDataResponse(TrainingDataServiceResponse response){}

    public void TriggerTraining()
    {
        state = State.Training;
        UpdateText();
        var request = new TrainingServiceRequest();
        if (modelDropdown.value == 0)
        {
            request.input_msg = "promp";
        }
        else if (modelDropdown.value == 1)
        {
            request.input_msg = "dmp";
        }
        else if (modelDropdown.value == 2)
        {
            request.input_msg = "gmm";
        }


        m_Ros.SendServiceMessage<TrainingServiceResponse>(trainTriggerService, request, TriggerTrainingResponse);
    
    }
    
    public void TriggerTrainingResponse(TrainingServiceResponse response)
    {
        state = State.Trained;
        testButtoninMainMenu.interactable = true;
        UpdateText();
    }


    public void TestModel()
    {
        // make buttons in main menu uninteractable
        SetAllButtonsInteractable(false);
        // they are made interactable after the request is completed in PlanRequesstGeneraterWithPoses - ExecuteTrajectories
        
        var request = new SampleServiceRequest();
        var start_point = HelperFunctions.GeneratePoseMsg(source.transform.position);
        var end_point = HelperFunctions.GeneratePoseMsg(target.transform.position);
        var req_waypoints = new PoseMsg[waypoints.Count + 2]; 
        req_waypoints[0] = start_point;
        req_waypoints[waypoints.Count + 1] = end_point;
        for (int i = 0; i < waypoints.Count; i++)
        {
            req_waypoints[i + 1] = HelperFunctions.GeneratePoseMsg(waypoints[i].transform.position);
        }
        request.condition_poses = req_waypoints;
        m_Ros.SendServiceMessage<SampleServiceResponse>(testService, request, TestModelResponse);
    }
    
    
    public void TestModelResponse(SampleServiceResponse response)
    {
        PlannerServiceRequest request = new PlannerServiceRequest();
        
        request.pose_list = response.sampled_trajectory;
        request.joints_input =  HelperFunctions.CurrentJointConfig();
        request.request_type = "poses_training";
        trajectoryPlanner.SendRequest(request);
    }

    public void AddWaypoint() {

        debugText.text = "adding waypoint"; 

        GameObject newCondition = Instantiate<GameObject>(conditionPrefab);

        debugText.text = "instantiated prefab"; 

        newCondition.GetComponentInChildren<TMP_Text>().text = (waypoints.Count + 1).ToString();
        waypoints.Add(newCondition);

        debugText.text = "waypoints count: " + waypoints.Count;
    }

    public void DeleteWaypoint() {
        if (waypoints.Count > 0) {
            Destroy(waypoints.Last());
            waypoints.RemoveAt(waypoints.Count - 1);
        }
    }




    public void TriggerDelete() {

        var request = new TrainingServiceRequest();
        m_Ros.SendServiceMessage<TrainingServiceResponse>(deleteService, request, TriggerDeleteResponse);
        
    }

    public void TriggerDeleteResponse(TrainingServiceResponse response) {
        state = State.Untrained;
        testButtoninMainMenu.interactable = false;
        UpdateText();
    }


    
    public void GetTrainingData() {
        var request = new GetTrainingDataServiceRequest();
        m_Ros.SendServiceMessage<GetTrainingDataServiceResponse>(getTrainingDataService, request, GetTrainingDataResponse);
    }

    // only called once, at the start
    public void GetTrainingDataResponse(GetTrainingDataServiceResponse response) {
        //trajectory_list should be a list of lists of poses
        foreach (var trajectory in response.trajectoryList) {
            List<Vector3> poses = new List<Vector3>();
            
            foreach (var pose in trajectory.pose_list) {
                poses.Add(new Vector3((float) pose.position.x, (float) pose.position.y, (float) pose.position.z));
            }
            prevRecordedTrajectories.AddTrajectory(poses, false);
        }

        prevRecordedTrajectories.HandleButtons();
    } 
    
    public void UpdateText()
    {
        switch (state)
        {
            case State.Untrained:
                if (prevRecordedTrajectories.GetTrajectoriesCount() > 0)
                {
                    loadingText.text = "ready to train.";
                }
                else
                {
                    loadingText.text = "no training data";
                }
                break;
            case State.Training:
                loadingText.text = "training...";
                break;
            case State.Trained:
                loadingText.text = "ready to test. press \"start training\" to retrain";
                break;
        }
    }

    public void SetAllButtonsInteractable(bool interactable)
    {
        foreach (var button in TestMenu_ButtonsList)
        {
            button.interactable = interactable;
        }
    }

    public void SetExecutionPermissionOnRealRobot(bool permission)
    {
        TestMenu_ExecuteOnRealRobotButton.interactable = permission;
    }

    public void ClearWaypoints()
    {
        foreach (var waypoint in waypoints)
        {
            Destroy(waypoint);
        }
        waypoints.Clear();
    }

    
}
