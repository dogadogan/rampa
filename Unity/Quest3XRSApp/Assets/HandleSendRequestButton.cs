using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class HandleSendRequestButton : MonoBehaviour
{
    // Start is called before the first frame update
    public TMP_Text debugText;
    public GameObject cube;

    public GameObject baseLink;

    public void handleClick() {
        debugText.text += "Button clicked!!!\n";

        Vector3 pos = cube.transform.position - baseLink.transform.position;

        debugText.text += "BaseLink position: " + baseLink.transform.position.ToString() + "\n";
        debugText.text += "Absolute cube position: " + cube.transform.position.ToString() + "\n";
        debugText.text += "Cube position: " + pos.ToString() + "\n";

    }
}
