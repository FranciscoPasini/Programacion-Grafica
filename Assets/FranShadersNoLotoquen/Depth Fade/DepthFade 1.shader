// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DepthFade 1"
{
	Properties
	{
		_Bias3("Bias", Range( 0 , 1)) = 0.4
		_Scale3("Scale", Range( 0 , 1)) = 1
		_Float3("Float 0", Range( 0 , 2)) = 0.9070593

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Opaque" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend Off
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		
		
		
		Pass
		{
			Name "Unlit"
			Tags { "LightMode"="ForwardBase" }
			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
			uniform float4 _CameraDepthTexture_TexelSize;
			uniform float _Bias3;
			uniform float _Scale3;
			uniform float _Float3;
					float2 voronoihash7( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi7( float2 v, float time, inout float2 id, inout float2 mr, float smoothness )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash7( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						 		}
						 	}
						}
						return F1;
					}
			

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord2 = screenPos;
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float4 color9 = IsGammaSpace() ? float4(0,0.458181,0.6509434,0) : float4(0,0.177355,0.3812781,0);
				float mulTime6 = _Time.y * 3.0;
				float time7 = mulTime6;
				float2 coords7 = i.ase_texcoord1.xy * 10.0;
				float2 id7 = 0;
				float2 uv7 = 0;
				float voroi7 = voronoi7( coords7, time7, id7, uv7, 0 );
				float4 screenPos = i.ase_texcoord2;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float screenDepth3 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
				float distanceDepth3 = abs( ( screenDepth3 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( 1.0 ) );
				
				
				finalColor = saturate( ( ( color9 + voroi7 ) + ( 1.0 - pow( ( ( distanceDepth3 + _Bias3 ) * _Scale3 ) , _Float3 ) ) ) );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	
}
/*ASEBEGIN
Version=18900
331;73;1119;669;1000.311;569.483;1.350496;True;True
Node;AmplifyShaderEditor.CommentaryNode;16;-894.4963,83.38486;Inherit;False;1013.157;464.341;Reflejo del objeto con el agua y la profundidad;8;2;3;4;5;10;11;12;13;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;19;-693.0894,-393.7284;Inherit;False;727.3041;443.7208;Textura de Agua;4;9;8;17;18;;0,0.4588236,0.6509804,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-844.4963,247.385;Inherit;False;Property;_Bias3;Bias;0;0;Create;True;0;0;0;False;0;False;0.4;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;3;-833.4963,134.385;Inherit;False;True;False;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4;-546.4959,133.385;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-730.4959,341.3853;Inherit;False;Property;_Scale3;Scale;1;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;18;-643.0894,-157.2344;Inherit;False;248.29;160.16;Velocidad del efecto blanco;1;6;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;17;-388.1729,-156.4876;Inherit;False;249.95;206.48;Efecto blanco del agua;1;7;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleTimeNode;6;-593.0894,-107.2344;Inherit;False;1;0;FLOAT;3;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-543.0369,432.5659;Inherit;False;Property;_Float3;Float 0;2;0;Create;True;0;0;0;False;0;False;0.9070593;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-393.4969,133.3849;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;12;-231.4967,133.3849;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;9;-378.2946,-343.7284;Inherit;False;Constant;_Color2;Color 1;0;0;Create;True;0;0;0;False;0;False;0,0.458181,0.6509434,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VoronoiNode;7;-338.1729,-106.4876;Inherit;False;0;0;1;0;1;False;1;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;10;False;3;FLOAT;0;False;3;FLOAT;0;FLOAT2;1;FLOAT2;2
Node;AmplifyShaderEditor.OneMinusNode;13;-66.86923,137.9156;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-118.3753,-143.12;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;186.2865,30.51545;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;15;307.5317,24.003;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;455.1364,13.792;Float;False;True;-1;2;ASEMaterialInspector;100;1;DepthFade 1;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;False;True;0;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;True;0;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;1;RenderType=Opaque=RenderType;True;2;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;1;True;False;;False;0
WireConnection;4;0;3;0
WireConnection;4;1;2;0
WireConnection;10;0;4;0
WireConnection;10;1;5;0
WireConnection;12;0;10;0
WireConnection;12;1;11;0
WireConnection;7;1;6;0
WireConnection;13;0;12;0
WireConnection;8;0;9;0
WireConnection;8;1;7;0
WireConnection;14;0;8;0
WireConnection;14;1;13;0
WireConnection;15;0;14;0
WireConnection;0;0;15;0
ASEEND*/
//CHKSM=1893E621EF0671F98BDC93EAB6F1A22E96A577D6