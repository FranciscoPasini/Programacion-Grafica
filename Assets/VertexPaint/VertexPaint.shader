// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VertexPaint"
{
	Properties
	{
		_Texture_Dirt("Texture_Dirt", 2D) = "white" {}
		_Texture_Grass("Texture_Grass", 2D) = "white" {}
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
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		uniform sampler2D _Texture_Grass;
		uniform float4 _Texture_Grass_ST;
		uniform sampler2D _Texture_Dirt;
		uniform float4 _Texture_Dirt_ST;
		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float4 break27 = v.color;
			v.vertex.xyz += ( float3(0,1,0) * ( break27.r * 0.5 ) );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color41 = IsGammaSpace() ? float4(1,1,1,0) : float4(1,1,1,0);
			float2 uv_Texture_Grass = i.uv_texcoord * _Texture_Grass_ST.xy + _Texture_Grass_ST.zw;
			float4 break27 = i.vertexColor;
			float4 lerpResult2 = lerp( color41 , tex2D( _Texture_Grass, uv_Texture_Grass ) , break27.g);
			float2 uv_Texture_Dirt = i.uv_texcoord * _Texture_Dirt_ST.xy + _Texture_Dirt_ST.zw;
			float4 lerpResult3 = lerp( lerpResult2 , tex2D( _Texture_Dirt, uv_Texture_Dirt ) , break27.b);
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float4 lerpResult40 = lerp( lerpResult3 , tex2D( _TextureSample0, uv_TextureSample0 ) , break27.r);
			o.Albedo = lerpResult40.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
151;73;1459;767;760.1805;-7.62157;1.6;False;False
Node;AmplifyShaderEditor.VertexColorNode;1;-761.5966,300.3349;Inherit;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.BreakToComponentsNode;27;-408.4169,309.671;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.SamplerNode;5;-428.2629,-73.08015;Inherit;True;Property;_Texture_Grass;Texture_Grass;1;0;Create;True;0;0;0;False;0;False;-1;c23c449aa46be9445be5a3d429dec22c;c23c449aa46be9445be5a3d429dec22c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-232.0876,931.8884;Inherit;False;Constant;_Float0;Float 0;2;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;41;-369.7807,-289.9785;Inherit;False;Constant;_Color0;Color 0;3;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;2;-42.58451,-91.00949;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;4;-88.32056,184.2451;Inherit;True;Property;_Texture_Dirt;Texture_Dirt;0;0;Create;True;0;0;0;False;0;False;-1;30d6174462a3a1d41a1e365614b62f3d;30d6174462a3a1d41a1e365614b62f3d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;37;195.4212,376.4782;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-15.26157,911.7064;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;11;140.4104,732.3678;Inherit;False;Constant;_Vector0;Vector 0;2;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;31;318.8066,918.0471;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3;253.323,163.9981;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;39;-67.38036,465.2209;Inherit;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;b30d0fec18079724991e1bea3c18ff1a;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;376.5297,731.2499;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;40;355.0195,394.8215;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;799.3939,154.2736;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;VertexPaint;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;27;0;1;0
WireConnection;2;0;41;0
WireConnection;2;1;5;0
WireConnection;2;2;27;1
WireConnection;37;0;27;2
WireConnection;13;0;27;0
WireConnection;13;1;12;0
WireConnection;31;0;13;0
WireConnection;3;0;2;0
WireConnection;3;1;4;0
WireConnection;3;2;37;0
WireConnection;14;0;11;0
WireConnection;14;1;31;0
WireConnection;40;0;3;0
WireConnection;40;1;39;0
WireConnection;40;2;27;0
WireConnection;0;0;40;0
WireConnection;0;11;14;0
ASEEND*/
//CHKSM=9F8E0930A02445CA6C7EFFCD0AE0B615A3C9D9C4