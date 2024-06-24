using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using RosMessageTypes.Ur10Mover;
using Unity.Robotics.ROSTCPConnector;
using RosMessageTypes.Geometry;
using System.Collections;

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
    public TrajectoryPlanner trajectoryPlanner;
    public PrevRecordedTrajectories prevRecordedTrajectories;    
    
    // Start is called before the first frame update
    void Start()
    {
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

    void SendTrainingDataResponse(TrainingDataServiceResponse response)
    {
        
    }

    public void TriggerTraining()
    {
        var request = new TrainingServiceRequest();
        m_Ros.SendServiceMessage<TrainingServiceResponse>(trainTriggerService, request, TriggerTrainingResponse);
    
    }
    
    public void TriggerTrainingResponse(TrainingServiceResponse response)
    {
    }


    public void TestModel()
    {
        var request = new SampleServiceRequest();
        request.start_point = HelperFunctions.GeneratePoseMsg(source.transform.position);
        request.end_point = HelperFunctions.GeneratePoseMsg(target.transform.position);
        m_Ros.SendServiceMessage<SampleServiceResponse>(testService, request, TestModelResponse);
    }
    
    
    public void TestModelResponse(SampleServiceResponse response)
    {
        PlannerServiceRequest request = new PlannerServiceRequest();
        request.pose_list = response.sampled_trajectory;
        request.joints_input =  HelperFunctions.CurrentJointConfig();
        request.request_type = "poses";
        trajectoryPlanner.SendRequest(request);
    }


    public void TriggerDelete() {

        var request = new TrainingServiceRequest();
        m_Ros.SendServiceMessage<TrainingServiceResponse>(deleteService, request, TriggerDeleteResponse);
        
    }

    public void TriggerDeleteResponse(TrainingServiceResponse response) {}


    
    public void GetTrainingData() {
        var request = new GetTrainingDataServiceRequest();
        m_Ros.SendServiceMessage<GetTrainingDataServiceResponse>(getTrainingDataService, request, GetTrainingDataResponse);
    }

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
    
    
}
