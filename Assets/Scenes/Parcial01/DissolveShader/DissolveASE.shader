// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DissolveASE"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_Dissolve("Dissolve", Range( 0 , 1)) = 0
		_Noise("Noise", 2D) = "white" {}
		_Mask("Mask", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Mask;
		uniform float _Dissolve;
		uniform sampler2D _Noise;
		uniform float4 _Noise_ST;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Noise = i.uv_texcoord * _Noise_ST.xy + _Noise_ST.zw;
			float temp_output_5_0 = ( (-0.7 + (( 1.0 - _Dissolve ) - 0.0) * (0.7 - -0.7) / (1.0 - 0.0)) + tex2D( _Noise, uv_Noise ).r );
			float clampResult7 = clamp( (-4.0 + (temp_output_5_0 - 0.0) * (4.0 - -4.0) / (1.0 - 0.0)) , 0.0 , 1.0 );
			float2 temp_cast_0 = (clampResult7).xx;
			o.Emission = tex2D( _Mask, temp_cast_0 ).rgb;
			o.Alpha = 1;
			clip( temp_output_5_0 - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
10;102;1904;979;1890.247;367.9227;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;11;-2091.411,-46.28662;Inherit;False;531.7947;165.16;Float que controla el dissolve. One minus invierte el valor;2;2;1;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-2041.411,3.713388;Inherit;False;Property;_Dissolve;Dissolve;1;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;12;-1530.229,-47.55373;Inherit;False;576.9637;348.9295;Se remapea el valor de Dissolve y se añade al ADD junto al NoiseTexture;2;3;5;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;10;-1483.497,-380.2887;Inherit;False;354.1621;275.4873;NoiseTexture;1;4;;1,1,1,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;2;-1745.147,7.507597;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;3;-1436.412,5.28714;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.7;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4;-1447.035,-330.2887;Inherit;True;Property;_Noise;Noise;2;0;Create;True;0;0;0;False;0;False;-1;6e211314aaf90a34ab34ed882136da0f;6e211314aaf90a34ab34ed882136da0f;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;14;-892.5667,103.4278;Inherit;False;233.1595;228.7213;remapea el valor devuelta;1;6;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleAddOpNode;5;-1127.161,30.71344;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;13;-617.3151,39.63426;Inherit;False;318.3703;248.3772;asegura que el valor este entre 0 y 1;1;7;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;6;-865.0474,151.9291;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-4;False;4;FLOAT;4;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;15;-233.9389,25.14955;Inherit;False;367.7;280;Color del efecto de Dissolve;1;9;;1,1,1,1;0;0
Node;AmplifyShaderEditor.ClampOpNode;7;-518.0026,113.3787;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;16;225.8027,-345.6585;Inherit;False;383.29;479.56;Opacity Mask define que es visible y que no;1;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;9;-183.9389,75.14954;Inherit;True;Property;_Mask;Mask;3;0;Create;True;0;0;0;False;0;False;-1;1bc42debcca70914caae5d196b82dc39;1bc42debcca70914caae5d196b82dc39;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;275.8027,-295.6585;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;DissolveASE;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;0;True;Opaque;;AlphaTest;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;2;0;1;0
WireConnection;3;0;2;0
WireConnection;5;0;3;0
WireConnection;5;1;4;1
WireConnection;6;0;5;0
WireConnection;7;0;6;0
WireConnection;9;1;7;0
WireConnection;0;2;9;0
WireConnection;0;10;5;0
ASEEND*/
//CHKSM=0BB6FBD87CFD0381ABFC10C5A0C44BCEF1DA402C