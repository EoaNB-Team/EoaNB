Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"posteffect_base.fxh"
}

PixelShader =
{
	Samplers =
	{
		BloomSource =
		{
			Index = 0
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
	}
}

VertexStruct VS_INPUT
{
    int2 position	: POSITION;
};

VertexStruct VS_OUTPUT_BLOOM
{
    float4 position			: PDX_POSITION;
	float2 uvBloom			: TEXCOORD0;
	float4 uvBloom2_0		: TEXCOORD1;
	float4 uvBloom2_1		: TEXCOORD2;
	float4 uvBloom2_2		: TEXCOORD3;
	float4 uvBloom2_3		: TEXCOORD4;
};

ConstantBuffer( 2, 39 )
{
	float2 InvBloomSize;
	float Axis;
	float Weight0;
	float4 Weights;
	float4 Offsets;
};


VertexShader =
{
	MainCode VertexShader
	[[
		#if OPT_BLOOM_MERGE_TAPS
			// Pairs of taps one whole texel apart ( offsets 1,2 and 3,4 ) can be read as ONE bilinear tap placed between the two texels, with the weights added: ( w0 * t1 + w1 * t2 ) == ( w0 + w1 ) * lerp( t1, t2, w1 / ( w0 + w1 ) ). The blur then needs 5 lookups instead of 9. Same test in the vertex and the pixel shader.
			#define BLOOM_CAN_MERGE ( ( Offsets[1] - Offsets[0] ) == 1.0f && ( Offsets[3] - Offsets[2] ) == 1.0f && Offsets[0] == floor( Offsets[0] ) && Offsets[2] == floor( Offsets[2] ) && ( Weights[0] + Weights[1] ) > 0.0f && ( Weights[2] + Weights[3] ) > 0.0f )
		#endif
		VS_OUTPUT_BLOOM main( const VS_INPUT VertexIn )
		{
			VS_OUTPUT_BLOOM VertexOut;
			VertexOut.position = float4( VertexIn.position, 0.0f, 1.0f );

			VertexOut.uvBloom = ( VertexIn.position + 1.0f ) * 0.5f;
			VertexOut.uvBloom.y = 1.0f - VertexOut.uvBloom.y;

			float2 vInvSize = InvBloomSize;

			float2 vAxisOffset = vInvSize * float2( Axis, 1.0 - Axis );

			float4 vOffsets = Offsets;
			#if OPT_BLOOM_MERGE_TAPS
				if ( BLOOM_CAN_MERGE )
				{
					// slot 0 carries the merged 1+2 tap and slot 1 the merged 3+4 tap
					vOffsets[0] = Offsets[0] + Weights[1] / ( Weights[0] + Weights[1] );
					vOffsets[1] = Offsets[2] + Weights[3] / ( Weights[2] + Weights[3] );
				}
			#endif

			VertexOut.uvBloom2_0 = float4( VertexOut.uvBloom + vAxisOffset * vOffsets[0], VertexOut.uvBloom - vAxisOffset * vOffsets[0] );
			VertexOut.uvBloom2_1 = float4( VertexOut.uvBloom + vAxisOffset * vOffsets[1], VertexOut.uvBloom - vAxisOffset * vOffsets[1] );
			VertexOut.uvBloom2_2 = float4( VertexOut.uvBloom + vAxisOffset * vOffsets[2], VertexOut.uvBloom - vAxisOffset * vOffsets[2] );
			VertexOut.uvBloom2_3 = float4( VertexOut.uvBloom + vAxisOffset * vOffsets[3], VertexOut.uvBloom - vAxisOffset * vOffsets[3] );

			return VertexOut;
		}
	]]
}

PixelShader =
{
	MainCode PixelShader
	[[
		#if OPT_BLOOM_MERGE_TAPS
			#define BLOOM_CAN_MERGE ( ( Offsets[1] - Offsets[0] ) == 1.0f && ( Offsets[3] - Offsets[2] ) == 1.0f && Offsets[0] == floor( Offsets[0] ) && Offsets[2] == floor( Offsets[2] ) && ( Weights[0] + Weights[1] ) > 0.0f && ( Weights[2] + Weights[3] ) > 0.0f )
		#endif
		float4 main( VS_OUTPUT_BLOOM Input ) : PDX_COLOR
		{
			float3 color = tex2Dlod0( BloomSource, Input.uvBloom ).rgb * Weight0;

			#if OPT_BLOOM_MERGE_TAPS
				if ( BLOOM_CAN_MERGE )
				{
					color += ( Weights[0] + Weights[1] ) * ( tex2Dlod0( BloomSource, Input.uvBloom2_0.xy ).rgb + tex2Dlod0( BloomSource, Input.uvBloom2_0.zw ).rgb );
					color += ( Weights[2] + Weights[3] ) * ( tex2Dlod0( BloomSource, Input.uvBloom2_1.xy ).rgb + tex2Dlod0( BloomSource, Input.uvBloom2_1.zw ).rgb );
				}
				else
			#endif
			{
				color += Weights[0] * ( tex2Dlod0( BloomSource, Input.uvBloom2_0.xy ).rgb + tex2Dlod0( BloomSource, Input.uvBloom2_0.zw ).rgb );
				color += Weights[1] * ( tex2Dlod0( BloomSource, Input.uvBloom2_1.xy ).rgb + tex2Dlod0( BloomSource, Input.uvBloom2_1.zw ).rgb );
				color += Weights[2] * ( tex2Dlod0( BloomSource, Input.uvBloom2_2.xy ).rgb + tex2Dlod0( BloomSource, Input.uvBloom2_2.zw ).rgb );
				color += Weights[3] * ( tex2Dlod0( BloomSource, Input.uvBloom2_3.xy ).rgb + tex2Dlod0( BloomSource, Input.uvBloom2_3.zw ).rgb );
			}

			return float4(color, 1.0);
		}
	]]

	MainCode PixelShaderAlpha
	[[
		#if OPT_BLOOM_MERGE_TAPS
			#define BLOOM_CAN_MERGE ( ( Offsets[1] - Offsets[0] ) == 1.0f && ( Offsets[3] - Offsets[2] ) == 1.0f && Offsets[0] == floor( Offsets[0] ) && Offsets[2] == floor( Offsets[2] ) && ( Weights[0] + Weights[1] ) > 0.0f && ( Weights[2] + Weights[3] ) > 0.0f )
		#endif
		float4 main( VS_OUTPUT_BLOOM Input ) : PDX_COLOR
		{
			float value = tex2Dlod0( BloomSource, Input.uvBloom ).a * Weight0;

			#if OPT_BLOOM_MERGE_TAPS
				if ( BLOOM_CAN_MERGE )
				{
					value += ( Weights[0] + Weights[1] ) * ( tex2Dlod0( BloomSource, Input.uvBloom2_0.xy ).a + tex2Dlod0( BloomSource, Input.uvBloom2_0.zw ).a );
					value += ( Weights[2] + Weights[3] ) * ( tex2Dlod0( BloomSource, Input.uvBloom2_1.xy ).a + tex2Dlod0( BloomSource, Input.uvBloom2_1.zw ).a );
				}
				else
			#endif
			{
				value += Weights[0] * ( tex2Dlod0( BloomSource, Input.uvBloom2_0.xy ).a + tex2Dlod0( BloomSource, Input.uvBloom2_0.zw ).a );
				value += Weights[1] * ( tex2Dlod0( BloomSource, Input.uvBloom2_1.xy ).a + tex2Dlod0( BloomSource, Input.uvBloom2_1.zw ).a );
				value += Weights[2] * ( tex2Dlod0( BloomSource, Input.uvBloom2_2.xy ).a + tex2Dlod0( BloomSource, Input.uvBloom2_2.zw ).a );
				value += Weights[3] * ( tex2Dlod0( BloomSource, Input.uvBloom2_3.xy ).a + tex2Dlod0( BloomSource, Input.uvBloom2_3.zw ).a );
			}

			return float4(0.0, 0.0, 0.0, value);
		}
	]]
}

BlendState BlendState
{
	BlendEnable = no
}

Effect bloom
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}

Effect bloom_alpha
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShaderAlpha"
}