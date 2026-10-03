PixelShader = 
{
	Code
	[[

	float CalculateShadow( float4 vShadowProj, sampler2DShadow ShadowSample )
	{
		//float fShadowTerm = 0.0f;
		//fShadowTerm = tex2Dproj( ShadowSample, vShadowProj ).r;
		//fShadowTerm = ( fShadowTerm < 0.99f && fShadowTerm < (vShadowProj.z - 0.001f) ) ? 0.1f : 1.0f;
		//return fShadowTerm;

		// Texel size
		const float fTexelSize = 0.5f / 2048.0f;
		const float fBias = 0.001f;

		// tex2Dproj divides by .w for every tap. The divisor is the same for all five, so do the
		// perspective divide once and offset the result instead ( (x + o) / w == x / w + o / w ).
		float fInvW = 1.0f / vShadowProj.w;
		float2 vBase = vShadowProj.xy * fInvW;
		float fOffset = fTexelSize * fInvW;

		// A texel shadows the pixel when it is nearer than the pixel and not on the far plane.
		// "A < 0.99 && A < B" is the same test as "A < min( 0.99, B )".
		float fCompare = min( 0.99f, vShadowProj.z - fBias );

		// Sample each of them checking whether the pixel under test is shadowed or not
		float fShadowTerm = ( tex2Dlod0( ShadowSample, vBase + float2( -fOffset, 0.0f ) ).r < fCompare ) ? 0.1f : 1.0f;
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase + float2( 0.0f, fOffset ) ).r < fCompare ) ? 0.1f : 1.0f;
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase + float2( fOffset, 0.0f ) ).r < fCompare ) ? 0.1f : 1.0f;
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase + float2( 0.0f, -fOffset ) ).r < fCompare ) ? 0.1f : 1.0f;
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase ).r < fCompare ) ? 0.1f : 1.0f;

		// Get the average
		fShadowTerm = fShadowTerm / 5.0f;
		return fShadowTerm;
	}

	float GetShadowScaled( float fScaler, in float4 vBlurTexCoord, in sampler2DShadow ShadowSample )
	{
		fScaler = saturate( fScaler );
		float vShadowValue = tex2Dproj( ShadowSample, vBlurTexCoord ).r;
		
		//Hide shadow after a certain distance
		vShadowValue += (1.0 - ShadowFadeFactor);
		vShadowValue = saturate( vShadowValue );
		
		return ( 1.0 - fScaler ) + fScaler * vShadowValue;
	}

	]]
}