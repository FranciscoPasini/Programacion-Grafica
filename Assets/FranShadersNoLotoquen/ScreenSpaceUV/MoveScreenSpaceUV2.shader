// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ScreenSpaceUV2"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 screenPos;
		};

		uniform sampler2D _TextureSample0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			o.Albedo = tex2D( _TextureSample0, ( (ase_screenPosNorm).xy + ( _Time.y * 1 * 0.01 ) ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
331;73;1119;669;874.9518;55.03107;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;17;-791.2755,240.9465;Inherit;False;451.139;403.5908;Genera el movimiento de la imágen (Float = velocidad / Vector = Eje X);4;4;9;5;8;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;16;-875.2508,-21.02802;Inherit;False;512.6884;257.8;Agarra posición de la cámara en X e Y;2;1;2;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;1;-825.2508,28.97198;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;4;-690.8786,290.9465;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;9;-741.2755,397.5466;Inherit;False;Constant;_Vector0;Vector 0;2;0;Create;True;0;0;0;False;0;False;1,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;5;-703.3143,529.3772;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2;-595.4224,31.41087;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-507.6765,328.6459;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6;-308.6224,34.17429;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;3;-174.2818,3.49286;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;5147e0750b071d54d9e94e145396dd69;5147e0750b071d54d9e94e145396dd69;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;102.4,-9.536743E-07;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ScreenSpaceUV2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;1;0
WireConnection;8;0;4;0
WireConnection;8;1;9;1
WireConnection;8;2;5;0
WireConnection;6;0;2;0
WireConnection;6;1;8;0
WireConnection;3;1;6;0
WireConnection;0;0;3;0
ASEEND*/
//CHKSM=E65A703E4786346E4788CC113B8C9F40255FBAAB