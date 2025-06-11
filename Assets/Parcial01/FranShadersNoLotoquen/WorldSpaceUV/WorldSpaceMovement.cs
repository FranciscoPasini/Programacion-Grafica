using UnityEngine;
using UnityEngine.UI;

public class WorldSpaceMovement : MonoBehaviour
{
    public Slider slider;
    public GameObject cube;

    void Start()
    {
        slider.onValueChanged.AddListener(OnSliderValueChanged);
    }

    void OnSliderValueChanged(float value)
    {
        Vector3 newPosition = cube.transform.position;
        newPosition.z = value;
        cube.transform.position = newPosition;
    }
}
