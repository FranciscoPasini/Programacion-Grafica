// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_ShadowThreshold1("ShadowThreshold", Float) = 0.33
		_BrightThreshold1("BrightThreshold", Float) = 0.66
		_ShadowColor1("ShadowColor ", Color) = (0.245283,0.245283,0.245283,0)
		_MidColor1("MidColor ", Color) = (0.6981132,0.6981132,0.6981132,0)
		_BrightColor1("BrightColor ", Color) = (1,1,1,0)
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
		};

		uniform float4 _ShadowColor1;
		uniform float _ShadowThreshold1;
		uniform float4 _MidColor1;
		uniform float _BrightThreshold1;
		uniform float4 _BrightColor1;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float3 ase_worldNormal = UnityObjectToWorldNormal( v.normal );
			float3 normalizeResult12 = normalize( ase_worldNormal );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float3 normalizeResult14 = normalize( ase_worldlightDir );
			float dotResult2 = dot( normalizeResult12 , normalizeResult14 );
			float temp_output_1_0 = step( _ShadowThreshold1 , dotResult2 );
			float temp_output_5_0 = step( _BrightThreshold1 , dotResult2 );
			v.vertex.xyz += ( ( ( _ShadowColor1 * ( 1.0 - temp_output_1_0 ) ) + ( _MidColor1 * ( temp_output_1_0 - temp_output_5_0 ) ) ) + ( _BrightColor1 * temp_output_5_0 ) ).rgb;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
836;73;1083;926;65.20599;342.5321;1;True;False
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;10;-573.4016,-134.501;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldNormalVector;17;-556.365,-354.093;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.NormalizeNode;14;-323.9818,-133.0439;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;12;-338.5379,-333.501;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-175.9888,-67.448;Inherit;False;Property;_BrightThreshold1;BrightThreshold;1;0;Create;True;0;0;0;False;0;False;0.66;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;2;-209.6615,-248.168;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-209.528,-432.946;Inherit;False;Property;_ShadowThreshold1;ShadowThreshold;0;0;Create;True;0;0;0;False;0;False;0.33;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;5;-39.11359,-195.2009;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;1;-45.7131,-334.9021;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;6;88.24451,-393.0439;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;13;102.5444,-269.5449;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;16;-178.7556,32.68091;Inherit;False;Property;_ShadowColor1;ShadowColor ;2;0;Create;True;0;0;0;False;0;False;0.245283,0.245283,0.245283,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;11;-180.9944,234.5679;Inherit;False;Property;_MidColor1;MidColor ;3;0;Create;True;0;0;0;False;0;False;0.6981132,0.6981132,0.6981132,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;19;-172.9866,430.344;Inherit;False;Property;_BrightColor1;BrightColor ;4;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;253.5124,-294.292;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;251.3379,-143.582;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;417.7384,-225.4819;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;251.3379,9.817871;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;3;595.3124,-92.66797;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;801.6487,-275.2327;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;14;0;10;0
WireConnection;12;0;17;0
WireConnection;2;0;12;0
WireConnection;2;1;14;0
WireConnection;5;0;18;0
WireConnection;5;1;2;0
WireConnection;1;0;15;0
WireConnection;1;1;2;0
WireConnection;6;0;1;0
WireConnection;13;0;1;0
WireConnection;13;1;5;0
WireConnection;8;0;16;0
WireConnection;8;1;6;0
WireConnection;7;0;11;0
WireConnection;7;1;13;0
WireConnection;9;0;8;0
WireConnection;9;1;7;0
WireConnection;4;0;19;0
WireConnection;4;1;5;0
WireConnection;3;0;9;0
WireConnection;3;1;4;0
WireConnection;0;11;3;0
ASEEND*/
//CHKSM=952CADBE449A00DD404C07D6689B449838E4DD37