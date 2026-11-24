PixelShader = 
{
	Code
	[[
	
	static const float HEIGHT_FOG_END = 15.0;
	static const float HEIGHT_FOG_START = 12.0;
	static const float HEIGHT_FOG_POW = 3.5;
	static const float HEIGHT_FOG_MAX = 1.0;
	
	static const float FOW_TRANSPARENCY_MIN = 0.3;
	static const float FOW_TRANSPARENCY_MAX = 0.9;
	
	static const float FOW_COLOR_MIN = 0.2;
	static const float FOW_COLOR_MAX = 1.0;
	
	static const float FOW_NOISE_TILING = 0.01;
	static const float FOW_NOISE_SPEED = 0.015;
	
	static const float3 BRIGHT_FOW_COLOR = float3(0.98, 0.93, 0.93);
	static const float3 DARK_FOW_COLOR = float3(0.08, 0.08, 0.1);
	
	static const float INTEL_CUTOFF = 0.7;
	
	float GetIntelFactor( float3 WorldPosition, in sampler2D IntelTex )
	{
		return tex2D( IntelTex, float2( ( ( WorldPosition.x + 0.5 ) / MAP_SIZE_X ) * FOW_POW2_X, ( (WorldPosition.z + 0.5 ) / MAP_SIZE_Y) ) * FOW_POW2_Y ).a;
	}
	
	float2 GetExtraFogUV( float3 WorldPosition )
	{
		return float2( ( ( WorldPosition.x + 0.5 ) / MAP_SIZE_X ) * FOW_POW2_X, ( (WorldPosition.z + 0.5 - MAP_SIZE_Y ) / -MAP_SIZE_Y) ) * FOW_POW2_Y;
	}

	float GetExtraFogFactor( float3 WorldPosition, in sampler2D ExtraFOW )
	{
		float sample = tex2D( ExtraFOW, GetExtraFogUV( WorldPosition ) ).g;
		return sample * 2.0 - 1.0;
	}
	
	float GetHeightFogFactor( float3 vPos )
	{
		float vFactor = ( vPos.y - HEIGHT_FOG_END ) / ( HEIGHT_FOG_START - HEIGHT_FOG_END );
		vFactor = pow( saturate( vFactor ), HEIGHT_FOG_POW );
		return min( HEIGHT_FOG_MAX, vFactor );
	}
	
	float GetFOWTransparency( float3 WorldPosition, in sampler2D NoiseTex )
	{
		float Time = vFoWOpacity_FoWTime_SnowMudFade_MaxGameSpeed.y;

		float Noise = tex2D( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 0.1 + Time * FOW_NOISE_SPEED * 0.1 * float2(0.7, 0.7) ).a * 2;
		Noise *= tex2D( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 0.5 + Time * FOW_NOISE_SPEED * 0.5 * float2(-0.8, -0.2) ).a * 1.5;
		Noise *= tex2D( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 1 + Time * FOW_NOISE_SPEED * 0.8 * float2(-0.1, -0.9) ).a;
		Noise = smoothstep(0.0, 1.6, Noise);
		
		return Noise;
	}
	
	float GetFOWColor( float3 WorldPosition, in sampler2D NoiseTex )
	{
		float Time = vFoWOpacity_FoWTime_SnowMudFade_MaxGameSpeed.y;

		float Color = tex2D( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 0.5 + Time * FOW_NOISE_SPEED * 0.5 * float2(0.6, -0.2) ).g;
		return lerp(FOW_COLOR_MIN, FOW_COLOR_MAX, Color);
	}
	
	#ifndef PDX_OPENGL
		// Direct3D 11 only: the same lookups as GetFOWTransparency / GetFOWColor / GetExtraFogFactor, with the UV gradients handed over explicitly so that they may sit inside a per-pixel branch. 
		// vDX / vDY are ddx / ddy of WorldPosition.xz ( for the extra map: of GetExtraFogUV ), taken outside the branch. The derivative of the linear UV maps below is the base derivative times the tiling; the time offset is the same for every pixel.
		float GetFOWTransparencyGrad( float3 WorldPosition, float2 vDX, float2 vDY, in sampler2D NoiseTex )
		{
			float Time = vFoWOpacity_FoWTime_SnowMudFade_MaxGameSpeed.y;

			float Noise = tex2Dgrad( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 0.1 + Time * FOW_NOISE_SPEED * 0.1 * float2(0.7, 0.7), vDX * ( FOW_NOISE_TILING * 0.1 ), vDY * ( FOW_NOISE_TILING * 0.1 ) ).a * 2;
			Noise *= tex2Dgrad( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 0.5 + Time * FOW_NOISE_SPEED * 0.5 * float2(-0.8, -0.2), vDX * ( FOW_NOISE_TILING * 0.5 ), vDY * ( FOW_NOISE_TILING * 0.5 ) ).a * 1.5;
			Noise *= tex2Dgrad( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 1 + Time * FOW_NOISE_SPEED * 0.8 * float2(-0.1, -0.9), vDX * FOW_NOISE_TILING, vDY * FOW_NOISE_TILING ).a;
			return smoothstep(0.0, 1.6, Noise);
		}

		float GetFOWColorGrad( float3 WorldPosition, float2 vDX, float2 vDY, in sampler2D NoiseTex )
		{
			float Time = vFoWOpacity_FoWTime_SnowMudFade_MaxGameSpeed.y;

			float Color = tex2Dgrad( NoiseTex, WorldPosition.xz * FOW_NOISE_TILING * 0.5 + Time * FOW_NOISE_SPEED * 0.5 * float2(0.6, -0.2), vDX * ( FOW_NOISE_TILING * 0.5 ), vDY * ( FOW_NOISE_TILING * 0.5 ) ).g;
			return lerp(FOW_COLOR_MIN, FOW_COLOR_MAX, Color);
		}

		float GetExtraFogFactorGrad( float2 vUV, float2 vUVDX, float2 vUVDY, in sampler2D ExtraFOW )
		{
			float sample = tex2Dgrad( ExtraFOW, vUV, vUVDX, vUVDY ).g;
			return sample * 2.0 - 1.0;
		}
	#endif

	void GetFogFactors( out float FogColorFactor, out float FogAlphaFactor, float3 WorldPosition, float ExtraHeight, in sampler2D NoiseTex, in sampler2D ExtraFOW, in sampler2D IntelMapSampler )
	{
		float FogHeightFactor = GetHeightFogFactor( WorldPosition + float3(0.0, ExtraHeight, 0.0) );		
		float IntelFactor = GetIntelFactor( WorldPosition, IntelMapSampler );

		#if defined( PDX_OPENGL )
			float FOWTransparency = GetFOWTransparency( WorldPosition, NoiseTex );
			float FOWTransparencyRemapped = lerp(FOW_TRANSPARENCY_MIN, FOW_TRANSPARENCY_MAX, FOWTransparency);
			float FOWExtra = GetExtraFogFactor( WorldPosition, ExtraFOW );
			
			float FOWColor = GetFOWColor( WorldPosition, NoiseTex );
			
			FogColorFactor = FOWColor * FOWTransparencyRemapped;
			FogAlphaFactor = saturate(ToGamma(saturate(FogHeightFactor * FOWTransparencyRemapped)) + FOWExtra) * IntelFactor * FOWFadeFactor;
		#else
			// Direct3D 11. The alpha factor is a product with IntelFactor * FOWFadeFactor, so where that is 0 the alpha factor is 0 and ApplyFOW does nothing whatever the colour factor is: the noise and extra lookups ( 5 of the 6 ) and the pow() calls are not needed there. 
			//The colour factor is left at 0 in that case; it only ever matters together with a non-zero alpha factor. The derivatives are taken here, outside the branch.
			float2 vDX = ddx( WorldPosition.xz );
			float2 vDY = ddy( WorldPosition.xz );
			float2 vExtraUV = GetExtraFogUV( WorldPosition );
			float2 vExtraDX = ddx( vExtraUV );
			float2 vExtraDY = ddy( vExtraUV );

			FogColorFactor = 0.0;
			FogAlphaFactor = 0.0;
			OPT_BRANCH
			if ( IntelFactor * FOWFadeFactor > 0.0 )
			{
				float FOWTransparency = GetFOWTransparencyGrad( WorldPosition, vDX, vDY, NoiseTex );
				float FOWTransparencyRemapped = lerp(FOW_TRANSPARENCY_MIN, FOW_TRANSPARENCY_MAX, FOWTransparency);
				float FOWExtra = GetExtraFogFactorGrad( vExtraUV, vExtraDX, vExtraDY, ExtraFOW );

				float FOWColor = GetFOWColorGrad( WorldPosition, vDX, vDY, NoiseTex );

				FogColorFactor = FOWColor * FOWTransparencyRemapped;
				FogAlphaFactor = saturate(ToGamma(saturate(FogHeightFactor * FOWTransparencyRemapped)) + FOWExtra) * IntelFactor * FOWFadeFactor;
			}
		#endif
	}
	
	// GetFogFactors for the passes that write the fog-of-war buffer (terrainunlit / treeunlit).
	// When the fog of war is completely faded out the alpha factor is zero for every pixel, which makes ApplyFOW a no-op whatever the colour factor is, so the six noise / intel lookups and the two pow() calls can be skipped. 
	// The test is on a shader constant, so it goes the same way for the whole screen.
	void GetFogFactorsForBuffer( out float FogColorFactor, out float FogAlphaFactor, float3 WorldPosition, float ExtraHeight, in sampler2D NoiseTex, in sampler2D ExtraFOW, in sampler2D IntelMapSampler )
	{
		FogColorFactor = 0.0;
		FogAlphaFactor = 0.0;
		OPT_BRANCH
		if ( FOWFadeFactor > 0.0 )
		{
			GetFogFactors( FogColorFactor, FogAlphaFactor, WorldPosition, ExtraHeight, NoiseTex, ExtraFOW, IntelMapSampler );
		}
	}

	float3 ApplyFOW( float3 Color, float FogColorFactor, float FogAlphaFactor )
	{
		float3 FogColor = lerp(DARK_FOW_COLOR, BRIGHT_FOW_COLOR, FogColorFactor);
		return lerp(Color, FogColor, FogAlphaFactor);
	}
	
	float3 ApplyFOW( float3 Color, in sampler2D FOWTexture, float4 UV )
	{
		float4 FogValues = tex2Dproj( FOWTexture, UV );
		return ApplyFOW( Color, FogValues.y, FogValues.z );
	}

	]]
}
