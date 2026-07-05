Includes = {
	"constants.fxh"
	"standardfuncsgfx.fxh"
	"pdxmap.fxh"
	"shadow.fxh"
	"tiled_pointlights.fxh"
	"fow.fxh"
}

PixelShader =
{
	Samplers =
	{
		HeightTexture =
		{
			Index = 0
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		LeanTexture1 =
		{
			Index = 1
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		LeanTexture2 =
		{
			Index = 2
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		ProvinceSecondaryColorMap =
		{
			Index = 3
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		SpecularMap =
		{
			Index = 4
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		WaterRefraction =
		{
			Index = 5
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		IceDiffuse =
		{
			Index = 6
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		IceNoise =
		{
			Index = 7
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Wrap"
			AddressV = "Wrap"
		}
		ReflectionCubeMap =
		{
			Index = 8
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
			AddressV = "Clamp"
			Type = "Cube"
		}
		SnowMudTexture =
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
		GradientBorderChannel3 =
		{
			Index = 14
			MagFilter = "Point"
			MinFilter = "Point"
			MipFilter = "Point"
			AddressU = "Clamp"
			AddressV = "Clamp"
		}
		ShadowMap =
		{
			Index = 15
			MagFilter = "Linear"
			MinFilter = "Linear"
			MipFilter = "Linear"
			AddressU = "Clamp"
    		AddressV = "Clamp"
    		Type = "Shadow"
		}
	}
}


VertexStruct VS_INPUT_WATER
{
    int2 position			: POSITION;
};

VertexStruct VS_OUTPUT_WATER
{
    float4 position			: PDX_POSITION;
	float3 pos				: TEXCOORD0; 
	float2 uv				: TEXCOORD1;
	float4 screen_pos		: TEXCOORD2; 
	float4 vShadowProj      : TEXCOORD3;	
	float4 vScreenCoord		: TEXCOORD4;
	float2 uv_ice			: TEXCOORD5;	
};


ConstantBuffer( 3, 48 )
{
	float3 vTime_HalfPixelOffset;
};



VertexShader =
{
	MainCode VertexShader
	[[
		VS_OUTPUT_WATER main( const VS_INPUT_WATER VertexIn )
		{
			VS_OUTPUT_WATER VertexOut;

			// World-space position (Y is fixed water height)
			float3 vWorldPos = float3( VertexIn.position.x, WATER_HEIGHT, VertexIn.position.y );
			VertexOut.pos = vWorldPos;
			VertexOut.position = mul( ViewProjectionMatrix, float4( vWorldPos, 1.0f ) );
			VertexOut.screen_pos = VertexOut.position;
			VertexOut.screen_pos.y = FIX_FLIPPED_UV( VertexOut.screen_pos.y );

			// Map UVs (combined into fewer ops; POW2 scaling folded in)
			float2 vMapUV = float2(
				( VertexIn.position.x + 0.5f ) /  MAP_SIZE_X,
				( VertexIn.position.y + 0.5f - MAP_SIZE_Y ) / -MAP_SIZE_Y );
			VertexOut.uv = vMapUV * float2( MAP_POW2_X, MAP_POW2_Y );

			// Ice UV: ( vMapUV * MAP_SIZE * 0.1 ) * FOW_POW2 -> fold the size*0.1 into a single mul
			VertexOut.uv_ice = VertexOut.uv * float2( MAP_SIZE_X * 0.1f * FOW_POW2_X,
			                                          MAP_SIZE_Y * 0.1f * FOW_POW2_Y );

			VertexOut.vShadowProj = mul( ShadowMapTextureMatrix, float4( vWorldPos, 1.0f ) );

			// Output the screen-space texture coordinates
			float fHalfW = VertexOut.position.w * 0.5f;
			VertexOut.vScreenCoord.x = VertexOut.position.x * 0.5f + fHalfW;
			VertexOut.vScreenCoord.y = fHalfW - VertexOut.position.y * 0.5f;
		#ifdef PDX_OPENGL
			VertexOut.vScreenCoord.y = -VertexOut.vScreenCoord.y;
		#endif
			VertexOut.vScreenCoord.zw = VertexOut.position.ww;

			return VertexOut;
		}
	]]
}

PixelShader =
{
	MainCode PixelShader
	[[
		// 4-tap bilinear box filter approximating the original 9-tap uniform box.
		// Each bilinear sample fetches 4 texels in hardware, giving an effective
		// 3x3 Gaussian-like kernel for a fraction of the cost (4 samples vs 9).
		float MultiSampleTexX( in sampler2D TexCh, in float2 vUV )
		{
			const float2 vHalfTexel = float2( 0.5f / MAP_SIZE_X, 0.5f / MAP_SIZE_Y );
			float vResult  = tex2D( TexCh, vUV + float2( -vHalfTexel.x, -vHalfTexel.y ) ).x;
			vResult       += tex2D( TexCh, vUV + float2(  vHalfTexel.x, -vHalfTexel.y ) ).x;
			vResult       += tex2D( TexCh, vUV + float2( -vHalfTexel.x,  vHalfTexel.y ) ).x;
			vResult       += tex2D( TexCh, vUV + float2(  vHalfTexel.x,  vHalfTexel.y ) ).x;
			return vResult * 0.25f;
		}

		float3 ApplyIce( float3 vColor, float2 vPos, inout float3 vNormal, float4 vMudSnowColor, float2 vIceUV, float vIceFade )
		{
			// Latitude gate — polar region check (> 74% of map height)
			float vMapLimitFade = saturate( ( vPos.y / MAP_SIZE_Y - 0.74f ) * 800.0f );
			if ( vMapLimitFade <= 0.0f )
			{
				vIceFade = 0.0f;
				return vColor;  // skip both texture reads entirely
			}

			float4 vIceDiffuse = tex2D( IceDiffuse, vIceUV );
			float vIceNoise    = tex2D( IceNoise, ( vPos + 0.5f ) * ICE_NOISE_TILING ).r;

			float vSnow    = saturate( GetSnow( vMudSnowColor ) );
			float vOpacity = 1.0f - cam_distance( ICE_CAM_MIN, ICE_CAM_MAX );

			// Combine all multiplicative factors at once
			vIceFade = vSnow * 8.0f * vIceNoise * vOpacity;

			// Latitude mask - removes ice from non-polar regions
			vMapLimitFade = saturate( ( vPos.y / MAP_SIZE_Y - 0.74f ) * 800.0f );
			vIceFade *= vMapLimitFade;

			vIceFade = saturate( ( vIceFade - 0.3f ) * 10.0f );

			float3 vIceNormal = normalize( vIceDiffuse.rgb - 0.5f );
			vNormal = normalize( lerp( vNormal, vIceNormal, vIceFade ) );

			float3 vIceColor = ICE_COLOR * vIceDiffuse.a;
			return lerp( vColor, vIceColor, vIceFade );
		}

		float4 main( VS_OUTPUT_WATER Input ) : PDX_COLOR
		{
			// screen_pos derivation (pixel shader):
			//   refractiveUV = (screen_pos.xy / screen_pos.w) * 0.5 + 0.5
			//   1 - refractiveUV.y

			// vScreenCoord derivation (vertex shader):
			//   .x = pos.x*0.5 + w*0.5     → /w gives  pos.x/(2w) + 0.5        ✓ same
			//   .y = w*0.5 - pos.y*0.5     → /w gives  0.5 - pos.y/(2w)         ✓ same as 1-y form
			//   .z = .w = w

			#ifdef PDX_OPENGL
				float invW = 1.0 / Input.vScreenCoord.z;
			#else
				// Replacement in pixel shader (DX path):
				float invW = rcp( Input.vScreenCoord.z );
			#endif
			float2 refractiveUV = Input.vScreenCoord.xy * invW;
			refractiveUV    += vTime_HalfPixelOffset.gb;

			// --- Heightmap shore mask ---
			// 1.0 / (95.7 / 255.0) precomputed as a constant
			const float SHORE_SCALE = 255.0f / 95.7f * 25.0f;   // ~66.56, compile-time constant
			const float SHORE_BIAS  = -0.954f * 25.0f;           // -23.85, compile-time constant
			float waterShore = saturate( MultiSampleTexX( HeightTexture, Input.uv ) * SHORE_SCALE + SHORE_BIAS );

			// --- Wave + LEAN normals ---
			float2 B;
			float3 M;
			float3 normal;
			SampleWater( Input.uv, vTime_HalfPixelOffset.x, B, M, normal, LeanTexture1, LeanTexture2 );

			float vSpecMap = tex2D( SpecularMap, Input.uv ).a;
			normal.y      += ( 1.0f - vSpecMap );
			normal.xz     *= vSpecMap;
			normal         = normalize( normal );

			// vFlatten == vSpecMap; fold directly to remove the rename
			B *= vSpecMap;
			M *= vSpecMap * vSpecMap;

			// --- Sun direction ---
			float3 SunDirWater = CalculateSunDirectionWater( Input.pos );

			// Cache view direction once: was being normalize()'d 3 separate times.
			float3 vToCam  = normalize( vCamPos - Input.pos );
			float3 vEyeDir = -vToCam;

			// LEAN-mapping anisotropic specular
			float3 H     = normalize( vToCam.xzy - SunDirWater.xzy );
			float2 HWave = H.xy / H.z - B;

			float3 sigma = M - float3( B * B, B.x * B.y );
			float  det   = sigma.x * sigma.y - sigma.z * sigma.z;
			float2 HWave2 = HWave * HWave;
			float  e     = HWave2.x * sigma.y + HWave2.y * sigma.x - 2.0f * HWave.x * HWave.y * sigma.z;
			#ifdef PDX_OPENGL
				float spec = (det <= 0) ? 0.0f : exp( -0.5f*e/det ) / sqrt(det);
			#else
				// rsqrt is faster than 1/sqrt; result is mathematically identical.
				float spec  = ( det > 0.0f ) ? exp( -0.5f * e / det ) * rsqrt( det ) : 0.0f;
			#endif

			// --- Refraction UV setup ---
			#ifdef PDX_OPENGL
				invW = 1.0f / ( Input.screen_pos.w );
			#else
				// Replacement in pixel shader (DX path):
				invW = rcp( Input.screen_pos.w );
			#endif
			refractiveUV.x =  Input.screen_pos.x * invW * 0.5f + 0.5f;
			refractiveUV.y = -Input.screen_pos.y * invW * 0.5f + 0.5f; // folds the 1.0-y flip
			refractiveUV  += vTime_HalfPixelOffset.yz;

			float vRefractionScale = saturate( ( 1.0f - Input.screen_pos.z * invW ) * 5.0f );
			float2 vRefractionDistortion = normal.xz * vRefractionScale * 1.80f;

			float3 reflection = reflect( vEyeDir, normal );

			float vSpecularIntensity = 0.010f;
			// 1/9 precomputed; spec was being divided by 9 to remap to glossiness
			float vGlossiness        = spec * (1.0f / 9.0f) * ( 1.0f - vSpecMap );

			float3 reflectiveColor = texCUBE( ReflectionCubeMap, reflection ).rgb;

			float3 refractiveColor = tex2D( WaterRefraction, refractiveUV - vRefractionDistortion ).rgb;

			// --- Fresnel: replace pow(x,10) with 3 muls ---
			const float fresnelBias = 0.5f;
			float fresnel = saturate( dot( vToCam, normal ) ) * 0.5f;
			float oneMinusF = 1.0f - fresnel;
			float f2  = oneMinusF * oneMinusF;   // ^2
			float f4  = f2 * f2;                  // ^4
			float f10 = f4 * f4 * f2;             // ^10
			fresnel = saturate( fresnelBias + ( 1.0f - fresnelBias ) * f10 );
			refractiveColor = lerp( refractiveColor, reflectiveColor, fresnel );

			// --- Ice ---
			float vIceFade = 0.0f;

			// --- Borders / province overlays ---
			float vBloomAlpha = 0.0f;
			gradient_border_apply( refractiveColor, normal,
				Input.uv + vRefractionDistortion * 0.0075f,
				GradientBorderChannel1, GradientBorderChannel2, 0.0f,
				vGBCamDistOverride_GBOutlineCutoff.zw * GB_OUTLINE_CUTOFF_SEA,
				vGBCamDistOverride_GBOutlineCutoff.xy, vBloomAlpha );

			secondary_color_mask( refractiveColor, normal,
				Input.uv - vRefractionDistortion * 0.001f,
				ProvinceSecondaryColorMap,
				vBloomAlpha );

			// --- Lighting ---
			LightingProperties lightingProperties;
			lightingProperties._WorldSpacePos        = Input.pos;
			lightingProperties._ToCameraDir          = vToCam;     // reused, no extra normalize
			lightingProperties._Normal               = normal;
			lightingProperties._Diffuse              = refractiveColor;
			lightingProperties._Glossiness           = vGlossiness;
			lightingProperties._SpecularColor        = vec3( vSpecularIntensity );
			lightingProperties._NonLinearGlossiness  = GetNonLinearGlossiness( vGlossiness );

			float3 diffuseLight  = vec3( 0.0f );
			float3 specularLight = vec3( 0.0f );

			float4 vShadowCoord = Input.vScreenCoord;
			vShadowCoord.xz    += vRefractionDistortion * 20.0f;
			float fShadowTerm   = GetShadowScaled( SHADOW_WEIGHT_WATER, vShadowCoord, ShadowMap );

			CalculateSunLight( lightingProperties, fShadowTerm, SunDirWater, diffuseLight, specularLight );
			CalculatePointLights( lightingProperties, LightDataMap, LightIndexMap, diffuseLight, specularLight );

			float3 vOut = ComposeLight( lightingProperties, diffuseLight, specularLight );

			vOut = DayNightWithBlend( vOut, CalcGlobeNormal( Input.pos.xz ),
				lerp( BORDER_NIGHT_DESATURATION_MAX, 1.0f, vBloomAlpha ) );

			dominance_fx_apply( vOut, normal,
				Input.uv,
				GradientBorderChannel1, GradientBorderChannel2, GradientBorderChannel3,
				vGBCamDistOverride_GBOutlineCutoff.zw * GB_OUTLINE_CUTOFF_SEA,
				vGBCamDistOverride_GBOutlineCutoff.xy, 0.0f );

			DebugReturn( vOut, lightingProperties, fShadowTerm );
			return float4( vOut, 1.0f - waterShore );
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

Effect water_low_gfx
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
	Defines = { "LOW_END_GFX" "NO_REFRACTIONS" }
}

Effect water_no_refractions
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
	Defines = { "NO_REFRACTIONS" }
}

Effect water
{
	VertexShader = "VertexShader"
	PixelShader = "PixelShader"
}
