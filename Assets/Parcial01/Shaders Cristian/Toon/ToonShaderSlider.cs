using UnityEngine;
using UnityEngine.UI;

public class ToonShaderSlider : MonoBehaviour
{
    [Header("Material Toon Shader")]
    public Material toonMaterial;

    [Header("Sliders de Umbral")]
    public Slider ShadowForce;   
    public Slider ShadowForce2;     
    public Slider ShadowForce3;      

 
    const string ShadowProp = "_ShadowForce";
    const string MidProp = "_ShadowForceStep2";
    const string BrightProp = "_ShadowForceStep3";

    void Start()
    {
      
        UpdateShaderValues();
    }

    void Update()
    {

        UpdateShaderValues();
    }

    void UpdateShaderValues()
    {
        if (toonMaterial == null) return;

        toonMaterial.SetFloat(ShadowProp, ShadowForce.value);
        toonMaterial.SetFloat(MidProp, ShadowForce2.value);
        toonMaterial.SetFloat(BrightProp, ShadowForce3.value);
    }
}
