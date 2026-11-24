Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"posteffect_base.fxh"
}

PixelShader =
{
	Samplers =
	{
		MainScene =
		{
			Index = 0
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		RestoreBloom =
		{
			Index = 1
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "None"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		ColorCube =
		{
			Index = 2
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "None"
			AddressU = "Clamp"
			AddressV = "Clamp"
			MaxAnisotropy = 0
		}
		AverageLuminanceTexture =
		{
			Index = 3
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
	float2 uv				: TEXCOORD0;
};

VertexShader =
{
	MainCode VertexShader
	[[
		VS_OUTPUT_BLOOM main( const VS_INPUT VertexIn )
		{
			VS_OUTPUT_BLOOM VertexOut;
			VertexOut.position = float4( VertexIn.position, 0.0f, 1.0f );
		
			VertexOut.uv = float2(VertexIn.position.x, FIX_FLIPPED_UV(VertexIn.position.y)) * 0.5 + 0.5;
			VertexOut.uv.y = 1.0f - VertexOut.uv.y;
		
			return VertexOut;
		}
	]]
}

PixelShader =
{
	MainCode PixelShader
	[[
		static const float CubeSize = 32.0;
		float3 SampleColorCube(float3 aColor)
		{	
			float scale = (CubeSize - 1.0) / CubeSize;
			float offset = 0.5 / CubeSize;
			
			float x = ((scale * aColor.r + offset) / CubeSize);
			float y = scale * aColor.g + offset;
			
			float zFloor = floor((scale * aColor.b + offset) * CubeSize);
			float xOffset1 = zFloor / CubeSize;
			float xOffset2 = min(CubeSize - 1.0, zFloor + 1.0) / CubeSize;
			
			float3 color1 = tex2D( ColorCube, float2(x + xOffset1, y) ).rgb;
			float3 color2 = tex2D( ColorCube, float2(x + xOffset2, y) ).rgb;
			
			float3 color = lerp(color1, color2, scale * aColor.b * CubeSize - zFloor );
				
			return color;
		}
		
		static const float2 LevelValue = float2( 0.04f, 0.8f );    // First: DARKNESS 0.0 Normal, the higher the darker   Second: Brightness, Lower = brighter
		float4 RestoreScene( float3 inColor )
		{
			#ifdef COLOR_LUT
				float3 color = SampleColorCube( inColor );
				float3 HSV_ = RGBtoHSV( color.rgb );
				HSV_.yz *= HSV.yz;
				HSV_.x += HSV.x;
				HSV_.x = mod( HSV_.x, 6.0 ); // H was wrapped into [0, 6) on the line above, so the branchless version gives the same colour
				color = HSVtoRGBPostFast( HSV_ );
			
				color = saturate( color * ColorBalance );
				color = Levels( color, LevelValue.x, LevelValue.y );
			
				return float4( color, 1.0f );
			#else
				return float4( inColor, 1.0f );
			#endif
		}
		
		float3 Exposure(float3 inColor) // Exposure
		{
			float AverageLuminance = tex2Dlod0(AverageLuminanceTexture, vec2(0.5)).r; 
			return inColor * (MiddleGrey / AverageLuminance);
		}
		
		float3 Uncharted2Tonemap(float3 x) // Tonemapping
		{
			float A = 0.22;
			float B = 0.30;
			float C = 0.10;
			float D = 0.20;
			float E = 0.01;
			float F = 0.30;
			
			return ((x*(A*x+C*B)+D*E)/(x*(A*x+B)+D*F))-E/F;
		}
		
		float3 ToneMap(float3 inColor)
		{	
			float ExposureBias = 1.0f;
			float W = 11.2;
			
			float3 curr = Uncharted2Tonemap(ExposureBias * inColor);
			float3 whiteScale = 1.0 / Uncharted2Tonemap(vec3(W));
			float3 color = curr * whiteScale;
			color = pow(color, vec3(1.0 / 2.2));
			return color;
		}
		
		float4 main( VS_OUTPUT_BLOOM Input ) : PDX_COLOR
		{
			float3 color = tex2Dlod0( MainScene, Input.uv ).rgb;
			
			#ifdef BLOOM
				float3 bloom = tex2Dlod0( RestoreBloom, Input.uv * BloomToScreenScale ).rgb;
				color = bloom.rgb + color; // todo * bloomscale?
			#endif
			
			#ifdef HDR
				color = Exposure(color);
				color = ToneMap(color);
			#endif
			
			return RestoreScene( saturate(color) );
		}
	]]
}

BlendState BlendState
{
	BlendEnable = no
	WriteMask = "RED|GREEN|BLUE"
}


Effect RestoreBloom
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
	Defines = { "BLOOM" }
}

Effect Restore
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}