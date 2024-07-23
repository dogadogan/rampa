using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Meta.XR.MRUtilityKit;
using TMPro;

public class CollisionManager : MonoBehaviour
{

    public GameObject collisionObject;
    public TMP_Text debugText;

    void Update() {
        CheckCollision();
    }
    public void CheckCollision() {

        var room = MRUK.Instance.GetCurrentRoom();

        foreach (var anchor in room.GetRoomAnchors())
        {
            if (anchor.IsPositionInVolume(collisionObject.transform.position, false))
            {
                debugText.text += "\nCollision Detected";
            }
                
        }
            
    }
}
