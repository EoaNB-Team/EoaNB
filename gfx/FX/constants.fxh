Code
[[
	// ------------------  OPTIMISATION TOGGLES  --------------------
	// Set a value to 0 to get the stock code path back for that item,
	// then run "reloadfx all" to compare in game.
	// --------------------------------------------------------------

	// Gradient borders and the shoreline fade blur their source texture with 9 bilinear taps. 1 = use 4 taps placed so the blur keeps the same width. This is the only toggle that is ON by default and not pixel-identical to stock (difference is well below one 8-bit step on average).
	#define OPT_GB_FAST_MULTISAMPLE		1

	// 1 = the colour-map overlay blend (terrain, mud, trees) uses gamma 2.0 (sqrt / x*x) instead of pow( x, 0.45 ) / pow( x, 2.2 ). Cheaper, but shifts the terrain tint contrast slightly, so it is OFF by default.
	#define OPT_FAST_OVERLAY_GAMMA		0

	// 1 = skinned meshes (units, ships, ...) blend their 4 bone matrices once per vertex and transform position, normal, tangent and bitangent with the blended matrix, instead of running all of them through each bone separately. Roughly 2.5x less vertex work for skinned meshes. Same result as stock for rigid bones (rotation + translation). If a skinned model ever shows odd normal-map lighting (mirrored or scaled bones), set this to 0.
	#define OPT_SKIN_BLEND_MATRIX		1

	// These are NOT exact. They trade a little detail at large camera heights ( vCamPos.y ) for fewer lookups. Each one fades in smoothly between its START and END height ( constants further down ) so nothing pops, and is fully on above END. Set a switch to 0 to get the original look back.
	#define OPT_FAR_WATER				1	// water: 2 of the 4 LEAN wave layers instead of 4, and a 1-tap shore height lookup
	#define OPT_FAR_MESH_NORMALS		1	// meshes and trees: vertex normal instead of the normal map ( skips the lookup and the tangent frame )
	#define OPT_FAR_MESH_REFLECTIONS	1	// meshes and trees: the environment reflection fades out and is skipped
	#define OPT_FAR_TERRAIN_TILES		1	// terrain: no blending between neighbouring terrain types far away ( 6 lookups saved on tile edges )
	#define OPT_FAR_POINTLIGHTS			1	// point lights fade out and are skipped

	// 1 = the bloom blur merges pairs of neighbouring taps into one bilinear tap ( 9 taps -> 5 ) when its offsets are whole texels one apart ( 1,2 and 3,4 ). The result is the same up to the filter's own rounding; with any other offsets the shader falls back to the 9 separate taps by itself.
	#define OPT_BLOOM_MERGE_TAPS		1

	// Direct3D 11 can keep a texture lookup inside a real branch as long as the UV gradients are handed to it explicitly. OpenGL (legacy GLSL) has no portable way to do that, so there the lookups stay in front of the branch and only the maths is skipped.
	#ifndef OPT_SAMPLE_IN_BRANCH
		#if defined( PDX_DIRECTX_11 )
			#define OPT_SAMPLE_IN_BRANCH 1
		#else
			#define OPT_SAMPLE_IN_BRANCH 0
		#endif
	#endif

	#ifdef PDX_DIRECTX_11
		#define OPT_BRANCH [branch]
	#else
		#define OPT_BRANCH
	#endif

	#if OPT_SAMPLE_IN_BRANCH
		#define OPT_TEX2D( samp, uv, dx, dy ) tex2Dgrad( samp, uv, dx, dy )
	#else
		#define OPT_TEX2D( samp, uv, dx, dy ) tex2D( samp, uv )
	#endif

	// ------------------    Light          -------------------------
	static const float NIGHT_AMBIENT_BOOST = 3.0f; // can just be baked into the below later ye?

	static const float3 DayAmbientMapPosX = float3(0.1, 0.1, 0.05);  // right
	static const float3 DayAmbientMapNegX = float3(0.15, 0.15, 0.15);  // left
	static const float3 DayAmbientMapPosY = float3(0.03, 0.03, 0.06);  // kills everything
	static const float3 DayAmbientMapNegY = float3(0.0, 0.0, 0.0);  // from under
	static const float3 DayAmbientMapPosZ = float3(0.0502, 0.05023, 0.1023);  // top
	static const float3 DayAmbientMapNegZ = float3(0.03, 0.033, 0.033);  // bottom

	static const float3 NightAmbientMapPosX = float3(0.2, 0.2, 0.2);  // right
	static const float3 NightAmbientMapNegX = float3(0.0, 0.0, 0.0);  // left
	static const float3 NightAmbientMapPosY = float3(0.01, 0.01, 0.01);  // kills everything
	static const float3 NightAmbientMapNegY = float3(0.0, 0.0, 0.1);  // from under
	static const float3 NightAmbientMapPosZ = float3(0.06, 0.1, 0.15);  // top
	static const float3 NightAmbientMapNegZ = float3(0.14, 0.14, 0.2);  // bottom

	// NOTE: regular unit ambient colors set from defines. this is night
	static const float3 NightAmbientPosX = float3(2.0, 2.0, 2.0);  // right
	static const float3 NightAmbientNegX = float3(0.2, 0.2, 0.2);  // left
	static const float3 NightAmbientPosY = float3(0.1, 0.1, 0.1);  // kills everything
	static const float3 NightAmbientNegY = float3(0.0, 0.0, 0.0);  // from under
	static const float3 NightAmbientPosZ = float3(3.0, 3.0, 3.0);  // top
	static const float3 NightAmbientNegZ = float3(0.8, 0.8, 0.8);  // bottom

	// ------------------    Specular       -------------------------
	static const float SPECULAR_WIDTH 				= 15.0;
	static const float SPECULAR_MULTIPLIER			= 1.0;
	static const float MAP_SPECULAR_WIDTH			= 15.0;

	// ------------------    TERRAIN        -------------------------
	static const float CITY_LIGHTS_TILING 			= 0.09103;
	static const float CITY_LIGHTS_INTENSITY 		= 5.5;
	static const float CITY_LIGHTS_BLOOM_FACTOR 	= 0.3;

	static const float TERRAIN_TILE_FREQ 			= 128.0f;
	static const float MAP_NUM_TILES 				= 4.0f;
	static const float TEXELS_PER_TILE 				= 512.0f;
	static const float ATLAS_TEXEL_POW2_EXPONENT	= 11.0f;
	static const float TERRAIN_WATER_CLIP_HEIGHT    = 3.0f;
	static const float TERRAIN_WATER_CLIP_CAM_HI	= 700.0f;
	static const float TERRAIN_WATER_CLIP_CAM_LO	= 50.0f;

	static const float MUD_TILING 					= 0.09;
	static const float MUD_NORMAL_CUTOFF 			= 10.982;
	static const float MUD_STRENGHTEN 				= 1.0;

	static const float 	SNOW_OPACITY_MIN			= 0.95f;
	static const float 	SNOW_OPACITY_MAX			= 0.2f;
	static const float 	SNOW_CAM_MIN 				= 50.0f;
	static const float 	SNOW_CAM_MAX 				= 300.0f;
	static const float 	MUD_CAM_MIN 				= 50.0f;
	static const float 	MUD_CAM_MAX 				= 300.0f;
	static const float 	ICE_CAM_MIN 				= 100.0f;
	static const float 	ICE_CAM_MAX 				= 350.0f;

	static const float 	SNOW_START_HEIGHT 			= 3.0f;
	static const float 	SNOW_RIDGE_START_HEIGHT 	= 11.0f;
	static const float 	SNOW_NORMAL_START 			= 0.7f;
	static const float3 SNOW_COLOR 					= float3( 0.46, 0.48, 0.69 );
	static const float3 SNOW_WATER_COLOR 			= float3( 0.3, 0.6, 1.0 );
	static const float 	SNOW_CLIFFS 				= 5.0f;
	static const float 	SNOW_SPEC_GLOSS_MULT 		= 0.2f;
	static const float 	SNOW_TILING  				= 0.05f;
	static const float 	SNOW_NOISE_TILING  			= 0.06f;
	static const float 	SNOW_ICE_NOISE_TILING  		= 0.0625f;
	static const float 	SNOW_FROST_MIN_EFFECT  		= 0.4f;

	static const float3 ICE_COLOR 					= float3( 0.5f, 0.6f, 0.9f );
	static const float 	ICE_NOISE_TILING  			= 0.1f; //0.068f;

	static const float WATER_COLOR_LIGHTNESS = 0.5;
	static const float WATER_RIPPLE_EFFECT = 0.0025;

	static const float COLORMAP_OVERLAY_STRENGTH 	= 0.75f;
	static const float COLORMAP_MUD_OVERLAY_STRENGTH = 0.5f;

	static const float3 FAKE_CUBEMAP_COLOR 			= float3(0.0f, 0.0f, 0.0f);

	static const float 	BORDER_TILE					= 0.4f;

	static const float 	TREE_SEASON_MIN 			= 0.5f;
	static const float 	TREE_SEASON_FADE_TWEAK 		= 2.5f;

	static const float3 LUMINANCE_VECTOR  			= float3(0.2125f, 0.7154f, 0.0721f); // HDR

	// ------------------    TREES          -------------------------
	static const float 	TREE_SPECULAR = 0.1f;
	static const float 	TREE_ROUGHNESS = 0.6f;

	// ------------------    WATER          -------------------------
	static const float  WATER_TIME_SCALE			= 1.0f / 50.0f;
	static const float  WATER_HEIGHT = 9.5f;
	static const float  WATER_HEIGHT_RECP = 1.0f / WATER_HEIGHT;
	static const float  WATER_HEIGHT_RECP_SQUARED = WATER_HEIGHT_RECP * WATER_HEIGHT_RECP;

	// ------------------    FOG            -------------------------

	static const float3 FOG_COLOR 					= float3( 0.12, 0.28, 0.6 );
	static const float 	FOG_BEGIN					= 1.0f;
	static const float 	FOG_END 					= 150.0f;
	static const float 	FOG_MAX 					= 0.35f; 

	static const float 	FOW_MAX 					= 0.5f;
	static const float  FOW_CAMERA_MIN				= 200;
	static const float  FOW_CAMERA_MAX				= 500;

	// ------------------    BUILDINGS      -------------------------

	static const float  SHADOW_WEIGHT_TERRAIN    	= 0.7f;
	static const float  SHADOW_WEIGHT_MAP    		= 0.7f;
	static const float  SHADOW_WEIGHT_BORDER   		= 0.7f;
	static const float  SHADOW_WEIGHT_WATER   		= 0.5f;
	static const float  SHADOW_WEIGHT_RIVER   		= 0.4f;
	static const float  SHADOW_WEIGHT_TREE   		= 0.7f;

	// ------------------    GRADIENT BORDERS   ---------------------

	static const float GB_CAM_MIN = 100.0f;
	static const float GB_CAM_MAX = 350.0f;
	static const float GB_CAM_MAX_FILLING_CLAMP = 0.8f; // 0 to 1 value for clamping the fill when camera is at max distance
	static const float GB_THRESHOLD = 0.05f; // interpolation time
	static const float GB_THRESHOLD2 = 0.25f; // interpolation time
	static const float GB_OUTLINE_CUTOFF_SEA = 0.990f; // Magic number to balance cutoff on edges without neighbor (over Sea)
	static const float GB_OPACITY_NEAR = 1.0f; // Transparency when camera is near
	static const float GB_OPACITY_FAR = 0.85f;  // Transparency when camera is far
	static const float BORDER_NIGHT_DESATURATION_MAX = 0.2f; // how much border colors can get desaturated at night. 1.0f is full grey
	static const float BORDER_FOW_REMOVAL_FACTOR = .8f; // How much of the FOW that is removed from the borders. 1.0f is no FOW
	static const float BORDER_LIGHT_REMOVAL_FACTOR = 0.8f; // How much of the light calculations that are removed from the borders. 1.0f is no light

	// Camera heights for the OPT_FAR_* switches at the top of this file: fully original below START, fully simplified above END. ( Guesses, based on the 600 - 1400 range the arrow shader uses. Tune them while watching the frame time. )
	static const float WATER_FAR_START			= 600.0f;
	static const float WATER_FAR_END			= 1000.0f;
	static const float MESH_NORMAL_FAR_START	= 600.0f;
	static const float MESH_NORMAL_FAR_END		= 1000.0f;
	static const float TERRAIN_TILE_BLEND_FAR	= 1200.0f; // no fade: the blend is about one map texel wide, so about a pixel or less up here
	static const float POINTLIGHT_FAR_START		= 800.0f;
	static const float POINTLIGHT_FAR_END		= 1200.0f;
	static const float GB_STRENGTH_CH1 = 1.0; // Opacity of bottom layer
	static const float GB_STRENGTH_CH2 = 1.0; // Opacity of top layer
	static const float GB_FIRST_LAYER_PRIORITY = 0.4; // Priority for first/second layer when both are active at the same pixel
	static const float BORDER_MAP_TILE = 18000.0f;

	static const float SEC_MAP_TILE = 6000.0f; // SECONDARY COLOR MAP

	// ------------------    MAP ARROWS   ---------------------------

	static const float MAP_ARROW_SEL_BLINK_SPEED = 5.5f;
	static const float MAP_ARROW_SEL_BLINK_RANGE = 0.7f;
	static const float MAP_ARROW_NORMALS_STR_TERR = 0.0125f;
	static const float MAP_ARROW_NORMALS_STR_WATER = 0.08f;

	// ------------------    PARTICLES   ----------------------------
	static const float PARTICLE_FADE_START_DISTANCE = 100;
	static const float PARTICLE_FADE_STOP_DISTANCE = 350;

	// -------------    RIM LIGHT (PDXMESH)   -----------------------
	static const float 	RIM_START 		= 0.55f;
	static const float 	RIM_END 		= 0.6f;
	static const float4 RIM_COLOR 		= float4( 0.3f, 0.3f, 0.3f, 0.0f );

	// -------------    MAP BORDER (PDXMESH)   ----------------------
	static const float3 BORDER_SUN_INTENSITY = float3(1.5, 1.5, 1.6);
	static const float3 BORDER_SUN_DIRECTION = float3(-0.2, 0.9, 0.1);
]]