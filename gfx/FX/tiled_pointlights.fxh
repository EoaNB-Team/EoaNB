PixelShader = 
{
	ConstantBuffer( 2, 62 )
	{
		float4 GridStart_InvCellSize;
	}

	Code
	[[

	static const float2 INV_LIGHT_INDEX_TEXTURE_SIZE = float2(1.0 / 64.0, 1.0 / 64.0);
	static const float INV_LIGHT_DATA_TEXTURE_SIZE = float(1.0 / 128.0);

	float2 GetLightIndexUV(float3 WorldSpacePos)
	{
		float2 XZ = WorldSpacePos.xz;
		XZ -= GridStart_InvCellSize.xy;
		
		float2 cellIndex = XZ * GridStart_InvCellSize.zw;
		return cellIndex * INV_LIGHT_INDEX_TEXTURE_SIZE;
	}

	void CalculatePointLights(LightingProperties aProperties, in sampler2D LightDataSampler, in sampler2D LightIndexMapSampler, inout float3 aDiffuseLightOut, inout float3 aSpecularLightOut)
	{
		float2 LightIndexUV = GetLightIndexUV(aProperties._WorldSpacePos);
		float4 LightIndices = tex2Dlod(LightIndexMapSampler, float4(LightIndexUV, 0, 0));
		
		for (int i = 0; i < 4; ++i)
		{
			float LightIndex = LightIndices[i] * 255.0;
			if (LightIndex >= 255.0)
				break;
			
			float4 LightData1 = tex2Dlod(LightDataSampler, float4((LightIndex * 2 + 0.5) * INV_LIGHT_DATA_TEXTURE_SIZE, 0, 0, 0));
			#if OPT_SKIP_UNUSED_LAYERS
				float3 vToLight = LightData1.xyz - aProperties._WorldSpacePos;
				if ( dot( vToLight, vToLight ) >= LightData1.w * LightData1.w )
				{
					continue;
				}
			#endif
			float4 LightData2 = tex2Dlod(LightDataSampler, float4((LightIndex * 2 + 1.5) * INV_LIGHT_DATA_TEXTURE_SIZE, 0, 0, 0));
			PointLight pointlight = GetPointLight(LightData1, LightData2);
				
			CalculatePointLight(pointlight, aProperties, aDiffuseLightOut, aSpecularLightOut);
		}
	}

	]]
}