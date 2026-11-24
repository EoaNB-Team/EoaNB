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

		float fInvW = 1.0f / vShadowProj.w; // tex2Dproj divides by .w for every tap. The divisor is the same for all five, so do the perspective divide once and offset the result instead ( (x + o) / w == x / w + o / w ).
		float2 vBase = vShadowProj.xy * fInvW;
		float fOffset = fTexelSize * fInvW;

		float fCompare = min( 0.99f, vShadowProj.z - fBias ); // A texel shadows the pixel when it is nearer than the pixel and not on the far plane. "A < 0.99 && A < B" is the same test as "A < min( 0.99, B )".

		float fShadowTerm = ( tex2Dlod0( ShadowSample, vBase + float2( -fOffset, 0.0f ) ).r < fCompare ) ? 0.1f : 1.0f; // Sample each of them checking whether the pixel under test is shadowed or not
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase + float2( 0.0f, fOffset ) ).r < fCompare ) ? 0.1f : 1.0f;
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase + float2( fOffset, 0.0f ) ).r < fCompare ) ? 0.1f : 1.0f;
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase + float2( 0.0f, -fOffset ) ).r < fCompare ) ? 0.1f : 1.0f;
		fShadowTerm += ( tex2Dlod0( ShadowSample, vBase ).r < fCompare ) ? 0.1f : 1.0f;

		fShadowTerm = fShadowTerm / 5.0f; // Get the average
		return fShadowTerm;
	}

	float GetShadowScaled( float fScaler, in float4 vBlurTexCoord, in sampler2DShadow ShadowSample )
	{
		fScaler = saturate( fScaler );

		float vShadowValue = 1.0f; // Once the shadows have faded out completely ( ShadowFadeFactor <= 0 ) the value below is saturated to 1 whatever the lookup returns, so the lookup is not needed. The condition is a constant-buffer value, so the whole draw takes the same path and the lookup can sit inside the branch.
		OPT_BRANCH
		if ( ShadowFadeFactor > 0.0f )
		{
			vShadowValue = tex2Dproj( ShadowSample, vBlurTexCoord ).r;

			vShadowValue += (1.0 - ShadowFadeFactor); //Hide shadow after a certain distance
			vShadowValue = saturate( vShadowValue );
		}
		
		return ( 1.0 - fScaler ) + fScaler * vShadowValue;
	}

	]]
}