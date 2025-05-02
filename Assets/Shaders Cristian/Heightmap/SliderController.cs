using UnityEngine;
using UnityEngine.UI;

public class SliderController : MonoBehaviour
{
    public Slider slider;
    public Material material;

    void Start()
    {
        slider.onValueChanged.AddListener(ChangeHeight);
    }

    void ChangeHeight(float value)
    {
        Debug.Log("Slider value: " + value); 
        material.SetFloat("_Intensity", value);
    }

}
