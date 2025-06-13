using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class RuntimeManager : MonoBehaviour
{
    [SerializeField] private Material vignette;
    [SerializeField] private Slider IntensitySlider;
    [SerializeField] private Slider PowerSlider;

    private void Start()
    {
        if (vignette.HasProperty("_VignetteIntensity"))
        {
            IntensitySlider.value = vignette.GetFloat("_VignetteIntensity");
        }

        IntensitySlider.onValueChanged.AddListener(UpdateVignetteIntensity);


        if (vignette.HasProperty("_VignettePower"))
        {
            PowerSlider.value = vignette.GetFloat("_VignettePower");
        }

        PowerSlider.onValueChanged.AddListener(UpdateVignettePower);
    }
    private void UpdateVignetteIntensity(float value)
    {
        if (vignette != null)
        {
            vignette.SetFloat("_VignetteIntensity", value);
        }
    }
    private void UpdateVignettePower(float value)
    {
        if (vignette != null)
        {
            vignette.SetFloat("_VignettePower", value);
        }
    }

    private void OnDestroy()
    {
        // Evita memory leaks removiendo el listener
        IntensitySlider.onValueChanged.RemoveListener(UpdateVignetteIntensity);
        PowerSlider.onValueChanged.RemoveListener(UpdateVignettePower);
    }

}
