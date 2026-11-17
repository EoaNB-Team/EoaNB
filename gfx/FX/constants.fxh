

Code
[[

#define OPT_GB_FAST_MULTISAMPLE		1

#define OPT_SKIP_UNUSED_LAYERS		1

#define OPT_FAST_OVERLAY_GAMMA		0

#define OPT_SKIN_BLEND_MATRIX		1

#ifndef OPT_SAMPLE_IN_BRANCH
	#if OPT_SKIP_UNUSED_LAYERS && defined( PDX_DIRECTX_11 )
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

static const float NIGHT_AMBIENT_BOOST = 3.0f;


static const float3 DayAmbientMapPosX = float3(0.1, 0.1, 0.05);
static const float3 DayAmbientMapNegX = float3(0.15, 0.15, 0.15);
static const float3 DayAmbientMapPosY = float3(0.03, 0.03, 0.06);
static const float3 DayAmbientMapNegY = float3(0.0, 0.0, 0.0);
static const float3 DayAmbientMapPosZ = float3(0.0502, 0.05023, 0.1023);
static const float3 DayAmbientMapNegZ = float3(0.03, 0.033, 0.033);

static const float3 NightAmbientMapPosX = float3(0.2, 0.2, 0.2);
static const float3 NightAmbientMapNegX = float3(0.0, 0.0, 0.0);
static const float3 NightAmbientMapPosY = float3(0.01, 0.01, 0.01);
static const float3 NightAmbientMapNegY = float3(0.0, 0.0, 0.1);
static const float3 NightAmbientMapPosZ = float3(0.06, 0.1, 0.15);
static const float3 NightAmbientMapNegZ = float3(0.14, 0.14, 0.2);

static const float3 NightAmbientPosX = float3(2.0, 2.0, 2.0);
static const float3 NightAmbientNegX = float3(0.2, 0.2, 0.2);
static const float3 NightAmbientPosY = float3(0.1, 0.1, 0.1);
static const float3 NightAmbientNegY = float3(0.0, 0.0, 0.0);
static const float3 NightAmbientPosZ = float3(3.0, 3.0, 3.0);
static const float3 NightAmbientNegZ = float3(0.8, 0.8, 0.8);

static const float SPECULAR_WIDTH 				= 15.0;
static const float SPECULAR_MULTIPLIER			= 1.0;
static const float MAP_SPECULAR_WIDTH			= 15.0;

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

static const float3 LUMINANCE_VECTOR  			= float3(0.2125f, 0.7154f, 0.0721f);

static const float 	TREE_SPECULAR = 0.1f;
static const float 	TREE_ROUGHNESS = 0.6f;

static const float  WATER_TIME_SCALE			= 1.0f / 50.0f;
static const float  WATER_HEIGHT = 9.5f;
static const float  WATER_HEIGHT_RECP = 1.0f / WATER_HEIGHT;
static const float  WATER_HEIGHT_RECP_SQUARED = WATER_HEIGHT_RECP * WATER_HEIGHT_RECP;

static const float3 FOG_COLOR 					= float3( 0.12, 0.28, 0.6 );
static const float 	FOG_BEGIN					= 1.0f;
static const float 	FOG_END 					= 150.0f;
static const float 	FOG_MAX 					= 0.35f; 

static const float 	FOW_MAX 					= 0.5f;
static const float  FOW_CAMERA_MIN				= 200;
static const float  FOW_CAMERA_MAX				= 500;

static const float  SHADOW_WEIGHT_TERRAIN    	= 0.7f;
static const float  SHADOW_WEIGHT_MAP    		= 0.7f;
static const float  SHADOW_WEIGHT_BORDER   		= 0.7f;
static const float  SHADOW_WEIGHT_WATER   		= 0.5f;
static const float  SHADOW_WEIGHT_RIVER   		= 0.4f;
static const float  SHADOW_WEIGHT_TREE   		= 0.7f;

static const float GB_CAM_MIN = 100.0f;
static const float GB_CAM_MAX = 350.0f;
static const float GB_CAM_MAX_FILLING_CLAMP = 0.8f;
static const float GB_THRESHOLD = 0.05f;
static const float GB_THRESHOLD2 = 0.25f;
static const float GB_OUTLINE_CUTOFF_SEA = 0.990f;
static const float GB_OPACITY_NEAR = 1.0f;
static const float GB_OPACITY_FAR = 0.85f;
static const float BORDER_NIGHT_DESATURATION_MAX = 0.2f;
static const float BORDER_FOW_REMOVAL_FACTOR = .8f;
static const float BORDER_LIGHT_REMOVAL_FACTOR = 0.8f;
static const float GB_STRENGTH_CH1 = 1.0;
static const float GB_STRENGTH_CH2 = 1.0;
static const float GB_FIRST_LAYER_PRIORITY = 0.4;
static const float BORDER_MAP_TILE = 18000.0f;

static const float SEC_MAP_TILE = 6000.0f;

static const float MAP_ARROW_SEL_BLINK_SPEED = 5.5f;
static const float MAP_ARROW_SEL_BLINK_RANGE = 0.7f;
static const float MAP_ARROW_NORMALS_STR_TERR = 0.0125f;
static const float MAP_ARROW_NORMALS_STR_WATER = 0.08f;

static const float PARTICLE_FADE_START_DISTANCE = 100;
static const float PARTICLE_FADE_STOP_DISTANCE = 350;

static const float 	RIM_START 		= 0.55f;
static const float 	RIM_END 		= 0.6f;
static const float4 RIM_COLOR 		= float4( 0.3f, 0.3f, 0.3f, 0.0f );

static const float3 BORDER_SUN_INTENSITY = float3(1.5, 1.5, 1.6);
static const float3 BORDER_SUN_DIRECTION = float3(-0.2, 0.9, 0.1);
]]