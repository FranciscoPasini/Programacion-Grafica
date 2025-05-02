// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "WorldSpaceUV"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample0;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 ase_worldPos = i.worldPos;
			float2 uv_TexCoord12 = i.uv_texcoord * (ase_worldPos).xz;
			o.Albedo = tex2D( _TextureSample0, ( uv_TexCoord12 * 0.3 ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
331;73;1119;669;1568.268;361.6035;2.193885;True;True
Node;AmplifyShaderEditor.CommentaryNode;14;-1119.718,8.046961;Inherit;False;474.6457;234.6599;Agarra posición del mundo en los valores X y Z;2;11;2;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldPosInputsNode;2;-1069.718,63.06688;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;15;-627.4045,-13.74096;Inherit;False;386.438;411.7607;Agarra la posición del UV del objeto;3;9;12;8;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode;11;-877.9336,58.04696;Inherit;False;True;False;True;True;1;0;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-531.606,282.8597;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-577.4045,36.25904;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-408.5065,176.1591;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-218.2338,33.79743;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;5147e0750b071d54d9e94e145396dd69;5147e0750b071d54d9e94e145396dd69;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;87.75541,26.32661;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;WorldSpaceUV;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;11;0;2;0
WireConnection;12;0;11;0
WireConnection;8;0;12;0
WireConnection;8;1;9;0
WireConnection;1;1;8;0
WireConnection;0;0;1;0
ASEEND*/
//CHKSM=C0E81E10DB8C64F69ACA7D9E3AAC078AD07D4D2F