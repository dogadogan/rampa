using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Meta.XR.MRUtilityKit;
using TMPro;

public class CollisionManager : MonoBehaviour
{

    public CapsuleCollider[] robotColliders;
    public TMP_Text debugText;

    void Update() {
        CheckCollision();
    }
    public void CheckCollision() {

        var room = MRUK.Instance.GetCurrentRoom();

        foreach (var anchor in room.GetRoomAnchors())
        {
            // check collision of base_link with anchor
            foreach (var collider in robotColliders)
            {
                if (collider.bounds.Intersects(anchor.VolumeBounds.Value))
                {
                    debugText.text = "Collision Detected";
                    return;
                }
                debugText.text = "No Collision";
            }    
        }
    }
}
