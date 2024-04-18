using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CollisionLog : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnCollisionEnter(Collision other)
    {
        if (other.gameObject.name != "base_link")
        {
            Debug.LogWarning("-----------Collision--------");
            Debug.LogWarning(gameObject.name);
            Debug.LogWarning(other.gameObject.name);
            Debug.LogWarning("-----------Collision--------");
        }

    }
}
