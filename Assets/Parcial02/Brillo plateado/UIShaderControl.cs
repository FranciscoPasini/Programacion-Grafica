using UnityEngine;
using UnityEngine.UI;

public class UIShaderControl : MonoBehaviour
{
    public Material material;
    public Slider intensitySlider;
    public Toggle enableToggle;

    void Update()
    {
        if (material != null)
        {
            material.SetFloat("_GlowIntensity", intensitySlider.value);
            material.SetFloat("_EnableGlow", enableToggle.isOn ? 1f : 0f);
        }
    }
}
