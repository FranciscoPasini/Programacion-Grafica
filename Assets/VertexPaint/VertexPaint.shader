// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "VertexPaint"
{
	Properties
	{
		_Texture_Dirt("Texture_Dirt", 2D) = "white" {}
		_Texture_Grass("Texture_Grass", 2D) = "white" {}
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

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			v.vertex.xyz += ( float3(0,1,0) * ( v.color.r * 0.5 ) );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 color6 = IsGammaSpace() ? float4(0.1882353,0.5803922,0.0509804,1) : float4(0.02955684,0.2961383,0.004024717,1);
			float2 uv_Texture_Grass = i.uv_texcoord * _Texture_Grass_ST.xy + _Texture_Grass_ST.zw;
			float4 lerpResult2 = lerp( color6 , tex2D( _Texture_Grass, uv_Texture_Grass ) , i.vertexColor.g);
			float2 uv_Texture_Dirt = i.uv_texcoord * _Texture_Dirt_ST.xy + _Texture_Dirt_ST.zw;
			float4 lerpResult3 = lerp( lerpResult2 , tex2D( _Texture_Dirt, uv_Texture_Dirt ) , i.vertexColor.b);
			o.Albedo = lerpResult3.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
151;73;1459;681;1276.435;-194.1153;1.105831;True;True
Node;AmplifyShaderEditor.VertexColorNode;1;-1369.416,317.5564;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;7;-767.2978,280.6082;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;12;-661.0862,853.446;Inherit;False;Constant;_Float0;Float 0;2;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;17;-888.5999,722.343;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;6;-1088.721,-241.2138;Inherit;False;Constant;_Base;Base;2;0;Create;True;0;0;0;False;0;False;0.1882353,0.5803922,0.0509804,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;8;-505.2374,160.7115;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;5;-900.312,-4.846202;Inherit;True;Property;_Texture_Grass;Texture_Grass;1;0;Create;True;0;0;0;False;0;False;-1;c23c449aa46be9445be5a3d429dec22c;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;11;-608.4005,597.7499;Inherit;False;Constant;_Vector0;Vector 0;2;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-366.5009,738.3421;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;2;-413.8739,-97.33788;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;4;-554.3245,238.3725;Inherit;True;Property;_Texture_Dirt;Texture_Dirt;0;0;Create;True;0;0;0;False;0;False;-1;30d6174462a3a1d41a1e365614b62f3d;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;9;-332.2454,445.037;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-133.4525,613.1226;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;3;-35.34333,147.5937;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;15;455.7773,623.2104;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;576.9941,162.2736;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;VertexPaint;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;7;0;1;2
WireConnection;17;0;1;1
WireConnection;8;0;7;0
WireConnection;13;0;17;0
WireConnection;13;1;12;0
WireConnection;2;0;6;0
WireConnection;2;1;5;0
WireConnection;2;2;8;0
WireConnection;9;0;1;3
WireConnection;14;0;11;0
WireConnection;14;1;13;0
WireConnection;3;0;2;0
WireConnection;3;1;4;0
WireConnection;3;2;9;0
WireConnection;15;0;14;0
WireConnection;0;0;3;0
WireConnection;0;11;15;0
ASEEND*/
//CHKSM=E459BA82405775119A2F4B8DF20CE11D0219EBE1