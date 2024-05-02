using System.Collections;
using System.Linq;
using RosMessageTypes.Geometry;
using RosMessageTypes.NiryoMoveit;
using Unity.Robotics.ROSTCPConnector;
using Unity.Robotics.ROSTCPConnector.ROSGeometry;
using UnityEngine;
using UnityEngine.UI;

public class PlanRequestGeneratorRealTime : MonoBehaviour
{
    const float k_JointAssignmentWait = 0.1f;
    private string m_RosServiceName = "niryo_moveit";
    public GameObject baseLink;
    public GameObject m_Target;
    
    public Slider[] Sliders;
    public GameObject[] objectsToRemoveColliders;
    public Text text;
    public DrawService drawService;
    public TrajectoryHelperFunctions HelperFunctions;
    public TrajectoryPlanner TrajectoryPlanner;

    void Start()
    {

    }
    public void GenerateRequest(Vector3 pose)
    {
        var request = new MoverServiceRequest();

        request.joints_input =  HelperFunctions.CurrentJointConfig();

        PoseMsg[] pose_list = new PoseMsg[1];
        pose_list[0] = new PoseMsg
        {
            position = (pose - baseLink.transform.position).To<FLU>(),

            // The hardcoded x/z angles assure that the gripper is always positioned above the target cube before grasping.
            orientation = Quaternion.Euler(90, m_Target.transform.eulerAngles.y, 0).To<FLU>()
        };
        
        request.pose_list = pose_list;
        TrajectoryPlanner.SendRquest(request);
    } 
    
    public void ProcessResponse(MoverServiceResponse response)
    {
        
    }
    
    void TrajectoryResponse(MoverServiceResponse response)
    {
        text.text = "Trajectory calculated";
        if (response.trajectories.Length > 1)
        {
            //drawService.UpdateDrawingState();
        }
        
        foreach (var removeObject in objectsToRemoveColliders)
        {
            removeObject.GetComponent<BoxCollider>().enabled = false;
        }
        
        
        if (response.trajectories.Length > 0)
        {
            StartCoroutine(ExecuteTrajectories(response));
        }
        else
        {
            Debug.LogError("No trajectory returned from MoverService.");
            text.text = "No trajectory returned";
            foreach (var removeObject in objectsToRemoveColliders)
            {
                removeObject.GetComponent<Collider>().enabled = true;
            }
            //drawService.UpdateDrawingState();
        }

    }
    
    
    
    IEnumerator ExecuteTrajectories(MoverServiceResponse response)
    {
        if (response.trajectories != null)
        {
            // For every trajectory plan returned
            for (var poseIndex = 0; poseIndex < response.trajectories.Length; poseIndex++)
                
            { 
                // For every robot pose in trajectory plan
                foreach (var t in response.trajectories[poseIndex].joint_trajectory.points)
                {
                    var jointPositions = t.positions;
                    var result = jointPositions.Select(r => r * Mathf.Rad2Deg).ToArray();
                    HelperFunctions.SetSliders(result);
                    yield return new WaitForSeconds(k_JointAssignmentWait);
                }
            }
            
            
        }
        foreach (var removeObject in objectsToRemoveColliders)
        {
            removeObject.GetComponent<Collider>().enabled = true;
        }
        text.text = "Ready for another execution";
        drawService.UpdateDrawingState();
        
    }
    
}