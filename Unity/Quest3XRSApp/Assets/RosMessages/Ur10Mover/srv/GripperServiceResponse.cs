//Do not edit! This file was generated by Unity-ROS MessageGeneration.
using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using Unity.Robotics.ROSTCPConnector.MessageGeneration;

namespace RosMessageTypes.Ur10Mover
{
    [Serializable]
    public class GripperServiceResponse : Message
    {
        public const string k_RosMessageName = "ur10_mover/GripperService";
        public override string RosMessageName => k_RosMessageName;

        public string output_msg;

        public GripperServiceResponse()
        {
            this.output_msg = "";
        }

        public GripperServiceResponse(string output_msg)
        {
            this.output_msg = output_msg;
        }

        public static GripperServiceResponse Deserialize(MessageDeserializer deserializer) => new GripperServiceResponse(deserializer);

        private GripperServiceResponse(MessageDeserializer deserializer)
        {
            deserializer.Read(out this.output_msg);
        }

        public override void SerializeTo(MessageSerializer serializer)
        {
            serializer.Write(this.output_msg);
        }

        public override string ToString()
        {
            return "GripperServiceResponse: " +
            "\noutput_msg: " + output_msg.ToString();
        }

#if UNITY_EDITOR
        [UnityEditor.InitializeOnLoadMethod]
#else
        [UnityEngine.RuntimeInitializeOnLoadMethod]
#endif
        public static void Register()
        {
            MessageRegistry.Register(k_RosMessageName, Deserialize, MessageSubtopic.Response);
        }
    }
}
