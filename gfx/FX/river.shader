Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"shadow.fxh"
	"tiled_pointlights.fxh"
	"fow.fxh"
}

PixelShader =
{
	Samplers =
	{
		WaterColor =
		{
			Index = 0
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		Diffuse =
		{
			Index = 1
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Clamp"
		}
		NormalMap =
		{
			Index = 2
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Clamp"
		}
		RiverData =
		{
			Index = 3
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		LeanTexture1 =
		{
			Index = 4
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		LeanTexture2 =
		{
			Index = 5
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		ProvinceSecondaryColorMap =
		{
			Index = 6
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		HeightNormal =
		{
			Index = 7
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		SnowMudTexture =
		{
			Index = 8
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		CityLightsAndSnowNoise =
		{
			Index = 9
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		LightIndexMap =
		{
			Index = 10
			MagFilter = "Point"
			MinFilter = "Point"
			MipFilter = "Point"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		LightDataMap =
		{
			Index = 11
			MagFilter = "Point"
			MinFilter = "Point"
			MipFilter = "Point"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		GradientBorderChannel1 =
		{
			Index = 12
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		GradientBorderChannel2 =
		{
			Index = 13
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		ReflectionCubeMap =
		{
			Index = 14
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
			Type = "Cube"
		}
		ShadowMap =
		{
			Index = 15
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
			Type = "Shadow"
		}
	}
}


VertexStruct VS_INPUT
{
	float4 vPosition   : POSITION;
	float4 vUV_Tangent : TEXCOORD0;
};

VertexStruct VS_OUTPUT
{
	float4 vPosition	    : PDX_POSITION;
	float2 vUV			    : TEXCOORD0;
	float2 vTangent			: TEXCOORD1;
	float4 vPrePos_Fade		: TEXCOORD2;
	float4 vScreenCoord		: TEXCOORD3;
	float2 vWorldUV			: TEXCOORD4;
	float vTransp			: TEXCOORD5;
};


ConstantBuffer( 1, 32 )
{
	float4x4 ShadowMapTextureMatrix;
	float3 vTimeDirectionSeasonLerp;
};




VertexShader =
{
	MainCode VertexShader
	[[
		VS_OUTPUT main( const VS_INPUT v )
		{
			VS_OUTPUT Out;

			// World-space position is just the input xyz; w channel carries fade/transparency.
			float4 vWorldPos = float4( v.vPosition.xyz, 1.0f );
			Out.vPrePos_Fade.xyz = vWorldPos.xyz;
			Out.vTransp          = v.vPosition.w;

			// Standard projection.
			float4 vClipPos = mul( ViewProjectionMatrix, vWorldPos );

			// Push z slightly toward the camera (along view direction) so the river
			// surface doesn't z-fight with the terrain at grazing angles.
			float4 vDistortedPos = vWorldPos - float4( vCamLookAtDir * 0.05f, 0.0f );

			// Row 2 of the view-projection matrix gives clip-space z for any point.
			// Pulling it as a single row read is much cheaper than 4x GetMatrixData calls.
			float4 vRow2 = float4(
				GetMatrixData( ViewProjectionMatrix, 2, 0 ),
				GetMatrixData( ViewProjectionMatrix, 2, 1 ),
				GetMatrixData( ViewProjectionMatrix, 2, 2 ),
				GetMatrixData( ViewProjectionMatrix, 2, 3 ) );
			float vNewZ = dot( vDistortedPos, vRow2 );

			Out.vPosition = float4( vClipPos.xy, vNewZ, vClipPos.w );

			// UVs: original code swapped components and scaled x by 0.15.
			Out.vUV = float2( v.vUV_Tangent.y * 0.15f, v.vUV_Tangent.x );

			Out.vTangent       = v.vUV_Tangent.zw;
			Out.vPrePos_Fade.w = saturate( 1.0f - v.vUV_Tangent.y );

			// Screen-space coordinates for shadow / FOW sampling.
			// (.zw both equal w, so a single swizzle covers them.)
			Out.vScreenCoord.x  = ( Out.vPosition.x + Out.vPosition.w ) * 0.5f;
			Out.vScreenCoord.y  = ( Out.vPosition.w - Out.vPosition.y ) * 0.5f;
		#ifdef PDX_OPENGL
			Out.vScreenCoord.y = -Out.vScreenCoord.y;
		#endif
			Out.vScreenCoord.zw = Out.vPosition.ww;

			// World-space UVs in [0,1] mapped onto the power-of-two atlas.
			Out.vWorldUV = float2(
				 ( vWorldPos.x + 0.5f )            /  MAP_SIZE_X,
				-( vWorldPos.z + 0.5f - MAP_SIZE_Y ) / MAP_SIZE_Y
			) * float2( MAP_POW2_X, MAP_POW2_Y );

			return Out;
		}

	]]
}

PixelShader =
{
	MainCode PixelShader
	[[
		// --------------------------------------------------------------------
		// Constants pulled out of main() so they live in the constant pool
		// instead of being rebuilt every fragment.
		// --------------------------------------------------------------------
		static const float RIVER_TIME_SCALE = 0.4f;
		static const float RIVER_UV_SCALE_A = 0.6f * 0.4f;   // 0.24
		static const float RIVER_UV_SCALE_B = 0.4f;

		static const float2 RIVER_TIME_MULTIPLIERS[4] = {
			float2( 0.98f, 0.98f ) * RIVER_TIME_SCALE,
			float2( 1.03f, 1.03f ) * RIVER_TIME_SCALE,
			float2( 0.95f, 0.95f ) * RIVER_TIME_SCALE,
			float2( 1.02f, 1.02f ) * RIVER_TIME_SCALE
		};

		static const float2 RIVER_UV_MULTIPLIERS[4] = {
			float2(  RIVER_UV_SCALE_A,  RIVER_UV_SCALE_A ),
			float2(  RIVER_UV_SCALE_A,  RIVER_UV_SCALE_A ),
			float2(  RIVER_UV_SCALE_B, -RIVER_UV_SCALE_B ),
			float2(  RIVER_UV_SCALE_B, -RIVER_UV_SCALE_B )
		};


		float3 ApplyRiverSnow(
			float3 vColor,
			float3 vReflectColor,
			float3 vPos,
			inout float3 vNormal,
			float4 vMudSnowColor,
			in sampler2D SnowNoise,
			in float waterSideAlpha,
			out float vOutSpecGloss )
		{
			float vNoiseColor = tex2D( SnowNoise, vPos.xz * SNOW_ICE_NOISE_TILING ).a;
			float vIsSnow     = GetSnow( vMudSnowColor );

			float vOpacity = SNOW_OPACITY_MIN
			               + cam_distance( SNOW_CAM_MIN, SNOW_CAM_MAX )
			               * ( SNOW_OPACITY_MAX - SNOW_OPACITY_MIN );

			float vSnowAlpha = smoothstep( 0.0f, 1.0f, saturate( vIsSnow * vOpacity * 1.7f ) );

			float3 vSnowedWater = lerp(
				saturate( SNOW_WATER_COLOR * vReflectColor ),
				SNOW_COLOR,
				smoothstep( 0.4f, 0.75f, saturate( vNoiseColor + waterSideAlpha ) )
			);
			vColor = lerp( vColor, vSnowedWater, vSnowAlpha );

			vNormal.y += lerp( 20.0f, 1.0f, waterSideAlpha ) * vSnowAlpha;
			vNormal    = normalize( vNormal );

			vOutSpecGloss = vSnowAlpha;
			return vColor;
		}

		float4 main( VS_OUTPUT Input ) : PDX_COLOR
		{
			// ----------------------------------------------------------------
			// Mirror the V coord around 0.5 so both river banks share one
			// 0..1 strip of the diffuse / data textures. vFlip is +1 on the
			// "near" side, -1 on the "far" side, used later to mirror the
			// canal normal's Z. Branchless via step().
			// ----------------------------------------------------------------
			float  bNearSide = step( 0.5f, Input.vUV.y );           // 1 if y >= 0.5, else 0
			float  vFlip     = bNearSide * 2.0f - 1.0f;             // -1 or +1
			float2 vNewUV    = float2( Input.vUV.x,
			                           lerp( 1.0f - Input.vUV.y, Input.vUV.y, bNearSide ) );

			// Compress the bank region into the upper portion of the texture.
			vNewUV.y = saturate( vNewUV.y * 4.0f - 3.0f );

			// ----------------------------------------------------------------
			// Base water + bank diffuse sampling.
			// ----------------------------------------------------------------
			float3 waterColor = tex2D( WaterColor, Input.vWorldUV ).rgb;

		#ifdef LOW_END_GFX
			float4 diffuseColor   = float4( waterColor, 1.0f );
			float2 waterSideAlpha = float2( 0.0f, ( 1.0f - vNewUV.y ) * 0.8f );
		#else
			float4 diffuseColor   = tex2D( Diffuse,   float2( vNewUV.x, 1.0f - vNewUV.y ) );
			float2 waterSideAlpha = tex2D( RiverData, vNewUV ).br;

			// Force pure water in the central strip of the river (branchless).
			float vCenterStrip = 1.0f - step( 0.25f, abs( Input.vUV.y - 0.5f ) );
			waterSideAlpha = lerp( waterSideAlpha, float2( 0.0f, 1.0f ), vCenterStrip );
		#endif

			// ----------------------------------------------------------------
			// Animated water surface (LEAN-mapping based).
			// ----------------------------------------------------------------
			float2 B;
			float3 M;
			float3 waterNormal;

			float vTimeFlow = vTimeDirectionSeasonLerp.x * vTimeDirectionSeasonLerp.y * 0.05f;
			SampleWater( Input.vUV, RIVER_UV_MULTIPLIERS, vTimeFlow, RIVER_TIME_MULTIPLIERS,
			             B, M, waterNormal, LeanTexture1, LeanTexture2 );

		#ifdef LOW_END_GFX
			float3 SunDirWater = float3( 0.0f, 1.0f, 0.0f );
		#else
			float3 SunDirWater = CalculateSunDirectionWater( Input.vPrePos_Fade.xyz );
		#endif

			// ----------------------------------------------------------------
			// View / half vectors. We compute toCam ONCE and reuse it
			// (original code took normalize() of both +delta and -delta).
			// ----------------------------------------------------------------
			float3 vToCam  = normalize( vCamPos - Input.vPrePos_Fade.xyz );
			float3 vEyeDir = -vToCam;

			float3 H     = normalize( vToCam.xzy + -SunDirWater.xzy );
			float2 HWave = H.xy / H.z - B;

			// LEAN-mapping anisotropic specular.
			float3 sigma = M - float3( B * B, B.x * B.y );
			float  det   = sigma.x * sigma.y - sigma.z * sigma.z;
			float  e     = HWave.x * HWave.x * sigma.y
			             + HWave.y * HWave.y * sigma.x
			             - 2.0f * HWave.x * HWave.y * sigma.z;
			// rsqrt is faster than 1/sqrt; result is mathematically identical.
			float  spec  = ( det <= 0.0f ) ? 0.0f : exp( -0.5f * e / det ) * rsqrt( det );

			// ----------------------------------------------------------------
			// Surface normal: water normal in midstream, canal-side normal
			// near the banks.
			// ----------------------------------------------------------------
		#ifdef LOW_END_GFX
			float3 normal = waterNormal;
		#else
			float3 vCanalNormal = normalize( tex2D( NormalMap, float2( vNewUV.x, 1.0f - vNewUV.y ) ).rbg - 0.5f );
			vCanalNormal.z *= vFlip;

			float3 vTangent     = normalize( float3( Input.vTangent.x, 0.0f,  Input.vTangent.y ) );
			float3 vBitangent   = normalize( float3( Input.vTangent.y, 0.0f, -Input.vTangent.x ) );
			float3 vTmpNormal   = normalize( cross( vTangent, vBitangent ) );
			float3x3 TNB        = Create3x3( vTangent, vTmpNormal, vBitangent );
			float3 vSideNormal  = normalize( mul( vCanalNormal, TNB ) );

			float3 normal = normalize( lerp( waterNormal, vSideNormal, waterSideAlpha.x ) );
		#endif

			// ----------------------------------------------------------------
			// Gradient borders.
			// ----------------------------------------------------------------
			float gradientBorderFactor = 1.0f - gradient_border_camera_distance();
			float vBloomAlpha = 0.0f;

		#ifndef LOW_END_GFX
			gradient_border_apply( diffuseColor.rgb, normal, Input.vWorldUV,
				GradientBorderChannel1, GradientBorderChannel2, 1.0f,
				vGBCamDistOverride_GBOutlineCutoff.zw, vGBCamDistOverride_GBOutlineCutoff.xy,
				vBloomAlpha );

			float3 gradientBorderWaterColor = waterColor;
			gradient_border_apply( gradientBorderWaterColor, normal, Input.vWorldUV,
				GradientBorderChannel1, GradientBorderChannel2, 1.0f,
				vGBCamDistOverride_GBOutlineCutoff.zw, vGBCamDistOverride_GBOutlineCutoff.xy,
				vBloomAlpha );
			waterColor = lerp( waterColor, gradientBorderWaterColor, gradientBorderFactor );
		#endif

			// ----------------------------------------------------------------
			// Reflection + Schlick-ish fresnel. pow(x, 10) is expanded as
			// three muls (x2, x4, x8 then combine) which avoids the costly
			// generic pow path on most drivers.
			// ----------------------------------------------------------------
			float3 reflection      = reflect( vEyeDir, normal );
			float3 reflectiveColor = texCUBE( ReflectionCubeMap, reflection ).rgb * 1.3f;

			const float fresnelBias = 0.5f;
			float fresnelTerm = 1.0f - saturate( dot( vToCam, normal ) ) * 0.5f;
			// pow( x, 10 ) = x^8 * x^2  (3 muls instead of pow)
			float fr2  = fresnelTerm * fresnelTerm;
			float fr4  = fr2 * fr2;
			float fr10 = fr4 * fr4 * fr2;
			float fresnel = saturate( fresnelBias + ( 1.0f - fresnelBias ) * fr10 );

			waterColor = lerp( waterColor, reflectiveColor, fresnel );

			float3 diffuse = lerp( waterColor, diffuseColor.rgb, waterSideAlpha.x );

			// ----------------------------------------------------------------
			// Snow / ice overlay.
			// ----------------------------------------------------------------
			float vSnowSpecGloss = 0.0f;
		#ifndef LOW_END_GFX
			float4 vMudSnow = GetMudSnowColor( Input.vPrePos_Fade.xyz, SnowMudTexture );
			diffuse = ApplyRiverSnow( diffuse, reflectiveColor, Input.vPrePos_Fade.xyz, normal,
			                          vMudSnow, CityLightsAndSnowNoise, waterSideAlpha.x,
			                          vSnowSpecGloss );
		#endif

			// ----------------------------------------------------------------
			// Lighting.
			// ----------------------------------------------------------------
			float vSpecularIntensity = lerp( 0.085f, 0.051f, vSnowSpecGloss );
			vSpecularIntensity = lerp( vSpecularIntensity, diffuseColor.a, waterSideAlpha.x )
			                   * ( 1.0f - gradientBorderFactor * 0.5f );

			float vGlossiness = lerp( spec * 2.0f, 5.0f, waterSideAlpha.x )
			                  + vSnowSpecGloss * SNOW_SPEC_GLOSS_MULT;

			LightingProperties lightingProperties;
			lightingProperties._WorldSpacePos        = Input.vPrePos_Fade.xyz;
			lightingProperties._ToCameraDir          = vToCam;          // reused, no second normalize()
			lightingProperties._Diffuse              = diffuse;
			lightingProperties._Normal               = normal;
			lightingProperties._Glossiness           = vGlossiness;
			lightingProperties._SpecularColor        = vec3( vSpecularIntensity );
			lightingProperties._NonLinearGlossiness  = GetNonLinearGlossiness( vGlossiness );

			float3 diffuseLight  = vec3( 0.0f );
			float3 specularLight = vec3( 0.0f );

			float fShadowTerm = GetShadowScaled( SHADOW_WEIGHT_RIVER, Input.vScreenCoord, ShadowMap );
			CalculateSunLight( lightingProperties, fShadowTerm, diffuseLight, specularLight );

		#ifndef LOW_END_GFX
			CalculatePointLights( lightingProperties, LightDataMap, LightIndexMap,
			                      diffuseLight, specularLight );
		#endif

			float3 vOut = ComposeLight( lightingProperties, diffuseLight, specularLight );

			vOut = ApplyFOW( vOut, ShadowMap, Input.vScreenCoord );
		#ifndef LOW_END_GFX
			vOut = ApplyDistanceFog( vOut, Input.vPrePos_Fade.xyz );
		#endif
			vOut = DayNightWithBlend( vOut, CalcGlobeNormal( Input.vPrePos_Fade.xz ),
			                          lerp( BORDER_NIGHT_DESATURATION_MAX, 1.0f, vBloomAlpha ) );

			// ----------------------------------------------------------------
			// Distance fade. vFastFade = vFadeValue^8, computed by repeated
			// squaring (3 muls).
			// ----------------------------------------------------------------
			float vFadeValue = 1.0f - Input.vPrePos_Fade.w;
			float vFade2     = vFadeValue * vFadeValue;
			float vFade4     = vFade2 * vFade2;
			float vFastFade  = vFade4 * vFade4;

			// Fade slower over water, faster over land (helps river crossings read clearly).
			float vDesiredFade    = lerp( vFadeValue * 2.0f, 0.0f, saturate( waterSideAlpha.x * 4.0f ) );
			float vAlphaMultiplier = saturate( lerp( vDesiredFade, 1.0f, vFastFade ) );

			DebugReturn( vOut, lightingProperties, fShadowTerm );

			return float4( vOut, waterSideAlpha.y * vAlphaMultiplier * Input.vTransp );
		}
	]]
}


BlendState BlendState
{
	BlendEnable = yes
	AlphaTest = no
	SourceBlend = "src_alpha"
	DestBlend = "inv_src_alpha"
	WriteMask = "RED|GREEN|BLUE"
}

Effect river_low_gfx
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
	Defines = { "LOW_END_GFX" }
}

Effect river
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}
