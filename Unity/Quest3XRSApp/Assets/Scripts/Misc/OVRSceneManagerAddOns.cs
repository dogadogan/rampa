using System.Collections;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine;

namespace MetaAdvancedFeatures.SceneUnderstanding
{
    public class OVRSceneManagerAddons : MonoBehaviour
    {
        protected OVRSceneManager SceneManager { get; private set; }

        private void Awake()
        {
            SceneManager = GetComponent<OVRSceneManager>();
        }

        void Start()
        {
            SceneManager.SceneModelLoadedSuccessfully += OnSceneModelLoadedSuccessfully;
        }

        private void OnSceneModelLoadedSuccessfully()
        {
            StartCoroutine(AddCollidersAndFixClassifications());
        }

        private IEnumerator AddCollidersAndFixClassifications()
        {
            // [Note] jackyangzzh: to avoid racing condition, wait for end of frame
            //                     for all prefabs to be populated properly before continuing
            yield return new WaitForEndOfFrame();

            MeshRenderer[] allObjects = FindObjectsOfType<MeshRenderer>();

            foreach (var obj in allObjects)
            {
                if (obj.GetComponent<Collider>() == null)
                {
                    obj.AddComponent<BoxCollider>();
                }
            }

            // fix to desks - for some reason they are upside down with Meta's default code
            OVRSemanticClassification[] allClassifications = FindObjectsOfType<OVRSemanticClassification>()
                .Where(c => c.Contains(OVRSceneManager.Classification.Table))
                .ToArray();

            foreach(var classification in allClassifications)
            {
                transform.localScale = new Vector3(transform.localScale.x, transform.localScale.y, transform.localScale.z * -1);
            }
        }
    }
}