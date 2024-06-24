using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ClearDebug : MonoBehaviour
{
    public TMP_Text debugText;

    public void ClearText()
    {
        debugText.text = "";
    }
}
