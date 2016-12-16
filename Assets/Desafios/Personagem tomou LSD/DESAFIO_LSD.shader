Shader "MADPENGUIN_BOOTCAMP/DESAFIO_LSD"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			//roda uma vez pra cada vertice do modelo ou imagem.
			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = v.uv;
				return o;
			}

			sampler2D _MainTex;

			//roda uma vez pra cada pixel.
			//a função básica dessa função é dizer para a placa de vídeo que cor o pixel deve ser.
			fixed4 frag(v2f i) : SV_Target
			{
				////EXEMPLO UM
				////pega a cor de uma imagem "_MainTex"
				////a função básica é dizer para a placa de vídeo que cor o pixel deve ser.
				fixed4 col = tex2D(_MainTex, i.uv);
				//// inverte as cores da imagem
				//col = 1 - col;
				////deixa o canal RED da cor estourado
				//col.r = 1;
				return col;

				////EXEMPLO DOIS
				////pega a cor de uma imagem "_MainTex"
				////a função básica é dizer para a placa de vídeo que cor o pixel deve ser.
				//fixed4 col = tex2D(_MainTex, i.uv + float2(0,0.2));
				////adicionamos uma nova função que faz a imagem renderizada ser "jogada" pra cima (x,y).
				//return col;

				////EXEMPLO TRÊS
				////pega a cor de uma imagem "_MainTex"
				////a função básica é dizer para a placa de vídeo que cor o pixel deve ser.
				//fixed4 col = tex2D(_MainTex, i.uv + float2(0, i.vertex.x/1500));
				////agora ao inves de jogar pra cima nós alteramos o Y proporcionalmente a sua posição no x.
				//return col;

				////EXEMPLO QUATRO
				////pega a cor de uma imagem "_MainTex"
				////a função básica é dizer para a placa de vídeo que cor o pixel deve ser.
				//fixed4 col = tex2D(_MainTex, i.uv + float2(0, i.vertex.x / 1500));
				////agora ao inves de jogar pra cima nós alteramos o Y proporcionalmente a sua posição no x.
				//return col;

				////EXEMPLO CINCO
				////pega a cor de uma imagem "_MainTex"
				////a função básica é dizer para a placa de vídeo que cor o pixel deve ser.
				//fixed4 col = tex2D(_MainTex, i.uv + float2(0, sin(i.vertex.x /50)/10));
				////usando o seno(não manjo) conseguimos um efeito um pouco mais maluco.
				//return col;

				////EXEMPLO SEIS
				////pega a cor de uma imagem "_MainTex"
				////a função básica é dizer para a placa de vídeo que cor o pixel deve ser.
				//fixed4 col = tex2D(_MainTex, i.uv + float2(0, sin(i.vertex.x / 50 + _Time[2]) / 10));
				////mesma função anterior, só que dessa vez usando _Time[].
				////_Time[1] conta quantos segundos o jogo está em PLAY
				////****ESSE PRECISA DAR PLAY PRA VER.
				//return col;

				//---------------------------------------------------------------------------------------

				//EXTRA
				//MOSTRE SUA CRIATIVIDADE....
				//EM UM FPS, O PERSONAGEM TOMOU LSD, COMO SERIA A VISÃO DELE?

				//---------------------------------------------------------------------------------------
			}
			ENDCG
		}
	}
}
