//Do not edit! This file was generated by Unity-ROS MessageGeneration.
using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using Unity.Robotics.ROSTCPConnector.MessageGeneration;

namespace RosMessageTypes.Ur10Mover
{
    [Serializable]
    public class TrainingDataServiceRequest : Message
    {
        public const string k_RosMessageName = "ur10_mover/TrainingDataService";
        public override string RosMessageName => k_RosMessageName;

        public string input_msg;
        public Geometry.PoseMsg[] pose_list;

        public TrainingDataServiceRequest()
        {
            this.input_msg = "";
            this.pose_list = new Geometry.PoseMsg[0];
        }

        public TrainingDataServiceRequest(string input_msg, Geometry.PoseMsg[] pose_list)
        {
            this.input_msg = input_msg;
            this.pose_list = pose_list;
        }

        public static TrainingDataServiceRequest Deserialize(MessageDeserializer deserializer) => new TrainingDataServiceRequest(deserializer);

        private TrainingDataServiceRequest(MessageDeserializer deserializer)
        {
            deserializer.Read(out this.input_msg);
            deserializer.Read(out this.pose_list, Geometry.PoseMsg.Deserialize, deserializer.ReadLength());
        }

        public override void SerializeTo(MessageSerializer serializer)
        {
            serializer.Write(this.input_msg);
            serializer.WriteLength(this.pose_list);
            serializer.Write(this.pose_list);
        }

        public override string ToString()
        {
            return "TrainingDataServiceRequest: " +
            "\ninput_msg: " + input_msg.ToString() +
            "\npose_list: " + System.String.Join(", ", pose_list.ToList());
        }

#if UNITY_EDITOR
        [UnityEditor.InitializeOnLoadMethod]
#else
        [UnityEngine.RuntimeInitializeOnLoadMethod]
#endif
        public static void Register()
        {
            MessageRegistry.Register(k_RosMessageName, Deserialize);
        }
    }
}
