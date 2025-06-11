// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "HeightMapShader"
{
	Properties
	{
		_ASEOutlineColor( "Outline Color", Color ) = (0,0,0,0)
		_ASEOutlineWidth( "Outline Width", Float ) = 0
		_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 32
		_Intensity("_Intensity", Range( 1 , 5)) = 1
		_HeightMapTex1("_HeightMapTex", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ }
		Cull Front
		CGPROGRAM
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface outlineSurf Outline nofog  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc tessellate:tessFunction 
		
		
		
		
		struct Input {
			half filler;
		};
		float4 _ASEOutlineColor;
		float _ASEOutlineWidth;
		uniform float _TessValue;

		float4 tessFunction( )
		{
			return _TessValue;
		}

		void outlineVertexDataFunc( inout appdata_full v )
		{
			v.vertex.xyz += ( v.normal * _ASEOutlineWidth );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			o.Emission = _ASEOutlineColor.rgb;
			o.Alpha = 1;
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred vertex:vertexDataFunc tessellate:tessFunction 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _HeightMapTex1;
		uniform float4 _HeightMapTex1_ST;
		uniform float _Intensity;
		uniform float _TessValue;

		float4 tessFunction( )
		{
			return _TessValue;
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float2 uv_HeightMapTex1 = v.texcoord * _HeightMapTex1_ST.xy + _HeightMapTex1_ST.zw;
			float4 tex2DNode1 = tex2Dlod( _HeightMapTex1, float4( uv_HeightMapTex1, 0, 0.0) );
			v.vertex.xyz += ( tex2DNode1.r * float3(0,1,0) * _Intensity );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_HeightMapTex1 = i.uv_texcoord * _HeightMapTex1_ST.xy + _HeightMapTex1_ST.zw;
			float4 tex2DNode1 = tex2D( _HeightMapTex1, uv_HeightMapTex1 );
			o.Albedo = tex2DNode1.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
1920;23;1920;996;1003.852;489.273;1;False;False
Node;AmplifyShaderEditor.CommentaryNode;6;-679.8525,-191.273;Inherit;False;348;265;Entrada del HeightMap;1;1;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;11;-294.8525,-80.27298;Inherit;False;264;178;Extracción del valor de altura;1;2;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;10;-552.8525,134.727;Inherit;False;399;106;Control de intensidad;1;3;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;7;-270.8525,-288.273;Inherit;False;254;193;Dirección de desplazamiento;1;5;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;1;-627.7043,-139.8035;Inherit;True;Property;_HeightMapTex1;_HeightMapTex;6;0;Create;True;0;0;0;False;0;False;-1;e5e64352038d4c248a2fa58aa9925952;e5e64352038d4c248a2fa58aa9925952;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;8;-88.85248,-15.27298;Inherit;False;283;165;Cálculo de desplazamiento final;1;4;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;3;-475.7043,171.1965;Inherit;False;Property;_Intensity;_Intensity;5;0;Create;True;0;0;0;False;0;False;1;1;1;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;5;-207.7043,-239.8035;Inherit;False;Constant;_Vector1;Vector 0;1;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;2;-215.7043,-43.8035;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.CommentaryNode;9;242.1475,-179.273;Inherit;False;273;548;Aplicación al vértice;1;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-3.7043,28.19647;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;279.0567,-105.839;Float;False;True;-1;6;ASEMaterialInspector;0;0;Standard;HeightMapShader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;True;1;32;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;True;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;0;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;1;0
WireConnection;4;0;2;0
WireConnection;4;1;5;0
WireConnection;4;2;3;0
WireConnection;0;0;1;0
WireConnection;0;11;4;0
ASEEND*/
//CHKSM=42AA46D5D411826371AE33712C62322E9414419C