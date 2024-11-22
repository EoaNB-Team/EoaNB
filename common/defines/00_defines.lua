NDefines = {

	NGame = {
		START_DATE = "1857.5.10.24",
		END_DATE = "2100.1.1.1",
		MAP_SCALE_PIXEL_TO_KM = 7.114,					-- Yes, we did the math
		SAVE_VERSION = 24,
		CHECKSUM_SALT = "zwOdv5d9wm9uDSOT",				-- Data to modify generated checksum when game binaries have changed but not any content files.
		LAG_DAYS_FOR_LOWER_SPEED = 10,					-- Days of client lag for decrease of gamespeed
		LAG_DAYS_FOR_PAUSE = 25,						-- Days of client lag for pause of gamespeed.
		GAME_SPEED_SECONDS = { 2.0, 0.5, 0.2, 0.1, 0.0 }, -- game speeds for each level. Must be 5 entries with last one 0 for unbound	
		MAJOR_PARTICIPANTS_FOR_MAJOR_WAR = 3,			-- Minimum number of major countries involved in a war to consider it major enough to not end the game even though the enddate has been reached.
		TRADE_ROUTE_RECALCULATE_FREQUENCY_DAYS = 30, -- Max recalculation time for all trade routes (0 means we do not recalucate prediodically trade routes)
		COMBAT_LOG_MAX_MONTHS = 12,
		MESSAGE_TIMEOUT_DAYS = 60,						-- Useful if running the handsoff game. The popup messages that doesn't require the player respond will automatically hide after some timeout.	
		INFO_MESSAGE_TIMEOUT_DAYS = 3,					-- Same but for unimportant messages.
		AIR_LOG_TIMEOUT_HOURS = 24,						-- Data storring data
		EVENT_TIMEOUT_DEFAULT = 13,						-- Default days before an event times out if not scripted
		MISSION_REMOVE_FROM_INTERFACE_DEFAULT = 13,		-- Default days before a mission is removed from the interface after having failed or completed
		DECISION_ALERT_TIMEOUT_DAYS = 30,				-- Days left when player will be alerted about timing out events or decisions
		FUEL_RESOURCE = "oil",							-- resource that will give country fuel
		MAX_EFFECT_ITERATION = 1000,					-- maximum allowed iteration for loop effects
		MAX_SCRIPTED_LOC_RECURSION = 30,				-- max recursion for scripted localizations
		HANDS_OFF_START_TAG = "UCT",					-- tag for player country for -hands_off runs. use an existing tag that is less likely to affect the game
		ALERT_SFX_COOLDOWN_DAYS = 14,					-- After playing an alert sound, don't play the same sound for XXX days, even if it fires again.
		MUSIC_PLAYER_RECENTLY_PLAYED_SIZE = 10,			-- The music player keeps track of recently played music to try and avoid playing the same songs too often. This determines the max number of songs in the recently played list.
	},

	NGeography = {
		MEDITERRANEAN_SEA_REGIONS = { 29, 68, 69, 168, 169, 202 }, -- The sea regions that are considered as part of the Mediterranean sea
	},	
	
	NDiplomacy = {
		DIPLOMACY_REQUEST_EXPIRY_DAYS = 30,
		BASE_SURRENDER_LEVEL = 1.0,						-- Surrender when level reached. valid 0-1
		MAX_TRUST_VALUE = 80,							-- Max trust value cap.
		MIN_TRUST_VALUE = -80,							-- Min trust value cap.
		MAX_OPINION_VALUE = 200,						-- Max opinion value cap.
		MIN_OPINION_VALUE = -200,						-- Min opinion value cap.
		BASE_TRUCE_PERIOD = 30,							-- Base truce period in days.
		TRUCE_PERIOD_AFTER_KICKING_FROM_FACTION = 30,				-- Truce period after kicking someone from faction in days.
		NUM_DAYS_TO_ENABLE_KICKING_NEW_MEMBERS_OF_FACTION = 90,			-- Number of days before being able to kick a new member of faction 
		NUM_DAYS_TO_ENABLE_REINVITE_KICKED_NATIONS = 90,			-- Number of days before being able to re invite a kicked nation to your faction
		BASE_NEGATIVE_OPINION_AFTER_BEING_KICKED = 20,				-- Negative opinion that will be received after kicking a nation
		DECAY_RATE_OF_NEGATIVE_OPINION_AFTER_BEING_KICKED = 1,			-- Weekly decay rate of the negative opinion
		TRUCE_BREAK_COST_PP = 200,						-- Base cost in PP of breaking a truce by joining a war or accepting a call to war ( you cannot declare war yourself until the truce if up ), this is then multiplied by the time left on the truce ( so once half the truce is up it only cost 50% of this )				
		BASE_PEACE_PUPPET_FACTOR = 100,					-- Base factor for puppet in %.
		BASE_PEACE_LIBERATE_FACTOR = 100,				-- Base factor for liberate in %.
		BASE_PEACE_TAKE_UNCONTROLLED_STATE_FACTOR = 10.0, -- Base factor for taking state you do not control
		BASE_PEACE_TAKE_FACTION_CONTROLLED_STATE_FACTOR = 0.5, -- Base factor for taking state you do not control, but someone in faction does
		BASE_PEACE_FORCE_GOVERNMENT_COST = 100, 		-- Base cost for forcing a country to change government.
	-- In peace conference, cost is factored based on how many times the state has been contested and for how long it has been uncontested (for everyone else)
	PEACE_COST_FACTOR_CONTESTED_MAX = 15,           -- To prevent overflows due to the exponential increase, cap the contested factor to this
	PEACE_COST_FACTOR_UNCONTESTED_MAX = 15,         -- To prevent overflows due to the exponential increase, cap the uncontested factor to this
	PEACE_COST_FACTOR_CONTESTED_BID = 1.20,         -- Cost factor for each contested bid on the state.
	PEACE_COST_FACTOR_UNCONTESTED_BID_MIN = 1.15,   -- Minimum cost factor for each turn a bid has been uncontested on the state.
	PEACE_COST_FACTOR_UNCONTESTED_BID_MAX = 1.60,   -- Maximum cost factor for each turn a bid has been uncontested on the state.
	PEACE_COST_FACTOR_UNCONTESTED_BID_STEP = 0.15,  -- Uncontested cost factor will increase by this much each turn.
	PEACE_COST_FACTOR_CAPITAL_SHIP_IC = 0.005,				-- In peace conference, cost for taking one capital ship per IC
	PEACE_COST_FACTOR_SCREENING_SHIP_IC = 0.005,			-- In peace conference, cost for taking a part of the screening ships per IC
	PEACE_INCREASE_COST_FACTOR_PER_MISSING_PERCENT_FOR_CAPITULATION = 0.01, 	-- increase factor if loser has not capitulated, for every percent between surrender level and BASE_SURRENDER_LEVEL
	-- peace action taker has a discount if they occupy the state depending on compliance
	-- it's a table where first value is the compliance level, and the second the factor
	PEACE_COST_FACTOR_COMPLIANCE_STEPS = {
		0,   1.0, -- between 0%  and 30% compliance, factor is 1.0
		30,  0.9, -- between 30% and 70%
		70,  0.8, -- above 70%
	},
	-- In peace conference, adding a stackable to a peace action, increment the cost by a percentage
	PEACE_COST_FACTOR_STACK_DEMILITARIZED_ZONE = 0.25,
	PEACE_COST_FACTOR_STACK_WAR_REPARATION = 0.25,
	PEACE_COST_FACTOR_STACK_RESOURCE_RIGHTS = 0.25,
	PEACE_COST_FACTOR_STACK_DISMANTLE_INDUSTRY = 0.25,
	-- peace conference can set timed effect, set length in days
	PEACE_TIMED_EFFECT_LENGTH_DEMILITARIZED_ZONE = 1825, -- 5 years
	PEACE_TIMED_EFFECT_LENGTH_WAR_REPARATION = 1825,
	PEACE_TIMED_EFFECT_LENGTH_RESOURCE_RIGHTS = 1825,
	PEACE_TIMED_EFFECT_RATIO_CIVILIAN_FACTORY_WAR_REPARATION = 0.5, 	-- ratio of civilian factories taken via stackable war reparation

	-- The Influence cost modifier is computed by starting at 100 % influence and reducing that based on the distance values down to a minimum of 0 %. Then factored by INFLUENCE_MAX_DISCOUNT before applied to the cost of peace actions.
	-- We basically do a two-segment lerp:
	--   if distance is between [0, NEUTRAL_DIST], we lerp the cost modifier between [MIN_DIST_COST_MODIFIER, 1.0]
	--   if distance is between [NEUTRAL_DIST, MAX_DIST], we lerp the cost modifier between [1.0, MAX_DIST_COST_MODIFIER]
	-- The below values represent (pixel distance / INFLUENCE_DISTANCE_DIVISOR)
	INFLUENCE_NEUTRAL_DIST_CAPITAL = 80.0,           -- distance to capital that results in a cost modifier of 1.0
	INFLUENCE_MAX_DIST_CAPITAL = 100.0,              -- distance to capital that results in a cost modifier of INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_NEUTRAL_DIST_CORE = 20.0,              -- distance to nearest core state that results in a cost modifier of 1.0
	INFLUENCE_MAX_DIST_CORE = 30.0,                 -- distance to nearest core state that results in a cost modifier of INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_NEUTRAL_DIST_CONTROLLED = 10.0,        -- distance to nearest controlled state that results in a cost modifier of 1.0
	INFLUENCE_MAX_DIST_CONTROLLED = 14.0,           -- distance to nearest controlled state that results in a cost modifier of INFLUENCE_MAX_DIST_COST_MODIFIER
	INFLUENCE_MIN_DIST_COST_MODIFIER = 0.80,        -- Cost modifier at min (zero) distance
	INFLUENCE_MAX_DIST_COST_MODIFIER = 1.20,         -- Cost modifier at max distance
	INFLUENCE_RATIO_CAPITAL = 0.2,                  -- Ratio of influence based on distance to capital
	INFLUENCE_RATIO_CORE = 0.3,                     -- Ratio of influence based on distance to nearest core territory
	INFLUENCE_RATIO_CONTROLLED = 0.5,               -- Ratio of influence based on distance to neared controlled territory (including uncontested peace conference bids)
	INFLUENCE_DISTANCE_DIVISOR = 30.0,              -- Divide pixel distance with this when determining distance to capital / core / controlled states. Just an arbitrary way of scaling the distance numbers.
	
	INFLUENCE_PER_ADJACENCY = 0.05,					-- How much influence to add per uncontested adjacent state in the PC (blob, don't snake)
	
	INFLUENCE_MAJOR_FACTOR = 1.0,					--How much influence discount a major will get
	INFLUENCE_MINOR_FACTOR = 0.65,					--How much influence discount a minor will get
	
	PEACE_TRIGGER_AI_MAX_INFLUENCE_VALUE = 0.89,	-- Max influence value for pc_is_state_outside_influence_for trigger
	
	BASE_IMPROVE_RELATION_COST = 25,                -- Political power cost to initiate relation improvement
		BASE_IMPROVE_RELATION_SAME_IDEOLOGY_GROUP_MAINTAIN_COST = 0.2, -- Political power cost each update when boosting relations with nation of same ideology
		BASE_IMPROVE_RELATION_DIFFERENT_IDEOLOGY_GROUP_MAINTAIN_COST = 0.4,    -- Political power cost each update when boosting relations with nation of different ideology
		BASE_SEND_ATTACHE_COST = 100,					-- Political power cost to send attache
		BASE_SEND_ATTACHE_CP_COST = 50.0,				-- Command Power sent attache usage cost
		BASE_GENERATE_WARGOAL_DAILY_PP = 0.4,	-- Daily pp cost for generation of wargoals
		WARGOAL_VERSUS_MAJOR_AT_WAR_REDUCTION = -0.75, 	-- reduction of pp cost for wargoal vs major at war.
		WARGOAL_WORLD_TENSION_REDUCTION = -0.5,			-- Reduction of pp cost for wargoal at 100% world tension, scales linearly
		WARGOAL_JUSTIFY_TENSION_FROM_PRODUCTION = 15.0,	-- Base value scaled by production capacity of country compared to biggest country
		MIN_WARGOAL_JUSTIFY_COST = 2.0,					-- It always takes atleast 10 days to justify a wargoal
		WARGOAL_PER_JUSTIFY_AND_WAR_COST_FACTOR = 1.75,	-- Cost factor per nation at war with or justifying against
		WARGOAL_THREAT_MAX_TIME_RATIO = 1.0,			-- Threat from justifying a wargoal slowly builds up, hitting 100% at this proportion of the way to completion
		BASE_BOOST_PARTY_POPULARITY_DAILY_PP = 0.25, 	-- Daily pp cost for boost party popularity
		BASE_BOOST_PARTY_POPULARITY_DAILY_DRIFT = 0.1, 	-- Daily amount of popularity that will be added by the activity.
		BASE_STAGE_COUP_DAILY_PP = 0.5,					-- Daily pp cost for staging a coup
		BASE_STAGE_COUP_TOTAL_COST = 200, 				-- Equipment consume factor for stage coup.
		NAP_EXPIRY_MONTHS = 48,                         -- NAPs expire after this many months
		NAP_UNBREAKABLE_MONTHS = 12,                    -- NAPS cannot be broken for this many months
		NAP_FORCE_BALANCE_RULE_MONTHS = 6,        		-- The NAP border force balance rule changes with this interval
		NAP_BREAK_FORCE_BALANCE_1 = 2.0,              	-- 2-1 brigades along the border required to break NAP
		NAP_BREAK_FORCE_BALANCE_2 = 1.0,              	-- 1-1 brigades along the border required to break NAP
		NAP_BREAK_FORCE_BALANCE_3 = 0.5,              	-- 1-2 brigades along the border required to break NAP
		VERY_GOOD_OPINION = 75,							-- Threshold for a country that has a very good opinion of you.
		VERY_BAD_OPINION = -75,							-- Threshold for a country that has a very bad opinion of you.
		DIPLOMACY_HOURS_BETWEEN_REQUESTS = 24,			-- How long a country must wait before sending a new diplomatic request.
		TROOP_FEAR = 1, 								-- Impact on troops on borders when deciding how willing a nation is to trade
		FLEET_FEAR = 1,									-- Impact on troops on borders when deciding how willing a nation is to trade
		IC_TO_EQUIPMENT_COUP_RATIO = 0.1,				-- Ratio for calculating cost of staging coup
		VOLUNTEERS_PER_TARGET_PROVINCE = 0.05,			-- Each province owned by the target country contributes this amount of volunteers to the limit.
		VOLUNTEERS_PER_COUNTRY_ARMY = 0.05,				-- Each army unit owned by the source country contributes this amount of volunteers to the limit.
		VOLUNTEERS_RETURN_EQUIPMENT = 0.95,				-- Returning volunteers keep this much equipment
		VOLUNTEERS_TRANSFER_SPEED = 14,					-- days to transfer a unit to another nation
		VOLUNTEERS_DIVISIONS_REQUIRED = 30,				-- This many divisons are required for the country to be able to send volunteers.
		TENSION_STATE_VALUE = 0,						-- Tension value gained by annexing one state
		TENSION_CIVIL_WAR_IMPACT = 0,					-- civil war multiplier on tension.
		TENSION_NO_CB_WAR = 0,							-- Amount of tension generated by a no-CB wargoal
		TENSION_CB_WAR = 0,								-- Amount of tension generated by a war with a CB
		TENSION_ANNEX_NO_CLAIM = 4,						-- Amount of tension generated by annexing a state you don't have claims on
		TENSION_ANNEX_CLAIM = 1,						-- Amount of tension generated by annexing a state you DO have claims on
		TENSION_ANNEX_CORE = 0.25,						-- Amount of tension generated by annexing a state that is your core
		TENSION_PUPPET = 4,								-- Amount of tension generated by puppeting (per state)
		TENSION_FORCE_GOVERNMENT = 0.75,                -- Amount of tension generated by forcing government (per state)
		TENSION_VOLUNTEER_FORCE_DIVISION = 0.2,			-- Amount of tension generated for each sent division
		TENSION_DECAY_DAILY = 0.005,					-- Each day tension decays this much for Threat sources which are no longer relevant. Replaces TENSION_DECAY as of 1.12.0
		TENSION_SIZE_FACTOR = 1.0,						-- All action tension values are multiplied by this value
		TENSION_TIME_SCALE_START_DATE = "1857.5.10.24",	-- Starting at this date, the tension values will be scaled down (will be equal to 1 before that)
		TENSION_TIME_SCALE_MONTHLY_FACTOR = -0.005,		-- Timed tension scale will be modified by this amount starting with TENSION_TIME_SCALE_START_DATE
		TENSION_TIME_SCALE_MIN = 0.25,					-- Timed tension scale won't decrease under this value
		TENSION_GUARANTEE = 0,
		TENSION_FACTION_JOIN = 10,
		TENSION_JOIN_ATTACKER = 0,						-- scale of the amount of tension added when country joins attacker side
		TENSION_PEACE_FACTOR = 0,					-- scale of the amount of tension (from war declaration) reduced when peace is completed.
		TENSION_LIBERATE = -1,							-- Amount of tension generated by liberating a country.
		TENSION_TAKE_ONE_CAPITAL_SHIP = 0.25,			-- Amount of tension generated by 1 take navy peace action
		TENSION_DEMILITARIZE_ZONE = 0.25,				-- Amount of tension generated by stacking demilitarize zone on 1 state, multiplied with the state base threat
		TENSION_WAR_REPARATION = 0.25,					-- Amount of tension generated by stacking war reparation on 1 state, multiplied with the state base threat
		TENSION_RESOURCE_RIGHTS = 0.25,					-- Amount of tension generated by stacking resource rights on 1 state, multiplied with the state base threat
		TENSION_DISMANTLE_INDUSTRY = 0.25,				-- Amount of tension generated by stacking dismantle military industry on 1 state, multiplied with the state base threat
		TENSION_CAPITULATE = 0,						-- Scale of the amount of tension created by a countries capitulation.
		GUARANTEE_COST = 50,							-- Scale with the number of already guaranteed countries.
		REVOKE_GUARANTEE_COST = 50,
		BASE_CONDITIONAL_PEACE_WARESCORE_RATIO = 0.5, 	-- Warscore ratio needed for the losing side to able to surrender.
		BASE_CONDITIONAL_PEACE_MONTHS = 6,				-- War length must be this before a surrender is possible.
		JOINING_NAP_WAR_PENALTY = 0.2,					-- War support penalty for breaking non-breakable NAP
		BREAKING_GUARANTEE_PENALTY = 0.2,				-- War support penalty for breaking guarantee

		-- WARNING ! if you modify the following values, you should update corresponding loc keys in games_rules_l_english.yml
		PEACE_SCORE_TRANSFERRED_TO_FACTION_LEADER = 0.1, 		-- Part of the peace score transferred from the faction members 	to the faction leader (if game rule enabled)
		PEACE_SCORE_RESET_LOW_SCORE_THRESHOLD = 0.05,			-- Winners with less than this ratio of war participation will 	give all their score to other players
		PEACE_SCORE_RESET_LOW_SCORE_MINIMUM_FOR_RECEIVER = 0.1, -- Disable the previous, if no winner has at least this ratio 	of war participation

		PEACE_SCORE_SCALE_FACTOR = 1.25,                -- Losers' total value times this factor becomes the default total peace conference score that is distributed to the winners.

		PEACE_SCORE_MINOR_BOOST_FRACTION = 0.05,        -- Low-scoring winners are boosted by receiving more of their score earlier. This value, multiplied by the total score distributed this turn, is the minimum score they will receive (up until their total allocated score).
		-- Example: If 2000 score is distributed to winners this turn and this value is set to 0.05, each winner will receive a minimum of 100 score (clamped by the max score they will receive over the cource of the conference).

		PEACE_SCORE_DISTRIBUTION = { 0.2, 0.2, 0.2, 0.2, 0.2 }, -- How much of the total peace conference score you get during the first n turns.
		-- More explanation of the peace score distribution above:
		-- {1.0} would give you all the score on the first turn.
		-- {0.5, 0.5, 0.5} would give you 50 % of the total score on each of the first three turns (in this case resulting in receiving 150 % of the total score).

		PEACE_CONTEST_REFUND_FACTOR = { 1.0, 0.90, 0.80, 0.70 }, -- How much of the spent peace conference score that gets refunded in a contest. First element applies for the first round of conflicts, second element for the second round of conflicts, etc. The final element is used for each consecutive turn, so setting that to e.g. 0.7 means you get 70 % of the spent score back for every turn thereafter.

		PEACE_PLAY_SOUND_ON_NEW_TURN = true,            -- Whether the 'peace_conference_new_turn' audio hook is called or not
		PEACE_PLAY_NEW_TURN_SOUND_ONLY_IF_NOT_ALREADY_PLAYING = true, -- Whether the 'peace_conference_new_turn' audio hook should play only if not already playing (relevant if players spam-click the pass/submit button)

		MAX_REMEMBERED_LEASED_IC = 1000,				-- Maximum of leased equipment value that is remembered for opinion bonus
		MAX_OPINION_FOR_LEASED_IC = 30,					-- Positive opinion when remembering the MAX_REMEMBERED_LEASED_IC equipment
		MONTHLY_LEASED_IC_DECAY = 35,					-- How much of leased equipment is being "forgot" each month
		OPINION_PER_VOLUNTEER = 3,						-- Opinion bonus per one sent volunteer division
		MAX_OPINION_FROM_VOLUNTEERS = 30,				-- Opinion bonus per one sent volunteer division
		OPINION_FOR_DEMO_FROM_WT_GENERATION = 0,		-- How much less do democracies like us if we generate world tension
		NOT_READY_FOR_WAR_BASE = -50,					-- AI should be unwilling to enter accept a call to war if not ready for war against the relevant enemies.
		FRONT_IS_DANGEROUS = -100,						-- AI should be unwilling to enter accept a call to war if front is too dangerous.
		NOT_READY_FOR_WAR_VAL_PER_DAY_SINCE_CALL = 1,	-- Value modifying the not ready base over time.

		PEACE_ACTION_MAX_COST = 9999,					-- Max value for a peace action cost (after all modifiers)
		
		RESOURCE_SENT_AUTONOMY_DAILY_BASE = 0.0,		-- If puppet provides resources to its master they increasy their autonomy by at least this amount
		RESOURCE_SENT_AUTONOMY_DAILY_FACTOR = 0.005,	-- If puppet provides resources to its master they increasy their autonomy by the resources factored by this
		WAR_SCORE_AUTONOMY_BASE = 0.0,					-- Value added if any war score is contributed by puppet
		WAR_SCORE_AUTONOMY_FACTOR = 0.6,				-- If puppet generates war score it get a boost to independence 
		LL_TO_OVERLORD_AUTONOMY_DAILY_BASE = 0.0,		-- If puppet lend leases equipment to overlord of at least same tech level as they have, they gain autonomy
		LL_TO_OVERLORD_AUTONOMY_DAILY_FACTOR = 0.05,	-- If puppet lend leases equipment to overlord of at least same tech level as they have, they gain autonomy
		LL_TO_PUPPET_AUTONOMY_DAILY_BASE = 0.0,			-- If overlord lend leases equipment to puppet of higher tech level as they have, puppet losses autonomy
		LL_TO_PUPPET_AUTONOMY_DAILY_FACTOR = -0.01,		-- If overlord lend leases equipment to puppet of higher tech level as they have, puppet losses autonomy
		AUTONOMY_FREEDOM_FROM_CAPITULATE = 0.5,         -- if overlord capitulate you get this
		ATTACHE_TO_SUBJECT_EFFECT = -0.05,				-- If overlord sent attaches to the subject it losses autonomy
		ATTACHE_TO_OVERLORD_EFFECT = 0.05,				-- If subject sent attaches to the overlord it gains autonomy
		
		AUTONOMY_LEVEL_CHANGE_PP_COST_BASE = 50.0,		-- Base cost of changing level of autonomy
		AUTONOMY_LEVEL_CHANGE_PP_ANNEX = 300,			-- Annexation cost
		AUTONOMY_LEVEL_CHANGE_PP_FREE = 300,			-- Break free cost
		MAX_SCORE_DIFF_TO_CHANGE_AUTONOMY = 10,			-- The max diff between current freedom score and the cap for next or previous level allowed for changing
		MASTER_BUILD_AUTONOMY_FACTOR = -0.7,            -- scales autonomy gain from construction by this
		VICTORY_POINT_WORTH_FACTOR = 10,				-- multiplier when calcualting proince worth (surrender)
		VICTORY_POINT_WORTH_FACTOR_WARSCORE = 0.2,		-- multiplier when calcualting province worth with autonomy/warscore
		PROVINCE_WORTH_FROM_STATE_VALUE_FACTOR_WARSCORE = 0.2, 	-- multiplier for the average value a province received from state for warscore
		CAPITAL_CAPITULATE_BONUS_SCORE = 150,			-- extra bonus when deciding who to capitulate to (applied to capital holder)
		CAPITAL_CAPITULATE_BONUS_SCORE_MUL = 1.5,		-- extra bonus multiplier when deciding who to capitulate to (applied to capital holder)
		IDEOLOGY_JOIN_FACTION_MIN_LEVEL = 0.3,			-- ideology limit required to join faction
		JOIN_FACTION_LIMIT_CHANGE_AT_WAR = 0.5,			-- if in defensive war this or your modifier is counted as limit to join factions (so if you have 80% join limit this now means you can join at 50%)
		LICENSE_ACCEPTANCE_OPINION_FACTOR = 0.2,		-- Opinion modifier for acceptance of license production requests.
		LICENSE_ACCEPTANCE_PUPPET_BASE = 20,			-- Acceptance modifier for puppets requesting production licenses.
		LICENSE_ACCEPTANCE_TECH_DIFFERENCE = 5, 		-- Acceptance modifier for each year of technology difference.
		LICENSE_ACCEPTANCE_TECH_DIFFERENCE_BASE = 20,    -- Acceptance base for tech difference
		LICENSE_ACCEPTANCE_SAME_FACTION = 20,			-- Acceptance modifier for being in the same faction
		
		WARGOAL_COST_LEND_LEASE = -0.25,                -- cost modifier to wargoaljustification for LL
		WARGOAL_COST_DOCKING_RIGHTS = -0.2,             -- cost modifier to wargoaljustification for dockign rights
		WARGOAL_COST_VOLUNTEERS = -0.5,                 -- cost modifier to wargoaljustification for volunteers

		ASSUME_FACTION_LEADERSHIP_PP_COST = 200,				-- Political power cost to assume faction leadership
		ASSUME_FACTION_LEADERSHIP_MIN_MANPOWER_RATIO = 2,		-- The minimum ratio of manpower that a country must have compared to the current leader in order to assume leadership.
		ASSUME_FACTION_LEADERSHIP_MIN_FACTORY_RATIO = 1.5,		-- The minimum ratio of factories that a country must have compared to the current leader in order to assume leadership.
		ASSUME_FACTION_LEADERSHIP_COOLDOWN_DAYS = 180,			-- Number of days after formation of faction or change in leadership before another country is allowed to assume leadership.
		ASSUME_FACTION_SPYMASTER_COOLDOWN_DAYS = 180,			-- Number of days after change of Spy Master before another country is allowed to become Spy Master.
		FACTION_LEADERSHIP_CHANGE_ALERT_THRESHOLD = 0.8,		-- Threshold for showing an alert when a faction member is close to being able to assume leadership of the faction that a player currently leads.
		FACTION_LEADERSHIP_CHANGE_NOT_SUBJECT_WEIGHT = 2,		-- Importance of subject status when determining how close a faction member is to being able to assume leadership.
		FACTION_LEADERSHIP_CHANGE_NOT_CAPITULATED_WEIGHT = 2,	-- Importance of capitulation status when determining how close a faction member is to being able to assume leadership.
		FACTION_LEADERSHIP_CHANGE_IN_ALL_WARS_WEIGHT = 1,		-- Importance not being in all faction leader wars when determining how close a faction member is to being able to assume leadership.
		FACTION_LEADERSHIP_CHANGE_COOLDOWN_WEIGHT = 1,			-- Importance of leadership change cooldown when determining how close a faction member is to being able to assume leadership.
		FACTION_LEADERSHIP_CHANGE_MANPOWER_WEIGHT = 2,			-- Importance of manpower in field when determining how close a faction member is to being able to assume leadership.
		FACTION_LEADERSHIP_CHANGE_FACTORY_WEIGHT = 2,			-- Importance of factory count when determining how close a faction member is to being able to assume leadership.

		EMBARGO_COST = 100,										-- One-time cost
		REVOKE_EMBARGO_COST = 0,								-- Cost to remove an existing embargo
		EMBARGO_THREAT_THRESHOLD = 30,						-- Target-generated threat threshold to allow embargo (affected by modifiers)

		EMBARGO_SAME_IDEOLOGY_AI_WEIGHT = -20,				-- AI weight for same ideology
		EMBARGO_DIFFERENT_IDEOLOGY_AI_WEIGHT = 15,			-- AI weight for different ideology
		EMBARGO_DIFFERENT_IDEOLOGY_AT_OFFENSIVE_WAR_AI_WEIGHT = 10,	--AI weight for different ideology and in offensive war (additive with above)
		EMBARGO_RECIPIENT_IS_MAJOR_AI_WEIGHT = 10,			-- Ai weight for recipient being major
		EMBARGO_NEIGHBOUR_AI_WEIGHT = -10,					--AI weight for embargoing neighbors (neighbors are big and scary, we should consider not doing it)

		EQUIPMENT_PURCHASE_ACCEPTANCE_OPINION = 1.0,                        -- Acceptance factor for opinion
		EQUIPMENT_PURCHASE_ACCEPTANCE_SAME_IDEOLOGY = 10,                   -- Acceptance value added if same ideology
		EQUIPMENT_PURCHASE_ACCEPTANCE_SCRIPTED_IDEOLOGY_ACCEPTANCE = 1.0,   -- Acceptance factor for scripted ideology acceptance modifier
		EQUIPMENT_PURCHASE_ACCEPTANCE_TRADE_INFLUENCE = 0.50,               -- Acceptance factor for trade influence (adjusted from base value)
		EQUIPMENT_PURCHASE_ACCEPTANCE_COMPETING_FACTIONS = -30,             -- Acceptance value added if both countries are in factions, and factions are different
		EQUIPMENT_PURCHASE_ACCEPTANCE_EMBARGO = -200,                       -- Acceptance value added if either side has embargoed the other
		EQUIPMENT_PURCHASE_ACCEPTANCE_NON_AGGRESSION_PACT = 25,             -- Acceptance value added if there is a non-aggression pact between the countries

		MARKET_ACCESS_ACCEPTANCE_OPINION = 1.0,                             -- Acceptance factor for opinion
		MARKET_ACCESS_ACCEPTANCE_SAME_IDEOLOGY = 10,                        -- Acceptance value added if same ideology
		MARKET_ACCESS_ACCEPTANCE_SCRIPTED_IDEOLOGY_ACCEPTANCE = 1.0,        -- Acceptance factor for scripted ideology acceptance modifier
		MARKET_ACCESS_ACCEPTANCE_TRADE_INFLUENCE = 0.50,                    -- Acceptance factor for trade influence (adjusted from base value)
		MARKET_ACCESS_ACCEPTANCE_COMPETING_FACTIONS = -30,                  -- Acceptance value added if both countries are in factions, and factions are different
		MARKET_ACCESS_ACCEPTANCE_EMBARGO = -200,                            -- Acceptance value added if either side has embargoed the other
		MARKET_ACCESS_ACCEPTANCE_NO_TRADE_ROUTE = -100,                     -- Acceptance value added if there is no valid trade route between the countries
		MARKET_ACCESS_ACCEPTANCE_NON_AGGRESSION_PACT = 25,                  -- Acceptance value added if there is a non-aggression pact between the countries
		},

	NCountry = {
		EVENT_PROCESS_OFFSET = 20,						-- Events are checked every X day per country or state (1 is ideal, but CPU heavy)
		BASE_RESEARCH_SLOTS = 2,						-- Base number of research slots per country.
		POPULATION_YEARLY_GROWTH_BASE = 0.0082,			-- basic population growth per year, used for monthly manpower gain
		RESISTANCE_STRENGTH_FROM_VP = 0.001,			-- How much strength ticking speed gives each VP score.
		RESISTANCE_STRENGTH_FROM_NEIGHBORS = 0.5, 		-- Multiplies how much resistance can spread from one state to its neighbors, a state will spread whatever is highest of its victorypoints resistance increase or half of any of its neighbors spread, multiplied by this
		RESISTANCE_DECAY_WHEN_NO_GROWTH = 0.005,		-- Resistance will fall by this much each day if there is nothing increasing it ( no VPs and no spread from neighbors )
		REINFORCEMENT_DIVISION_PRIORITY_COUNT = 3, 		-- How many priority stages we have in division template? 0)Reserves, 1)Normal, 2)Elite.
		REINFORCEMENT_DIVISION_PRIORITY_DEFAULT = 1, 	-- Each template by default is 1)Normal
		REINFORCEMENT_THEATER_GROUP_PRIORITY_DEFAULT = 1,-- Each theater group by default is 1)Normal
		REINFORCEMENT_THEATRE_PRIORITY_COUNT = 3,		-- Same as with divisions...
		REINFORCEMENT_THEATRE_PRIORITY_DEFAULT = 1,
		REINFORCEMENT_AIRBASE_PRIORITY_COUNT = 3,
		REINFORCEMENT_AIRBASE_PRIORITY_DEFAULT = 1,
		REINFORCEMENT_DELIVERY_SPEED_MIN = 0.6,			-- The distance from the supply region to capital should affect the speed only a little bit. Main factor for penalty is overcrowded areas, and not the route length.
		REINFORCEMENT_EQUIPMENT_DELIVERY_SPEED = 0.3,	-- Modifier for army equipment reinforcement speed
		REINFORCEMENT_MANPOWER_DELIVERY_SPEED = 10.0,	-- Modifier for army manpower reinforcement delivery speed (travel time)
		REINFORCEMENT_MANPOWER_CHUNK = 0.1,				-- Chunk size of manpower reinforcement delivery, in % of total manpower needed by the template.
		EQUIPMENT_UPGRADE_CHUNK_MAX_SIZE = 10,			-- Maximum chunk size of equipment upgrade distribution per update.
		COUNTRY_SCORE_MULTIPLIER = 1.0,					-- Weight of the country score.
		ARMY_SCORE_MULTIPLIER = 0.15,					-- Based on number of armies.
		NAVY_SCORE_MULTIPLIER = 1.0,					-- Based on number of navies.
		AIR_SCORE_MULTIPLIER = 0.1,						-- Based on number of planes (which is typically a lot).
		INDUSTRY_SCORE_MULTIPLIER = 1.0,				-- Based on number of factories.
		PROVINCE_SCORE_MULTIPLIER = 0.1,				-- Based on number of controlled provinces.
		NUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_INFRA = 0.2, -- Reduce enemy national war support on nuking a province, the value scales with infrastructure up to this number
		NUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_VP = 3,-- War support will be scaled down if there's less VP than this in the province
    	THERMONUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_INFRA = 0.2,	-- Reduce enemy national war support on nuking a province, the value scales with infrastructure up to this number
    	THERMONUCLEAR_BOMB_DROP_WAR_SUPPORT_EFFECT_MAX_VP = 3,		-- War support will be scaled down if there's less VP than this in the province
		WEEKLY_STABILITY_GAIN = 0.0,
		WEEKLY_WAR_SUPPORT_GAIN = 0.0,
		SUPPLY_CONVOY_FACTOR = 0.25,					-- How many convoys each supply needs
		CONVOY_RANGE_FACTOR = 1,                        -- how much range affects convoy need
		CONVOY_LENDLEASE_RANGE_FACTOR = 1,				-- How much range affects convoy need for lend lease
		CONVOY_INTERNATIONAL_MARKET_RANGE_FACTOR = 1,	-- How much range affects convoy need for international market
		LOCAL_MANPOWER_ACCESSIBLE_NON_CORE_FACTOR = 0.02,  -- accessible recruitable factor base
		MAX_NON_CORE_MANPOWER_FACTOR = 1.0,				-- max clamp for recruitable local non core manpower factor for states
		DEFAULT_STABILITY = 0.5,						-- Default stability if not scripted otherwise.
		DEFAULT_WAR_SUPPORT = 0.5,						-- Default war support if not scripted otherwise.
		BASE_STABILITY_WAR_FACTOR = -0.3,				-- Default stability war factor
		BASE_STABILITY_PARTY_POPULARITY_FACTOR = 0.15,	-- Default stability rulling party popularity factor
		MIN_COUP_STABILITY_FACTOR = 0.0,				-- Min value of coup factor in stability
		MAX_COUP_STABILITY_FACTOR = 2.0,				-- Max value of coup factor in stability
		MIN_COUP_SUCCESS_STABILITY = 0.8,				-- Max stability when coup will happen
		WAR_SUPPORT_OFFNSIVE_WAR = -0.1,				-- Impact of being in offensive war
		WAR_SUPPORT_DEFENSIVE_WAR = 0.2,				-- Impact of being in defensive war
		WAR_SUPPORT_TENSION_IMPACT = 0.3,				-- Total impact of world tension
		MIN_STABILITY = 0.0,
		MAX_STABILITY = 1.0,
		MIN_WAR_SUPPORT = 0.0,
		MAX_WAR_SUPPORT = 1.0,
		FRONT_PROVINCE_SCORE = 20,    					-- Max province score of a front. Used for the hostile troop alert
		MAJOR_IC_RATIO = 3,                             -- difference in total factories needed to be considered major with respect to other nation
		MAJOR_MIN_FACTORIES = 1000000,					-- need at least these many factories to become a major
		MAX_INTELLIGENCE_DIFFERENCE = 10.0,				-- Max difference in intelligence levels between countries
		INTEL_FROM_ALLIANCE_FACTOR = 0.3,				-- Multiplied to the difference between a country intel and the maximum value in the alliance to compute the amount of intel that flows from the alliance to that country. 0 means no alliance contribution, 1 means a country intel's is the same as the max in the alliance.
		MAX_INTELLIGENCE_DATA_DEVIATION = 0.3,          -- Max deviation in estimating default espionage values ( 0.0 - 1.0 )
		MAX_INTELLIGENCE_MILITARY_DATA_DEVIATION = 1.0, -- Max deviation in estimating enemy military units amount ( 0.0 - 1.0 )
		MAX_INTELLIGENCE_NAVY_DATA_DEVIATION = 0.3,		-- Max deviation in estimating enemy ships amount ( 0.0 - 1.0 )
		MAX_INTELLIGENCE_AIR_DATA_DEVIATION = 1.0,		-- Max deviation in estimating enemy air planes amount ( 0.0 - 1.0 )
		MAX_INTELLIGENCE_INDUSTRY_DATA_DEVIATION = 0.4,	-- Max deviation in estimating enemy industry amount ( 0.0 - 1.0 )
		MAX_INTELLIGENCE_CONVOY_DATA_DEVIATION = 0.3,	-- Max deviation in estimating enemy convoys amount ( 0.0 - 1.0 )
		MAX_INTELLIGENCE_MANPOWER_DATA_DEVIATION = 0.4,	-- Max deviation in estimating enemy total manpower amount ( 0.0 - 1.0 )
		MAX_INTELLIGENCE_FIELDED_MANPOWER_DATA_DEVIATION = 0.35, -- Max deviation in estimating enemy fielded manpower amount ( 0.0 - 1.0 )
		MIN_MANPOWER_RATIO = 0.15,						-- Min manpower ratio to show manpower alert
		ARMY_IMPORTANCE_FACTOR = 5.0,					-- Army factor for AI and calculations
		TERRAIN_IMPORTANCE_FACTOR = 5.0,				-- Terrain base factor for state strategic value
		VICTORY_POINTS_IMPORTANCE_FACTOR = 5.0,			-- State victory points importance factor for AI and calculations
		BUILDING_IMPORTANCE_FACTOR = 3.0,				-- State building importance factor for AI and calculations
		RESOURCE_IMPORTANCE_FACTOR = 0.1,				-- State resource importance factor for AI and calculations
		INTERPOLATED_FRONT_STEPS_SHORT = 2,				-- Performance optimization - The amount of steps for interpolated fronts. Non-AI countries got full interpolated fronts, the rest has optimized version of it.
		MIN_AIR_RESERVE_RATIO = 0.33,					-- Min manpower ratio to show air reserves alert
		POLITICAL_POWER_LOWER_CAP = -500.0,				-- Min amount of political power country should have
		POLITICAL_POWER_UPPER_CAP = 2000.0,				-- Max amount of political power country should have
		RESISTANCE_IMPORTANT_LEVEL = 0.25,				-- Level when resistance becomes dangerous
		RESISTANCE_IMPORTANT_COUNTRY_LEVEL = 0.25,		-- Level when average resistance in a country becomes dangerous
		MIN_MAJOR_COUNTRIES	= 7,						-- MIN_MAJOR_COUNTRIES countries with most factories will be considered as major countries
		ADDITIONAL_MAJOR_COUNTRIES_IC_RATIO = 0.7,		-- Countries will also be considered major when having more factories that the average of top MIN_MAJOR_COUNTRIES countries' factories times ADDITIONAL_MAJOR_COUNTRIES_IC_RATIO
		BASE_TENSION_MAJOR_COUNTRY_INDEX = 1,			-- Which major country should be considered the base country when scaling generated world tension. 0 is the country with the most factories, 1 is the second most-factories country etc. This number has to be lower than MIN_MAJOR_COUNTRIES
		MIN_NAVAL_SUPPLY_EFFICIENCY = 0.1,				-- Min ratio when supplies will be considered delivered from the capital by naval path
		PARADROP_AIR_SUPERIORITY_RATIO = 0.7,			-- Min ratio of air superiority for paradropping
		STATE_VALUE_BASE = 10.0,                        -- Base value of a state (value is used to determine costs in e.g. peace conferences)
		STATE_VALUE_BUILDING_SLOTS_MULT = 4.0,          -- The value of each building slot in a state
		STATE_VALUE_MANPOWER_FACTOR = 0.1,              -- State cost increases with this for every 10k population (so 3.1M becomes 310 and then multiplied by this)
		INVASION_REPORT_EXPERATION_DAYS = 30,			-- Invasion experation days
		MIN_FOCUSES_FOR_CONTINUOUS = 10,				-- Focuses needed to unlock continuous focuses
		AUTONOMOUS_TOTAL_SCORE = 5000,					-- Total score for autonomous scale
		AUTONOMOUS_SPILLOVER = 0.025,					-- Total score that can be saved to reach next level
		CIVIL_WAR_INVOLVEMENT_MIN_TENSION = 0.0,		-- base value of world tension to involve other sides to the civil war
		UNCAPITULATE_LEVEL = 0.1,                       -- if we reclaim this much and our capital we reset capitulate status
		BASE_SURRENDER_LIMIT = 0.8,						-- Base level of occupation required for country surrender
		SURRENDER_LIMIT_MULT_FOR_COUNTRIES_WITH_NO_CORES = 0.7, -- Countries with no owned cores will their surrender level multiplied by this amount
		MIN_SURRENDER_LIMIT = 0.1,						-- Minimum non-forced surrender limit. valid 0-1
		BASE_MOBILIZATION_SPEED = 0.005,				-- Base speed of manpower mobilization  #in 1/1000 of 1 %

		INTERCEPTION_WAR_SUPPORT_SCALE = 0.00001,		-- Scaling of interceptions to war support impact
		INTERCEPTION_BOMBING_WAR_SUPPORT_IMPACT = 0.3,	-- Max impact of interceptions on the war support

		BOMBING_WAR_SUPPORT_PENALTY_SCALE = -0.00015, 			-- Scaling of bomber damage to war support impact, will be added weekly as a war support penalty
		MAX_BOMBING_WEEKLY_WAR_SUPPORT_PENALTY = -0.02,			-- Max penalty that will gained per week from bomber's damage
		BOMBING_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.001,		-- Weekly decay of bomber damage war support penalty
		MAX_BOMBING_WAR_SUPPORT_IMPACT = -0.3,					-- Max total penalty from bomber's damage

		HEROES_BEING_KILLED_WAR_SUPPORT_PENALTY_SCALE = -0.05,			-- Scaling of war heroes manpower lost to war support impact, will be added weekly as a war support penalty
		MAX_HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY = -0.04,		-- Max penalty that will gained per week from war heroes manpower lost
		HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.0001,	-- Weekly decay of war heroes manpower lost war support penalty
		MAX_HEROES_BEING_KILLED_WAR_SUPPORT_IMPACT = -0.3,				-- Max total penalty from war heroes manpower lost
		WAR_SUPPORT_FROM_CASUALTIES = 0.025,							-- Base value (inverted) for calculating heroes being killed
		
		CONVOYS_BEING_RAIDED_WAR_SUPPORT_PENALTY_SCALE = -0.05,			-- Scaling of trade convoy raided to war support impact, will be added weekly as a war support penalty
		MAX_CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY = -0.025,	-- Max penalty that will gained per week from trade convoy raided
		CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.003,	-- Weekly decay of trade convoy raided war support penalty
		MAX_CONVOYS_BEING_RAIDED_WAR_SUPPORT_IMPACT = -0.5,				-- Max total penalty from trade convoy raided
		
		FEMALE_UNIT_LEADER_BASE_CHANCE = { 
			-- applies as a factor to female unit leader randomization
			-- the values needs to be zero if you don't actually have random portraits
			0.0, -- country leaders
			0.0, -- army leaders
			0.0, -- navy leaders
			0.0, -- air leaders
			0.5, -- operatives
        	0.5, -- scientists
		},

		CONVOYS_SUNK_MULTIPLIER_FOR_WAR_SUPPORT = 0.2,	-- once a trade convoy ship sunk, you will get a larger negative impact on your war support
		CONVOYS_BEING_RAIDED_DAILY_WAR_SUPPORT_IMPACT_FROM_OVERSEA_STATES = 0.2,	-- resource transfer convoys convoys from our states being raided will give a daily war support penalty depending on how important that resource is and how inefficent convoys are
		CONVOYS_SUNK_MULTIPLIER_FOR_WAR_SUPPORT_FROM_OVERSEA_STATES = 0.2,			-- once a resource transfer convoys from our states ship sunk, you will get a larger negative impact on your war support
		CONVOYS_BEING_RAIDED_DAILY_WAR_SUPPORT_IMPACT = 0.2,	-- trade convoys being raided will give a daily war support penalty depending on how important that resource is and how inefficent convoys are

		MAX_PROPAGANDA_STABILITY_IMPACT = -0.2,			-- Max total penalty from operative performing the propaganda mission in a country
		MAX_PROPAGANDA_WAR_SUPPORT_IMPACT = -0.2,		-- Max total penalty from operative performing the propaganda mission in a country
		PROPAGANDA_STABILITY_DAILY_DECAY = 0.001,		-- Amount of stability recovered daily from propaganda effort
		PROPAGANDA_WAR_SUPPORT_DAILY_DECAY = 0.001,		-- Amount of war support recovered daily from war support effort

		NUM_DAYS_TO_FULLY_DELETE_STOCKPILED_EQUIPMENT = 90,	 -- time in days to fully delete equipments from stockpile. when you delete an equipment, they go to a temporary hidden pool which still can be seized 
		AIR_SUPPLY_CONVERSION_SCALE = 0.05,				-- Conversion scale for planes to air supply
		AIR_SUPPLY_DROP_EXPIRATION_HOURS = 168,			-- Air drop length after being dropped
		STARTING_COMMAND_POWER = 0.0,					-- starting command power for every country
		BASE_MAX_COMMAND_POWER = 200.0,					-- base value for maximum command power
		BASE_COMMAND_POWER_GAIN = 0.4,				-- base value for daily command power gain
		AIR_VOLUNTEER_PLANES_RATIO = 0.2,				-- Ratio for volunteer planes available for sending in relation to sender air force
		AIR_VOLUNTEER_BASES_CAPACITY_LIMIT = 0.1,		-- Ratio for volunteer planes available for sending in relation to receiver air base capacity
		ATTACHE_XP_SHARE = 0.2,							-- Country received xp from attaches
		SPECIAL_FORCES_CAP_BASE = 0.05,					-- Max ammount of special forces battalions is total number of non-special forces battalions multiplied by this and modified by a country modifier
		SPECIAL_FORCES_CAP_MIN = 24,					-- You can have a minimum of this many special forces battalions, regardless of the number of non-special forces battalions you have, this can also be modified by a country modifier
		DAYS_OF_WAR_BEFORE_SURRENDER = 7,				-- Number of days a war has to have existed before anyone can surrender in it
		
		FUEL_LEASE_CONVOY_RATIO = 0.0005,				-- num convoys needed per fuel land lease 
		
		STARTING_FUEL_RATIO = 0.0,						-- starting fuel ratio compared to max fuel for countries
		BASE_FUEL_GAIN_PER_OIL = 0.25,					-- base amount of fuel gained hourly per excess oil
		BASE_FUEL_GAIN = 1.0,							-- base amount of fuel gained hourly, independent of excess oil
		BASE_FUEL_CAPACITY = 500,						-- base amount of fuel capacity

		SCORCHED_EARTH_STATE_COST = 5,					-- pp cost to scorch a state

		COUNTRY_MANPOWER_CAPITULATED_FREE_POOL_FACTOR = 0.1,	-- Factor on amount of normal manpower left for an exiled nation with no territory.
		COUNTRY_MANPOWER_CAPITULATED_CORE_GAIN_FACTOR = 0.001,	-- Factor on amount of normal manpower gained for the exile nation. From owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
		COUNTRY_MANPOWER_CAPITULATED_NON_CORE_GAIN_FACTOR = 0.001,	-- Factor on amount of normal manpower gained for the exile nation. From owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
		GIE_MAX_LEGITIMACY = 100, 								--Legitimacy max of a GiE
		GIE_CAPITULATE_MAX_STOCKPILE_TRANSFER = 0.1, 			-- 0-1 Transfers ratio of stockpile. from 0 to this define depending on starting legitimacy on capitulation.
		GIE_CAPITULATE_MIN_LEGIT_FOR_TRANSFER = 5, -- 0-100 Minimum starting legitimacy to transfer any equipment at all.
		GIE_CAPITULATION_LEGITIMACY_WARSCORE_FACTOR = 0.5,      -- Multiplies war contribution percent with this factor for part of starting legitimacy. (0.5 would mean a 50 % war contribution gives 25 more legitimacy)
		GIE_CAPITULATION_LEGITIMACY_WARLENGTH_FACTOR = 1.0,     -- Multiplies war length (nr of weeks) with this factor for part of starting legitimacy. (1.0 would mean a war length of 30 weeks gives 30 more legitimacy)
		GIE_WARSCORE_GAIN_LEGITIMACY_FACTOR = 1,		 		--Factor on how much legitimacy is gained from warscore earned by GiE units.
		GIE_HOST_CIC_FROM_LEGITIMACY_MAX = 5, 					--Host will receive from 0 to this value in CIC.
		GIE_HOST_MIC_FROM_LEGITIMACY_MAX = 5,					--Host will receive from 0 to this value in MIC.
		GIE_HOST_DOCKYARDS_FROM_LEGITIMACY_MAX = 0,				--Host will receive from 0 to this value in dockyards.
		GIE_VETERAN_MANPOWER_NON_CORE_GAIN_FACTOR = 0.005,	-- Factor on amount of manpower gained from owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
		GIE_VETERAN_MANPOWER_CORE_GAIN_FACTOR = 0.01,	-- Factor on amount of manpower gained from owned states that are controlled by an enemy. State manpower reduced by factor 1000 in code.
		GIE_MANPOWER_TOTAL_MAX_FACTOR = 0.5,	-- Factor on max amount of exile manpower that can be gained from owned states. Approaching this will give diminishing returns. Reduced by factor 100 in code.
		GIE_MANPOWER_RATO_OF_MAX_START_PENALTY = 0.5,	--When this ratio of max manpower has been recruited we start applying the penalty.
		GIE_MANPOWER_GAIN_PENALTY_MAX = 0.95,	--Max penalty on exile manpower growth.
		GIE_EXILE_AIR_RECRUITMENT_LEGITIMACY = 50, 	--Legitimacy required to recruit exile airwings
		GIE_EXILE_AIR_START_EXPERIENCE = 3, 		--Starting experience for exile airwings
		GIE_EXILE_TROOP_RECRUITMENT_LEGITIMACY = 25, 	--Legitimacy required to recruit exile troops
		GIE_EXILE_TROOPS_DEPLOY_TRAINING_MAX_LEVEL = 3, 	--Max XP exile troops can receive from training
		GIE_EXILE_ARMY_LEADER_LEGITIMACY_LEVELS = {  	--Legitimacy levels where a new army leader is received.
			30,
			60,
			90,
		},
		GIE_EXILE_ARMY_LEADER_START_LEVEL = 3,	--Starting level for exile leader
		GIE_ESCAPING_DIVISIONS_TRANSFER_DAYS = 30, -- days to transfer escaping divisions to host nation
		GIE_ESCAPING_DIVISIONS_XP_BOOST = 0.4, -- Escaping divisions gain a boost to experience. Only the toughest motherbadasses will band together and survive to git me one hundred Nazi scalps ... Or die tryin'...
		GIE_DIVISION_ATTACK_BONUS_AGAINST_OCCUPIER = 0.1, -- Attack bonus factor against whoever occupies your core territory.
		GIE_DIVISION_DEFENSE_BONUS_AGAINST_OCCUPIER = 0.1, -- Attack bonus factor against whoever occupies your core territory.
		GIE_DIVISION_ATTACK_BONUS_ON_CORE = 0.1, -- Attack bonus factor when fighting on cores.
		GIE_DIVISION_DEFENSE_BONUS_ON_CORE = 0.1, -- Defense bonus factor when fighting on cores.
		GIE_ESCAPING_DIVISIONS_EQUIPMENT_RATIO = 0.2, -- Base equipment ratio on escaped troops.
		GIE_ESCAPING_DIVISIONS_AMOUNT_RATIO = 0.1, -- Ratio on amount of divisions that escapes. Scales with starting legitimacy
		GIE_LIBERATED_NATION_DAILY_LEGITIMACY_CHANGE = -1.5, --An uncapitulated exile that is fully liberated will have legitimacy changed with this amount daily. Will be automatically reinstated when it reaches 0.
		GIE_EXILE_TRANSFER_ON_LEADER_CAPITULATION_MANPOWER_FACTOR = 0.1, --Factor on exile manpower kept when a faction leader capitulates and the hosted exiles are transfered.
		GIE_CONVOY_ON_CREATION = 10, -- Number of convoy a GiE will get on creation.
		
		
		SURRENDER_LIMIT_REDUCTION_PER_COLLABORATION = 0.3, 	--each percent of collaboration will lower surrender limit by this percentage 
		SURRENDER_RECIPIENT_SCORE_PER_COLLABORATION = 1.0, 	--countries with collaboration will get bonus while game calculates which country the enemy will capitulate
		COMPLIANCE_PER_COLLABORATION = 1.0,					--each percent of collaboration will be converted to this compliance at capitulation

		WILL_LEAD_TO_WAR_FOCUS_PERSISTENCE = 60, -- taken focuses that has lead to war will still make ai prep for war for this many days after being taken
		WILL_LEAD_TO_WAR_DECISION_PERSISTENCE = 30, -- the decision thats lead to war will sitll make ai prep for war for this many days after being taken/cooldown/timeout

		ARMY_COUNT_DAILY_LERP_FOR_TRAINING_XP = 0.002, -- number of armies that is used in training xp calculates daily lerps to actual number (if real number is lower)
		ARMY_COUNT_DAILY_DECREASE_FOR_TRAINING_XP = 0.1, -- number of armies that is used in training xp calculates daily linearly approaches this number (if real number is lower)
	},

	NResistance = {
		INITIAL_STATE_RESISTANCE = 1.0,							-- initial resistance percentage of a state once it is captured
		INITIAL_STATE_COMPLIANCE = 0.0,							-- initial compliance percentage of a state once it is captured
		COMPLIANCE_FACTOR_ON_STATE_CONTROLLER_CHANGE = -0.1,	-- compliance factor that applies when the state controller changes (in between allies, compliance is zeroed if it is taken by original country)
		RESISTANCE_COOLDOWN_WHEN_DISABLED = -0.25,				-- resistance cooldown when the state is taken back by its original owner (compliance is zeroed in that case)
		
		RESISTANCE_TARGET_BASE = 35.0,							-- base resistance target percentage
		
		RESISTANCE_TARGET_MODIFIER_HAS_CLAIM = -5.0,			-- resistance target modifier in % for states we have claim

		RESISTANCE_TARGET_MODIFIER_PER_STABILITY_LOSS = 0.2,	-- resistance target modifier per stability below 100%
		RESISTANCE_TARGET_MODIFIER_PER_COMPLIANCE = -0.5,		-- resistance target modifier per compliance %
		
		RESISTANCE_TARGET_MODIFIER_IS_AT_PEACE = -10.0,			-- resistance target modifier when we are at peace
		
		RESISTANCE_TARGET_MODIFIER_STATE_VP = {					-- resistance target modifier pairs for vp. first entry is total vp in state and second entry is amount of target modifier that applies for that threshold
			0,   0.0, -- 0 - 5
			5,   5.0, -- 5 - 20
			20,  10.0, -- 20 - 50
			50,  20.0, -- 50 - ...
		},

		RESISTANCE_TARGET_MODIFIER_OCCUPIED_CAPITULATED = 10.0, -- resistance target modifier when the enemy is capitulated
		
		RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MIN = 2.0,   -- min & max resistance target modifier resistance target modifier for exile countries. interpolated using legitimacy
		RESISTANCE_TARGET_MODIFIER_OCCUPIED_IS_EXILE_MAX = 20.0,

		RESISTANCE_TARGET_MODIFIER_POP_LOW = -20.0,			-- how much we reduce the resistance target
		RESISTANCE_TARGET_MODIFIER_POP_VERY_LOW = -50.0,			-- resistance target modifier in % for states we have claim
		
		RESISTANCE_POP_LOW_CUTOFF = 10000,
		RESISTANCE_POP_VERY_LOW_CUTOFF = 1000,

		RESISTANCE_TARGET_MIN_CAP_FOR_NON_COMPLIANCE = 10, -- min resistance target will be capped to this percentage for non-compliance sources
		
		RESISTANCE_DECAY_BASE = 0.1, -- base resistance decay
		RESISTANCE_DECAY_MIN = 0.01, -- min resistance decay
		RESISTANCE_DECAY_MAX = 100.0, -- nax resistance decay
		
		RESISTANCE_DECAY_MODIFIER_HAS_CLAIM = 25.0, -- resistance decay modifier for our claims
		RESISTANCE_DECAY_MODIFIER_FACTORS = {  -- resistance decay modifier when resistance hits a certain percentage
			10, -50, -- below 10% it has a -50% modifier on decay
			20, -25, -- below 20% it has a -25% modifier on decay
		},
		
		MIN_DAMAGE_TO_GARRISONS_MODIFIER = 0.1, -- modifier that applies to losses from resistance attack to garrisons at most can be reduced to this amount

		RESISTANCE_GROWTH_BASE = 0.2, -- base resistance grow
		RESISTANCE_GROWTH_MIN = 0.01, -- min resistance grow
		RESISTANCE_GROWTH_MAX = 100.0, -- max resistance grow
		
		COMPLIANCE_GROWTH_BASE = 0.07, -- base compliance grow
		COMPLIANCE_GROWTH_MIN = -100.0, -- min compliance grow
		COMPLIANCE_GROWTH_MAX = 100.0, -- max compliance grow
		
		COMPLIANCE_GROWTH_IS_AT_PEACE = 10, -- compliance growth buff at peace
		COMPLIANCE_GROWTH_HAS_CLAIM = 5, -- compliance growth buff if state has a claim
		
		COMPLIANCE_DECAY_AT_MAX_COMPLIANCE = -0.1, -- as compliance increases, it gets a decay rate depending on its value. compliance should stabilize at some value until its growth changes
		COMPLIANCE_DECAY_PER_EXILE_LEGITIMACY = -0.015, -- higher legitimacy will give higher decay to compliance
		
		RESISTANCE_RATIO_DIFF_TO_SPREAD = 0.5, -- resistance diff between two neighbour states will spread by this ratio ( from highest resistance states to lower ones and it will only spread once to a state)
		
		RESISTANCE_ACTIVITY_CHANCE_AT_MAX_RESISTANCE = 0.312,
		RESISTANCE_ACTIVITY_MIN_GARRISON_PENETRATE_CHANCE = 0.02,
		
		RESISTANCE_TARGET_TO_REENABLE_RESISTANCE = 10, -- resistance will be disabled once it reaches zero and will not be reenabled until resistance target reaches above this value
		GARRISON_LOG_MAX_MONTHS = 12,				
		
		NO_COMPLIANCE_GAIN_ENABLE_LIMIT = 0.5, -- at least this ratio of no garrison law should be active in order to no compliance gain to take effect
		
		GARRISON_MANPOWER_MIN_DELIVERY_SPEED = 0.7,	-- Minimum base delivery speed if the chunk can't be calculated.
		GARRISON_MANPOWER_REINFORCEMENT_SPEED = 2000.0,	-- Modifier for garrison manpower reinforcement.  This value is the maximum to be delivered which is then modified by distance
		GARRISON_EQUIPMENT_DELIVERY_SPEED = 4.0,	-- Modifier for garrison equipment reinforcement speed
		
		GARRISON_STR_POW_MANPOWER = 2,	--Scales impact of manpower deficiency by raising that deficiency to the number here. Formula: efficiency = 1.0 - manpower_deficiency^GARRISON_STR_POW_MANPOWER
		GARRISON_STR_POW_EQUIPMENT = 3,	--Scales impact of euqipment deficiency by raising that deficiency to the number here. Formula: efficiency = 1.0 - equipment_deficiency^GARRISON_STR_POW_EQUIPMENT

		SUPPRESSION_NEEDED_BY_RESISTANCE_POINT = 0.75, -- Number of suppression point we need for each 1% of resistance
		SUPPRESSION_NEEDED_LOWER_CAP = 10.0,	-- if resistance is lower than this value then we always act as though it is at the define for the purpose of suppresion requirements
		SUPPRESSION_NEEDED_UPPER_CAP = 50.0, -- if resistance is greater than this value then we always act as though it is at the define for the purpose of suppresion requirements
		
		GARRISON_MANPOWER_LOST_BY_ATTACK = 0.03, 	-- Ratio of manpower lost by garrison at each attack on garrison (this number will be reduced by the hardness of garrison template)
		GARRISON_EQUIPMENT_LOST_BY_ATTACK = 0.02, 	-- Ratio of equipment lost by garrison at each attack on garrison (this number will be reduced by the hardness of garrison template)
		MAXIMUM_GARRISON_HARDNESS_WHEN_ATTACKED = 0.90,   -- Cap to be sure that garrison will suffer lost in attack, even with a almost 100% hardness
		
		FOREIGN_MANPOWER_MIN_THRESHOLD = 5000,		 -- The minimum number of Manpower that AI will accept to give at once, in order to avoid many weird little transfer.
		MANPOWER_BUFFER_TO_NOT_GIVE_MINOR = 0.3, -- To determine how much AI can give as foreign manpower, we calculate how much manpower we use, and add this buffer. The result is what we want to keep, for minor countries. So higher this number is, lower we will give Manpower.
		MANPOWER_BUFFER_TO_NOT_GIVE_MAJOR = 0.6, -- To determine how much AI can give as foreign manpower, we calculate how much manpower we use, and add this buffer. The result is what we want to keep, for major countries. So higher this number is, lower we will give Manpower.
		MAX_GARRISON_RATIO_WE_AGREE_TO_SUPPORT = 3.0,	-- The part of the manpower needed by the foreign garrison, that AI will agree to support with our manpower. If negative number, AI will not take into consideration the need, and just calculate how much they can give.
		FOREIGN_MANPOWER_AI_COOLDOWN_DAYS = 30,		 -- Number of days after an AI give us manpower before the AI accept to give more.

		INITIAL_HISTORY_RESISTANCE = 0.0,			-- resistance value for initial colony states
		INITIAL_HISTORY_COMPLIANCE = 70.0,			-- compliance value for initial colony states
		INITIAL_GARRISON_STRENGTH = 1,				-- garrison value for initial colony states
		
		STATE_COMPLIANCE_DECAY_FOR_LOST_STATES = 0.05, -- daily compliance decay for the states you lost control of
		
	},

	NProduction = {
		MAX_EQUIPMENT_RESOURCES_NEED = 6, 	-- Max number of different strategic resources an equipment can be dependent on.
		MAX_CIV_FACTORIES_PER_LINE = 15,	-- Max number of factories that can be assigned a single production line.
		DEFAULT_MAX_NAV_FACTORIES_PER_LINE = 10,
		FLOATING_HARBOR_MAX_NAV_FACTORIES_PER_LINE = 5,
		CONVOY_MAX_NAV_FACTORIES_PER_LINE = 15,
		CAPITAL_SHIP_MAX_NAV_FACTORIES_PER_LINE = 5,
		MAX_MIL_FACTORIES_PER_LINE = 150,
	    MAX_MIL_FACTORIES_VISIBLE_FOR_MIL_EQUIPMENT_LINE = 15,
		RAILWAY_GUN_MAX_MIL_FACTORIES_PER_LINE = 5,
		RAILWAY_GUN_REPAIR_SPEED = 8.0,			-- Railway gun strength repair speed per factory
		EFFICIENCY_LOSS_PER_UNUSED_DAY = 1,		-- Daily loss of efficiency for unused factory slots ( efficiency is tracked per factory slot in the production line )
		RESOURCE_PENALTY_WARNING_CRITICAL_RATIO =  0.8, -- Switch to red progress bar if penalty is over threshold 
		BASE_FACTORY_SPEED = 5, 				-- Base factory speed multiplier (how much hoi3 style IC each factory gives).
		BASE_FACTORY_SPEED_MIL = 5, 				-- Base factory speed multiplier (how much hoi3 style IC each factory gives).
		BASE_FACTORY_SPEED_NAV = 2.0, 				-- Base factory speed multiplier (how much hoi3 style IC each factory gives).
		BASE_FACTORY_START_EFFICIENCY_FACTOR = 10,	-- Base start efficiency for factories expressed in %.
		BASE_FACTORY_MAX_EFFICIENCY_FACTOR = 50,	-- Base max efficiency for factories expressed in %.
		BASE_FACTORY_EFFICIENCY_GAIN = 1,		-- Base efficiency factor.
		BASE_FACTORY_EFFICIENCY_BALANCE_FACTOR = 0.1, 			-- Factory efficiency balancing factor
		BASE_FACTORY_EFFICIENCY_VARIANT_CHANGE_FACTOR = 90,		-- Base factor for changing production variants in %.
		BASE_FACTORY_EFFICIENCY_PARENT_CHANGE_FACTOR = 30,		-- Base factor for changing production parent<->children in %.
		BASE_FACTORY_EFFICIENCY_FAMILY_CHANGE_FACTOR = 70,		-- Base factor for changing production with same family in %.
		BASE_FACTORY_EFFICIENCY_ARCHETYPE_CHANGE_FACTOR = 20, 	-- Base factor for changing production with same archetype in %.
		EQUIPMENT_BASE_LEND_LEASE_WEIGHT = 1.0, -- Base equipment lend lease weight
		EQUIPMENT_LEND_LEASE_WEIGHT_FACTOR = 0.01, -- Base equipment lend lease factor
		LEND_LEASE_DELIVERY_TOTAL_DAYS = 30,                    -- Nr of days between lend lease deliveries
		ANNEX_STOCKPILES_RATIO = 1.0,		-- How much stockpiled equipment will be transferred on annexation
		ANNEX_FIELD_EQUIPMENT_RATIO = 0.25,	-- How much equipment from deployed divisions will be transferred on annexation
		ANNEX_FUEL_RATIO = 0.25,	-- How much fuel will be transferred on annexation
		ANNEX_CONVOYS_RATIO = 0.15,			-- How many convoys will be transferred on annexation
		MIN_POSSIBLE_TRAINING_MANPOWER = 5000,	-- How many deployment lines minimum can be training
		MIN_FIELD_TO_TRAINING_MANPOWER_RATIO = 0.75,	-- Ratio which % of army in field can be trained
		CAPITULATE_STOCKPILES_RATIO = 0.5, -- How much equipment from deployed divisions will be transferred on capitulation
		CAPITULATE_FUEL_RATIO = 0.5, -- How much fuel will be transferred on capitulation
		INFRA_MAX_CONSTRUCTION_COST_EFFECT = 1, 		-- Building in a state with higher infrastructure will reduce the cost of shared buildings.
		PRODUCTION_RESOURCE_LACK_PENALTY = -0.05,			-- Penalty decrease while lack of resource per factory
		CIC_BANK_SPEED_BOOST_FACTOR = 0.25,                 -- The CIC bank can boost production speed with this factor (0.5 means 50 %)
		MIN_LICENSE_ACTIVE_DAYS = 30,						-- Min days for license to be active
		BASE_LICENSE_IC_COST = 1,							-- Base IC cost for lended license
		LICENSE_IC_COST_YEAR_INCREASE = 1,					-- IC cost equipment for every year of equipment after 1936
		LICENSE_EQUIPMENT_BASE_SPEED = -0.25,				-- base MIC speed modifier for licensed equipment
		LICENSE_EQUIPMENT_TECH_SPEED_PER_YEAR = -0.05,		-- MIC speed modifier for licensed equipment for each year of difference between actual and latest equipment
		LICENSE_EQUIPMENT_TECH_SPEED_MAX_YEARS = 4,			-- Maximum years for MIC speed modifier
		LICENSE_EQUIPMENT_SPEED_NOT_FACTION = -0.10,		-- MIC speed modifier for licensed equipment for not being in faction
		LICENSE_EQUIPMENT_UPGRADE_XP_FACTOR = 2.0,			-- XP cost for upgrading licensed equipment
		LICENSE_EQUIPMENT_SPEED_NO_LICENSE = -0.50,			-- Penalty for producing non licensed equipment
		CONVERSION_SPEED_BONUS = 2.0,						-- Modifier to the production speed when converting equipment
		EQUIPMENT_MODULE_ADD_XP_COST = 5.0,					-- XP cost for adding a new equipment module in an empty slot when creating an equipment variant.
		EQUIPMENT_MODULE_REPLACE_XP_COST = 6.0,				-- XP cost for replacing one equipment module with an unrelated module when creating an equipment variant.
		EQUIPMENT_MODULE_CONVERT_XP_COST = 3.0,				-- XP cost for converting one equipment module to a related module when creating an equipment variant.
		EQUIPMENT_MODULE_REMOVE_XP_COST = 1.0,				-- XP cost for removing an equipment module and leaving the slot empty when creating an equipment variant.
		BASE_NAVAL_EQUIPMENT_CONVERSION_IC_COST_FACTOR = 0.2,       -- Fraction of the hull industry cost which is always included in the refitting cost.
		BASE_LAND_EQUIPMENT_CONVERSION_IC_COST_FACTOR = 0.2,        -- Fraction of the chassis industry cost which is always included in the conversion cost.
		MIN_NAVAL_EQUIPMENT_CONVERSION_RESOURCE_COST_FACTOR = 0.2,	-- Minimum fraction of a naval equipment's strategic resource cost that any conversion will cost.
		MIN_LAND_EQUIPMENT_CONVERSION_RESOURCE_COST_FACTOR = 0,		-- Minimum fraction of a land equipment's strategic resource cost that any conversion will cost.
		SHIP_REFIT_MAX_PROGRESS_TO_CANCEL = 0.2,			-- Maximum refitting progress % that we still allow to cancel wihtout having to scuttle the ship.
		SHIP_REFIT_DAMAGE_TO_PROGRESS_FACTOR = 0.5,			-- When a ship is being damaged (for example port strike) while refitting, the damage is transferred to the production line progress instead. This variable is used to balance it.
		MINIMUM_NUMBER_OF_FACTORIES_TAKEN_BY_CONSUMER_GOODS_VALUE = 1,		-- The minimum number of factories we have to put on consumer goods, by value.
		MINIMUM_NUMBER_OF_FACTORIES_TAKEN_BY_CONSUMER_GOODS_PERCENT = 0.1,	-- The minimum number of factories we have to put on consumer goods, in percent.
		INITIAL_ALLOWED_FACTORY_RATIO_FOR_REPAIRS = 1.0,					-- max % of factories allowed on autorepairs
	},

	NMarket = {
		PURCHASE_CONTRACT_DELIVERY_TOTAL_DAYS = 30,                   	-- Number of days between purchase contract deliveries
		IC_TO_CIC_FACTOR = 2.0,                    						-- The factor for mapping IC cost to CIC cost. Should be a positive number.
		MAX_CIV_FACTORIES_PER_CONTRACT = 15,							-- Max number of factories that can be assigned for paying single contract.
		LOW_PRICE_LEVEL_FACTOR = 0.75,                    				-- The factor of base equipment price for low price level. Should be in range (0,1] 
		HIGH_PRICE_LEVEL_FACTOR = 1.25,                    				-- The factor of base equipment price for high price level. Should be more than 1.
		MIN_DELIVERY_LIMIT_WARNING_UI = 0.8,							-- The delivery percentage under we want to let player know the contract is inefficient. [0,1]
		PURCHASE_CONTRACT_SUBSIDY_BONUS_SPEED_FACTOR = 1.0,				-- The factor of speed bonus from subsidies
		CONVOY_WEIGHT_OVERRIDE = 0.0,									-- Overrides the default lend leas weight of convoys for international market
		REQUEST_AUTOMATION_AUTO_ACCEPT_MARKET_ACCESS_DEFAULT = true, 	-- Whether by default should accept market access requests from other countries.
		REQUEST_AUTOMATION_AUTO_SEND_MARKET_ACCESS_DEFAULT = true,		-- Whether by default should send market access requests to other countries.
		REQUEST_AUTOMATION_AUTO_ACCEPT_PURCHASE_DEFAULT = false,		-- Whether by default should accept purchase requests from other countries.
		CONTRACT_ESTIMATE_AVERAGE_CONVOY_COUNT_ALPHA = 0.5,				-- How strong effect should have the daily convoy count on the average (1.0 means it will use only the new number as average)
		CONTRACT_ESTIMATE_AVERAGE_DAILY_PRODUCTION_ALPHA = 0.5, 		-- How strong effect should have the daily production on the average (1.0 means it will use only the new number as average)
		CONTRACT_ESTIMATE_AVERAGE_CONVOY_COUNT_SNAP_LIMIT = 0.3,		-- If the difference between current and estimated available convoy count is smaller then this value, we will use the current value for calculations.
		CONTRACT_ESTIMATE_AVERAGE_DAILY_PRODUCTION_SNAP_LIMIT = 1.5,	-- If the difference between current and estimated daily production is smaller then this value, we will use the current value for calculations.
		CONTRACT_ESTIMATE_AVERAGE_CONVOY_SUNK_MULTIPLIER_ALPHA = 0.5,	-- How strong effect should have the daily sunk efficiency on the average (1.0 means it will use only the new number as average)
		CONTRACT_ESTIMATE_AVERAGE_CONVOY_SUNK_MULTIPLIER_SNAP_LIMIT = 0.05, -- If the difference between current and estimated sunk efficiency convoy count is smaller then this value, we will use the current value for calculations.
		WARNING_CONVOYS_SUNK_MAX_DAYS  = 30, -- The contracts will show sunk convoy message if there was sunk convoy in this amount of days
	},

	NTechnology = {
		MAX_SUBTECHS = 3,						-- Max number of sub technologies a technology can have.
		BASE_RESEARCH_POINTS_SAVED = 30.0,		-- Base amount of research points a country can save per slot.
		BASE_YEAR_AHEAD_PENALTY_FACTOR = 2,		-- Base year ahead penalty
		BASE_TECH_COST = 1000,					-- Base cost for a tech. multiplied with tech cost and ahead of time penalties
		MAX_TECH_SHARING_BONUS = 0.5, 			-- Max technology sharing bonus that can be applied instantly
		LICENSE_PRODUCTION_TECH_BONUS = 0.2,	-- License production tech bonus

		DEFAULT_XP_UNLOCK_RESEARCH_COST = 0,			-- default xp cost of a research to unlock directly
		DEFAULT_XP_BOOST_RESEARCH_COST = 0,				-- default xp cost of a research to speed up the process
		DEFAULT_XP_BOOST_RESEARCH_BONUS = 0,			-- default boost research bonus gained when xp is used to research an item
		MIN_RESEARCH_SPEED = 0.0,				-- research speed can't go below this value

		USE_BONUS_REGRET_TIMER = 3,						-- Number of days the player has to regret using a limited tech bonus
	},

	NPolitics = {
		BASE_LEADER_TRAITS = 3,				-- Base amount of leader traits.
		MAX_RANDOM_LEADERS = 1,				-- Maximum amount random leader to have per party.
		BASE_POLITICAL_POWER_INCREASE = 2,	-- Weekly increase of PP.
		ARMY_LEADER_COST = 5,					-- command power cost for recruiting new leaders, 'this value' * number_of_existing_leaders_of_type
		NAVY_LEADER_COST = 5,					-- command power cost for recruiting new leaders, 'this value' * number_of_existing_leaders_of_type
		ARMY_LEADER_MAX_COST = 100,				-- max cost BEFORE modifiers
		NAVY_LEADER_MAX_COST = 100,				-- max cost BEFORE modifiers
		LEADER_TRAITS_XP_SHOW = 0.05,			-- Amount of XP a trait needs to be shown in tooltips of a leader.
		REVOLTER_PARTY_POPULARITY = 0.4,		-- Revolter party loses 80% popularity when the civil war breaks out
		MIN_OVERTHROWN_GOVERNMENT_SUPPORT_RATIO = 0.4, -- Min possible support for new government after puppeting the government
		NUM_OCCUPATION_POLICIES = 4,		-- Number of potential occupation policies
		DEFAULT_OCCUPATION_POLICY = 1,		-- Defaullt value for occupation policy
		INSTANT_WIN_REVOLTER_POPULARITY_RATIO = 0.4, -- Min party popularity for instant win in one province state
		INSTANT_WIN_POPULARITY_WIN = 50, -- New party popularity
	},

	NBuildings = {
 	    SAM_MISSION_SUPERIORITY = 5.0,      -- How much air superiority each SAM mission gives per rocket wing performing SAM missions.
		ANTI_AIR_SUPERIORITY_MULT = 5.0,	-- How much air superiority reduction to the enemy does our AA guns? Normally each building level = -1 reduction. With this multiplier.
		MAX_BUILDING_LEVELS = 15,			-- Max levels a building can have.
		AIRBASE_CAPACITY_MULT = 200,		-- Each level of airbase building multiplied by this, gives capacity (max operational value). Value is int. 1 for each airplane.
		ROCKETSITE_CAPACITY_MULT = 100,		-- Each level of rocketsite building multiplied by this, gives capacity (max operational value). Value is int. 1 for each rocket.
		NAVALBASE_REPAIR_MULT = 0.025,		-- Each level of navalbase building repairs X strength and can repair as many ships as its level
		RADAR_RANGE_BASE = 20,				-- Radar range base, first level radar will be this + min, best radar will be this + max
		RADAR_RANGE_MIN = 20,				-- Radar range (from state center to province center) in measure of map pixels. Exluding techs.
		RADAR_RANGE_MAX = 200,				-- Range is interpolated between building levels 1-15.
		RADAR_INTEL_EFFECT = 40,			-- Province covered by radar increases intel by 10 (where 255 is max). Province may be covered by multiple radars, then the value sums up.
		SABOTAGE_FACTORY_DAMAGE = 100.0,		-- How much damage takes a factory building in sabotage when state is occupied. Damage is mult by (1 + resistance strength), i.e. up to 2 x base value.
		BASE_FACTORY_REPAIR = 0.3,			-- Default repair rate before factories are taken into account
		BASE_FACTORY_REPAIR_FACTOR = 2.0,	-- Factory speed modifier when repairing.
		SUPPLY_PORT_LEVEL_THROUGHPUT = 3,   -- supply throughput per level of naval base
		MAX_SHARED_SLOTS = 80,				-- Max slots shared by factories
		OWNER_CHANGE_EXTRA_SHARED_SLOTS_FACTOR = 0.5, --Scale factor of extra shared slots when state owner change.
		DESTRUCTION_COOLDOWN_IN_WAR = 30,	-- Number of days cooldown between removal of buildings in war times
		
		INFRASTRUCTURE_RESOURCE_BONUS = 0.025, -- multiplactive resource bonus for each level of (non damaged) infrastructure
		SUPPLY_ROUTE_RESOURCE_BONUS = 0.2,   -- multiplicative resource bonus for having a railway/naval connection to the capital
		INFRASTRUCTURE_MUD_EFFECT = -0.8, -- multiplicative effect on mud growth for max infra
	},

	NDeployment = {
		BASE_DEPLOYMENT_TRAINING = 1,		-- Base training done each day during deployment.
	},

	NMilitary = {
		COMBAT_VALUE_ORG_IMPORTANCE = 1,		-- Multiplier on TotalOrganisation when determining the combat value of a division
		COMBAT_VALUE_STR_IMPORTANCE = 1,		-- Multiplier on TotalStrength when determining the combat value of a division

		SOFT_ATTACK_TARGETING_FACTOR = 1.0,		-- How much we care about potential soft attacks when evaluating priority combat target
		HARD_ATTACK_TARGETING_FACTOR = 1.2,		-- How much we care about potential hard attacks when evaluating priority combat target
		
		CASUALTIES_WS_P_PENALTY_DIVISOR = 200,							--Divisor for casualties WS penalty
		CASUALTIES_WS_A_PENALTY_DIVISOR = 600,							--Divisor for casualties WS penalty
		
		PIERCING_THRESHOLDS = {					-- Our piercing / their armor must be this value to deal damage fraction equal to the index in the array below [higher number = higher penetration]. If armor is 0, 1.00 will be returned.
			1.00,
			0.75,
			0.50,
			0.00, --there isn't much point setting this higher than 0
		},
		PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
			1.00,
			0.80,
			0.65,
			0.50,
		},

		DIVISIONAL_COMMANDER_TRAIT_XP_REQUIREMENT = 600.0,	--Get a trait if any valid options & xp gained >= this
		NUM_DAYS_FOR_OPERATION_ENTRY = 60,					--Number of days that a unit must have been on a particular active order instance to receive a history entry.
		MAX_LEADERS_TO_SHOW = 50,							--Max officers to show in field officers list, sorted by field EXP. Divisions with awardable entries will potentially supercede this limit
		BASE_FEMALE_DIVISIONAL_COMMANDER_CHANCE = 0,		--Chance to receive a female divisonal commander. This is set to zero in the base game, as we do not have generic female portraits for many graphical culture groups.
															--this expects a value between 0 and 1 and is added to by female_divisional_commander_chance. If you don't have female generic portraits defined, you -will- get silhouettes.

		DIVISIONAL_COMMANDER_RANK_XP_THRESHOLD = { 		-- XP thresholds for divisional commander ranks. [TAG]_DIVISION_EXPERIENCE_TITLE_ARMY_EXPERIENCE_[array index]
			0,
			100.0,
			300.0,
			600.0,
			1000.0,
		},

		USE_MULTIPLICATIVE_ORG_LOSS_WHEN_MOVING = true, -- whether to apply org_loss_when_moving modifiers additively or multiplicatively (hardcoded multiplicative pre-2021)
		HOURLY_ORG_MOVEMENT_IMPACT = -0.1,		-- how much org is lost every hour while moving an army.
		ZERO_ORG_MOVEMENT_MODIFIER = -0.8,		-- speed impact at 0 org.
		INFRA_ORG_IMPACT = 0.5,				-- scale factor of infra on org regain.
		ENGAGEMENT_WIDTH_PER_WIDTH = 2.0,	-- how much enemy combat width we are allowed to engage per width of our own
		
		INFRASTRUCTURE_MOVEMENT_SPEED_IMPACT = -0.05,	-- speed penalty per infrastucture below maximum.
		
		VPS_FOR_HISTORY_ENTRY = 3,					-- Minimum VPs required to receive an entry in divisional history
		VPS_FOR_HIGH_HISTORY_ENTRY = 8,				-- VPs required for high-level history entry
		ENTRIES_TO_CHECK_FOR_DUPLICATE = 2,			-- Max number of history entries to check back to see if we're being awarded the same entry
		COST_INCREASE_PER_ACTIVE_MEDAL = 0.25,		-- Additional cost factor per active medal
		MAX_ENTRY_ELISION_COUNT = 4,				-- If we do the same type of thing consecutively, each entry will stack locations up to this number
		GENERATE_AI_DIV_COMMAND_HISTORY_ENTRIES = true,	--Should we generate history entries for the AI (may cause savegame bloat)
		FIELD_EXPERIENCE_ON_DIVISION_MULT = 0.03,	-- Multiply field experience gained by this, when applying to divisional commander
		MAX_FIELD_EXPERIENCE_ON_DIVISION = 8000,	-- Max experience that can be gained on divisional commanders
		FIELD_EXPERIENCE_ON_DIVISION_PER_MEDAL_MULT = 0.1,	--Multiply officer field experience gain by this * number of division medals on application
		HISTORY_OPERATION_RANDOM_MAX = 24,			-- max random int to roll when determining whether to grant an awardable entry for operations. 1/N chances.
		CASUALTY_COUNT_FOR_HISTORY_ENTRY = 40000,	-- number of received casualties to receive a history entry (one only)
		FIELD_OFFICER_PROMOTION_PENALTY = 0.25,		--Amount of division experience lost when promoting a commander (reduced by modifiers)
			
		HISTORICAL_ORDER_NAME_EXHAUSTION = false,	-- Do historically chosen order instances exhaust their case names? If false ie, Operation Barbarossa will appear for any orders fulfilling the conditions for Germany
		
		WAR_SCORE_LOSSES_RATIO = 0.5,								-- war score gained for every 1000 casualties
		WAR_SCORE_LOSSES_MULT_IF_CAPITULATED = 0.25, 				-- factor applied to war score gained from casualties if capitulated
		WAR_SCORE_STRATEGIC_BOMBING_FACTOR = 0.02,  				-- war score gained for every damage made to enemy's building with strategic bombing
		WAR_SCORE_STRAT_BOMBING_DECAY_PER_CIVILIAN_FACTORY = 0.10,	-- monthly war score deducted from strategic bombing for every civilian factory in service on the bombed enemy side
		WAR_SCORE_AIR_IC_LOSS_FACTOR = 0.1,							-- war score gained for every IC of damage done to an enemy's air mission
		WAR_SCORE_LAND_DAMAGE_FACTOR = 0.1,          				-- war score gained for every strengh damage done to an enemy's army
		WAR_SCORE_ATTACKER_AND_WINNER_FACTOR = 1.2,					-- factor applied to war score gained for strength damage done when being the attacker and the winner
		WAR_SCORE_LAND_IC_LOSS_FACTOR = 0.1,         				-- war score gained for every IC damage done to an enemy's army
		WAR_SCORE_PROVINCE_FACTOR = 0.3,							-- war score gained when capturing a province for the first time, multiplied by province's worth
		WAR_SCORE_LEND_LEASE_GIVEN_IC_FACTOR = 0.1,  				-- war score gained for every IC of lend lease sent to allies
		WAR_SCORE_LEND_LEASE_GIVEN_FUEL_FACTOR = 0.01,  				-- war score gained for every unit of fuel lend lease sent to allies
		WAR_SCORE_LEND_LEASE_RECEIVED_IC_FACTOR = 0.1,  			-- war score deducted for every IC of lend lease received from allies
		WAR_SCORE_LEND_LEASE_RECEIVED_FUEL_FACTOR = 0.01, 			-- war score deducted for every unit of fuel lend lease received from allies
		
		CORPS_COMMANDER_DIVISIONS_CAP = 24,			-- how many divisions a corps commander is limited to. 0 = inf, < 0 = blocked
		DIVISION_SIZE_FOR_XP = 8,                   -- how many battalions should a division have to count as a full divisions when calculating XP stuff
		CORPS_COMMANDER_ARMIES_CAP = -1,			-- how many armies a corps commander is limited to. 0 = inf, < 0 = blocked
		FIELD_MARSHAL_DIVISIONS_CAP = 24,			-- how many divisions a field marshall is limited to. 0 = inf, < 0 = blocked
		FIELD_MARSHAL_ARMIES_CAP = 5,				-- how many armies a field marshall is limited to. 0 = inf, < 0 = blocked

		UNIT_LEADER_GENERATION_CAPITAL_CONTINENT_FACTOR = 100, --Integer factor to multiply manpower.

		RECON_SKILL_IMPACT = 5, -- how many skillpoints is a recon advantage worth when picking a tactic.

		MAX_DIVISION_BRIGADE_WIDTH = 5,			-- Max width of regiments in division designer.
		MAX_DIVISION_BRIGADE_HEIGHT = 5,		-- Max height of regiments in division designer.
		MIN_DIVISION_BRIGADE_HEIGHT = 4,		-- Min height of regiments in division designer.
		MAX_DIVISION_SUPPORT_WIDTH = 1,			-- Max width of support in division designer.
		MAX_DIVISION_SUPPORT_HEIGHT = 5,		-- Max height of support in division designer.
		
		BASE_DIVISION_BRIGADE_GROUP_COST = 20, 	--Base cost to unlock a regiment slot,
		BASE_DIVISION_BRIGADE_CHANGE_COST = 5,	--Base cost to change a regiment column.
		BASE_DIVISION_SUPPORT_SLOT_COST = 10, 	--Base cost to unlock a support slot
		
		MAX_ARMY_EXPERIENCE = 2500,			--Max army experience a country can store
		MAX_NAVY_EXPERIENCE = 2500,			--Max navy experience a country can store
		MAX_AIR_EXPERIENCE = 2500,				--Max air experience a country can store
		
		COMBAT_MINIMUM_TIME = 4,			-- Shortest time possible for a combat in hours
		SPOTTING_QUALITY_DROP_HOURS = 4, 	-- Each X hours the intel quality drops after unit was spotted.
		LEADER_GROUP_MAX_SIZE = 1000, --5,			-- Max slots for leader groups.

		MIN_SUPPLY_CONSUMPTION = 0.05,					-- minimum value of supply consumption that a unit can get
		
		LAND_COMBAT_ORG_DICE_SIZE = 4,                 -- nr of damage dice
		LAND_COMBAT_STR_DICE_SIZE = 2,                 -- nr of damage dice
		LAND_COMBAT_STR_DAMAGE_MODIFIER = 0.03,        -- global damage modifier... but some equipment is returned at end of battles see : EQUIPMENT_COMBAT_LOSS_FACTOR
		LAND_COMBAT_ORG_DAMAGE_MODIFIER = 0.04,        -- global damage modifier
		LAND_AIR_COMBAT_STR_DAMAGE_MODIFIER = 0.04,    -- air global damage modifier
		LAND_AIR_COMBAT_ORG_DAMAGE_MODIFIER = 0.04,    -- global damage modifier
		LAND_AIR_COMBAT_MAX_PLANES_PER_ENEMY_WIDTH = 3, -- how many CAS/TAC can enter a combat depending on enemy width there
		LAND_COMBAT_STR_ARMOR_ON_SOFT_DICE_SIZE = 2,   -- extra damage dice if our armor outclasses enemy
		LAND_COMBAT_ORG_ARMOR_ON_SOFT_DICE_SIZE = 6,   -- extra damage dice if our armor outclasses enemy
		LAND_COMBAT_STR_ARMOR_DEFLECTION_FACTOR = 0.5, -- damage reduction if armor outclassing enemy
		LAND_COMBAT_ORG_ARMOR_DEFLECTION_FACTOR = 0.5, -- damage reduction if armor outclassing enemy
		LAND_COMBAT_COLLATERAL_FORT_FACTOR = 0.005,		-- Factor to scale collateral damage to forts with.
		LAND_COMBAT_COLLATERAL_INFRA_FACTOR = 0.0022,	-- Factor to scale collateral damage to infra with.
		LAND_COMBAT_FORT_DAMAGE_CHANCE = 5,		-- chance to get a hit to damage on forts. (out of 100)
		ATTRITION_DAMAGE_ORG = 0.1,					   -- damage from attrition to Organisation
		ATTRITION_EQUIPMENT_LOSS_CHANCE = 0.1,		   -- Chance for loosing equipment when suffer attrition. Scaled up the stronger attrition is. Then scaled down by equipment reliability.
		ATTRITION_EQUIPMENT_PER_TYPE_LOSS_CHANCE = 0.1, -- Chance for loosing equipment when suffer attrition. Scaled up the stronger attrition is. Then scaled down by equipment reliability.
		ATTRITION_WHILE_MOVING_FACTOR = 1,
		RELIABILITY_ORG_REGAIN = -0.3,                 -- how much reliability affects org regain
		RELIABILITY_ORG_MOVING = -1.0,                 -- how much reliability affects org loss on moving
		RELIABILITY_WEATHER = 3.0,                     -- how much reliability is afffecting weather impact
		RELIABILTY_RECOVERY = 0.1,                     -- factor affecting how much equipment is returned "from the dead"
		BASE_CHANCE_TO_AVOID_HIT = 90,                 -- Base chance to avoid hit if defences left.
		CHANCE_TO_AVOID_HIT_AT_NO_DEF = 60,	           -- chance to avoid hit if no defences left.
		COMBAT_MOVEMENT_SPEED = 0.33,	               -- speed reduction base modifier in combat
		TACTIC_SWAP_FREQUENCEY = 24,                   -- hours between tactic swaps
		PREFERRED_TACTIC_CHARACTER_SKILL_LEVEL_REQUIRED = 5, -- Which level a field marhal or general has to be before they can pick their preferred tactic
		COUNTRY_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.25,  -- extra weight multiplier for the country preferred tactic when doing weighted random
		ARMY_GENERAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.5,   -- extra weight multiplier for the army general preferred tactic when doing weighted random
		FIELD_MARSHAL_PREFERRED_TACTIC_WEIGHT_FACTOR = 0.25, -- extra weight multiplier for the field marhsal preferred tactic when doing weighted random
		PREFERRED_TACTIC_COMMAND_POWER_COST = 20,	   -- command point cost for changing preferred tactic
		INITIATIVE_PICK_COUNTER_ADVANTAGE_FACTOR  = 0.35, -- advantage per leader level for picking a counter
		AMPHIBIOUS_INVADE_MOVEMENT_COST = 24.0,        -- total progress cost of movement while amphibious invading
		LAND_SPEED_MODIFIER = 0.05,                    -- basic speed control
		RIVER_CROSSING_PENALTY = -0.3,                 -- small river crossing
		RIVER_CROSSING_PENALTY_LARGE = -0.6,           -- large river crossing
		RIVER_CROSSING_SPEED_PENALTY = -0.25,           -- small river crossing
		RIVER_CROSSING_SPEED_PENALTY_LARGE = -0.5,     -- large river crossing
		RIVER_SMALL_START_INDEX = 0,                   -- color indices for rivers
		RIVER_SMALL_STOP_INDEX = 6,
		RIVER_LARGE_STOP_INDEX = 11,
		BASE_FORT_PENALTY = -0.15, 					   -- fort penalty
		MULTIPLE_COMBATS_PENALTY = -0.5,               -- defender penalty if attacked from multiple directions
		DIG_IN_FACTOR = 0.02,						   -- bonus factor for each dug-in level
		ARMY_LEADER_XP_GAIN_PER_UNIT_IN_COMBAT = 0.1, -- XP gain per unit in combat
		CONSTANT_XP_RATIO_FOR_MULTIPLE_LEADERS_IN_SAME_COMBAT = 0.5, -- if there are multiple leaders in same combat, each one gets thisratio + (1-thisratio)/num leaders. amount of xp each general gets scales 1 0.75 0.66 etc for 1 2 3 generals
		BASE_LEADER_TRAIT_GAIN_XP = 0.45,			   -- Base xp gain for traits per hour for armies
		MAX_NUM_TRAITS = -1,						   -- cant have more, -1 to disable
		ENEMY_AIR_SUPERIORITY_IMPACT = -0.35,          -- effect on defense due to enemy air superiorty
		ENEMY_AIR_SUPERIORITY_DEFENSE = 0.70,	       -- more AA attack will approach this amount of help (diminishing returns)
		ENEMY_AIR_SUPERIORITY_DEFENSE_STEEPNESS = 112, -- how quickly defense approaches the max impact diminishing returns curve
		ENEMY_AIR_SUPERIORITY_SPEED_IMPACT = -0.3,     -- effect on speed due to enemy air superiority

		ANTI_AIR_TARGETTING_TO_CHANCE = 0.07,			-- Balancing value to determine the chance of ground AA hitting an attacking airplane, affecting both the effective average damage done by AA to airplanes, and the reduction of damage done by airplanes due to AA support
		ANTI_AIR_ATTACK_TO_AMOUNT = 0.005,				-- Balancing value to convert equipment stat anti_air_attack to the random % value of airplanes being hit.

		ENCIRCLED_PENALTY = -0.3,                      	-- penalty when completely encircled

		UNIT_EXPERIENCE_PER_COMBAT_HOUR = 0.0001,
		UNIT_EXPERIENCE_SCALE = 1.0,
		UNIT_EXPERIENCE_PER_TRAINING_DAY = 0.0010,
		TRAINING_MAX_LEVEL = 10,						
		DEPLOY_TRAINING_MAX_LEVEL = 5,					
		TRAINING_EXPERIENCE_SCALE = 62.0,
		TRAINING_ORG = 0.2,
		ARMY_EXP_BASE_LEVEL = 5,						
		UNIT_EXP_LEVELS = { 0.02, 0.04, 0.06, 0.08, 0.1, 0.15, 0.2, 0.25, 0.3, 0.425, 0.55, 0.675, 0.75, 0.775, 0.8, 0.825, 0.85, 0.9, 0.95, 0.99 },		-- Experience needed to progress to the next level
		FIELD_EXPERIENCE_SCALE = 0.002,
		FIELD_EXPERIENCE_MAX_PER_DAY = 3,				-- Most xp you can gain per day
		EXPEDITIONARY_FIELD_EXPERIENCE_SCALE = 0.5,		-- reduction factor in Xp from expeditionary forces
		LEND_LEASE_FIELD_EXPERIENCE_SCALE = 0.005,		-- Experience scale for lend leased equipment used in combat.
		LEADER_EXPERIENCE_SCALE = 1.0,
		SLOWEST_SPEED = 1.0,
		REINFORCEMENT_REQUEST_MAX_WAITING_DAYS = 14,   -- Every X days the equipment will be sent, regardless if still didn't produced all that has been requested.
		REINFORCEMENT_REQUEST_DAYS_FREQUENCY = 7,	   -- How many days must pass until we may give another reinforcement request
		EXPERIENCE_COMBAT_FACTOR = 0.05,			
		UNIT_DIGIN_CAP = 5,                           -- how "deep" you can dig you can dig in until hitting max bonus
		UNIT_DIGIN_SPEED = 1,						   -- how "deep" you can dig a day.
		PARACHUTE_FAILED_EQUIPMENT_DIV = 50.0,		   -- When the transport plane was shot down, we drop unit with almost NONE equipment
		PARACHUTE_FAILED_MANPOWER_DIV = 100.0,		   -- When the transport plane was shot down, we drop unit with almost NONE manpower
		PARACHUTE_FAILED_STR_DIV = 10.0,			   -- When the transport plane was shot down, we drop unit with almost NONE strenght
		PARACHUTE_DISRUPTED_EQUIPMENT_DIV = 1.5,	   -- When the transport plane was hit, we drop unit with reduced equipment. Penalty is higher as more hits was received (and AA guns was in the state).
		PARACHUTE_DISRUPTED_MANPOWER_DIV = 1.9,	       -- When the transport plane was hit, we drop unit with reduced manpower. Penalty is higher as more hits was received (and AA guns was in the state).
		PARACHUTE_DISRUPTED_STR_DIV = 2.2,			   -- When the transport plane was hit, we drop unit with reduced strength. Penalty is higher as more hits was received (and AA guns was in the state).
		PARACHUTE_PENALTY_RANDOMNESS = 0.1,			   -- Random factor for str,manpower,eq penalties.
		PARACHUTE_DISRUPTED_AA_PENALTY = 1,            -- How much the Air defence in the state (from AA buildings level * air_defence) is scaled to affect overall disruption (equipment,manpower,str).
		PARACHUTE_COMPLETE_ORG = 0.1,				   -- Organisation value (in %) after unit being dropped, regardless if failed, disrupted, or successful.
		PARACHUTE_ORG_REGAIN_PENALTY_DURATION = 120,   -- penalty in org regain after being parachuted. Value is in hours.
		PARACHUTE_ORG_REGAIN_PENALTY_MULT = -0.8,	   -- penalty to org regain after being parachuted.
		SHIP_MORALE_TO_ORG_REGAIN_BASE = 0.2,			   -- Base org regain per hour
		BASE_NIGHT_ATTACK_PENALTY = -0.5,
		EXILE_EQUIPMENT = 1.0,						   -- Amount of equipment to keep
		EXILE_ORG = 0.0,							   -- Amount of org to keep
		EXPERIENCE_LOSS_FACTOR = 1.00,                 -- percentage of experienced solders who die when manpower is removed
		EQUIPMENT_COMBAT_LOSS_FACTOR = 0.70,	 	   -- % of equipment lost to strength ratio in combat, so some % is returned if below 1
		SUPPLY_USE_FACTOR_MOVING = 1.5,                -- Deprecated/Unused
		SUPPLY_USE_FACTOR_INACTIVE = 0.95,			   -- Deprecated/Unused
		SUPPLY_GRACE = 72,							   -- troops always carry 3 days of food and supply
		SUPPLY_GRACE_MAX_REDUCE_PER_HOUR = 2,          -- supply grace is not decreased instantly when it is buffed temporarily and buff is removed
		SUPPLY_ORG_MAX_CAP = 0.30,                     -- Max organization is factored by this if completely out of supply
		MAX_OUT_OF_SUPPLY_DAYS = 30, 				   -- how many days of shitty supply until max penalty achieved
		OUT_OF_SUPPLY_ATTRITION = 0.3,                 -- max attrition when out of supply
		OUT_OF_SUPPLY_SPEED = -0.8,                    -- max speed reduction from supply
		NON_CORE_SUPPLY_SPEED = -0.5,				   -- we are not running on our own VP supply so need to steal stuff along the way
		NON_CORE_SUPPLY_AIR_SPEED = -0.25,			   -- we are not running on our own VP supply so need to steal stuff along the way, a bit less due to air supply
		OUT_OF_SUPPLY_MORALE = -0.3,                   -- max org regain reduction from supply
		TRAINING_ATTRITION = 0.06,		  			   -- amount of extra attrition from being in training
		TRAINING_MIN_STRENGTH = 0.1,					-- if strength is less than this, the unit will pause training until it's been reinforced
		TRAINING_MAX_DAILY_COUNTRY_EXP = 0.06,			-- Maximum army XP gained per day from training
		AIR_SUPPORT_BASE = 0.3,                        -- base ground bonus to troops when active planes helping them
		LOW_SUPPLY = 0.99,							   -- When the supply status of an unit becomes low.
		BORDER_WAR_ATTRITION_FACTOR = 0.01,			   -- How much of borderwar balance of power makes it into attrition
		BORDER_WAR_VICTORY = 0.8,					   -- At wich border war balance of power is victory declared
		REINFORCE_CHANCE = 0.03,                 	   -- base chance to join combat from back line when empty
		SPEED_REINFORCEMENT_BONUS = 0.01,              -- chance to join combat bonus by each 100% larger than infantry base (up to 200%)
		OVERSEAS_LOSE_EQUIPMENT_FACTOR = 0.75,		   -- percentage of equipment lost disbanded overseas
		NAVAL_TRANSFER_DISBAND_MANPOWER_FACTOR = 0.5,  -- percentage of manpower returned when a naval transfering unit is disbanded
		ENCIRCLED_DISBAND_MANPOWER_FACTOR = 0.2,       -- percentage of manpower returned when an encircled unit is disbanded
		ORG_LOSS_FACTOR_ON_CONQUER = 0.2,              -- percentage of (max) org loss on takign enemy province
		LOW_ORG_FOR_ATTACK = 0.5,                      -- at what org % we start affecting speed when doign hostile moves. scales down ZERO_ORG_MOVEMENT_MODIFIER

		PLANNING_DECAY = 0.01,
		PLAYER_ORDER_PLANNING_DECAY = 0.08,				-- Amount of planning lost due to player manual order
		PLANNING_GAIN = 0.02,
		NAVAL_INVASION_PLANNING_BONUS_GAIN = 0.02,		-- Planning Bonus gain per day for naval invasions
		NAVAL_INVASION_PLANNING_BONUS_MALUS = -1,		-- Malus in percentage for the planning bonus gain for naval invasions
		PLANNING_MAX = 0.2,                           	-- can get more from techs
		CIVILWAR_ORGANIZATION_FACTOR = 0.3,			  	-- Multiplier of org for both sides when civilwar.	
		PLAN_CONSIDERED_GOOD = 0.25,					-- Plan evaluations above this value are considered more or less safe
		PLAN_CONSIDERED_BAD = -0.25,					-- Plan evaluations below this value are considered unsafe
		PLAN_MIN_AUTOMATED_EMPTY_POCKET_SIZE = 2,		-- The battle plan system will only automatically attack provinces in pockets that has no resistance and are no bigger than these many provinces
		PLAN_SPREAD_ATTACK_WEIGHT = 13.0,				-- The higher the value, the less it should crowd provinces with multiple attacks.
		PLAN_NEIGHBORING_ENEMY_PROVINCE_FACTOR = 0.7,	-- When calculating the importance of provinces, it takes number of enemy provinces into account, factored by this
		PLAN_PROVINCE_BASE_IMPORTANCE = 2.0,			-- Used when calculating the calue of front and defense area provinces for the battle plan system
		
		PLAN_PROVINCE_LOW_VP_DEFENSE_THRESHOLD = 2.0,      -- For area defense VP orders, what are the thresholds for "low", "medium" and "high" VP values
		PLAN_PROVINCE_MEDIUM_VP_DEFENSE_THRESHOLD = 8.0,   -- see above
		PLAN_PROVINCE_HIGH_VP_DEFENSE_THRESHOLD = 25.0,    -- see above
		PLAN_PROVINCE_LOW_VP_DEFENSE_IMPORTANCE = 2.0,     -- For area defense VP orders, use this value for relative importance
		PLAN_PROVINCE_MEDIUM_VP_DEFENSE_IMPORTANCE = 5.0,  -- see above
		PLAN_PROVINCE_HIGH_VP_DEFENSE_IMPORTANCE = 10.0,   -- see above
		PLAN_PROVINCE_CAPITAL_DEFENSE_IMPORTANCE = 50.0,   -- For area defense VP orders, boost importance value with this if it's the capital
		MIN_VP_NEEDED_FOR_DEFENSE_ORDER_ASSIGNMENTS = 1.0, -- For area devense VP orders, ignore provinces with VP <= this value
		
		PLAN_PROVINCE_LOW_VP_IMPORTANCE_FRONT = 2.0,    -- Used when calculating the calue of fronts in the battle plan system
		PLAN_PROVINCE_MEDIUM_VP_IMPORTANCE_FRONT = 2.25, -- Used when calculating the calue of fronts in the battle plan system
		PLAN_PROVINCE_HIGH_VP_IMPORTANCE_FRONT = 2.75,  -- Used when calculating the calue of fronts in the battle plan system
		
		PLAN_SHARED_FRONT_PROV_IMPORTANCE_FACTOR = 0.8,	-- If fornt orders share end provinces, they should each have a somewhat reduced prio due to it being shared.
		
		PLAN_PORVINCE_PORT_BASE_IMPORTANCE = 12.0,		-- Added importance for area defense province with a port
		PLAN_PORVINCE_PORT_LEVEL_FACTOR = 1.5,			-- Bonus factor for port level
		PLAN_PORVINCE_AIRFIELD_BASE_IMPORTANCE = 3.0,	-- Added importance for area defense province with air field
		PLAN_PORVINCE_AIRFIELD_POPULATED_FACTOR = 1.5,	-- Bonus factor when an airfield has planes on it
		PLAN_PORVINCE_AIRFIELD_LEVEL_FACTOR = 0.25,		-- Bonus factor for airfield level
		PLAN_PORVINCE_RESISTANCE_BASE_IMPORTANCE = 10.0, -- Used when calculating the calue of defense area provinces for the battle plan system (factored by resistance level)
		PLAN_PROVINCE_VP_PORT_FACTOR = 0.25,

		-- These need to result in province value > 1.0 for it to matter.
		PLAN_AREA_DEFENSE_ENEMY_CONTROLLER_SCORE = 15.0,-- Score applied to provinces in the defense area order controlled by enemies
		PLAN_AREA_DEFENSE_ENEMY_UNIT_FACTOR = -2.0,		-- Factor applied to province score in area defense order per enemy unit in that province
		PLAN_AREA_DEFENSE_FORT_IMPORTANCE = 0.25,		-- Used when calculating the calue of defense area provinces for the battle plan system, works as multipliers on the rest
		PLAN_AREA_DEFENSE_COASTAL_FORT_IMPORTANCE = 3.0,-- Used when calculating the calue of defense area provinces for the battle plan system
		PLAN_AREA_DEFENSE_COAST_NO_FORT_IMPORTANCE = 1.1,-- Used when calculating the calue of defense area provinces for the battle plan system
		PLAN_AREA_DEFENSE_HAS_RAIL_IMPORTANCE = 1.5,	-- Used when calculating the value of defense area provinces for the battle plan system
		PLAN_AREA_DEFENSE_HAS_SUPPLY_NODE = 20.0,		-- Used when calculating the value of defense area provinces for the battle plan system
    	PLAN_AREA_DEFENSE_FACILITY = 15.0,               -- Used when calculating the value of defense area provinces for the battle plan system

		PLAN_STICKINESS_FACTOR = 100.0,					-- Factor used in unitcontroller when prioritizing units for locations
		
		PLAN_PROVINCE_PRIO_DISTRIBUTION_MIN = 0.8,		-- Lowest fraction of divisions that will be distributed based on province priority
		PLAN_PROVINCE_PRIO_DISTRIBUTION_MAX = 1.0,		-- Highest fraction of divisions that will be distributed based on province priority
		PLAN_PROVINCE_PRIO_DISTRIBUTION_DPP_HIGH = 4.0, -- At what divisions per province should we use PLAN_PROVINCE_PRIO_DISTRIBUTION_MIN
		PLAN_PROVINCE_PRIO_DISTRIBUTION_DPP_LOW = 2.0,	-- At what divisions per province should we use PLAN_PROVINCE_PRIO_DISTRIBUTION_MAX
		
		PLAN_EXECUTE_CAREFUL_LIMIT = 25,				-- When looking for an attach target, this score limit is required in the battle plan to consider province for attack
		PLAN_EXECUTE_BALANCED_LIMIT = 0,				-- When looking for an attach target, this score limit is required in the battle plan to consider province for attack
		PLAN_EXECUTE_RUSH = -200,						-- When looking for an attach target, this score limit is required in the battle plan to consider province for attack
		PLAN_EXECUTE_CAREFUL_MAX_FORT = 5,				-- If execution mode is set to careful, units will not attack provinces with fort levels greater than or equal to this

		-- order by EExecutionType: careful, balanced, rush, <skip>, rush_weak
		PLAN_EXECUTE_SUPPLY_CHECK = { 1.0, 0.0, 0.0, 1.0, 0.0 }, -- for each execution mode how careful should we be with supply (1.0 means full required supply available, zero is no limit).
		
		PLAN_MAX_PROGRESS_TO_JOIN = 0.50,				-- If Lower progress than this, probably needs support
		
		PLAN_COHESION_WEIGHTS = { 1.0, 40.0, 80.0 }, 	-- for each cohesion setting, how keen on relocating from distance should we be? (default 1.0), higher weight = shorter max distance
		PLAN_COHESION_DISTANCE_MAX_WHEN_LEFT_BEHIND = 38,	--If not on the frontline and not moving, we can still be relocated if we exceed cohesion distance, but only to locations less than THIS distance. (Note: this is -actual- distance, not weighted distance)

		PLAN_BLITZ_OPTIMISM = 0.2,						-- Additional combat balance value in favor of blitzing side when considering targets (not a combat bonus, just offsets planning)
		MIN_BALANCE_SCORE_TO_PROCEED_ATTACK = 0.2,		--A combat balance score of less than this will prevent auto attacking
		DYNAMIC_MODIFIER_ATTACK_BIAS = 1.0,				--This factors the weighting bias of dynamic attack modifiers
		
		FLANKED_PROVINCES_COUNT = 3,					-- Attacker has to attack from that many provinces for the attack to be considered as flanking
		EQUIPMENT_REPLACEMENT_RATIO = 0.1,				-- Equipment min ratio after blocking the equipment type
		NUKE_DELAY_HOURS = 2,							-- How many hours does it take for the nuclear drop to happen
		PARADROP_PENALTY = -0.3, 						-- Combat penalty when recently paradropped
		PARADROP_HOURS = 48,							-- time paratroopers suffer penalties in combat
		COMBAT_SUPPLY_LACK_ATTACKER_ATTACK = -0.20,     -- attack combat penalty for attacker if out of supply
		COMBAT_SUPPLY_LACK_ATTACKER_DEFEND = -0.70,     -- defend combat penalty for attacker if out of supply
		COMBAT_SUPPLY_LACK_DEFENDER_ATTACK = -0.50,     -- attack combat penalty for defender if out of supply
		COMBAT_SUPPLY_LACK_DEFENDER_DEFEND = -0.15,     -- defend combat penalty for defender if out of supply
		COMBAT_STACKING_START = 8,						-- at what nr of divisions stacking penalty starts
		COMBAT_STACKING_EXTRA = 4,                      -- extra stacking from directions
		COMBAT_STACKING_PENALTY = -0.02,                -- how much stackign penalty per division
		COMBAT_OVER_WIDTH_PENALTY = -2,					-- over combat width penalty per %.
		COMBAT_OVER_WIDTH_PENALTY_MAX = -0.33,			-- over combat width max (when you cant join no more).
		RETREAT_SPEED_FACTOR = 0.25,                    -- speed bonus when retreating
		WITHDRAWING_SPEED_FACTOR = 0.15,				-- speed bonus when withdrawing
		STRATEGIC_SPEED_INFRA_BASE = 5.0,               -- Base speed of strategic redeployment when not on railways
		STRATEGIC_SPEED_INFRA_MAX = 10.0,               -- Additional speed of strategic redeployment on max-level infrastructure
		STRATEGIC_SPEED_RAIL_BASE = 15.0,               -- Base speed of strategic redeployment when on railways
		STRATEGIC_SPEED_RAIL_MAX = 25.0,                -- Additional speed of strategic redeployment on max-level railways
		STRATEGIC_REDEPLOY_ORG_RATIO = 0.1,				-- Ratio of max org while strategic redeployment
		BATALION_NOT_CHANGED_EXPERIENCE_DROP = 0.0,		-- Division experience drop if unit has same batalion
		BATALION_CHANGED_EXPERIENCE_DROP = 0.5,			-- Division experience drop if unit has different batalion
		ARMOR_VS_AVERAGE = 0.3,			                -- how to weight in highest armor & pen vs the division average
		PEN_VS_AVERAGE = 0.4,

		LAND_EQUIPMENT_BASE_COST = 10,					-- Cost in XP to upgrade a piece of equipment one level is base + ( total levels * ramp )
		LAND_EQUIPMENT_RAMP_COST = 5,					
		NAVAL_EQUIPMENT_BASE_COST = 25,
		NAVAL_EQUIPMENT_RAMP_COST = 5,
		AIR_EQUIPMENT_BASE_COST = 25,
		AIR_EQUIPMENT_RAMP_COST = 5,
		
		FASTER_ORG_REGAIN_LEVEL = 0.25,
		FASTER_ORG_REGAIN_MULT = 1.0,
		SLOWER_ORG_REGAIN_LEVEL = 0.75,
		SLOWER_ORG_REGAIN_MULT = -0.5,
		
		DISBAND_MANPOWER_LOSS = 0.7,
		MIN_DIVISION_DEPLOYMENT_TRAINING = 0.05,			-- Min level of division training
		
		FRONTLINE_EXPANSION_FACTOR = 0.6,				-- When attacking along a frontline, how much should units spread out as they advance. 0.0 means head (more or less) directly to the drawn frontline, with no distractions
		FRONT_MIN_PATH_TO_REDEPLOY = 8,					-- If a units path is at least this long to reach its front location, it will strategically redeploy.
		ARMY_INITIATIVE_REINFORCE_FACTOR = 0.25,		-- scales initiative for reinforce chance
		
		BASE_CAPTURE_EQUIPMENT_RATIO = 0.0,				-- after a successful land combat, ratio of the equipments that are being captured/salvaged from enemy's lost equipment

		ACCLIMATIZATION_IN_COMBAT_SPEED_FACTOR = 3,		-- Acclimatization speed multiplier while being in combat.
		ACCLIMATIZATION_SPEED_GAIN = 0.15,				-- A variable used to balance the overall speed of gaining the acclimatization
		ACCLIMATIZATION_LOSS_SPEED_FACTOR = 2.0,		-- Loosing one acclimatization while being under affect of the opposite climate should cause it to drop down much faster than gaining.


		PROMOTE_LEADER_CP_COST = 40.0,					-- cost of promoting a leader
		
		FIELD_MARSHAL_ARMY_BONUS_RATIO = 0.5,           -- ratio to apply regular bonuses FM bonuses to armies
		
		FIELD_MARSHAL_XP_RATIO = 0.3,					-- xp gain ratio for army group leaders
		
		GARRISON_ORDER_ARMY_CAP_FACTOR = 3.0,			-- armies gets increased cap when they are garrisoned
		
		COMMANDER_LEVEL_UP_STAT_COUNT = 3, 				-- num stats gained on level up
		COMMANDER_LEVEL_UP_STAT_WEIGHTS = {5, 5, 5, 5}, -- level up stat random base weights attack, defense, planning, logistics
		
		NAVY_LEADER_LEVEL_UP_STAT_WEIGHTS = {5, 5, 5, 5}, -- level up stat random base weights attack, defense, maneuvering, coordination
		
		UNIT_LEADER_INITIAL_TRAIT_SLOT = { 				-- trait slot for 0 level leader
			1.0, -- field marshal
			0.0, -- corps commander
			1.0, -- navy general
			0.0, -- operative	
		}, 
		
		UNIT_LEADER_TRAIT_SLOT_PER_LEVEL = { 			-- num extra traits on each level
			0.5, -- field marshal
			0.5, -- corps commander
			0.5, -- navy general
			0.0, -- operative	
		}, 

		UNIT_LEADER_USE_NONLINEAR_XP_GAIN = true,       -- Whether unit leader XP gain is scaled by 1/<nr_of_traits>
		
		HOURS_REQ_REJOIN_BORDER_WAR_FOR_INJURED_UNITS = 336, -- minimum hours required for units to rejoin border wars
		
		NEW_COMMANDER_RANDOM_PERSONALITY_TRAIT_CHANCES = {  -- chances to gain a personality trait for new generals
			0.5, -- 50% for first trait
			0.15  -- 15% for second trait after that
		},
		
		NEW_COMMANDER_RANDOM_BASIC_TRAIT_CHANCES = {  -- chances to gain a basic trait for new generals
		},
		
		NEW_COMMANDER_RANDOM_STATUS_TRAIT_CHANCES = {  -- chances to gain a status trait for new generals
		},
		
		NEW_OPERATIVE_RANDOM_PERSONALITY_TRAIT_CHANCES = {  -- chances to gain a personality trait for new operatives
			0.5, -- 50% for first trait
			0.1  -- 10% for second trait after that
		},
		
		NEW_OPERATIVE_RANDOM_BASIC_TRAIT_CHANCES = {  -- chances to gain a basic trait for new operatives
			0.25, -- 25% for first trait
			0.05  -- 5% for second trait after that
		},
		
		NEW_OPERATIVE_RANDOM_STATUS_TRAIT_CHANCES = {  -- chances to gain a status trait for new operatives
		},
		
		NEW_COMMANDER_RANDOM_SKILL_CHANCES = {  -- chances to give a random stat skill for new operatives
		},

		NEW_NAVY_LEADER_RANDOM_SKILL_CHANCES = { -- chances to give a random stat skill point for a new admiral
		},
		
		UNIT_LEADER_MODIFIER_COOLDOWN_ON_GROUP_CHANGE = 15,		-- time in days for a unit leader to regain its modifiers
		UNIT_LEADER_ASSIGN_TRAIT_COST = 15.0,					-- cost to assign a new trait to a unit leader
		ATTACHED_WINGS_ORDER_UPDATE_DAYS = 5,					-- Days untill the attached wing will update the order
		
		BORDER_WAR_WIN_DAYS_AGAINST_EMPTY_OPPONENTS = 15,		-- border wars will be automatically won if no opponent shows up for this duration
		
		
		MAX_RELATIVE_COMBAT_DAMAGE_TO_MODIFY_XP = 4.0,			-- you gain more XP if you are doing more damage relative to enemy, this is the max relative amount to gain following RATe
		XP_GAIN_FACTOR_FOR_MAX_RELATIVE_COMBAT_DAMAGE = 4.0,	-- XP factor scaling for max relative combat damage
		
		XP_DECAY_RATE_PER_HOUR_IN_COMBAT = 0.03,				-- you get reduced XP as combat drags
		MIN_XP_RATE_TO_DECAY = 0.1,								-- minimum XP factor for dragged combats
		
		XP_GAIN_PER_OVERRUN_UNIT = 35.0,						-- fixed XP gain per overrun unit
		XP_GAIN_FOR_SHATTERING = 35.0,                          -- fixed XP gain per shattered unit
		
		UNIT_UPKEEP_ATTRITION = 0.00,							--Constant attrition value applied to armies.

		FUEL_PENALTY_START_RATIO = 0.25,				-- ratio of fuel in an army to start getting penalties
		
		SURPLUS_SUPPLY_RATIO_FOR_ZERO_FUEL_FLOW = 0.5,		-- if a supply chunk has more supply needed than this ratio + 1 compared to its max supply flow, the units inside the chiunk will get no fuel 
		
		ARMY_MAX_FUEL_FLOW_MULT = 2.0,					-- max fuel ratio that an army can get per hour, multiplied by supply situation
		
		ARMY_FUEL_COST_MULT = 0.3,						-- fuel cost multiplier for all army related stuff
		ARMY_COMBAT_FUEL_MULT =   2.0,					-- fuel consumption ratio in combat (plus ARMY_MOVEMENT_FUEL_MULT if you are also moving. ie offensive combat)
		ARMY_TRAINING_FUEL_MULT = 1.0,					-- fuel consumption ratio while training
		ARMY_MOVEMENT_FUEL_MULT = 1.0,					-- fuel consumption ratio while moving
		ARMY_NAVAL_TRANSFER_FUEL_MULT = 0.0,			-- fuel consumption ratio while naval transferring
		ARMY_STRATEGIC_DEPLOYMENT_FUEL_MULT = 0.0,		-- fuel consumption ratio while doing strategic deployment
		ARMY_IDLE_FUEL_MULT = 0.0,						-- fuel consumption ratio while just existing
		FUEL_EFFICIENCY_RAID_MULTIPLIER = 1.0,			-- convoy raid multiplier for fuel sunk
		
		FUEL_FLOW_PENALTY_FOR_SUPPLY_CHUNK_EDGE_RATIO = 0.5, -- supply flow that is limited by control of incoming edge provinces will have lesser effect on fuel flow
		
		OUT_OF_FUEL_EQUIPMENT_MULT = 0.1,				-- ratio of the stats that you get from equipments that uses fuel and you lack it
		OUT_OF_FUEL_SPEED_MULT = 0.4,					-- speed mult that armies get when out of fuel
		OUT_OF_FUEL_TRAINING_XP_GAIN_MULT = 0.0,		-- xp gain mult from training when a unit is out of fuel
		FUEL_CAPACITY_DEFAULT_HOURS = 96,               -- default capacity if not specified

		MAX_ESTIMATED_PLAN_UNITS_NOT_IN_PLACE_FACTOR = -0.6, 	--Scaled by % of units not in place. Used to be a flat -50%
		DAMAGE_SPLIT_ON_FIRST_TARGET = 0.35,			--% of damage dealt to the first target in a combat. The rest will be split amongst subsequent targets. Modifiers can affect this up to a maximum of 0.9. That value must not be exposed as a define.


		NEW_ARMY_LEADER_LEVEL_CHANCES = {				-- chances for new army leaders to start at a given level
			0.95, -- 95% for level one
			0.05  -- 5% for level two
				-- 0% for level three to ten
		}
	},


	NAir = {
		AIR_WING_FLIGHT_SPEED_MULT = 0.02,					-- Global speed multiplier for airplanes (affects fe.transferring to another base)
		AIR_WING_MAX_STATS_ATTACK = 100,					-- Max stats
		AIR_WING_MAX_STATS_DEFENCE = 100,
		AIR_WING_MAX_STATS_AGILITY = 100,
		AIR_WING_MAX_STATS_SPEED = 1500,
		AIR_WING_MAX_STATS_BOMBING = 100,
		AIR_WING_MAX_SIZE = 1000, 							-- Max amount of airplanes in wing
		AIR_WING_AVERAGE_SIZE = 100, 						-- Eyeballed average amount of airplanes in wing. Used when calculating air volunteer.
		AIR_WING_BOMB_DAMAGE_FACTOR = 2,					-- Used to balance the damage done while bombing.
		BIGGEST_AGILITY_FACTOR_DIFF = 3.0,					-- biggest factor difference in agility for doing damage (caps to this)
		BIGGEST_SPEED_FACTOR_DIFF = 2.5,					-- biggest factor difference in speed for doing damage (caps to this)
		TOP_SPEED_DAMAGE_BONUS_FACTOR = 0.02,				-- A factor for scaling the top speed of a plane into damage buff
		COMBAT_DAMAGE_STATS_MULTILPIER = 0.2,
		COMBAT_BETTER_AGILITY_DAMAGE_REDUCTION = 0.30, 		-- How much the better agility (than opponent's) can reduce their damage to us.
		COMBAT_BETTER_SPEED_DAMAGE_INCREASE = 0.45, 		-- How much the better Speed (than opponent's) can reduce increase our damage to them.
															-- Both of these defines are combined with their sister FACTOR_DIFF defines to create defense or offensive buffs
															-- In both cases the maximum bonus or reduction is (BIGGEST_X_FACTOR_DIFF - 1) * COMBAT_BETTER_X_DAMAGE_Y * Damage
	    MISSILE_LAUNCHER_CAPACITY = 10,                     -- The number of missiles per slot
	    MISSILE_LAUNCHER_SLOTS = 1,                         -- The number of missile slots a missile launcher unit can have
		COMBAT_MAX_WINGS_AT_ONCE = 10000, 						-- Max amount of air wings in one combat simulation. The higher value, the quicker countries may loose their wings. It's a gameplay balance value.
		COMBAT_MAX_WINGS_AT_GROUND_ATTACK = 10000,	        	-- we can really pounce a land strike and escalate
		COMBAT_MAX_WINGS_AT_ONCE_PORT_STRIKE = 10000,        -- we can really pounce a naval strike and escalate
		AIR_REGION_SUPERIORITY_PIXEL_SCALE = 0.04,           -- air superiority scale = superiority/(pixels*this)
		COMBAT_MULTIPLANE_CAP = 3.0,						-- How many planes can shoot at each plane on other side ( if there are 100 planes we are atttacking COMBAT_MULTIPLANE_CAP * 100 of our planes can shoot )
		COMBAT_DAMAGE_SCALE = 0.1,							-- Higher value = more shot down planes
		COMBAT_DAMAGE_SCALE_CARRIER = 5,                    -- same as above but used inside naval combat for carrier battles
		DETECT_CHANCE_FROM_OCCUPATION = 0.10, 				-- How much the controlled provinces in area affects the air detection base value.
		DETECT_CHANCE_FROM_RADARS = 0.5, 					-- How much the radars in area affects detection chance.
		DETECT_CHANCE_FROM_AIRCRAFTS_EFFECTIVE_COUNT = 3000, -- Max amount of aircrafts in region to give full detection bonus.
		DETECT_CHANCE_FROM_AIRCRAFTS = 0.8,					-- How much aircrafts in region improves air detection (up to effective count).
		DETECT_CHANCE_FROM_NIGHT = -0.2,					-- How much the night can reduce the air detection. (see static modifiers to check how weather affects it too.)
		DETECT_EFFICIENCY_BASE = 0.1,						-- Base value for detection efficiency (once something detected, efficiency says how many airplanes was detected).
		DETECT_EFFICIENCY_FROM_RADAR = 0.7,					-- How much radars affect the efficiency.
		DETECT_EFFICIENCY_RANDOM_FACTOR = 0.1,				-- How much randomness is in amount of detected aircrafts.
		DAY_NIGHT_COVERAGE_FACTOR = 0.5,					-- How much of the land in the region must be covered by night to consider doing night missions. The same with the day.
		HOURS_DELAY_AFTER_EACH_COMBAT = 4,					-- How many hours needs the wing to be ready for the next combat. Use for tweaking if combats happens too often. (generally used as double because of roundtrip)
		PORT_STRIKES_DELAY_MULTIPLIER = 2,					-- multplies HOURS_DELAY_AFTER_EACH_COMBAT if port strikes
		CARRIER_HOURS_DELAY_AFTER_EACH_COMBAT = 3,          -- how often carrier planes do battle inside naval combat
		CARRIER_SIZE_STAT_INCREMENT = 10,					-- Each Point of carrier_size state adds capacity for this many planes
		NAVAL_STRIKE_TARGETTING_TO_AMOUNT = 0.3,			-- Balancing value to convert the naval_strike_targetting equipment stats to chances of how many airplanes managed to do successfull strike.
		NAVAL_STRIKE_DAMAGE_TO_STR = 2.0,					-- Balancing value to convert damage ( naval_strike_attack * hits ) to Strength reduction.
		NAVAL_STRIKE_DAMAGE_TO_ORG = 2.5,					-- Balancing value to convert damage ( naval_strike_attack * hits ) to Organisation reduction.
		NAVAL_STRIKE_CARRIER_MULTIPLIER = 5.0,              -- damage bonus when planes are in naval combat where their carrier is present (and can thus sortie faster and more effectively)
		FIELD_EXPERIENCE_SCALE = 0.001,
		FIELD_EXPERIENCE_MAX_PER_DAY = 2,					-- Most xp you can gain per day
		CLOSE_AIR_SUPPORT_EXPERIENCE_SCALE = 0.0005,			-- How much the experinence gained by CAS is scaled
		PARADROP_EXPERIENCE_SCALE = 0.03,					-- How much the experinence gained by paradropping is scaled
		BOMBING_DAMAGE_EXPERIENCE_SCALE = 0.0002,           -- How much the experinence gained by bombing is scaled

		EXPERIENCE_SCALE_ATTACK_LOGISTICS_NO_TRUCK_CONSUMERS = 0.0001, -- How much country experinence gained by attacking consumers who aren't motorized
		EXPERIENCE_SCALE_ATTACK_LOGISTICS_NODE_AND_TRAINS = 0.0002,    -- How much country experinence gained by attacking node/trains
		EXPERIENCE_SCALE_ATTACK_LOGISTICS_TRUCKS = 0.0002,             -- How much country experinence gained by attacking trucks

		FIELD_EXPERIENCE_FACTOR = 0.7,						-- Factor all air experience gain from missions by this
	
		AI_ALLOWED_PLANES_KEPT_IN_RESERVE = 0.10,			--AI allowed planes is reduced by this percentage. Overflow will be distributed to the next valid order. Worst case, this will result in this % of planes no being assigned any order. 
	
		ACCIDENT_CHANCE_BASE = 0.05,							-- Base chance % (0 - 100) for accident to happen. Reduced with higher reliability stat.
		ACCIDENT_CHANCE_CARRIER_MULT = 2.0,					-- The total accident chance is scaled up when it happens on the carrier ship.
		ACCIDENT_CHANCE_BALANCE_MULT = 0.5,					-- Multiplier for balancing how often the air accident really happens. The higher mult, the more often.
		ACCIDENT_CHANCE_RELIABILITY_MULT = 2.0,				-- Multiplier to accident chance per point of missing reliability.
		ACCIDENT_EFFECT_MULT = 0.005,						-- Multiplier for balancing the effect of accidents
		ACE_DEATH_CHANCE_BASE = 0.003,						-- Base chance % for ace pilot die when an airplane is shot down in the Ace wing.
		ACE_DEATH_BY_OTHER_ACE_CHANCE = 1.0,				-- chance to an ace dying by another ace if it was hit by ace in combat
		ACE_DEATH_CHANCE_PLANES_MULT = 0.001,				-- The more airplanes was lost in a single airplanes (more bloody it was) the higher chance of Ace to die.
		ACE_EARN_CHANCE_BASE = 0.003,						-- Base chance % for ace pilot to be created. Happens only when successfully kill airplane/ship or damage the buildings.
		ACE_EARN_CHANCE_PLANES_MULT = 0.001,				-- The more airplanes the wing shots the higher chance of earning Ace.
		AIR_AGILITY_TO_NAVAL_STRIKE_AGILITY = 0.01,         		-- conversion factor to bring agility in line with ship AA
		AIR_DAMAGE_TO_DIVISION_LOSSES = 1.0,				-- factor for conversion air damage to division losses for details statistics of air wings
		AIR_NAVAL_KAMIKAZE_DAMAGE_MULT = 20.0,				-- Balancing value to increase usual damage to Strength for Kamikaze
		AIR_NAVAL_KAMIKAZE_LOSSES_MULT = 4.0,          			-- Balancing value to increase usual losses if Kamikaze participating in the battle
		BASE_KAMIKAZE_DAMAGE = 2.0,                    				-- Base Kamikaze death rate
		BASE_KAMIKAZE_TARGETING = 2.0,			        		-- Kamikaze can't be a bad target
		BASE_STRATEGIC_BOMBING_HIT_SHIP_CHANCE = 0.01,		-- Chance to hit a ship in port when it is bombed.
		BASE_STRATEGIC_BOMBING_HIT_SHIP_DAMAGE_FACTOR = 50,
		BASE_STRATEGIC_BOMBING_HIT_PLANE_CHANCE = 0.5,		-- Chance to hit a plane in airbase when it is bombed.
		BASE_STRATEGIC_BOMBING_HIT_PLANE_DAMAGE_FACTOR = 0.2,
		AGGRESSION_THRESHOLD = { 0.0, 0.25, 0.5 },			-- Threshold levels for mission aggressivity for air
		
		ACE_WING_SIZE =	100,								-- size of wing ace bonuses are set up for. if lower more bonus, if higher less bonus
		ACE_WING_SIZE_MAX_BONUS = 10,                       -- biggest bonus we can get from having a small wing with an ace on
		NO_SEARCH_MISSION_DETECT_FACTOR = -0.5,				-- value of planes not on active search missions for detection
		SUPPLY_NEED_FACTOR = 0.3, 							-- multiplies supply usage
		SUPPLY_PRIO_FACTOR = 100.0,							-- Effect of supply need per unit for target province picking for air supply
		CAPACITY_PENALTY = 2,								-- scales penalty of having overcrowded bases.
		AIR_COMBAT_FINAL_DAMAGE_SCALE = 0.015,               -- % how many max disrupted only planes are alloed to die in a single combat
		AIR_COMBAT_FINAL_DAMAGE_PLANES = 50,                -- scaling/control for when only very few planes exist to stop roundoff issues
		AIR_COMBAT_FINAL_DAMAGE_PLANES_FACTOR = 0.1,
		AA_INDUSTRY_AIR_DAMAGE_FACTOR = -0.12,				-- 5x levels = 60% defense from bombing
		NAVAL_STRIKE_DETECTION_BALANCE_FACTOR = 0.7,		-- Value used to scale the surface_visibility stats to balance the gameplay, so 100% detection chance still won't spam the strikes.
		NAVAL_RECON_DETECTION_BALANCE_FACTOR = 0.7,			-- Value used to scale the surface_visibility stats to balance the gameplay, so 100% detection chance still won't spam spotting.
		LEND_LEASED_EQUIPMENT_EXPERIENCE_GAIN = 0.5,		-- Value used for equipment
		ANTI_AIR_PLANE_DAMAGE_FACTOR = 0.8,					-- Anti Air Gun Damage factor
		ANTI_AIR_PLANE_DAMAGE_CHANCE = 0.1,					-- Anti Air Gun hit chance
		ANTI_AIR_ATTACK_TO_DAMAGE_REDUCTION_FACTOR = 1.0,	-- Balancing value to convert equipment stat anti_air_attack to the damage reduction modifier apply to incoming air attacks against units with AA.
		ANTI_AIR_MAXIMUM_DAMAGE_REDUCTION_FACTOR = 0.75,	-- Maximum damage reduction factor applied to incoming air attacks against units with AA.
		AIR_DEPLOYMENT_DAYS = 2,							-- Days to deploy one air wing
		NAVAL_STRIKE_BASE_STR_TO_PLANES_RATIO = 0.03,		-- Max airbombers to do port strike comparing to strength
		NAVAL_COMBAT_EXTERNAL_PLANES_JOIN_RATIO = 0.05,		-- Max planes that can join a combat comparing to the total strength of the ships
		NAVAL_COMBAT_EXTERNAL_PLANES_JOIN_RATIO_PER_DAY = 0.2, -- max extra plane % that can join every day
		NAVAL_COMBAT_EXTERNAL_PLANES_MIN_CAP = 20,			-- Min cap for planes that can join naval combat
		
		AIR_MORE_GROUND_CREWS_COST = 20.0,					-- CP cost to maintain more ground crews
		AIR_MORE_GROUND_CREWS_BOOST = 0.1,					-- Efficienct boost for more ground crews

		EFFICIENCY_REGION_CHANGE_PENALTY_FACTOR = 0.9,				-- Penalty applied for changing region
		-- Gain should be changed in increments of 0.024 due to precision.
		EFFICIENCY_REGION_CHANGE_DAILY_GAIN_DEFAULT = 1,	-- Default how much efficiency to regain per day. Gain applied hourly.
		EFFICIENCY_REGION_CHANGE_DAILY_GAIN_CAS = 0.888,				-- How much efficiency to regain per day. Gain applied hourly.
		EFFICIENCY_REGION_CHANGE_DAILY_GAIN_NAVAL_BOMBER = 0.192,		-- How much efficiency to regain per day. Gain applied hourly.
		EFFICIENCY_REGION_CHANGE_DAILY_GAIN_TACTICAL_BOMBER = 0.192,	-- How much efficiency to regain per day. Gain applied hourly.
		EFFICIENCY_REGION_CHANGE_DAILY_GAIN_FIGHTER = 0.888,			-- How much efficiency to regain per day. Gain applied hourly.
		EFFICIENCY_REGION_CHANGE_DAILY_GAIN_STRATEGIC_BOMBER = 0.072,	-- How much efficiency to regain per day. Gain applied hourly.
		EFFICIENCY_REGION_CHANGE_DAILY_GAIN_MARITIME_PATROL_PLANE = 1,

		AIR_WING_XP_MAX = 1000.0, 											--Per plane XP.
		AIR_WING_XP_LEVELS = { 100, 300, 700, 900 }, 						--Experience needed to progress to the next level
		AIR_WING_XP_LOSS_WHEN_KILLED = 300,									--if a plane dies, the game assumes that a pilot with this amount of xp died and recalcs average. 
		AIR_WING_XP_TRAINING_MAX = 300.0, 									--Max average XP achieved with training.
		
		AIR_WING_XP_TRAINING_MISSION_GAIN_DAILY = 3.3, 						--Daily gain when running training exercise mission
		AIR_WING_XP_AIR_VS_AIR_COMBAT_GAIN = 0.4, 							--Wings in combat gain extra XP	
		AIR_WING_XP_GROUND_MISSION_COMPLETED_GAIN = 0.28, 					--Bombers bombing, CAS cassing, NBs nbing, kamikazees kamikazeeing, etc.	
		AIR_WING_XP_RECON_MISSION_COMPLETED_GAIN = 0.05, 					--recon mission

		AIR_WING_COUNTRY_XP_FROM_TRAINING_FACTOR = 0.005, 					--Factor on country Air XP gained from wing training
		AIR_WING_XP_TRAINING_MISSION_ACCIDENT_FACTOR = 1.5, 				--Training exercises cause more accidents
		AIR_WING_XP_LOSS_REDUCTION_OVER_FRIENDLY_TERRITORY_FACTOR = 0.3, 	--Reduction on XP loss over friendly territory

		DISRUPTION_FACTOR = 4.0,									-- multiplier on disruption damage to scale its effects on planes
		DISRUPTION_FACTOR_CARRIER = 24.0,							-- multiplier on disruption damage to scale its effects on carrier vs carrier planes
		DISRUPTION_SPEED_FACTOR = 1.0,
		DISRUPTION_AGILITY_FACTOR = 0.0,
		DISRUPTION_ATTACK_FACTOR = 0.0,
		DISRUPTION_DETECTION_FACTOR = 1.0,
		ESCORT_FACTOR = 2.0,
		ESCORT_SPEED_FACTOR = 1.0,
		ESCORT_AGILITY_FACTOR = 1.0,
		ESCORT_ATTACK_FACTOR = 1.0,
		DISRUPTION_DEFENCE_DEFENCE_FACTOR = 0.5,
		DISRUPTION_DEFENCE_SPEED_FACTOR = 1.0,
		DISRUPTION_DEFENCE_ATTACK_FACTOR = 0.5,
		
		CARRIER_PLANES_AMOUNT_FOR_POSITIONING = 50,         -- below this amount of planes on a carrier we no longer get max benefit on enemy positioning 

		CAS_NIGHT_ATTACK_FACTOR = 0.1,                      -- CAS damaged get multiplied by this in land combats at night

		AIR_WING_ATTACK_LOGISTICS_NO_TRUCK_DISRUPTION_FACTOR = 0.02, -- If a unit isn't motorized, still disrupt its supply by damage * this
		AIR_WING_ATTACK_LOGISTICS_TRUCK_DAMAGE_FACTOR = 0.5,
		AIR_WING_ATTACK_LOGISTICS_INFRA_DAMAGE_SPILL_FACTOR = 0.0016, -- Portion of truck damage to additionally deal to infrastructure
		AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_FACTOR = 0.075,
		AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_DISRUPTION_MITIGATION = 6.0, -- Multiply Train Damage by (Smooth / (Smooth + (Disruption * Mitigation)))
		AIR_WING_ATTACK_LOGISTICS_TRAIN_DAMAGE_DISRUPTION_SMOOTHING = 5.0,
		AIR_WING_ATTACK_LOGISTICS_RAILWAY_DAMAGE_SPILL_FACTOR = 0.006, -- Portion of train damage to additionally deal to railways

		AIR_WING_ATTACK_LOGISTICS_DISRUPTION_MIN_DAMAGE_FACTOR = 0.1, -- Multiply train damage by this factor, scale from 1.0 at 0 disruption to this at AIR_WING_ATTACK_LOGISTICS_MAX_DISRUPTION_DAMAGE_TO_CONSIDER
		AIR_WING_ATTACK_LOGISTICS_MAX_DISRUPTION_DAMAGE_TO_CONSIDER = 15.0, -- see above
		AIR_WING_ATTACK_LOGISTICS_DIRECT_DISRUPTION_DAMAGE_FACTOR = 0.01, -- Disruption damage to supply throughput done by bombing damage, not dependant on killing trains which also causes diruption.

		AIR_WING_ATTACK_LOGISTICS_TRUCK_MAX_FACTOR = 0.3, -- max trucks we can destroy in one instance of a logistics strike

		SECONDARY_DAMAGE_STRAT = 0.2,  -- how much damage gets translated to railway guns for strat bombing
		SECONDARY_DAMAGE_LOGISTICS = 1.0, -- how much damage gets translated to railway guns for logistic strike
		
		INTERCEPTION_DISTANCE_SCALE = 50, -- At this many pixels of path length, full interception efficiency is applied to air missions. Lerp from 0.
		INTERCEPTION_DAMAGE_SCALE = 0.3, -- Multiply the interception damage with this value. Works as a cap when interception distance is at maximum.
		
		MIN_PLANE_COUNT_PARADROP = 50,
		MIN_PLANE_COUNT_AIR_SUPPLY = 1,
		BASE_UNIT_WEIGHT_IN_TRANSPORT_PLANES = 45.0,
		
		MANPOWER_LOSS_RATIO_PLANE_SHOT = 0.10,	-- The loss ratio of manpower for a shot plane.

		MISSION_COMMAND_POWER_COSTS = {  -- command power cost per plane to create a mission
			0.0, -- AIR_SUPERIORITY
			0.0, -- CAS		
			0.0, -- INTERCEPTION	
			0.0, -- STRATEGIC_BOMBER
			0.0, -- NAVAL_BOMBER	
			0.0, -- DROP_NUKE		
			0.0, -- PARADROP		
			0.0, -- NAVAL_KAMIKAZE	
			0.0, -- PORT_STRIKE		
			0.0, -- ATTACK_LOGISTICS
			0.3, -- AIR_SUPPLY		
			0.0, -- TRAINING
			0.0, -- NAVAL_MINES_PLANTING
			0.0, -- NAVAL_MINES_SWEEPING
			0.0, -- RECON
			0.0, -- NAVAL_PATROL
	    	0.0, -- BARRAGE
	    	0,0, -- SAM
		},
		
		MISSION_FUEL_COSTS = {  -- fuel cost per plane for each mission
			1.0, -- AIR_SUPERIORITY
			1.0, -- CAS		
			0.2, -- INTERCEPTION	
			1.0, -- STRATEGIC_BOMBER
			1.0, -- NAVAL_BOMBER	
			1.0, -- DROP_NUKE		
			1.0, -- PARADROP		
			0.75, -- NAVAL_KAMIKAZE	
			1.2, -- PORT_STRIKE		
			1.2, -- ATTACK_LOGISTICS
			1.0, -- AIR_SUPPLY		
			0.75, -- TRAINING
			1.0, -- NAVAL_MINES_PLANTING
			1.0, -- NAVAL_MINES_SWEEPING
			1.0, -- RECON
			1.0, -- NAVAL_PATROL
	    	0.0, -- BARRAGE
	    	0,0, -- NUCLEAR
	    	0,0, -- SAM
		},
		MAX_FUEL_FLOW_MULT = 1.0, -- max fuel flow ratio for planes, which will be multiplied by supply
		
		FUEL_COST_MULT = 0.35, -- fuel multiplier for all air missions
		
		MISSION_EFFICIENCY_MULT_AT_LACK_OF_FUEL = 0.25, 				-- multiplier for mission efficiency when a base lacks fuel
		
		BOMBING_TARGETING_RANDOM_FACTOR = 0.25,							-- % of picking the wrong target
		BOMBING_PROV_BUILD_PRIO_SCALE = 1.5,							-- Scale of the selected priority for provincial buildings
		BOMBING_STATE_BUILD_PRIO_SCALE = 1.5,							-- Scale of the selected priority for state buildings
		BOMBING_INFRA_PRIO_SCALE = 0.7,									-- Scale of the selected priority for infastryctyre
		NAVAL_MINES_PLANTING_SPEED_MULT = 0.025,						-- Value used to overall balance of the speed of planting naval mines
		NAVAL_MINES_SWEEPING_SPEED_MULT = 0.025,						-- Value used to overall balance of the speed of sweeping naval mines
		NON_CORE_STRATEGIC_IMPACT = 0.5,                                -- multiplier for strategic impact of non-core bombing	
		RECON_LAND_SPOT_CHANCE = 0.02,                     				-- scale factor on spotting lan

		REINFORCEMENT_DISABLING_DURATION_IN_LAND_CARRIER_TRANSFER = 48,	-- The reinforcement disabling duration in hours when transfering from land to carrier and vice versa

		THRUST_WEIGHT_AGILITY_FACTOR = 0.5,								-- For plane designs, additive agility bonus per point of thrust exceeding weight
		MAX_QUICK_WING_SELECTION = 3,									-- Max possible selection for airwing quick deploy

		USE_SINGLE_NAVAL_ARMAMENT_CATEGORY = true,						-- If true, only the armament module category that inflicts the greatest damage to naval targets will contribute naval strike and port strike mission specific stats. Only modules with both naval_strike_attack and naval_strike_targetting are considered. This is used to prevent torpedo_mounting and bomb_locks stats from stacking.

		PORT_STRIKE_DAMAGE_FACTOR = 1.0,								-- How much damage is dealt to ports during a port strike (per plane damage [complex number] * num flying planes * define)
	},

	NNavy = {
		-- Peace Conference
		WAR_SCORE_GAIN_FOR_SUNK_SHIP_MANPOWER_FACTOR = 0.02,			-- war score gained for every manpower killed when sinking a ship
		WAR_SCORE_GAIN_FOR_SUNK_SHIP_PRODUCTION_COST_FACTOR = 0.04,		-- war score gained for every IC of the sunk ship
		WAR_SCORE_GAIN_FOR_SUNK_CONVOY = 10.0,							-- war score gained for every sunk convoy
		WAR_SCORE_DECAY_FOR_BUILT_CONVOY = 5.0,  						-- war score deducted when convoy-raided enemy produces one new convoy
		PEACE_ACTION_TRANSFER_NAVY_EXPERIENCE_RETAINED = 0.25,			-- % of experience to retain after being transferred in a peace conference

		-- Convoy Priorities START
		NAVAL_INVASION_PRIORITY = 1,									-- Default convoy priority for naval invasions
		NAVAL_TRANSFER_PRIORITY = 1,									-- Default convoy priority for naval transports
		SUPPLY_PRIORITY = 2,											-- Default convoy priority for supplying units via sea
		RESOURCE_LENDLEASE_PRIORITY = 3,								-- Default convoy priority for export lend lease
		RESOURCE_EXPORT_PRIORITY = 4,									-- Default convoy priority for export trade
		RESOURCE_ORIGIN_PRIORITY = 5,									-- Default convoy priority for resources shipped internally
		RESOURCE_PURCHASE_PRIORITY = 6,									-- Default convoy priority for export equipment purchase
		-- Convoy Priorities END
		
		ADMIRAL_TASKFORCE_CAP = 10,										-- admirals will start getting penalties after this amount of taskforces
		
		DETECTION_CHANCE_MULT_BASE = 0.1,								-- base multiplier value for detection chance. Later the chance is an average between our detection and enemy visibility, mult by surface/sub detection chance in the following defines.
		DETECTION_CHANCE_MULT_RADAR_BONUS = 0.1,						-- detection chance bonus from radars. 
		DETECTION_CHANCE_MULT_AIR_SUPERIORITY_BONUS = 0.25,			-- bonus from air superiority.

		MAX_CAPITALS_PER_AUTO_TASK_FORCE = 5,							-- maximum number of capital ships the auto-task force creation will put together when designing SurfaceActionGroup
		MAX_SUBMARINES_PER_AUTO_TASK_FORCE = 30,						-- maximum number of submarines the auto-task force creation will put together when designing wolfpack
		BEST_CAPITALS_TO_CARRIER_RATIO = 1,							-- capitals / carriers ratio used when auto-task force creation designs CarrierTaskForce
		BEST_CAPITALS_TO_SCREENS_RATIO = 0.25, 							-- capitals / screens ratio used for creating FEX groups in naval combat
		COMBAT_BASE_HIT_CHANCE = 0.1,									-- base chance for hit

		COMBAT_MIN_HIT_CHANCE = 0.05,									-- never less hit chance then this?
		COMBAT_EVASION_TO_HIT_CHANCE = 0.007,							-- we take ship evasion stats, and mult by this value, so it gives hit chance reduction. So if reduction is 0.025 and ship evasion = 10, then there will be 0.25 (25%) lower hit chance. (Fe. 50% base -25% from evasion +10% bcoz it's very close).
		COMBAT_EVASION_TO_HIT_CHANCE_TORPEDO_MULT = 10.0,				-- the above evasion hit chance is multiplied by 400% if shooting with torpedos. Torpedoes are slow, so evasion matters more.
		MIN_HIT_PROFILE_MULT = 0.0,										-- largest hit profile penalty to hitting
		COMBAT_LOW_ORG_HIT_CHANCE_PENALTY = -0.5,						-- % of penalty applied to hit chance when ORG is very low.
		COMBAT_LOW_MANPOWER_HIT_CHANCE_PENALTY = -0.25,						-- % of penalty applied to hit chance when manpower is very low.
		COMBAT_DAMAGE_RANDOMNESS = 0.3,								-- random factor in damage. So if max damage is fe. 10, and randomness is 30%, then damage will be between 7-10.
		COMBAT_TORPEDO_CRITICAL_CHANCE = 0.2,							-- chance for critical hit from torpedo.
		COMBAT_TORPEDO_CRITICAL_DAMAGE_MULT = 2.0,						-- multiplier to damage when got critical hit from torpedo. (Critical hits are devastating as usualy torpedo_attack are pretty high base values).
		
		COMBAT_DAMAGE_TO_STR_FACTOR = 0.6,								-- casting damage value to ship strength multiplier. Use it ot balance the game difficulty.
		COMBAT_DAMAGE_TO_ORG_FACTOR = 1.0,							-- casting damage value to ship organisation multiplier. Use it to balance the game difficulty.
		
		NAVY_MAX_XP = 100,
		COMBAT_ON_THE_WAY_INIT_DISTANCE_BALANCE = 0.25, 					-- Value to balance initial distance to arrive for ships that are "on the way"	
		COMBAT_CHASE_RESIGNATION_HOURS = 8,								-- Before we resign chasing enemy, give them some minimum time so the combat doesn't end instantly.
    	UNDERWAY_REPLENISHMENT_PRIORITY = 7,					-- Default convoy priority for underway replenishment
 	    UNDERWAY_REPLENISHMENT_RANGE_FACTOR = 0.42,			-- bonus factor applied to task force's range when underway replenishment is activated (e.g. 0.2 means +20%)
	    UNDERWAY_REPLENISHMENT_CONVOY_COST_PER_FUEL = 0.42,	-- Cost in convoys for underway replenishment multiplied by max daily fuel consumption (rounded up)

		COMBAT_MAX_GROUPS = 1,										-- Max amount of "Fire Exchange" groups (FEX).
		COMBAT_MIN_DURATION = 8,										-- Min combat duration before we can retreat. It's a balancing variable so it's not possible to always run with our weak ships agains big flotillas.
		COMBAT_INITIAL_DURATION = 6,									-- Number of hours that is considered the "initial phase" of naval combat, used for modifiers like surprise attack during "initial combat"
		COMBAT_RETREAT_DECISION_CHANCE = 0.22, 							-- There is also random factor in deciding if we should retreat or not. That causes a delay in taking decision, that sooner or later will be picked. It's needed so damaged fast ships won't troll the combat.
		COMBAT_DETECTED_CONVOYS_FROM_SURFACE_DETECTION_STAT = 0.1,		-- Each 1.0 of surface_detection that ship has (equipment stat), gives x% of convoys discovered from total travelling along the route.
		COMBAT_BASE_CRITICAL_CHANCE = 0.1,								-- Base chance for receiving a critical chance. It get's scaled down with ship reliability.
		COMBAT_CRITICAL_DAMAGE_MULT = 5.0,								-- Multiplier for the critical damage. Scaled down with the ship reliability.
		COMBAT_ARMOR_PIERCING_CRITICAL_BONUS = 1.0,						-- Bonus to critical chance when shooter armor piercing is higher then target armor.
		COMBAT_ARMOR_PIERCING_DAMAGE_REDUCTION = -0.9,					-- All damage reduction % when target armor is >= then shooter armor piercing.
		REPAIR_AND_RETURN_PRIO_LOW = 0.2,								-- % of total Strength. When below, navy will go to home base to repair.
		REPAIR_AND_RETURN_PRIO_MEDIUM = 0.5,							-- % of total Strength. When below, navy will go to home base to repair.
		REPAIR_AND_RETURN_PRIO_HIGH = 0.9,								-- % of total Strength. When below, navy will go to home base to repair.
		REPAIR_AND_RETURN_PRIO_LOW_COMBAT = 0.6,						-- % of total Strength. When below, navy will go to home base to repair (in combat).
		REPAIR_AND_RETURN_PRIO_MEDIUM_COMBAT = 0.3,						-- % of total Strength. When below, navy will go to home base to repair (in combat).
		REPAIR_AND_RETURN_PRIO_HIGH_COMBAT = 0.1,						-- % of total Strength. When below, navy will go to home base to repair (in combat).
		REPAIR_AND_RETURN_AMOUNT_SHIPS_LOW = 0.2,						-- % of total damaged ships, that will be sent for repair-and-return in one call.
		REPAIR_AND_RETURN_AMOUNT_SHIPS_MEDIUM = 0.4,					-- % of total damaged ships, that will be sent for repair-and-return in one call.
		REPAIR_AND_RETURN_AMOUNT_SHIPS_HIGH = 0.8,						-- % of total damaged ships, that will be sent for repair-and-return in one call.
		REPAIR_AND_RETURN_UNIT_DYING_STR = 0.2,							-- Str below this point is considering a single ship "dying", and a high priority to send to repair.
		EXPERIENCE_LOSS_FACTOR = 1.00,                 					-- percentage of experienced solders who die when manpower is removed
		NAVY_EXPENSIVE_IC = 5500,										-- How much IC is considering the fleet to be expensive. Those expensive will triger the alert, when are on low STR.
		MISSION_MAX_REGIONS = 0,										-- Limit of the regions that can be assigned to naval mission. Set to 0 for unlimited.
		CONVOY_EFFICIENCY_LOSS_MODIFIER = 1.25,							-- How much efficiency drops when losing convoys. If modifier is 0.5, then losing 100% of convoys in short period, the efficiency will drop by 50%.
		CONVOY_EFFICIENCY_REGAIN_AFTER_DAYS = 7,						-- Convoy starts regaining it's efficiency after X days without any convoys being sink.
		CONVOY_EFFICIENCY_REGAIN_BASE_SPEED = 0.04,						-- How much efficiency regains every day.
		CONVOY_EFFICIENCY_MIN_VALUE = 0.05,								-- To avoid complete 0% efficiency, set the lower limit.
		ANTI_AIR_TARGETTING_TO_CHANCE = 0.2,							-- Balancing value to convert averaged equipment stats (anti_air_targetting and naval_strike_agility) to probability chances of airplane being hit by navies AA.
		CONVOY_ROUTE_SIZE_CONVOY_SCALE = 0.5,                           -- scales impact of convoy route size (0 to turn off)
		ANTI_AIR_ATTACK_TO_AMOUNT = 0.01,								-- Balancing value to convert equipment stat anti_air_attack to the random % value of airplanes being hit.
		CONVOY_SINKING_SPILLOVER = 0.5,                 				-- Damaged convoys roll for if they sink in the end of combat by accumulating the damage. This scales that chance. 
		UNIT_EXPERIENCE_PER_COMBAT_HOUR = 10,
		UNIT_EXPERIENCE_SCALE = 1,
		EXPERIENCE_FACTOR_CONVOY_ATTACK = 0.05,
		EXPERIENCE_FACTOR_NON_CARRIER_GAIN = 0.05,						-- Xp gain by non-carrier ships in the combat
		EXPERIENCE_FACTOR_CARRIER_GAIN = 0.1,							-- Xp gain by carrier ships in the combat
		FIELD_EXPERIENCE_SCALE = 0.075,
		FIELD_EXPERIENCE_MAX_PER_DAY = 50,								-- Most xp you can gain per day
		LEADER_EXPERIENCE_SCALE = 1.0,
		BATTLE_NAME_VP_FACTOR = 100,									-- Name is given by ((VP value) * BATTLE_NAME_VP_FACTOR) / (Distance VP -> battle)
		BATTLE_NAME_VP_CUTOFF = 1.0,									-- If best score of above calculation is below this, name will be that of region.
		AMPHIBIOUS_LANDING_PENALTY = -0.7,								-- amphibious landing penalty
		AMPHIBIOUS_INVADE_SPEED_BASE = 0.5, 							-- every hour movement progress on amphibious invasion
		AMPHIBIOUS_INVADE_MOVEMENT_COST = 24.0, 						-- total progress cost of movement while amphibious invading
		AMPHIBIOUS_INVADE_ATTACK_LOW = 0.2, 							-- low and high cap of attack modifier scale. Scale interpolated by invasion progress.
		AMPHIBIOUS_INVADE_ATTACK_HIGH = 1.0,
		AMPHIBIOUS_INVADE_DEFEND_LOW = 1.5, 							-- low and high cap of defend modifier scale. Scale interpolated by invasion progress.
		AMPHIBIOUS_INVADE_DEFEND_HIGH = 1.0,
		AMPHIBIOUS_INVADE_LANDING_PENALTY_DECREASE = 3.5, 				-- scale of bonus that decreases "amphibious penalty" during combat, relative to invading transporter tech.
		BASE_CARRIER_SORTIE_EFFICIENCY = 0.5,							-- factor of planes that can sortie by default from a carrier
		CONVOY_ATTACK_BASE_FACTOR = 0.15,                               -- base % of convoys that get intercepted
		NAVAL_SPEED_MODIFIER = 0.1,	                    				-- basic speed control
		NAVAL_RANGE_TO_INGAME_DISTANCE = 0.12,							-- Scale the ship stats "naval_range" to the ingame distance
		NAVAL_INVASION_PREPARE_HOURS = 168,								-- base hours needed to prepare an invasion
		NAVAL_COMBAT_RESULT_TIMEOUT_YEARS = 2,							-- after that many years, we clear the naval combat results, so they don't get stuck forever in the memory.
		CONVOY_LOSS_HISTORY_TIMEOUT_MONTHS = 24,						-- after this many months remove the history of lost convoys to not bloat savegames and memory since there is no way to see them anyway
		NAVAL_TRANSFER_BASE_SPEED = 6,                                  -- base speed of units on water being transported
		NAVAL_TRANSFER_BASE_NAVAL_DIST_ADD = 100,						-- Extra cost for naval movement ( compared to land movement ) when deciding what ports to use for a naval transfer
		NAVAL_TRANSFER_BASE_NAVAL_DIST_MULT = 20,						-- Multiplier for the cost of naval movement ( compared to land movement ) when deciding what ports to use for naval transfer
		NAVAL_SUPREMACY_CAN_INVADE = 0.25,								-- required naval supremacy to perform invasions on an area
		CARRIER_STACK_PENALTY = 4,										-- The most efficient is 4 carriers in combat. 5+ brings the penalty to the amount of wings in battle.
		CARRIER_STACK_PENALTY_EFFECT = 0.2,								-- Each carrier above the optimal amount decreases the amount of airplanes being able to takeoff by such %.
		SHORE_BOMBARDMENT_CAP = 0.5,
		ANTI_AIR_TARGETING = 0.9,                                       -- how good ships are at hitting aircraft
		MIN_TRACTED_ASSIST_DAMAGE_RATIO = 0.05,							-- How much damage counts as assist damage
		SUPPLY_NEED_FACTOR = 4,										    -- multiplies supply usage
		DECRYPTION_SPOTTING_BONUS = 0.2,
		DISBAND_MANPOWER_LOSS = 0.0,
		MANPOWER_LOSS_RATIO_ON_SUNK = 0.5,								-- sunk ships will lose this ratio of their current manpower
		MANPOWER_LOSS_RATIO_ON_STR_LOSS = 0.5,							-- losing strength will make you also lose manpower at this ratio of total manpower
		MIN_MANPOWER_RATIO_TO_DROP = 0.1,								-- ships will not lose man power to below this ratio
		DAILY_MANPOWER_GAIN_RATIO = 0.05,								-- the ships not in combat will be able to gain this ratio of their max manpower
		PRIDE_OF_THE_FLEET_UNASSIGN_COST = 100,							-- cost to unassign/replace pride of the fleet
		PRIDE_OF_THE_FLEET_LOST_TEMP_MODIFIER_DURATION = 30,			-- duration for temp modifiers that you get when you lose your pride of the fleet
		XP_GAIN_FACTOR = 0.25,	   			   							-- xp gain factor for navy

		NAVAL_TRANSFER_DAMAGE_REDUCTION = 0.25,							-- its hard to specifically balance 1-tick naval strikes vs unit transports so here is a factor for it
		CARRIER_ONLY_COMBAT_ACTIVATE_TIME = 0,							-- hours from start of combat when carriers get to fight
		CAPITAL_ONLY_COMBAT_ACTIVATE_TIME = 4,                          -- hours from start of combat when only carriers, capitals and subs get to attack
		ALL_SHIPS_ACTIVATE_TIME = 8,                                    -- hours where all get to attack
		
		MINIMUM_SHIP_SPEED = 1.0,										-- slowest speed a ship can have
		
		REPAIR_SPLIT_TASKFORCE_SIZE = 5,								-- if a country does not have empty naval naval bases for repairs, it will split ships with this sizes and distribute them around
		NAVY_REPAIR_BASE_SEARCH_SCORE_PER_SHIP_WAITING_EXTRA_SHIP = 5,  -- if a naval base has more ships than it can repair, it will get penalties
		NAVY_REPAIR_BASE_SEARCH_SCORE_PER_SLOT = 1.0,					-- while searching for a naval base for repairs, the bases gets a bonus to their scores per empty slot they have
		NAVY_REPAIR_BASE_SEARCH_BOOST_FOR_SAME_COUNTRY = 5,				-- while searching for a naval base for repairs, your own bases gets a bonus
		

		CONVOY_SPOTTING_COOLDOWN = 0.3,  -- % of travel time 
		CONVOY_SPOTTING_COOLDOWN_MIN = 36, -- minimum cooldown time
		CONVOY_SPOTTING_COOLDOWN_MAX = 168, -- maximum cooldown time
		CONVOY_SPOTTING_COOLDOWN_MIN_FROM_EFFICIENCY = 15, -- clamped min value after screening efficiency has been applied

		MISSION_FUEL_COSTS = {  -- fuel cost for each mission
			0.0, -- HOLD (consumes fuel HOLD_MISSION_MOVEMENT_COST fuel while moving)
			1.0, -- PATROL		
			1.0, -- STRIKE FORCE (does not cost fuel at base, and uses IN_COMBAT_FUEL_COST in combat. this is just for the movement in between)	
			1.0, -- CONVOY RAIDING
			1.0, -- CONVOY ESCORT
			1.0, -- MINES PLANTING	
			1.0, -- MINES SWEEPING	
			0.8, -- TRAIN
			0.0, -- RESERVE_FLEET (consumes fuel HOLD_MISSION_MOVEMENT_COST fuel while moving)
			1.0, -- NAVAL_INVASION_SUPPORT (does not cost fuel at base, only costs while doing bombardment and escorting units)
		},
		
		HOLD_MISSION_MOVEMENT_COST = 1.0,								-- ships on hold cost this much fuel while moving
		ON_BASE_FUEL_COST = 0.0,										-- ships that waits at naval bases cost this ratio
		IN_COMBAT_FUEL_COST = 2.0,										-- ships in combat will get this ratio for fuel cost
		TRAINING_FUEL_COST_FOR_ESCORT_SHIPS = 0.15,						-- ships that are on training mission but not training (ie they are at max xp and training will cancel at max xp) will consume this ratio of fuel
		
		MAX_FUEL_FLOW_MULT = 2.0, -- max fuel flow ratio for ships, which will be multiplied by supply
		FUEL_COST_MULT = 0.10, -- fuel multiplier for all naval missions
		
		OUT_OF_FUEL_SPEED_FACTOR = -0.75,
		OUT_OF_FUEL_RANGE_FACTOR = -0.75,
		OUT_OF_FUEL_ATTACK_FACTOR = -0.5,
		OUT_OF_FUEL_TORPEDO_FACTOR = -0.8,

		MISSION_SPREADS = {  -- mission spreads in the case a ship join combat, which is calculated for number of ships that will be in combat. 1 means no ship will be at start
			0.0, -- HOLD 
			0.0, -- PATROL		
			0.0, -- STRIKE FORCE 
			0.0, -- CONVOY RAIDING
			0.0, -- CONVOY ESCORT
			0.7, -- MINES PLANTING	
			0.7, -- MINES SWEEPING	
			0.5, -- TRAIN
			0.0, -- RESERVE_FLEET
			0.0, -- NAVAL_INVASION_SUPPORT
		},
		MISSION_DEFAULT_SPREAD_BASE = 1.0, -- multiplier for mission spreads. higher = less ships on start

		AGGRESSION_SETTINGS_VALUES = { -- ships will use this values while deciding to attack enemies
			0,		-- do not engage
			0.5,	-- low
			0.9,	-- medium
			2.0,	-- high
			10000,	-- I am death incarnate!
		},
		
		AGGRESION_MULTIPLIER_FOR_COMBAT = 1.2,				-- ships are more aggresive in combat
		
		AGGRESSION_ARMOR_EFFICIENCY_MULTIPLIER = 1.0,		-- armor to enemy piercing ratio is multiplied by this value, which will increase the strength of ships while considering them for aggression
		AGGRESSION_MIN_ARMOR_EFFICIENCY = 0.5,              -- armor multiplier has a min and max caps while being factored in aggression
		AGGRESSION_MAX_ARMOR_EFFICIENCY = 1.5,              -- armor multiplier has a min and max caps while being factored in aggression
		
		AGGRESSION_LIGHT_GUN_EFFICIENCY_ON_LIGHT_SHIPS = 1.0, -- ratio for scoring for different gun types against light ships
		AGGRESSION_HEAVY_GUN_EFFICIENCY_ON_LIGHT_SHIPS = 0.25,-- ratio for scoring for different gun types against light ships
		AGGRESSION_TORPEDO_EFFICIENCY_ON_LIGHT_SHIPS = 0.1,   -- ratio for scoring for different gun types against light ships
		
		AGGRESSION_LIGHT_GUN_EFFICIENCY_ON_HEAVY_SHIPS = 0.1, -- ratio for scoring for different gun types against heavy ships
		AGGRESSION_HEAVY_GUN_EFFICIENCY_ON_HEAVY_SHIPS = 1.0, -- ratio for scoring for different gun types against heavy ships
		AGGRESSION_TORPEDO_EFFICIENCY_ON_HEAVY_SHIPS = 1.1,   -- ratio for scoring for different gun types against heavy ships
		
		AGGRESSION_CONVOY_STRENGTH_FACTOR = 0.3,			  -- convoys in combat gets a penalty to their strength in aggression calculations
		
		SUBMARINE_ESCAPE_RATIOS = { -- subs will escape battle in convoy raid if there are enemies that can attack
			1000,     -- do not engage
			15,   -- low
			3.0,   -- medium
			1.0,   -- high
			0.1,   -- I am death incarnate!
		},
		
		MIN_REPAIR_FOR_JOINING_COMBATS = { -- strikeforces/patrol forces will not join combats if they are not repaired enough
			0.0,	-- do not repair
			0.5,	-- low
			0.7,	-- medium
			0.9,	-- high
		},
		
		ORG_COST_WHILE_MOVING = { -- org cost while the ships are moving
			0.3, -- HOLD
			0.2, -- PATROL		
			0.25, -- STRIKE FORCE 
			0.2, -- CONVOY RAIDING
			0.2, -- CONVOY ESCORT
			0.2, -- MINES PLANTING	
			0.2, -- MINES SWEEPING	
			0.2, -- TRAIN
			0.3, -- RESERVE_FLEET
			0.2, -- NAVAL_INVASION_SUPPORT
		},
		
		ORG_COST_WHILE_MOVING_IN_MISSION_ZONE = { -- org cost while moving in mission zone
			0.0, -- HOLD
			0.0, -- PATROL
			0.0, -- STRIKE FORCE
			0.0, -- CONVOY RAIDING
			0.0, -- CONVOY ESCORT
			0.0, -- MINES PLANTING
			0.0, -- MINES SWEEPING
			0.0, -- TRAIN
			0.0, -- RESERVE_FLEET
			0.0, -- NAVAL_INVASION_SUPPORT
		},
		
		MAX_ORG_ON_MANUAL_MOVE = 0.66,	-- org will clamped to this ratio on manual move
		MIN_ORG_ON_MANUAL_MOVE = 0.1,	-- org will clamped to this ratio on manual move
		
		INITIAL_ALLOWED_DOCKYARD_RATIO_FOR_REPAIRS = 0.25,				-- initially countries will allocate this ratio of dockyards for repairs
		
		
		MISSION_SUPREMACY_RATIOS = { -- supremacy multipliers for different mission types
			0.0, -- HOLD
			1.0, -- PATROL		
			1.0, -- STRIKE FORCE 
			0.5, -- CONVOY RAIDING
			0.5, -- CONVOY ESCORT
			0.3, -- MINES PLANTING	
			0.3, -- MINES SWEEPING	
			0.0, -- TRAIN
			0.0, -- RESERVE_FLEET
			2.5, -- NAVAL_INVASION_SUPPORT
		},
		
		SUPREMACY_PER_SHIP_PER_MANPOWER = 0.5,							-- supremacy of a ship is calculated using its IC, manpower and a base define
		SUPREMACY_PER_SHIP_PER_IC = 0.1,
		SUPREMACY_PER_SHIP_BASE = 500.0,

		NAVAL_MINES_IN_REGION_MAX = 1000.0,								-- Max number of mines that can be layed by the ships. The value should be hidden from the user, as we present % so it's an abstract value that should be used for balancing.
		NAVAL_MINES_PLANTING_SPEED_MULT = 0.01,						-- Value used to overall balance of the speed of planting naval mines
		NAVAL_MINES_SWEEPING_SPEED_MULT = 0.009,						-- Value used to overall balance of the speed of sweeping naval mines
		NAVAL_MINES_DECAY_AT_PEACE_TIME = 0.25,							-- How fast mines are decaying in peace time. Planting mines in peace time may be exploitable, so it's blocked atm. That's why after war we should decay them too.
		NAVAL_MINES_SWEEPERS_REDUCTION_ON_PENALTY_EFFECT = 3.3,			-- How much is the task force's sweeping attribute reducing the penalty effect.
		NAVAL_MINES_INTEL_DIFF_FACTOR = 0.1,					-- Better our decryption over enemy encryption will reduce the penalties from the enemy mines in the region. This value is a factor to be used for balancing.
		NAVAL_MINES_NAVAL_SUPREMACY_FACTOR = 1.0,						-- Factor for max amount of mines increasing naval supremacy
		
		ATTRITION_WHILE_MOVING_FACTOR = 1.5,							-- attrition multiplier while moving & doing missions
		ATTRITION_DAMAGE_ORG = 0.01,					   				-- damage from attrition to Organisation (relative to max org)
		ATTRITION_DAMAGE_STR = 0.03,					   				-- damage from attrition to str (relative to max str)
		ATTRITION_STR_DAMAGE_CHANCE = 0.2,								-- chance to get damaged at highest attrition
			
		NAVAL_ACCIDENT_CHANCE_REDUCTION_ON_POTF = 0.01,					-- Scale of the current chance for an accident to happen, applied for the pride of the fleet.
		NAVAL_ACCIDENT_CRITICAL_HIT_CHANCE_REDUCTION_POTF = 0.01,		-- Scale of the current chance for a critical hit when an accident happens, applied for the pride of the fleet.

		NAVAL_MINES_ACCIDENT_CRITICAL_HIT_CHANCES = 0.14,				-- If an accident happens, how likely it is to be a critical hit (caused by naval mines)
		NAVAL_MINES_ACCIDENT_CRITICAL_HIT_DAMAGE_SCALE = 5.0,			-- Scale the value below in case of critical hit (caused by naval mines)
		NAVAL_MINES_ACCIDENT_STRENGTH_LOSS = 75.0,						-- Amount of strength loss when hit by naval mine
		NAVAL_MINES_ACCIDENT_ORG_LOSS_FACTOR = 0.6,						-- Amount of strength loss when hit by naval mine

		TRAINING_ACCIDENT_CHANCES = 0.02,						-- Chances one ship get damage each hour while on training 
		TRAINING_ACCIDENT_CRITICAL_HIT_CHANCES = 0.3,					-- If an accident happens, how likely it is to be a critical hit
		TRAINING_ACCIDENT_CRITICAL_HIT_DAMAGE_SCALE = 4.0,				-- Scale the value below in case of critical hit
		TRAINING_ACCIDENT_STRENGTH_LOSS = 4.0,							-- Amount of strength loss in a training accident
		TRAINING_ACCIDENT_STRENGTH_LOSS_FACTOR = 0.05,						-- Amount of strength loss in a training accident, propotional to the maximum strength of the ship
		TRAINING_ACCIDENT_ORG_LOSS_FACTOR = 0.3,						-- Amount of current organization the ship lose

		ACCIDENTS_CHANCE_BALANCE_FACTOR = 0.04,							-- General chance for naval accidents for balancing the gameplay.

																		-- The Formula: Min( TRAINING_MAX_DAILY_COUNTRY_EXP * Ratio, TRAINING_DAILY_COUNTRY_EXP_FACTOR * ( TRAINING_DAILY_COUNTRY_EXP_SHIP_RATIO_FACTOR * TrainingShipCount / CountryShipCount 
																		--              + TRAINING_DAILY_COUNTRY_EXP_MANPOWER_FACTOR * Manpower + TRAINING_DAILY_COUNTRY_EXP_MANPOWER_RATIO_FACTOR * Manpower / CountryShipCount ) ) 
		TRAINING_EXPERIENCE_FACTOR = 0.01,								-- Amount of exp each ship gain every 24h while training (before modifiers)
		TRAINING_DAILY_COUNTRY_EXP_FACTOR = 0.001,						-- Factor used to scale the Daily Country Navy XP gain
		TRAINING_DAILY_COUNTRY_EXP_MANPOWER_FACTOR = 0.01,					-- Factor used to scale the sum of the training manpower for the Daily Country Navy XP gain
		TRAINING_DAILY_COUNTRY_EXP_MANPOWER_RATIO_FACTOR = 0.01,				-- Factor used to scale the sum of the manpower divided by the country's number of ship for the Daily Country Navy XP gain
		TRAINING_DAILY_COUNTRY_EXP_SHIP_RATIO_FACTOR = 100.0,					-- Factor used to scale the ratio of training ships for the Daily Country Navy XP gain
		TRAINING_MAX_DAILY_COUNTRY_EXP = 1.0,							-- Maximum navy XP daily gain
		TRAINING_MIN_STRENGTH = 0.1,									-- if strength is less than this, the unit will not contribute to training and cant be damaged by training
		
		TRAINING_ORG = 0.2,												-- max organization on traiaing mission

		BASE_SPOTTING = 1,												-- base spotting percentage for navy
		BASE_SPOTTING_FROM_RADAR = 5,									-- base spotting percentage that comes from full radar coverage
		NAVY_SPOTTER_DETECTION_FACTOR = 0.1,							-- multiplier for task forces' detection value before logistic transform
		BASE_SPOTTING_FROM_NAVY = 10,									-- base spotting percentage that comes from task forces in area
		AIR_SPOTTER_NORMALIZED_AIRWING_SIZE = 100,						-- each plane will contribute 1/this of the air-wing's detection stat
		AIR_SPOTTER_DETECTION_FACTOR = 0.025,							-- multiplier for air-wings' detection value before logistic transform
		BASE_SPOTTING_FROM_AIR = 20,									-- base spotting percentage that comes from air-wings in area
		BASE_SPOTTING_FROM_DECRYPTION = 10,								-- base spotting percentage that comes from decryption, can go negative (enemy decryption is subtracted)
		MIN_SPOTTING_PROGRESS = 0.01,									-- Minimum spotting progress (in percent) per hourly tick
		AIR_MISSION_SPOTTING_FACTORS = {								-- Multiplier for air-wings' spotting contribution per mission type
			0.50, -- AIR_SUPERIORITY
			0, -- CAS
			0.25, -- INTERCEPTION
			0, -- STRATEGIC_BOMBER
			0.50, -- NAVAL_BOMBER
			0, -- DROP_NUKE
			0, -- PARADROP
			0.25, -- NAVAL_KAMIKAZE
			0, -- PORT_STRIKE
			0, -- ATTACK_LOGISTICS
			0, -- AIR_SUPPLY
			0, -- TRAINING
			0.25, -- NAVAL_MINES_PLANTING
			0.50, -- NAVAL_MINES_SWEEPING
			1.00, -- RECON
			1.50, -- NAVAL_PATROL
		},
		
		MIN_HOURS_TO_SHUFFLE_NEWLY_ASSIGNED_PATROLS = 7 * 24,			-- if a fleet has less patrol than it needs to cover all of it areas, it will shuffle the patrols around. it will wait this much hour before shuffling a task force to new area
		SPOTTING_ENEMY_SPOTTING_MULTIPLIER_FOR_RUNNING_AWAY = 0.80,		-- enemy spotting is multiplied by this value to simulate running away
		SPOTTING_MULTIPLIER_FOR_SURFACE = 1.0,							-- task force surface spotting value is multiplied by this and added to spotting percentage every hour
		SPOTTING_MULTIPLIER_FOR_SUB = 1.0,								-- task force sub spotting value is multiplied by this and added to spotting percentage every hour
		SPOTTING_SPEED_MULT_FOR_RUNNING_AWAY = 0.5,						-- task forces that does not want to engage will reduce enemy spotting rate every hour by speed diff mult this ratio
		SPOTTING_SPEED_MULT_FOR_CATCHING_UP = 0.2,						-- speed diff bonus rate that is added to spotting every hour
		SPOTTING_MISSION_DETECTION_THRESHOLD_LOW = 10.0,					-- value between 0 and 100 above which to show very coarse information about the spotted task force
		SPOTTING_MISSION_DETECTION_THRESHOLD_MEDIUM = 70.0,					-- value between 0 and 100 above which to show coarse information about the spotted task force. Note: accurate information are shown when spotting reach 100.
		NAVY_VISIBILITY_BONUS_ON_RETURN_FOR_REPAIR = 0.9,				-- Multiplier for the surface/sub visiblity when the heavily damaged fleet is returning to the home base for reparation. 1.0 = no bonus. 0.0 = invisible.
		VISIBILITY_MULTIPLIER_FOR_SPOTTING = 0.1,						-- multiplier for visibility stat
		INTEL_LEVEL_LOW_HALF_RANGE_PERCENTAGE = 5,							-- Integer representing the maximum offset of the displayed value to the original, in percentage (divided by 100 in code). For spotting level "low".
		INTEL_LEVEL_MEDIUM_HALF_RANGE_PERCENTAGE = 10,							-- Same as above but for the spotting level "medium"
		INTEL_LEVEL_LOW_HALF_RANGE_MIN_SHIPS = 3,							-- If the percentage of the value is lower than this, use this value instead. For spotting level "low"
		INTEL_LEVEL_LOW_HALF_RANGE_MIN_CAPITALS = 1,							-- Same as above but for capital ships
		INTEL_LEVEL_MEDIUM_HALF_RANGE_MIN_SHIPS = 1,							-- If the percentage of the value is lower than this, use this value instead. For spotting level "medium"
		INTEL_LEVEL_MEDIUM_HALF_RANGE_MIN_CAPITALS = 1,							-- Same as above but for capital ships. NOTE: overriden to 0 if the total number of ships in the task force is less than four.
		INTEL_LEVEL_LOW_STRENGTH_ESTIMATE_HALF_RANGE_PERCENTAGE = 20,					-- Integer representing the maximum offset of the estimated enemy strength to the original, in percentage (divided by 100 in code). For spotting level "low".
		INTEL_LEVEL_MEDIUM_STRENGTH_ESTIMATE_HALF_RANGE_PERCENTAGE = 10,					-- Same as above for spotting level "medium"
		BASE_SPOTTING_SPEED = 0.0,										-- daily base spotting speed
		BASE_ESCAPE_SPEED = 0.065,										-- daily base escape speed (gained as percentagE)
		SPEED_TO_ESCAPE_SPEED = 0.75,									-- ratio to converstion from ship speed to escape speed (divided by hundred)
		ESCAPE_SPEED_PER_COMBAT_DAY = 0.01,								-- daily increase in escape speed during combat duration
		MAX_ESCAPE_SPEED_FROM_COMBAT_DURATION = 0.15,					-- max escape speed that will be gained from combat duration
		ESCAPE_SPEED_SUB_BASE = 0.08,									-- subs get faster escape speed. gets replaced by hidden version below if hidden
		ESCAPE_SPEED_HIDDEN_SUB = 0.25,									-- hidden subs get faster escape speed

		SUB_DETECTION_CHANCE_BASE = 5,									-- to start spotting a submarine, a dice is rolled and checked if it succeeds this percentage. if not, that enemy sub force won't be spotted on this tick
		SUB_DETECTION_CHANCE_BASE_SPOTTING_EFFECT = 0.5,				-- effect of base spotting for initial spotting of pure submarine forces. this along with next value is added together and rolled against a random to start spotting
		SUB_DETECTION_CHANCE_SPOTTING_SPEED_EFFECT = 2.0,				-- effect of spotting speed for initial spotting of pure submarine forces. this along with prev value is added together and rolled against a random to start spotting
		SUB_DETECTION_CHANCE_BASE_SPOTTING_POW_EFFECT = 1.5,			-- effect of spotting speed will be powered by this for initial spotting of pure submarine forces. this along with prev value is added together and rolled against a random to start spotting
		
		BASE_CONVOY_SPOTTING_SPEED = 0.0,								-- daily base spotting speed against convoys
		BASE_UNIT_TRANSFER_SPOTTING_SPEED = 0.0,						-- daily base spotting speed against unit trans
		BASE_NAVAL_INVASION_SPOTTING_SPEED = 0.0,						-- daily base spotting speed against unit transfers

		CONVOY_SPOTTING_SPEED_MULT = 1.0,								-- spotting speed mult against convoys
		UNIT_TRANSFER_SPOTTING_SPEED_MULT = 5.0,						-- spotting speed mult against unit transfers
		NAVAL_INVASION_SPOTTING_SPEED_MULT = 10.0,						-- spotting speed mult against naval invasion armies
		
		
		CONVOY_DETECTION_CHANCE_BASE = 4.12,							-- regular convoy base chance detection percentage (if this fails, no detection is done on that tick)
		BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING = 0.05,		-- effect of base convoy spotting for initial spotting of regular convoys. this along with next value is added together and rolled a random  once for every convoy to check for spotting
		SPOTTING_SPEED_EFFECT_FOR_INITIAL_CONVOY_SPOTTING = 0.50,		-- effect of convoy spotting speed for initial spotting of regular convoys. this along with prev value is added together and rolled a random once for every convoy to check for spotting
		SPOTTING_MOD_FOR_CONVOY_COUNT = 0.2,							-- a modifier for scaling the count of convoys on a parabolic curve (counvoy_count ^ SPOTTING_MOD_FOR_CONVOY_COUNT)

		UNIT_TRANSFER_DETECTION_CHANCE_BASE = 8.0,						-- unit transfer and naval invasion base chance detection percentage (if this fails, no detection is done on that tick)
		BASE_SPOTTING_EFFECT_FOR_INITIAL_UNIT_TRANSFER_SPOTTING = 10.0,	-- same as BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval transfer convoys
		SPOTTING_SPEED_EFFECT_FOR_INITIAL_UNIT_TRANSFER_SPOTTING = 20.0, -- same as SPOTTING_SPEED_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval transfer convoys
		BASE_SPOTTING_EFFECT_FOR_INITIAL_NAVAL_INVASION_SPOTTING = 2.4,    -- same as BASE_SPOTTING_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval invasion convoys
		SPOTTING_SPEED_EFFECT_FOR_INITIAL_NAVAL_INVASION_SPOTTING = 0.12,  -- same as SPOTTING_SPEED_EFFECT_FOR_INITIAL_CONVOY_SPOTTING, but for naval invasion convoys
		
		MIN_GUN_COOLDOWN = 0.1,											-- minimum cooldown for a gun	
		BASE_GUN_COOLDOWNS = { -- number of hours for a gun to be ready after shooting
			1.0,	-- big guns
			4.0,	-- torpedos
			1.0,	-- small guns
		},
		
		BASE_JOIN_COMBAT_HOURS						= 8,				-- the taskforces that wants to join existing combats will wait for at least this amount
		LOW_ORG_FACTOR_ON_JOIN_COMBAT_DURATION		= 4.0,				-- low org of the ships will be factored in when a taskforce wants to join combat
			
		BASE_POSITIONING												= 1.0,	-- base value for positioning
		
		RELATIVE_SURFACE_DETECTION_TO_POSITIONING_FACTOR				= 0.01,	-- multiples the surface detection difference between two sides. the side with higher detection will get a bonus of this value
		MAX_POSITIONING_BONUS_FROM_SURFACE_DETECTION					= 0.0,  -- will clamp the bonus that you get from detection
		
		HIGHER_SHIP_RATIO_POSITIONING_PENALTY_FACTOR					= 0.25, -- if one side has more ships than the other, that side will get this penalty for each +100% ship ratio it has
		MAX_POSITIONING_PENALTY_FROM_HIGHER_SHIP_RATIO					= 0.5,  -- maximum penalty to get from larger fleets

		HIGHER_CARRIER_RATIO_POSITIONING_PENALTY_FACTOR					= 0.2;  -- penalty if other side has stronger carrier air force 
		MAX_CARRIER_RATIO_POSITIONING_PENALTY_FACTOR 					= 0.2;  -- max penalty from stronger carrier air force
		
		POSITIONING_PENALTY_FOR_SHIPS_JOINED_COMBAT_AFTER_IT_STARTS		= 0.05, -- each ship that joins the combat will have this penalty to be added into positioning
		MAX_POSITIONING_PENALTY_FOR_NEWLY_JOINED_SHIPS 					= 0.5,  -- the accumulated penalty from new ships will be clamped to this value
		POSITIONING_PENALTY_HOURLY_DECAY_FOR_NEWLY_JOINED_SHIPS			= 0.002,-- the accumulated penalty from new ships will decay hourly by this value
		
		DAMAGE_PENALTY_ON_MINIMUM_POSITIONING 							= 0.5,	-- damage penalty at 0% positioning
		SCREENING_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING				= 0.5,  -- screening efficiency (screen to capital ratio) at 0% positioning
		AA_EFFICIENCY_PENALTY_ON_MINIMUM_POSITIONING					= 0.7,  -- AA penalty at 0% positioning
		SUBMARINE_REVEAL_ON_MINIMUM_POSITIONING                         = 2.0,  -- submarine reveal change on 0% positioning 
		
		SHIP_TO_FLEET_ANTI_AIR_RATIO									= 0.2,	-- total sum of fleet's anti air will be multiplied with this ratio and added to calculations anti-air of individual ships while air damage reduction
		
		ANTI_AIR_POW_ON_INCOMING_AIR_DAMAGE								= 0.2,	-- received air damage is calculated using following: 1 - ( (ship_anti_air + fleet_anti_air * SHIP_TO_FLEET_ANTI_AIR_RATIO )^ANTI_AIR_POW_ON_INCOMING_AIR_DAMAGE ) * ANTI_AIR_MULT_ON_INCOMING_AIR_DAMAGE
		ANTI_AIR_MULT_ON_INCOMING_AIR_DAMAGE							= 0.15,
		
		MAX_ANTI_AIR_REDUCTION_EFFECT_ON_INCOMING_AIR_DAMAGE 			= 0.5,	-- damage reduction for incoming air attacks is clamped to this value at maximum.
		
		CHANCE_TO_DAMAGE_PART_ON_CRITICAL_HIT							= 0.1,	-- the game will roll between 0-1 and will damage a random part if below this val on naval critical hits
		CHANCE_TO_DAMAGE_PART_ON_CRITICAL_HIT_FROM_AIR					= 0.1,	-- the game will roll between 0-1 and will damage a random part if below this val on air critical hits
		
		SCREEN_RATIO_FOR_FULL_SCREENING_FOR_CAPITALS 					= 3.0,	-- this screen ratio to num capital/carriers is needed for full screening beyond screen line
		SCREEN_RATIO_FOR_FULL_SCREENING_FOR_CONVOYS 					= 0.5,	-- this screen ratio to num convoys is needed for full screening beyond screen line
		CAPITAL_RATIO_FOR_FULL_SCREENING_FOR_CARRIERS 					= 1.0,  -- this capital ratio to num carriers is needed for full screening beyond screen line
		CAPITAL_RATIO_FOR_FULL_SCREENING_FOR_CONVOYS 					= 0.25,  -- this capital ratio to num convoys is needed for full screening beyond screen line
		
		TASK_FORCE_ROLE_TO_INSIGNIA = {								-- define the index of the insignia to use for a task force designed for a specific role
			6,	-- Role undefined
			15,	-- Wolfpack
			22,	-- Carrier task force
			26,	-- Surface action group
			16,	-- Mine layers
			17,	-- Mine sweepers
			29,	-- Patrol task force
			1,	-- Convoy escort
		},

		-- NOTE: you can see the effect of changing the values down below by running the command tfria with a task force selected
		MIN_SHIP_COUNT_FOR_TASK_FORCE_ROLE_ASSIGNMENT = 4,					-- define the minimum number of ship that should be in a task force for it to be considered a patrol or an escort task force (used to the insignia assignment, see TASK_FORCE_ROLE_TO_INSIGNIA)
    	MIN_SHIPS_FOR_HIGHER_SHIP_RATIO_PENALTY                         = 0,    -- the minimum fleet size in ships that a fleet must be before having the large fleet penalty applied to them
		SURFACE_DETECTION_STAT_FOR_SHIP_TO_BE_PATROL = 16,					-- amount of surface detection required for a ship to be considered as part of a patrol task force
		DEPTH_CHARGE_STAT_FOR_SHIP_TO_BE_SUB_HUNTER = 15,					-- amount of depth charge required for a ship to be considred a sub hunter and so good for convoy escort
		SUB_DETECTION_STAT_FOR_SHIP_TO_BE_SUB_HUNTER = 2,					-- amount of sub detection required for a ship to be considered a sub hunter

		HEAVY_GUN_ATTACK_TO_SHORE_BOMBARDMENT							= 0.1,  -- heavy gun attack value is divided by this value * 100 and added to shore bombardment modifier 
		LIGHT_GUN_ATTACK_TO_SHORE_BOMBARDMENT							= 0.05, -- light gun attack value is divided by this value * 100 and added to shore bombardment modifier 

		GUN_HIT_PROFILES = { -- hit profiles for guns, if target ih profile is lower the gun will have lower accuracy
			90.0,	-- big guns
			145.0,	-- torpedos
			40.0,	-- small guns
		},
		
		DEPTH_CHARGES_HIT_CHANCE_MULT 									= 1.1, 		-- multiplies hit chance of small guns
		DEPTH_CHARGES_DAMAGE_MULT 										= 0.7, 		-- multiplies damage of depth charges
		DEPTH_CHARGES_HIT_PROFILE 										= 100.0,	-- hit profile for depth charges	
		
		CONVOY_HIT_PROFILE												= 120.0,  	-- convoys has this contant hit profile
		HIT_PROFILE_MULT 												= 50.0,  	-- multiplies hit profile of every ship
		HIT_PROFILE_SPEED_FACTOR										= 0.5,		-- factors speed value when determining it profile (Vis * HIT_PROFILE_MULT * Ship Hit Profile Mult)
		HIT_PROFILE_SPEED_BASE											= 20,		-- Base value added to hitprofile speed calulation
		
		CONVOY_RAID_MAX_REGION_TO_TASKFORCE_RATIO						= 1.5,		-- each taskforce in convoy raid mission can at most cover this many regions without losing efficiency
		CONVOY_DEFENSE_MAX_CONVOY_TO_SHIP_RATIO							= 2.0,		-- each ship in convoy defense mission can at most cover this many convoys without losing efficiency
		CONVOY_DEFENSE_MAX_REGION_TO_TASKFORCE_RATIO					= 3.0,		-- each taskforce in convoy defense mission can at most cover this many regions without losing efficiency
		
		MINE_SWEEPING_SUPREMACY_EFFICIENCY_MAX_REGION_TO_TASKFORCE_RATIO = 1.0,		-- mine missions will get lower supremacies if they are assigned more regions than this
		MINE_PLANTING_SUPREMACY_EFFICIENCY_MAX_REGION_TO_TASKFORCE_RATIO = 1.0,		-- mine missions will get lower supremacies if they are assigned more regions than this
		
		EFFICIENCY_TO_JOIN_COMBAT_RATIO_PENALTY							= 1.0,		-- at lower efficiencies less ships will be able to join combat
		EFFICIENCY_TO_TIME_TO_JOIN_COMBAT_PENALTY 						= 100.0,	-- at lower efficiencies less time to join combat hour will be increased
		
		COORDINATION_EFFECT_ON_CONVOY_RAID_EFFICIENCY					= 1.5,		-- coordination will increase the number of areas you can cover in convoy raid
		COORDINATION_EFFECT_ON_CONVOY_DEFENSE_EFFICIENCY				= 1.5,		-- coordination will increase the number of convoys you can cover in convoy defense
		
		COORDINATION_EFFECT_ON_TIME_TO_JOIN_COMBAT						= 1.0,		-- coordination will reduce the time to join combat penalties
		COORDINATION_EFFECT_ON_MINE_LAYING_SPEED 						= 0.5,      -- affect of coordination modifier in mine laying speed
		COORDINATION_EFFECT_ON_MINE_SWEEPING_SPEED 						= 0.5,      -- affect of coordination modifier in mine sweeping speed
		COORDINATION_EFFECT_ON_PATROL_SPOTTING 							= 1.0,		-- affect of coordination modifier in spotting speed

		COORDINATION_EFFECT_ON_MINE_SWEEPING_SUPREMACY_EFFICIENCY		= 1.0,      -- mine missions supremacy can be buffed by coordination
		COORDINATION_EFFECT_ON_MINE_PLANTING_SUPREMACY_EFFICIENCY		= 1.0,      -- mine missions supremacy can be buffed by coordination
		
		MISSION_EFFICIENCY_POW_FACTOR									= 1.7,		-- mission efficiencies will be powered up by this to further penalize low efficiencies
		
		NAVAL_COMBAT_SUB_DETECTION_FACTOR                               = 1.0,      -- balance value for sub detection in combat by ships
		SUBMARINE_HIDE_TIMEOUT 											= 20,		-- Amount of in-game-hours that takes the submarine (with position unrevealed), to hide.
		SUBMARINE_REVEALED_TIMEOUT 										= 16,		-- Amount of in-game-hours that makes the submarine visible if it is on the defender side.
		SUBMARINE_REVEAL_BASE_CHANCE 									= 12,		-- Base factor for submarine detection. It's modified by the difference of a spotter's submarines detection vs submarine visibility. Use this variable for game balancing. setting this too low will cause bad spotting issues.
		SUBMARINE_REVEAL_POW 											= 3.0,		-- A scaling factor that is applied to the reveal chance in order to make large differences in detection vs visibility more pronounced
		SUBMARINE_BASE_TORPEDO_REVEAL_CHANCE 							= 0.04,		-- Chance of a submarine being revealed when it fires. 1.0 is 100%. this chance is then multiplied with modifier created by comparing firer's visibiility and target's detection
		
		MAX_NUM_HOURS_TO_WAIT_AT_ALLY_DOCKYARDS_FOR_REPAIRS 			= 48,		-- taskforces will wait at most this amount of hours in ally bases for repairs before switching to another base for repairs
		
		COMBAT_RESULT_PRIORITY_THRESHOLDS = { 										-- the game will use this thresholds to define importance of a naval combat result. it will use the highest level that has higher threshold than the amount of production lost in combat
			0, 		-- low (keep at zero)
			4000,   -- medium
			20000,  -- high
		},
		COMBAT_RESULT_PRIORITY_DAY_TO_LIVE = { 										-- the game will delete the combat results after some duration depending on its importance
			7, 
			30, 
			120,
		},
		NAVAL_ACCIDENTS_DAYS_TO_LIVE = 120,
		
		NAVAL_MINE_DANGER_RATIOS = {
			0.1,		-- not owned
			0.5,		-- near controlled
			1.0,		-- near owned
			1.0,		-- controlled
			3.0,		-- owned
		},
		NAVAL_MINE_DANGER_TRIGGER_MIN = 0.0,
		NAVAL_MINE_DANGER_TRIGGER_MAX = 2.0,
		
		NAVAL_CONVOY_DANGER_RATIOS = {
			0.10,		-- not owned
			0.10,		-- near controlled
			0.10,		-- near owned
			0.15,		-- controlled
			0.15,		-- owned
		},
		NAVAL_CONVOY_DANGER_TRIGGER_MIN = 0.0,
		NAVAL_CONVOY_DANGER_TRIGGER_MAX = 100.0,

		-- those two work together in the formula f(x) = Y(x/(x+X)) where Y is MAX and X is SLOPE
		NAVAL_COMBAT_AIR_SUB_DETECTION_MAX = 10.0,
		NAVAL_COMBAT_AIR_SUB_DETECTION_SLOPE = 10.0,						-- lower means sharper curve (ramps up very fast, then flatten out very fast). Must be >0

		NAVAL_COMBAT_AIR_SUB_DETECTION_EXTERNAL_FACTOR = 1.0,					-- Factor applied to the stats of external air planes
		NAVAL_COMBAT_AIR_SUB_DETECTION_INTERNAL_EFFICIENCY_FACTOR = 1.0,			-- Factor of Carrier's sortie efficiency on the stats bellow
		NAVAL_COMBAT_AIR_AGILITY_TO_SUB_DETECTION = 0.0,					-- Factor to apply to the agility of air planes active in a naval combat to deduce their contibution to sub detection
		NAVAL_COMBAT_AIR_STRIKE_ATTACK_TO_SUB_DETECTION = 0.0,					-- Same, but for strike attack (aka naval attack)
		NAVAL_COMBAT_AIR_STRIKE_TARGETING_TO_SUB_DETECTION = 0.0,				-- Same, but for strike targeting (aka naval targeting)
		NAVAL_COMBAT_AIR_MAX_SPEED_TO_SUB_DETECTION = 0.0,					-- Same, but for Max Speed
		NAVAL_COMBAT_AIR_PLANE_COUNT_TO_SUB_DETECTION = 1.0,					-- Factor applied to the number of active plane in a naval combat to deduce their contribution to sub detection
		NAVAL_COMBAT_AIR_SUB_DETECTION_DECAY_RATE = 1.0,					-- Factor to decay the value of sub detection contributed by planes on the last hour. Note: the maximum value between the decayed value and the newly computed one is taken into account. A decay rate of 1 means that nothing is carried over, the previous value is zerod out. A decay rate of 0 means that the previous value is carried over as is.
		NAVAL_COMBAT_AIR_SUB_DETECTION_FACTOR = 0.0,						-- A global factor that applies after all others, right before the sub detection contributed by plane is added to the global sub detection of a combatant

		NAVAL_COMBAT_AIR_SUB_TARGET_SCORE = 10,                             -- scoring for target picking for planes inside naval combat, one define per ship typ
		NAVAL_COMBAT_AIR_CAPITAL_TARGET_SCORE = 50,
		NAVAL_COMBAT_AIR_CARRIER_TARGET_SCORE = 200,
		NAVAL_COMBAT_AIR_CONVOY_TARGET_SCORE = 1.0,
		NAVAL_COMBAT_AIR_STRENGTH_TARGET_SCORE = 5,                         -- how much score factor from low health (scales between 0->this number)
		NAVAL_COMBAT_AIR_LOW_AA_TARGET_SCORE = 5,                           -- how much score factor from low AA guns (scales between 0->this number)

		NEW_NAVY_LEADER_LEVEL_CHANCES = {									-- chances for new navy leaders to start at a given level
			0.95, -- 95% for level one
			0.05  -- 5% for level two
				-- 0% for level three to ten
	},

	NAVY_PIERCING_THRESHOLDS = {					-- Our piercing / their armor must be this value to deal damage fraction equal to the index in the array below [higher number = higher penetration]. If armor is 0, 1.00 will be returned.
		2.00,
		1.00,
		0.75,
		0.50,
		0.10,
		0.00 --there isn't much point setting this higher than 0
	},

	NAVY_PIERCING_THRESHOLD_CRITICAL_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		2.00,
		1.00,
		0.75,
		0.50,
		0.10,
		0.00 -- For criticals, you could reduce crit chance unlike damage in army combat, but we do not for now.
	},

	NAVY_PIERCING_THRESHOLD_DAMAGE_VALUES = {	-- 0 armor will always receive maximum damage (so add overmatching at your own peril). the system expects at least 2 values, with no upper limit.
		1.00,
		1.00,
		0.70,
		0.40,
		0.30,
		0.10 -- 
	},

		-- all of these NEED to be the same size!!!!
	},

	NRailwayGun = {
	    RAILWAY_GUN_POSSIBLE_RANGES = { 30, 15, 45 },	-- Possible values for railway gun range in pixel.
		ATTACK_TO_FORTS_MODIFIER_FACTOR = 1.333,		-- Forts modifier is calculated by multiplying railway gun attack value with this and dividing by 100
		ATTACK_TO_ENTRENCHMENT_MODIFIER_FACTOR = 0.8,		-- Entrenchment modifier is calculated by multiplying railway gun attack value with this and dividing by 100
		ATTACK_TO_BOMBARDMENT_MODIFIER_FACTOR = 0.4,	-- Bombardment modifier is calculated by multiplying railway gun attack value with this and dividing by 100
		DAILY_MANPOWER_GAIN_RATIO = 0.05,				-- Railway Guns will be able to gain this ratio of their max manpower daily
		DISBAND_MANPOWER_LOSS = 0.0,					-- The ration of manpower lost on disbanding railway guns
		ENCIRCLED_DISBAND_MANPOWER_FACTOR = 0.2,		-- The percentage of manpower returned when an encircled unit is disbanded
		OUT_OF_SUPPLY_SPEED = -0.8,						-- Max speed reduction from supply for railway guns
		BASE_CAPTURE_CHANCE = 0.2,						-- The base chance of railway guns being captured during an overrrun. Will be further modified by the equipment capture chance of the capturing unit.
		DISTRIBUTION_RAILWAY_GUN_PRESENCE_SCORE = -250,					-- Score for Railway Guns in range from given province when distributing Railway Guns
		DISTRIBUTION_OUR_UNITS_PRESENCE_SCORE = 1,	 					-- Score for our units in province when distributing Railway Guns
		DISTRIBUTION_FRIENDLY_UNITS_PRESENCE_SCORE = 0,					-- Score for friendly units in province when distributing Railway Guns
		DISTRIBUTION_HOSTILE_UNITS_PRESENCE_SCORE = -45,				-- Score for hostile units in province when distributing Railway Guns
		DISTRIBUTION_COMBATS_PRESENCE_SCORE = -15,						-- Score for combats in province when distributing Railway Guns
		DISTRIBUTION_COMBATS_INRANGE_SCORE = 15,						-- Score for combats in range when distributing Railway Guns
		DISTRIBUTION_OUR_UNITS_INRANGE_SCORE = 15,						-- Score for our units in range when distributing Railway Guns
		DISTRIBUTION_FRIENDLY_UNITS_INRANGE_SCORE = 5,					-- Score for friendly units in range when distributing Railway Guns
		DISTRIBUTION_HOSTILE_UNITS_INRANGE_SCORE = 2,					-- Score for hostile units in range when distributing Railway Guns
		DISTRIBUTION_DISTANCE_SCORE = -0.01,							-- Score for distance to province when distributing Railway Guns
		DISTRIBUTION_PROVINCE_CONTROLLED_BY_ENEMY_SCORE = -3,			-- Score for staying in province controlled by enemy
		DISTRIBUTION_PROVINCES_CONTROLLED_BY_ENEMY_INRANGE_SCORE = 15,	-- Score for provinces controlled by enemy in range when distributing Railway Guns
		DISTRIBUTION_HOLD_POSITION_SCORE = 10,							-- Score for staying in the same province when distributing Railway Guns
		DISTRIBUTION_NO_RAILWAY_SCORE = -500,							-- Score for provinces with no railways (need to be low, but we allow RG to enter port provinces without railways)
		DISTRIBUTION_SUPPLY_DEFICIT_SCORE = -100,						-- Score for provinces without sufficient supply cap
	},

	NTrade = {
		DISTANCE_TRADE_FACTOR = -0.02,				-- Trade factor is modified by distance times this
		RELATION_TRADE_FACTOR = 1,					-- Trade factor is modified by Opinion value times this
		ALLOW_TRADE_CUT_OFF = 0,					-- If trade factor is less than this, no trade will be allowed
		MONTH_TRADE_FACTOR = 2,						-- Each month a trade gets this much boost to it's trade factor
		MAX_MONTH_TRADE_FACTOR = 50,				-- This is the maximum bonus that can be gained from time
		BASE_TRADE_FACTOR = 150,					-- This is the base trade factor
		PUPPET_MASTER_TRADE_FACTOR = 400,			-- This is priority for puppet master
		PUPPET_TRADE_FACTOR = 0,					-- This is unpriority for puppets
		BASE_LAND_TRADE_RANGE = 1000,
		PARTY_SUPPORT_TRADE_FACTOR = 50,			-- Trade factor bonus at the other side having 100 % party popularity for my party
		ANTI_MONOPOLY_TRADE_FACTOR_THRESHOLD = 0.5,	-- What percentage of resources has to be sold to the buyer for the anti-monopoly factor to take effect
		ANTI_MONOPOLY_TRADE_FACTOR = -100,			-- This is added to the factor value when anti-monopoly threshold is exceeded
		NAVAL_ROUTE_ACCESS_AVOID_COST_MULT = 1,	-- Naval pathfinding should avoid certain regions that you mark. High "cost multiplier" will make it less willingly go through a specific region.
	},

	NAI = {
		GARRISON_FRACTION = 0.0, 					-- How large part of a front should always be holding the line rather than advancing at the enemy
		THEORIST_SCALING_WEIGHT_FACTOR_PER_NON_POLITICAL_ADVISORS = 0.15, --Scale theorist weight by this * num non political advisors
		DIPLOMATIC_ACTION_GOOD_BAD_RATIO_THRESHOLD = 1,
		BASE_RELUCTANCE = 20, 						-- Base reluctance applied to all diplomatic offers
		DIPLOMATIC_ACTION_RANDOM_FACTOR = 0.5, 		-- How much of the AI diplomatic action scoring is randomly determined (1.0 = half random, 2.0 = 2/3rd random, etc)
		DIPLOMATIC_ACTION_PROPOSE_SCORE = 50, 		-- AI must score a diplomatic action at least this highly to propose it themselves
		DILPOMATIC_ACTION_DECLARE_WAR_WARGOAL_BASE = -50, -- Base diplomatic action score bonus to go to war per wargoal
		DIPLOMATIC_ACTION_BREAK_SCORE = -10, 		-- AI must score a diplomatic action less than this to break it off	
		DIPLOMACY_CREATE_FACTION_FACTOR = 0.75,		-- Factor for AI desire to create a new faction. Val < 1.0 makes it less likely to create than to join.
		DIPLOMACY_FACTION_WRONG_IDEOLOGY_PENALTY = 60, -- AI penalty for diplomatic faction acitons between nations of different ideologies
		DIPLOMACY_FACTION_SAME_IDEOLOGY_MAJOR = 10, -- AI bonus acceptance when being asked about faction is a major of the same ideology
		DIPLOMACY_FACTION_NEUTRALITY_PENALTY = 50,	-- Neutral nations have a separate penalty, not wanting to get involved at all, rather than caring much about the difference in ideology
		DIPLOMACY_FACTION_GLOBAL_TENSION_FACTOR = 0.0,-- How much the AI takes global tension into account when considering faction actions
		DIPLOMACY_FACTION_WAR_RELUCTANCE = -50,		-- Penalty to desire to enter a faction with a country that we are not fighting wars together with.
		DIPLOMACY_FACTION_TAKE_OVER_RELUCTANCE_VERSUS_HUMAN = 2.0,	-- Multiplier penalty for how much stronger than a human faction member an AI country must be to choose to assume faction leadership.
		DIPLOMACY_SCARED_MINOR_EXTRA_RELUCTANCE = -50, -- extra reluctance to join stuff as scared minor
		DIPLOMACY_FACTION_PLAYER_JOIN = 20,			-- Bonus for human players asking to join a faction.
		DIPLOMACY_BOOST_PARTY_COST_FACTOR = 100.0,	-- Desire to boost party popularity subtracts the daily cost multiplied by this
		DIPLOMACY_IMPROVE_RELATION_COST_FACTOR = 5.0,-- Desire to boost relations subtracts the cost multiplied by this
		DIPLOMACY_IMPROVE_RELATION_PP_FACTOR = 0.1,	-- Desire to boost relations adds total PP multiplied by this
		DIPLOMACY_SEND_ATTACHE_COST_FACTOR = 5.0,	-- Desire to send attache substracts the cost multiplied by this
		DIPLOMACY_SEND_ATTACHE_PP_FACTOR = 0.1,	-- Desire to send attache adds total PP multiplied by this
		DIPLOMACY_REJECTED_WAIT_MONTHS_BASE = 4,	-- AI will not repeat offers until at least this time has passed, and at most the double
		DIPLOMACY_LEND_LEASE_MONTHS_TO_CANCEL = 1,	-- AI will not cancel a lend lease offer until this time has passed
		DIPLOMACY_CALL_ALLY_VALIDITY_DURATION = 1,	-- Overwrite above value for CallAlly and JoinAlly diplo action. This is however fixed, and is not subject to randomness. Also, this is the time the AI will keep the action in its incoming queue without declining it.
		DIPLOMACY_PURCHASE_EQUIPMENT_MONTHS = 2,    -- AI will not ask to purchase equipment more often than this (TODO Market: may want to change how this works)
		DIPLOMACY_SEND_MAX_FACTION = 0.75,			-- Country should not send away more units than this as expeditionaries
		DIPLOMACY_ACCEPT_VOLUNTEERS_BASE = 50,		-- Base value of volunteer acceptance (help is welcome)
		DIPLOMACY_ACCEPT_ATTACHE_BASE = 50,			-- Base value of attache acceptance (help is welcome)
		DIPLOMACY_ACCEPT_ATTACHE_OPINION_TRASHHOLD = 20, -- Value of opinion that will remove accepting penalty for receiveing the attache
		DIPLOMACY_ACCEPT_ATTACHE_OPINION_PENALTY = -100, -- Value of acceptance penalty if the opinion too low 
		DIPLOMACY_FACTION_MAJOR_AT_WAR = 1000.0,	-- Factor that will be multiplied with the surrender level in the desire to offer to the other ai to join a faction
		DIPLOMACY_FACTION_SURRENDER_LEVEL = 20, 	-- How much the recipient nation losing matters for joining a faction
		DIPLO_PREFER_OTHER_FACTION = -200,			-- The country has yet to ask some other faction it would prefer to be a part of.
		DIPLO_DISTANCE_BETWEEN_CAPITALS = -340,		-- Max scaled malus from distance between capitals
		DIPLO_ACCEPTABLE_DISTANCE_BETWEEN_CAPITALS = 1000.0, --When scaled distance malus begins to kick in. At double this value, max penalty (above) is achieved
		DIPLO_SHOW_FACTION_JOIN_WARNING_THRESHOLD = -20,	-- Show warning if declare-war target is this close to accepting or being sent a faction invitiation
		DIPLO_MAX_CONTAINMENT_ACCEPTANCE = 100,		-- Max value for 'wants to contain' diplo acceptance
    	GUN_EMPLACEMENT_MIN_ASSIGN_SCORE = 1,       -- Minimum total score for region to be considered for gun emplacement air missions
	    GUN_EMPLACEMENT_MIN_PRIO_ASSIGN_SCORE = 50, -- Minimum total score for region to be considered for critical gun emplacement air missions
    	GUN_EMPLACEMENT_ASSIGN_SCORE_REDUCTION_PER_ASSIGNMENT = 0.5, -- each assigned gun emplacement reduces the score of a region by this amount
		RESEARCH_DAYS_BETWEEN_WEIGHT_UPDATE = 7, 	-- Refreshes need scores based on country situation.
		RESEARCH_WEIGHT_TRUNCATION_THRESHOLD = 0.75,    -- When choosing a tech to research, use this truncation selection threshold. (for example, if the top score is 10, a threshold of 0.75 will pick randomly from anything above 7.5 score)
		RESEARCH_LAND_DOCTRINE_NEED_GAIN_FACTOR = 0.15, -- Multiplies value based on relative military industry size / country size.
		RESEARCH_NAVAL_DOCTRINE_NEED_GAIN_FACTOR = 0.05, -- Multiplies value based on relative naval industry size / country size.
		RESEARCH_AIR_DOCTRINE_NEED_GAIN_FACTOR = 0.07, -- Multiplies value based on relative number of air base / country size.
		RESEARCH_NEW_WEIGHT_FACTOR = 0.4, 			-- Impact of previously unexplored tech weights. Higher means more random exploration.
		RESEARCH_NEW_DOCTRINE_RANDOM_FACTOR = 0.05,	-- How much randomness is allowed to contribute to do new research expressed as a factor of total tech weights. Higher means more random exploration.
		RESEARCH_AHEAD_BONUS_FACTOR = 2.0,          -- To which extent AI should care about ahead of time bonuses to research
		RESEARCH_BONUS_FACTOR = 0.9, 				-- To which extent AI should care about bonuses to research
		RESEARCH_YEARS_BEHIND_FACTOR = 0.2,         -- To which extent AI should care about not falling behind (i.e. increase weight for old tech)
		RESEARCH_NEEDS_FACTOR = 0.01,               -- To which extent AI should care about its research needs (research needs are matched against the tech category)
		RESEARCH_LENGTH_FACTOR = 3,                 -- To which extent AI should care about how long it takes to research something (it prefers short research times)
		MAX_AHEAD_RESEARCH_PENALTY = 2,             -- max ahead of time penalty ai will pick ever
		RESEARCH_AHEAD_OF_TIME_FACTOR = 4.0, 		-- To which extent AI should care about ahead of time penalties to research
		RESEARCH_BASE_DAYS = 60,					-- AI adds a base number of days when weighting completion time for techs to ensure it doesn't only research quick techs
		DECLARE_WAR_RELATIVE_FORCE_FACTOR = 0.5,	-- Weight of relative force between nations that consider going to war
		TRADEABLE_FACTORIES_FRACTION = 0.8,			-- Will at most trade away this fraction of factories.
		MIN_DELIVERED_TRADE_FRACTION = 0.8,			-- AI will cancel trade deals that are not able to deliver more than this fraction of the agreed amount
		SEA_PATH_LENGTH_SCORE_BASE = -30,           -- scoring reduction from naval paths for AI when picking trade partners
		MINIMUM_GOOD_TRADE_RATIO_PER_CIV = 0.005,   -- for each civ factory we have mul with this we are allowed to trade under % of resource on a trade
		NAVAL_DOCKYARDS_SHIP_FACTOR = 1.5,			-- The extent to which number of dockyards play into amount of sips a nation wants
		PRODUCTION_EQUIPMENT_SURPLUS_FACTOR = 0.45,	-- Base value for how much of currently used equipment the AI will at least strive to have in stock
		PRODUCTION_EQUIPMENT_SURPLUS_FACTOR_GARRISON = 0.3,	-- Base value for how much of currently used equipment the AI will at least strive to have in stock for garrison forces
		AIR_SUPERIORITY_FACTOR = 2.5,				-- Factor for air superiority score
		ROCKET_MIN_ASSIGN_SCORE = 10,				-- Minimum total score for region to be considered for rocket air missions
		ROCKET_MIN_PRIO_ASSIGN_SCORE = 50,			-- Minimum total score for region to be considered for critical rocket air missions
		ROCKET_PRIORITIZE_BARRAGE = false,			-- Prioritize rocket barrage or strategic bombing mission. false = prioritize strategic bombing, true = prioritize barrage
		ROCKET_ASSIGN_SCORE_REDUCTION_PER_ASSIGNMENT = 0.5, -- each assigned rocket reduces the score of a region by this amount
		MAX_VOLUNTEER_ARMY_FRACTION = 0.25,			-- Countries will not send more than their forces time this number to aid another country
		DEPLOY_MIN_TRAINING_SURRENDER_FACTOR = 0.5,		-- Required percentage of training (1.0 = 100%) for AI to deploy unit in wartime while surrender progress is higher than 0 
		DEPLOY_MIN_EQUIPMENT_SURRENDER_FACTOR = 0.90,	-- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in wartime while surrender progress is higher than 0 
		DEPLOY_MIN_TRAINING_PEACE_FACTOR = 0.95,		-- Required percentage of training (1.0 = 100%) for AI to deploy unit in peacetime
		DEPLOY_MIN_EQUIPMENT_PEACE_FACTOR = 0.95,	-- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in peacetime
		DEPLOY_MIN_TRAINING_WAR_FACTOR = 0.95,		-- Required percentage of training (1.0 = 100%) for AI to deploy unit in wartime
		DEPLOY_MIN_EQUIPMENT_WAR_FACTOR = 0.95,		-- Required percentage of equipment (1.0 = 100%) for AI to deploy unit in wartime
		DEPLOY_MIN_EQUIPMENT_CAP_DEPLOY_FACTOR = 0.85,  -- If training is capped by equipment deficit and we have reached that cap, deploy unit anyway if percentage is above this (reinforce in field instead).
		DYNAMIC_STRATEGIES_THREAT_FACTOR = 4.0,		-- How much threat generated by other countries effects generated strategies
		LOCATION_BALANCE_TO_ADVANCE = 0.0,			-- Limit on location strength balance between country and enemy for unit to dare to move forward.

		EQUIPMENT_MARKET_UPDATE_FREQUENCY_DAYS = 11,                    -- How often the AI runs its market logic
		EQUIPMENT_MARKET_MAX_CIVS_FOR_PURCHASES_RATIO = 0.1,            -- Ratio of available civilian factories to max use for equipment purchases (0.2 = 20 %, so 50 available civs would mean max ca 10 civs to spend on purchases at any one time). Gets modified by equipment_market_spend_factories AI strategy.
		EQUIPMENT_MARKET_BASE_MARKET_RATIO = 0.2,                       -- The AI tries to keep ca this ratio of equipment surplus for sale on the market. Gets modified by equipment_market_for_sale_factor AI strategy.
		EQUIPMENT_MARKET_DEFAULT_CIC_CHUNK_FOR_SALE = 150.0,            -- When putting things up for sale on the market, this determines the default "chunk" size of equipment the AI puts up. Gets overridden by equipment_market_min_for_sale AI strategy. (If one equipment is worth 5 CIC, a value of 150 would result in chunk sizes of 150/5 = 30 units)
		EQUIPMENT_MARKET_NR_DELIVERIES_SOFT_MAX = 10,                   -- AI tries to adjust assigned factories and amount of equipment to keep nr deliveries at max this
		EQUIPMENT_MARKET_EXTRA_CONVOYS_OVERRIDE = 2,                    -- Makes the AI able to buy convoys even if they are lacking free convoys. 0 will make them stop this behavior, anything > 0 will allow overriding the perceived nr of free convoys. Only if convoy equipment has a non-zero weight does the actual value matter.
		EQUIPMENT_MARKET_WANTED_CONVOY_USAGE_RATIO = 0.3,               -- If the AI's available/free/unused convoys is reduced to this ratio (0.3 = 30 %), start buying convoys.
		EQUIPMENT_MARKET_CONTRACT_DURATION_ACCEPTANCE = -10,            -- If expected contract duration is longer than EQUIPMENT_MARKET_NR_DELIVERIES_SOFT_MAX deliveries, then add this to the PurchaseContract AI acceptance score per nr overdue deliveries
		EQUIPMENT_MARKET_CONTRACT_EFFICIENCY_TO_CANCEL = 0.1,           -- If contract efficiency stays below this, the AI will cancel the contract
		EQUIPMENT_MARKET_EQUIPMENT_SUNK_TO_CANCEL = 0.5,                -- If more equipment is sunk then the given percentage, the AI will cancel the contract
		EQUIPMENT_MARKET_SHORTAGE_DAYS_TO_CANCEL = 30,                  -- If equipment deficit will take more than these many days to fix, the AI will cancel the contract
		EQUIPMENT_MARKET_MAX_CONVOY_RATIO_FOR_MARKET_PEACE = 0.5,       -- Max ratio of total convoys to use for equipment trade while at peace
		EQUIPMENT_MARKET_MAX_CONVOY_RATIO_FOR_MARKET_WAR = 0.25,        -- Max ratio of total convoys to use for equipment trade while at war
		EQUIPMENT_MARKET_SCORE_FACTOR_VARIANT_SCORE = 5.0,              -- Score coefficient for VariantScore (high is good)
		EQUIPMENT_MARKET_SCORE_FACTOR_CIC_VALUE_NEEDED = 8.0,           -- Score coefficient for CicValueNeeded (high is prio)
		EQUIPMENT_MARKET_SCORE_FACTOR_SUBSIDY_VALUE = 2.0,              -- Score coefficient for SubsidyValue (high is good)
		EQUIPMENT_MARKET_SCORE_FACTOR_COST_PER_UNIT = -5.0,             -- Score coefficient for SubsidizedCostPerUnit (low is good)
		EQUIPMENT_MARKET_SCORE_FACTOR_AI_STRAT_WEIGHT = 50.0,           -- Score coefficient for AiStratWeight (high is prio)
		EQUIPMENT_MARKET_SCORE_FACTOR_DIPLO_OPINION = 1.0,              -- Score coefficient for DiploOpinion, mainly used as tie breaker (high is good)

		DIPLOMACY_ACCEPT_CONDITIONAL_SURRENDER_MANPOWER_IN_FIELD = -20,	-- Scale multiplied by difference in manpower in field
		DIPLOMACY_ACCEPT_CONDITIONAL_SURRENDER_GLOBAL_TENSION = -10,	-- Multiplied by WT
		DIPLOMACY_ACCEPT_CONDITIONAL_SURRENDER_WAR_SUPPORT = -10,		-- Multiplied by recipient WS
		DIPLOMACY_ACCEPT_CONDITIONAL_SURRENDER_EMBARGO = 2,				-- Multiplied by num embargo, max 5 embargo
		DIPLOMACY_ACCEPT_CONDITIONAL_SURRENDER_OWN_SURRENDER_LIMIT = 20, -- Multiplied by recipient nation's surrender level
		DIPLOMACY_ACCEPT_CONDITIONAL_SURRENDER_MINOR_WAR = 10,			-- Applied if recipient is a minor nation (and therefore there are no majors in this war)

		MIN_POLITICAL_POWER_MONTHLY_GAIN_FOR_IMPROVE_RELATIONS = 0.50,	-- If country makes less than this PP per month, they won't improve relations

		NUM_RESOURCES_TO_ALLOW_MINOR_EMBARGO = 69,	--If we or any of our puppets have more total resources of a single category that this, we will consider embargoing countries
		EMBARGO_WORLD_TENSION_THREAT_DIVISOR = 2.5,		--A divisor to generated world tension when applying how much we care about it in AI desire

		OPINION_CUTOFF_FOR_IMPROVE_RELATIONS = 80,	-- AI will never consider improving relations if above this opinion with target.

		DEFAULT_MODULE_VARIANT_CREATION_XP_CUTOFF_LAND = 50,	-- Army XP needed before attempting to create a variant of a type that uses the tank designer (the tank designer DLC feature must be active).
		DEFAULT_MODULE_VARIANT_CREATION_XP_CUTOFF_NAVY = 50,	-- Same as above but for the ship designer.
		DEFAULT_MODULE_VARIANT_CREATION_XP_CUTOFF_AIR = 25,		-- Same as above but for the plane designer.
		DEFAULT_LEGACY_VARIANT_CREATION_XP_CUTOFF_LAND = 10,	-- Army XP needed before attempting to create a variant of a type that uses the legacy upgrades system. ai_strategy supports land_xp_spend_priority upgrade_xp_cutoff. If none is set, this define is used instead.
		DEFAULT_LEGACY_VARIANT_CREATION_XP_CUTOFF_NAVY = 25,	-- Same as above but for navy XP and navy_xp_spend_priority.
		DEFAULT_LEGACY_VARIANT_CREATION_XP_CUTOFF_AIR  = 25,	-- Same as above but for air XP and air_xp_spend_priority.
		VARIANT_CREATION_XP_RESERVE_LAND = 50,					-- If the AI lacks army XP to create a variant it will reserve this much XP for variant creation so that it will eventually be able to create a variant.
		VARIANT_CREATION_XP_RESERVE_NAVY = 50,					-- Same as above but for navy XP.
		VARIANT_CREATION_XP_RESERVE_AIR  = 50,					-- Same as above but for air XP.

		-- The AI uses the below values when selecting which design to make among the types that use the tank designer
		-- (the tank designer DLC feature must be active). For each role, the highest priority AI design that can be
		-- created, if any, is assigned a weight. Any design with a weight of zero or a weight that falls below the
		-- cutoff is dropped. A random design is then picked from the remaining.
		-- Weight is calculated as AlternativeFactor * DemandFactor.
		-- An "alternative" is a producible design of the same archetype (each specialized type is its own archetype).
		LAND_DESIGN_ALTERNATIVE_ABSENT = 30000,
		LAND_DESIGN_ALTERNATIVE_OF_LESSER_TECH = 10000,
		LAND_DESIGN_ALTERNATIVE_OF_EQUAL_TECH = 100,
		LAND_DESIGN_ALTERNATIVE_OF_GREATER_TECH = 1,
		-- If a template may be reinforced with the archetype it's considered to be "demanded". If multiple conditions
		-- are met, e.g. it's both in the field and in training, the largest value is used.
		LAND_DESIGN_DEMAND_FIELD_DIVISION = 20,
		LAND_DESIGN_DEMAND_TRAINING_DIVISION = 15,
		LAND_DESIGN_DEMAND_GARRISON_DIVISION = 10,
		LAND_DESIGN_DEMAND_UNUSED_TEMPLATE = 1,
		LAND_DESIGN_DEMAND_ABSENT = 0,
		-- If a design with a weight when divided by the largest weight falls below this value it's excluded from the
		-- selection. Valid values are in the range [0, 1] inclusive.
		LAND_DESIGN_CUTOFF_AS_PERCENTAGE_OF_MAX = 0.25,

		-- See above documentation.
		AIR_DESIGN_ALTERNATIVE_ABSENT = 1000000,
		AIR_DESIGN_ALTERNATIVE_OF_LESSER_TECH = 10000,
		AIR_DESIGN_ALTERNATIVE_OF_EQUAL_TECH = 100,
		AIR_DESIGN_ALTERNATIVE_OF_GREATER_TECH = 1,
		-- The AI desires to produce equipment at a certain rate per archetype, and demand is determined per archetype
		-- relative to the least and most desired counts.
		AIR_DESIGN_DEMAND_MAX = 33,
		AIR_DESIGN_DEMAND_MIN = 1,
		AIR_DESIGN_DEMAND_ABSENT = 1,
		AIR_DESIGN_CUTOFF_AS_PERCENTAGE_OF_MAX = 0.34,

		-- The AI "desires" to spend XP on doctrines, templates, and equipment.
		-- The desire is built up over time and when XP is available it spends it on the action that has the highest accumulated desire. After spending XP the desire is reset, in effect balancing the desires.
		-- Below is the daily desire gain for each action.
		DESIRE_USE_XP_TO_UNLOCK_LAND_DOCTRINE = 0.5,    -- How quickly is desire to unlock land doctrines accumulated?
		DESIRE_USE_XP_TO_UNLOCK_NAVAL_DOCTRINE = 0.5,   -- How quickly is desire to unlock naval doctrines accumulated?
		DESIRE_USE_XP_TO_UNLOCK_AIR_DOCTRINE = 0.5,     -- How quickly is desire to unlock air doctrines accumulated?
		DESIRE_USE_XP_TO_UPDATE_LAND_TEMPLATE = 2.0,    -- How quickly is desire to update/create templates accumulated?
		DESIRE_USE_XP_TO_UPGRADE_LAND_EQUIPMENT = 1.0,  -- How quickly is desire to update/create land equipment variants accumulated?
		DESIRE_USE_XP_TO_UPGRADE_NAVAL_EQUIPMENT = 1.0, -- How quickly is desire to update/create naval equipment variants accumulated?
		DESIRE_USE_XP_TO_UPGRADE_AIR_EQUIPMENT = 1.0,   -- How quickly is desire to update/create air equipment variants accumulated?
		DESIRE_USE_XP_TO_UNLOCK_ARMY_SPIRIT = 0.4,    -- How quickly is desire to unlock army spirits accumulated?
		DESIRE_USE_XP_TO_UNLOCK_NAVY_SPIRIT = 0.4,   -- How quickly is desire to unlock naval spirits accumulated?
		DESIRE_USE_XP_TO_UNLOCK_AIR_SPIRIT = 0.4,     -- How quickly is desire to unlock air spirits accumulated?

		DAYS_BETWEEN_CHECK_BEST_DOCTRINE = 7;       -- Recalculate desired best doctrine to unlock with this many days inbetween.
		DAYS_BETWEEN_CHECK_BEST_TEMPLATE = 7;       -- Recalculate desired best template to upgrade with this many days inbetween.
		DAYS_BETWEEN_CHECK_BEST_EQUIPMENT = 7;      -- Recalculate desired best equipment to upgrade with this many days inbetween.

		UNLOCK_SPIRIT_AI_WILL_DO_FACTOR = 10,       -- Factor for scripted ai_will_do value
		UNLOCK_SPIRIT_MODIFIER_FACTOR = 0.1,        -- Factor for AI's evaluated value of the modifiers connected to the spirit
		UNLOCK_SPIRIT_USE_TRUNCATION_SELECT = false,       -- Whether to use truncation select or roulette-wheel select. Set threshold for truncation select below.
		UNLOCK_SPIRIT_TRUNCATION_SELECT_THRESHOLD = 0.80,  -- Valid between [0.0, 1.0]. When unlocking spirits, select randomly from all spirits with AI score >= VALUE * HighestSpiritScore. To always select the best, set this value to 1.0. To select fully randomly, set this value to 0.0.

		FOCUS_TREE_CONTINUE_FACTOR = 1.5,			-- Factor for score of how likely the AI is to keep going down a focus tree rather than starting a new path.
		PLAN_VALUE_TO_EXECUTE = -0.5,				-- AI will typically avoid carrying out a plan it below this value (0.0 is considered balanced).
		DECLARE_WAR_NOT_NEIGHBOR_FACTOR = 0.25,		-- Multiplier applied before force factor if country is not neighbor with the one it is considering going to war
		CALL_ALLY_BASE_DESIRE = 20,					-- exactly what it says
		CALL_ALLY_DEMOCRATIC_DESIRE = 50,			-- Desire to call ally added for democratic AI
		CALL_ALLY_NEUTRAL_DESIRE = 25,				-- Desire to call ally added for neutral AI
		CALL_ALLY_FASCIST_DESIRE = -10,				-- Desire to call ally added for fascist AI
		CALL_ALLY_COMMUNIST_DESIRE = 75,			-- Desire to call ally added for communist AI
		CALL_ALLY_PUPPET_INVITE_OVERLORD = 1000,    -- Desire for a puppet to call its overlord into the war
		CALL_ALLY_OVERLORD_INVITE_PUPPET = 20,      -- Desire for an overlord to call its puppet into the war
		CALL_ALLY_RELATIVE_INDUSTRY_STRENGTH_THRESHOLD = 1.5, -- If our relative industry strength ratio is less than this (compared to all enemies), increase desire to call allies
		CALL_ALLY_RELATIVE_ARMY_STRENGTH_THRESHOLD = 1.5,     -- If our relative army strength ratio is less than this (compared to all enemies), increase desire to call allies
		CALL_ALLY_RELATIVE_INDUSTRY_STRENGTH_MAX = 50.0,      -- Max desire value for relative industry strength (lerping between zero and this based on the threshold)
		CALL_ALLY_RELATIVE_ARMY_STRENGTH_MAX = 100.0,         -- Max desire value for relative army strength (lerping between zero and this based on the threshold)
		CALL_ALLY_LOSING_WAR_THRESHOLD = 0.45,                -- If our war progress is less than this, increase desire to call allies (0.5 is stalemate)
		CALL_ALLY_LOSING_WAR_MAX = 100.0,                     -- Max desire value for losing war (lerping between zero and this based on the threshold)
		CALL_ALLY_WAR_LENGTH_NR_MONTHS = 2,                   -- For every month the war has gone on, increase desire this much
		CALL_ALLY_JOINER_HAS_ENEMY_NEIGHBOR = 100,            -- If the joining country is neighbor to at least one of the enemies, increase desire this much

		AI_CHAIN_CALLS_ALLIES = true,				-- with this enabled the AI will automatically call AI allies when called into a war (which in turn generates a single popup, this circumvents some potential modfiable scripts with the call ally diplo action, which might be a cause to disable it in some mods

		MIN_AI_UNITS_PER_TILE_FOR_STANDARD_COHESION = 2.0,	-- How many units should we have for each tile along a front in order to switch to standard cohesion (less moving around)
		MIN_FRONT_SIZE_TO_CONSIDER_STANDARD_COHESION = 20,	-- How long should fronts be before we consider switching to standard cohesion (under this, standard cohesion fronts will switch back to relaxed)

		JOIN_ALLY_BASE_DESIRE = 20,					-- exactly what it says
		JOIN_ALLY_DEMOCRATIC_DESIRE = 50,			-- Desire to join ally added for democratic AI
		JOIN_ALLY_NEUTRAL_DESIRE = 25,				-- Desire to join ally added for neutral AI
		JOIN_ALLY_FASCIST_DESIRE = -10,				-- Desire to join ally added for fascist AI
		JOIN_ALLY_COMMUNIST_DESIRE = 75,			-- Desire to join ally added for communist AI
		JOIN_FACTION_BOTH_LOSING = -300,			-- Desire to be in a faction when both we and htey are in losing wars
		LENDLEASE_FRACTION_OF_PRODUCTION = 0.5,		-- Base fraction AI would send as lendlease
		LENDLEASE_FRACTION_OF_STOCKPILE = 0.25,		-- Base fraction AI would send as lendlease
		MINIMUM_EQUIPMENT_TO_ASK_LEND_LEASE = -100,	-- AI will accept to lend lease this equipment only if our stockpile is less than that.
		MINIMUM_CONVOY_TO_ASK_LEND_LEASE = 30,		-- AI will accept to lend lease convoys only if our stockpile is less than that (special case because convoy stockpile can't be negative).
		MINIMUM_FUEL_DAYS_TO_ASK_LEND_LEASE = 2,	-- AI will accept to lend lease fuel only if the player have less fuel than this number multiply by his max daily consumption.
		MINIMUM_FUEL_DAYS_TO_ACCEPT_LEND_LEASE = 10, -- AI will accept to lend lease fuel only if they have more fuel than this number multiply by their max daily consumption. Note that for a GiE asking to its host, we divide this number by 2.

		DEFAULT_SUPPLY_TRUCK_BUFFER_RATIO = 1.5,	-- ai will set to truck buffer ratio to this. can be modified by wanted_supply_trucks min_wanted_supply_trucks ai strats
		DEFAULT_SUPPLY_TRAIN_NEED_FACTOR = 1.5,     -- AI multiplies current train usage by this to determine desired nr of wanted trains. Can be modified by wanted_supply_train min_wanted_supply_trains ai strats.

		POLITICAL_IDEA_MIN_SCORE = 0.1,				-- Only replace or add an idea if score is above this score.
		HIGH_COMMAND_ADDED_WEIGHT_FACTOR = 0.25,		-- Weight multiplier for high_command advisors over other chosen advisor or idea types
		CHIEF_ADDED_WEIGHT_FACTOR = 2.4,			-- Weight multiplier for chief roles over other advisor or idea types

		GARRISON_TEMPLATE_SCORE_IC_FACTOR = 1.0,		-- ai uses these defines while calculating garrison template score of a template.
		GARRISON_TEMPLATE_SCORE_MANPOWER_FACTOR = 0.05,  -- formula is (template_ic * ic_factor + template_manpower * manpower_factor ) / template_supression (lower is better)
		
		ADVISOR_SCORE_TRAIT_MODIFIER_FACTOR = 0.2,     -- When scoring advisors, factor the score contribution from the advisor's trait modifiers by this value
		ADVISOR_SCORE_CHEAPER_IS_BETTER_FACTOR = 0.1,  -- When scoring advisors, this define scales how much the AI prefers cheaper advisors over more expensive ones. 0.0 means no effect, 0.15 means a cost difference of 100 PP modifies the score by 15 %.
		ADVISOR_SCORE_CHEAPER_IS_BETTER_MIN = 0.5,     -- Clamps the above scoring factor to at minimum this value
		
		-- stuff related to how the AI evaluates/scores how useful modifiers are
		EVAL_MODIFIER_NON_PERCENT_FACTOR = 0.1,                       -- Multiply non-percent-based modifiers with this to put the values in the approximately same range so they can be compared. (Why we are using 0.1 and not 0.01? No idea...)
		EVAL_MODIFIER_UNSPECIFIED_CATEGORY_FACTOR = 0.75,             -- Arbitrary scoring factor for modifiers the AI doesn't know how to categorize
		EVAL_MODIFIER_MAX_COMMAND_POWER_FACTOR = 0.01,                -- Increasing CP cap with x is maybe 100 times less useful than e.g. gaining x more XP per day

		-- for positive values of following defines, ai weights will take over of hardcoded ai scoring system
		MIN_AI_SCORE_TO_MOBILIZATION_LAW_OVERRIDE_HARD_CODED_SCORE = 0.0,
		MIN_AI_SCORE_TO_ECONOMY_LAW_OVERRIDE_HARD_CODED_SCORE = 0.0,
		MIN_AI_SCORE_TO_TRADE_LAW_OVERRIDE_HARD_CODED_SCORE = 1000.0,
		MIN_AI_SCORE_TO_ALL_LAWS_OVERRIDE_HARD_CODED_SCORE = 0.0,

		AT_WAR_THREAT_FACTOR = 2.0,					-- How much increase in threat does AI feel for being in war against osmeone
		NEIGHBOUR_WAR_THREAT_FACTOR = 1.10, 		-- How much increase in threat does AI feel against neighbours who are at war
		POTENTIAL_ALLY_JOIN_WAR_FACTOR = 100, 		-- How much increase in threat does AI feel against neighbours who are allied against one of our enemies
		POTENTIAL_FUTURE_ENEMY_FACTOR = 100, 		-- How much increase in threat does AI feel against neighbours who at war with our allies
		NEUTRAL_THREAT_PARANOIA = 10,				-- How scared neutrals are of everyone
		DIFFERENT_FACTION_THREAT = 30,				-- Threat caused by not being in the same faction
		MAX_THREAT_FOR_FIRST_YEAR_CIVILIAN_MODE = 60, -- above this threshold, ai will leave first year civilian factory mode which bumps it civilian factory scores while building
		PLAN_ATTACK_MIN_ORG_FACTOR_LOW = 0.85,		-- Minimum org % for a unit to actively attack an enemy unit when executing a plan
		PLAN_ATTACK_MIN_STRENGTH_FACTOR_LOW = 0.4,	-- Minimum strength for a unit to actively attack an enemy unit when executing a plan
		PLAN_ATTACK_MIN_ORG_FACTOR_MED = 0.75,		-- (LOW,MED,HIGH) corresponds to the plan execution agressiveness level.
		PLAN_ATTACK_MIN_STRENGTH_FACTOR_MED = 0.3,	
		PLAN_ATTACK_MIN_ORG_FACTOR_HIGH = 0.2,		
		PLAN_ATTACK_MIN_STRENGTH_FACTOR_HIGH = 0.15,	
		PLAN_FRONTUNIT_DISTANCE_FACTOR = 10.0,		-- Factor for candidate units distance to front positions.
		PLAN_ATTACK_DEPTH_FACTOR = 0.5,				-- Factor applied to size or enemy being attacked.
		PLAN_STEP_COST_LIMIT = 11,					-- When stepping to draw a plan this cost makes it break if it hits hard terrain (multiplied by number of desired steps)
		PLAN_STEP_COST_LIMIT_REDUCTION = 3,			-- Cost limit is reduced per iteration, making hard terrain less likely to be crossed the further into enemy territory it is
		PLAN_MIN_SIZE_FOR_FALLBACK = 50,			-- A country with less provinces than this will not draw fallback plans, but rather station their troops along the front
		SEND_VOLUNTEER_EVAL_BASE_DISTANCE = 175.0,  -- How far away it will evaluate sending volunteers if not a major power
		SEND_VOLUNTEER_EVAL_MAJOER_POWER = 1.0, 	-- How willing major powers are to send volunteers.
		SEND_VOLUNTEER_EVAL_CONTAINMENT_FACTOR = 0.1, -- How much AI containment factors into its evaluation of sending volunteers.
		GIVE_STATE_CONTROL_MIN_CONTROLLED = 1,		-- AI needs to control more than this number of states before considering giving any away
		GIVE_STATE_CONTROL_MIN_CONTROL_DIFF = 2,	-- The difference in number of controlled states compared to war participation needs to be bigger than this for the AI to consider giving a state to a country
		RELATIVE_STRENGTH_TO_INVADE = 0.08,			-- Compares the estimated strength of the country/faction compared to it's enemies to see if it should invade or stay at home to defend.
		RELATIVE_STRENGTH_TO_INVADE_DEFENSIVE = 0.4,-- Compares the estimated strength of the country/faction compared to it's enemies to see if it should invade or stay at home to defend, but while being a defensive country.
		GIVE_STATE_CONTROL_BASE_SCORE = 50,			-- Base diplo score for giving away control of states
		GIVE_STATE_CONTROL_DIFF_FACTOR = 2.0,		-- Diplo score multiplier for state control compared to war participation difference
		GIVE_STATE_CONTROL_NEIGHBOR_SCORE = 20,		-- Diplo score for each neighboring state controlled by the target
		GIVE_STATE_CONTROL_NEIGHBOR_ACTOR_SCORE = -5, -- Diplo score for each neighboring state that is controlled by the sender
		GIVE_STATE_CONTROL_NEIGHBOR_OTHER_SCORE = 5, -- Diplo score for each neighboring state controlled by someone else
		GIVE_STATE_CONTROL_MAX_SCORE_DIST = 600,	-- A State that is closer to the recipient capital than this gets a score bonus based on the below value
		GIVE_STATE_CONTROL_DIST_SCORE_MULT = 0.2,	-- Multiplier for the score gained from distance ( GIVE_STATE_CONTROL_MAX_SCORE_DIST - distance ) * this
		IRRATIONALITY_LAMBDA = 200,					-- Lambda given to Poisson Random function determining if a leader should act a bit irrational 											
													-- Value of 200 should give 0.3% chance of Stalin going for instance crazy and conquering all of America
		GENERATE_WARGOAL_THREAT_BASELINE = 1.0,	    -- The baseline for what the AI considers the world is getting dangerous and we want to generate wargoals with no antagonize value	
		GENERATE_WARGOAL_ANTAGONIZE_SCALE = 0.35,    -- works to scale the AIs antagonize value vs the threat baseline for when it should act on existing claims: threat used for baseline is min_threat - antagonize * scale
		RESERVE_TO_COMMITTED_BALANCE = 0.1,			-- How many reserves compared to number of committed divisions in a combat (1.0 = as many as reserves as committed)
		DIPLOMACY_COMMUNIST_NOT_NEIGHBOUR = -10,	-- Communists want to stay consolidated with their influence
		MAIN_ENEMY_FRONT_IMPORTANCE = 4.0,			-- How much extra focus the AI should put on who it considers to be its current main enemy.
		EASY_TARGET_FRONT_IMPORTANCE = 7.5,			-- How much extra focus the AI should put on who it considers to be the easiest target.
		AI_FRONT_MOVEMENT_FACTOR_FOR_READY = 0.25,	-- If less than this fraction of units on a front is moving, AI sees it as ready for action	
		MICRO_POCKET_SIZE = 4,						-- Pockets with a size equal to or lower than this will be mocroed by the AI, for efficiency.
		DECLARE_WAR_MIN_FRONT_SIZE_TO_CONSIDER_FOR_NOT_READY = 0.04, -- fronts with less armies than this ratio compared to total number of armies are ignored when ai checks if it is ready for war
		POCKET_DISTANCE_MAX = 40000,				-- shortest square distance we bother about chasing pockets
		VP_MAX_PROVINCE_WORTH = 500,				-- Max worth a province can have to a defensive order
		VP_LEVEL_IMPORTANCE_MEDIUM = 10,			-- Victory points with values higher than or equal to this are considered to be of medium importance.

		-- these are all 3 numbers for min, desired, max unit need weights for area defense
		AREA_DEFENSE_CAPITAL_PEACE_VP_WEIGHT = { 1.0, 1.0, 1.0 },
		AREA_DEFENSE_CAPITAL_VP_WEIGHT = { 0.0, 1.0, 2.0 },
		AREA_DEFENSE_HOME_VP_WEIGHT = { 0.0, 0.5, 1.0 },
		AREA_DEFENSE_OTHER_VP_WEIGHT = { 0.0, 0.0, 1.0 },

		AREA_DEFENSE_CAPITAL_PEACE_COAST_WEIGHT = { 0.0, 0.0, 0.0 },
		AREA_DEFENSE_CAPITAL_COAST_WEIGHT = { 0.0, 0.2, 0.7 },
		AREA_DEFENSE_HOME_COAST_WEIGHT = { 0.0, 0.1, 0.5 },
		AREA_DEFENSE_OTHER_COAST_WEIGHT = { 0.0, 0.0, 0.0 },

		AREA_DEFENSE_CAPITAL_PEACE_BASE_WEIGHT = { 0.0, 0.0, 0.0 },
		AREA_DEFENSE_CAPITAL_BASE_WEIGHT = { 0.5, 1.0, 1.5 },
		AREA_DEFENSE_HOME_BASE_WEIGHT = { 0.5, 1.0, 1.0 },
		AREA_DEFENSE_OTHER_BASE_WEIGHT = { 0.5, 0.5, 1.0 },

		ESTIMATED_CONVOYS_PER_DIVISION = 6,			-- Not always correct, but mainly used to make sure AI does not go crazy
		ENTRENCHMENT_WEIGHT = 2.0,					-- AI should favour units with less entrenchment when assigning units around.
		FRONT_TERRAIN_DEFENSE_FACTOR = 5.0,			-- Multiplier applied to unit defense modifier for terrain on front province multiplied by terrain importance
		FRONT_TERRAIN_ATTACK_FACTOR = 5.0,			-- Multiplier applied to unit attack modifier for terrain on enemy front province multiplied by terrain importance
		
		BASE_DISTANCE_TO_CARE = 600.0,				-- Countries that are too far away are less interesting in diplomacy
		MIN_FORCE_RATIO_TO_PROTECT = 0.5,			-- Tiny countries should not feel protective or really large ones
		
		ORG_UNIT_STRONG = 0.75,						-- Organization % for unit to be considered strong
		STR_UNIT_STRONG = 0.75,						-- Strength (equipment) % for unit to be considered strong
		
		ORG_UNIT_WEAK = 0.15,						-- Organization % for unit to be considered weak
		STR_UNIT_WEAK = 0.2,						-- Strength (equipment) % for unit to be considered weak
		
		ORG_UNIT_NORMAL = 0.35,						-- Organization % for unit to be considered normal
		STR_UNIT_NORMAL = 0.4,						-- Strength (equipment) % for unit to be considered normal
		
		PLAN_FACTION_STRONG_TO_EXECUTE = 0.50,		-- % or more of units in an order to consider executing the plan
		PLAN_FACTION_NORMAL_TO_EXECUTE = 0.65,		-- % or more of units in an order to consider executing the plan
		PLAN_FACTION_WEAK_TO_ABORT = 0.65,			-- % or more of units in an order to consider executing the plan
		PLAN_AVG_PREPARATION_TO_EXECUTE = 0.5,		-- % or more average plan preparation before executing
		
		REDEPLOY_DISTANCE_VS_ORDER_SIZE = 1.0,		-- Factor applied to the path length of a unit compared to length of an order to determine if it should use strategic redeployment
		
		FORT_LEVEL_TO_CONSIDER_HIGHLY_FORTIFIED = 3,	-- Provinces above this level of fortification will be considered highly fortified by plan evaluation
		PLAN_VALUE_FORTIFICATION_LEVEL_MAX_PENALTY = -0.5,	--Max plan value penalty from fortification. This is scaled by number of provinces along a frontline, over the number which exceed the fort value value above

		MAX_ALLOWED_NAVAL_DANGER = 80,				-- AI will ignore naval paths that has danger value of above this threshold while assigning units
		TRANSFER_DANGER_HOSTILE_SHIPS = 50, 		-- max danger from complete enemy naval supriority over ai in an area

		EXPORT_RESOURCE_TRADE_NEED_IMPORTANCE = 0.5,  -- how important is each lost resource to overexport for trade law selection

		OPERATION_EQUIPMENT_NEED_PRODUCTION_MULT = 1.0, -- equipment requests for operations will be added the equipment needs that ai considers while assigning factories to production
		
		MIN_FUEL_RATIO_TO_NOT_IGNORE_STRIKE_FORCE_COST = 0.0, -- ai will still assign strike forces unless fuel ratio drops below this one
		MIN_FUEL_RATIO_TO_NOT_IGNORE_INVASION_SUPPORT_COST = 0.0, -- ai will still naval invasion support forces unless fuel ratio drops below this one

		ENEMY_HOME_AREA_RATIO_TO_DISABLE_INVASIONS = 0.3, -- if we are fighting against an enemy home area from our home area and if the enemy area is larger than this ratio, non strategy invasions are disabled

		HOURS_BETWEEN_ENCIRCLEMENT_DISCOVERY = 72,	-- Per army, interval in hours between refresh of which provinces it considers make up potential encirclement points

		FASCISTS_BEFRIEND_FASCISTS = 10,
		FASCISTS_BEFRIEND_DEMOCRACIES = -25,
		FASCISTS_BEFRIEND_COMMUNISTS = -25,
		FASCISTS_ALLY_FASCISTS = 0,
		FASCISTS_ALLY_DEMOCRACIES = -100,
		FASCISTS_ALLY_COMMUNISTS = -100,
		FASCISTS_ANTAGONIZE_FASCISTS = -10,
		FASCISTS_ANTAGONIZE_DEMOCRACIES = 100,
		FASCISTS_ANTAGONIZE_COMMUNISTS = 100,
		DEMOCRACIES_BEFRIEND_FASCISTS = -25,
		DEMOCRACIES_BEFRIEND_DEMOCRACIES = 0,
		DEMOCRACIES_BEFRIEND_COMMUNISTS = -25,
		DEMOCRACIES_ALLY_FASCISTS = -50,
		DEMOCRACIES_ALLY_DEMOCRACIES = 0,
		DEMOCRACIES_ALLY_COMMUNISTS = -50,
		DEMOCRACIES_ANTAGONIZE_FASCISTS = 0,
		DEMOCRACIES_ANTAGONIZE_DEMOCRACIES = -25,
		DEMOCRACIES_ANTAGONIZE_COMMUNISTS = 0,
		COMMUNISTS_BEFRIEND_FASCISTS = -25,
		COMMUNISTS_BEFRIEND_DEMOCRACIES = -25,
		COMMUNISTS_BEFRIEND_COMMUNISTS = 25,
		COMMUNISTS_ALLY_FASCISTS = -100,
		COMMUNISTS_ALLY_DEMOCRACIES = -50,
		COMMUNISTS_ALLY_COMMUNISTS = 0,
		COMMUNISTS_ANTAGONIZE_FASCISTS = 100,
		COMMUNISTS_ANTAGONIZE_DEMOCRACIES = 10,
		COMMUNISTS_ANTAGONIZE_COMMUNISTS = -10,

		TENSION_MIN_FOR_GUARANTEE_VS_MINOR = 0, -- for non faction people AI will not consider you worth guaranteeing below this
		
		NUM_AI_MESSAGES = 10,				-- Set to whatever category has the highest number of messages

		DIPLOMACY_FACTION_WAR_WANTS_HELP = 50,	-- Desire to send to nations to join a faction if you are at war
		DIPLOMACY_FACTION_CIVILWAR_WANTS_HELP = -50,
		FACTION_UNSTABLE_ACCEPTANCE = -100,
		DIPLOMACY_AT_WAR_WITH_ALLY_RELUCTANCE = -1000,
		DIPLOMACY_FACTION_JOIN_COUP_INITIATOR_BONUS = 70,	-- If a country initiated coup on an another country, civil war revolter is more likely to join initiator's faction
		

		SHIPS_PRODUCTION_BASE_COST = 10000,					-- Used by the AI to normalize IC values when picking what ship to build.
		NEEDED_NAVAL_FACTORIES_EXPENSIVE_SHIP_BONUS = 12,   -- Amount of naval yards you need to get a bonus to building really expensive ships

		FORTIFIED_RATIO_TO_CONSIDER_A_FRONT_FORTIFIED = 0.5, -- ai will consider a front fortified if this ratio of provinces has fort
		HEAVILY_FORTIFIED_RATIO_TO_CONSIDER_A_FRONT_FORTIFIED = 0.5, -- ai will consider a front super fortified if this ratio of provinces has lots of forts
		FORTIFIED_MIN_ORG_FACTOR_TO_CONSIDER_A_FRONT_FORTIFIED = 0.2, -- ai will treat fortified provinces as unfortified if no unit in that province has an organization factor at least this high
		
		DESPERATE_AI_MIN_UNIT_ASSIGN_TO_ESCAPE = 0,			-- AI will assign at least this amount of units to break from desperate situations
		
		DESPERATE_AI_WEAK_UNIT_STR_LIMIT = 0.35,					-- ai will increase number of units assigned to break from desperate situations when units are start falling lower than this str limit
		DESPERATE_AI_MIN_ORG_BEFORE_ATTACK = 0.3,					-- ai will wait for this much org to attack an enemy prov in desperate situations
		DESPERATE_AI_MIN_ORG_BEFORE_MOVE = 0.06,					-- ai will wait for this much org to move in desperate situations
		DESPERATE_ATTACK_WITHOUT_ORG_WHEN_NO_ORG_GAIN = 120,		-- if ai can't regain enough org to attack in this many hours, it will go truly desperate and attack anyway (still has to wait for move org)
		
		
		MAX_REQUEST_EXPEDITIONARIES_ARMY_RATIO = 0.3,				-- AI will not accept expeditionary requests if its expeditions are above this ratio
		CASUALTY_RATIO_TO_PULL_EXPEDITIONARIES_BACK = 0.1,			-- AI will pull expeditioniries back if its casualties is aboce this ratio compared to their total deployed manpower
		CASUALTY_RATIO_TO_NOT_SEND_EXPEDITIONARIES = 0.05,			-- AI will not send expeditioniries if its casualties is aboce this ratio compared to their total deployed manpower
		
		SURRENDER_LEVEL_TO_PULL_EXPEDITIONARIES_BACK = 0.3,			-- AI will pull expeditioniries back if its surrender level is above this ratio
		SURRENDER_LEVEL_TO_NOT_SEND_EXPEDITIONARIES = 0.15,			-- AI will not send expeditioniries if its surrender level is above this ratio

		EXPEDITIONARY_CASUALTY_DECAY_RATIO = 0.3333,				-- expeditionary manpower lost will decay by thousands daily by this ratio (compared to deployed manpower)
		NUM_DAYS_TO_PULL_EXPEDITIONARIES_BACK = 14,					-- AI will pull units back from non-ai players after waiting this days if things are not going well for its units
		
		ACCESS_SCORE_FOR_DEMOCRATIC_COUNTRIES = 500,				-- democracies gives each other access if they have a common enemy
		
		AI_AIR_MISSION_COVERAGE_TO_STAY_PUT = 0.5,					-- AI will not rebase air wings on missions if their new mission target exceeds this percentage of region coverage

		ACCESS_SCORE_PENALTY_PER_EXISTING_ACCESS_AT_WAR = 250,		-- each access reduces the desire of next access
		ACCESS_SCORE_PENALTY_PER_EXISTING_ACCESS = 500,				-- each access reduces the desire of next access
		NAVAL_ACCESS_SCORE_PENALTY_PER_EXISTING_ACCESS_AT_WAR = 150,
		NAVAL_ACCESS_SCORE_PENALTY_PER_EXISTING_ACCESS = 250,
		
		NAVAL_SUPREMACY_WEIGHT_PER_DIVISION_ON_INVASION_ORDER = 6,	-- adds to supremacy requests for regions with active or pending naval invasions

		TOO_INSIGNIFICANT_ARMY_RATIO_BEGIN = 0.75,					-- if army ratio is of a country is larger than this threshold, it will be less reluctant to accept certain diplo actions
		TOO_INSIGNIFICANT_MAX_PENALTY = 350,						-- max penalty that will be applied for thinking a country is too insignificant

		-- Calculating wanted nr of divisions
		WANTED_UNITS_INDUSTRY_FACTOR = 1.45,                        -- How many units a country wants is partially based on how much military industry that is available
		WANTED_UNITS_THREAT_BASE = 0.7,                             -- If no threat, multiply min wanted units by this
		WANTED_UNITS_THREAT_MAX = 25.0,                             -- Normalized threat is clamped to this
		WANTED_UNITS_WAR_THREAT_FACTOR = 1.5,                       -- Factor threat with this if country is at war. this value is overriden by the value in ideology database if that value exceedes this.
		WANTED_UNITS_DANGEROUS_NEIGHBOR_FACTOR = 1.25,              -- Factor if has dangerous neighbor
		WANTED_UNITS_MANPOWER_DIVISOR = 22000,                      -- Normalizing divisor for AI manpower. (for each x max available manpower, they want one division)
		WANTED_UNITS_WEIGHT_FRONTS_WANT = 0.35,                      -- Weight of front needs when computing final nr wanted units
		WANTED_UNITS_WEIGHT_FACTORIES = 0.45,                        -- Weight of military factories when computing final nr wanted units
		WANTED_UNITS_WEIGHT_MANPOWER = 0.3,                         -- Weight of manpower availability when computing final nr wanted units
		WANTED_UNITS_MIN_DEFENCE_FACTOR = 0.4,						-- Factor on units required for min defence
		-- End of calculating wanted nr of divisions

		WANTED_UNITS_MAX_WANTED_CAP = 500,	-- Maximum wanted divisions for a country. This can be exceeded by certain hardcoded multipliers, but not by base calculation logic.

		WANTED_LAND_PLANES_PER_BASE_CAPACITY_FACTOR = 1,	-- Scales how many land-based planes the AI want per air base space (excluding carriers).
		WANTED_LAND_PLANES_PER_DIVISION = 20,				-- How many land-based planes the AI want for each division it wants.
		WANTED_LAND_PLANES_TOTAL_MAX_PER_DIVISION = 100,	-- The max total number of land-based planes the AI want.

		WANTED_CARRIER_PLANES_PER_CARRIER_CAPACITY_FACTOR = 1,					-- Scales how many carrier planes the AI want per carrier deck space.
		WANTED_CARRIER_PLANES_PER_CARRIER_CAPACITY_IN_PRODUCTION_FACTOR = 1,	-- Scales how many carrier planes the AI want per deck space of carriers in production.
		CARRIER_CAPACITY_IN_PRODUCTION_MAX_DAYS_LEFT_TO_INCLUDE_FACTOR = 365,	-- Carriers in production that will take more days to complete than this value will be ignored when calculating the above.

		START_TRAINING_EQUIPMENT_LEVEL = 0.95,               -- ai will not start to train if equipment drops below this level
		STOP_TRAINING_EQUIPMENT_LEVEL = 0.90,                -- ai will not train if equipment drops below this level
		START_TRAINING_SUPPLY_LEVEL = 0.40,                  -- ai will not start to train if supply ratio drops below this level
		STOP_TRAINING_SUPPLY_LEVEL = 0.30,                   -- ai will not train if supply ratio drops below this level
		STOP_TRAINING_FULLY_TRAINED_FACTOR = 0.95,           -- ai will not train if at least this ratio of divisions in the army are fully trained		
		
		BUILD_REFINERY_LACK_OF_RESOURCE_MODIFIER = 0.003,	-- How much lack of resources are worth when evaluating what to build.
	    
		REMOVE_OBSOLETE_TEMPLATE_DAYS = 180,                -- Remove obsolete and unused templates if they have been marked as obsolete for x days. Non-positive value means "never remove".

		DIVISION_DESIGN_MAX_FAILED_DAYS = 60,					-- max days we keep track of since failure of a template design update
		
		DIVISION_MATCH_ROLE_BOOST_FACTOR = 1.2,                 -- When finding closest matching existing template to a target template, boost the score by this much if the template also has the correct role

		EQUIPMENT_DESIGN_MAX_FAILED_DAYS = 60,					-- max days we keep track of since failure of an equipment design update


		UPGRADE_DIVISION_RELUCTANCE = 7,					-- How often to consider upgrading to new templates for units in the field
		UPGRADE_PERCENTAGE_OF_FORCES = 0.1,					-- How big part of the army that should be considered for upgrading

		REFIT_SHIP_RELUCTANCE = 28,							-- How often to consider refitting to new equipment variants for ships in the field
		REFIT_SHIP_PERCENTAGE_OF_FORCES = 0.1,				-- How big part of the navy that should be considered for refitting
		
		
		NAVY_PREFERED_MAX_SIZE = 20,						-- AI will generally attempt to merge fleets into this size, but as a soft limit.
		INVASION_COASTAL_PROVS_PER_ORDER = 24,				-- AI will consider one extra invasion per number of provinces stated here (num orders = total coast / this)
		MIN_INVASION_AREA_SIZE_FOR_FLOATING_HARBORS = 15,   -- AI will consider using floating harbors for naval invasion if invasion area is larger than this many provinces

		CONVOY_NEED_SAFETY_BUFFER = 1.30,					-- AI will try and keep 15% more convoys than what it needs.
		REGION_THREAT_PER_SUNK_CONVOY = 25,					-- Threat value per convoy sunk in a region. Decays over time.
		REGION_THREAT_LEVEL_TO_AVOID_REGION = 25 * 10,		-- How much threat must be generated in region ( by REGION_THREAT_PER_SUNK_CONVOY ) so the AI will decide to mark the region as avoid
		REGION_THREAT_LEVEL_TO_BLOCK_REGION = 25 * 100,		-- How much threat must be generated in region ( by REGION_THREAT_PER_SUNK_CONVOY ) so the AI will decide to mark the region as avoid
		REGION_CONVOY_DANGER_DAILY_DECAY = 1,				-- When convoys are sunk it generates threat in the region which the AI uses to prio nalval missions

		PRODUCTION_LINE_SWITCH_SURPLUS_NEEDED_MODIFIER = 0.2,	-- Is modified by efficency modifiers.
		PLAN_ACTIVATION_MAJOR_WEIGHT_FACTOR = 5.0,			-- AI countries will hold on activating plans if stronger countries have plans in the same location. Majors count extra (value of 1 will negate this)
		PLAN_ACTIVATION_PLAYER_WEIGHT_FACTOR = 50.0,		-- AI countries will hold on activating plans if player controlled countries have plans in the same location. Majors count extra (value of 1 will negate this)
		AREA_DEFENSE_BASE_IMPORTANCE = 3,					-- Area defense order base importance value (used for determining order of troop selections)
		AREA_DEFENSE_CIVIL_WAR_IMPORTANCE = 10000,			-- Area defense order importance value when a country is in a civil war as target or revolter.
		AREA_DEFENSE_IMPORTANCE_FACTOR = 1.0,               -- used to balance defensive area importance vs other fronts

		MAX_DISTANCE_NAVAL_INVASION = 200.0,				-- AI is extremely unwilling to plan naval invasions above this naval distance limit.
		ENEMY_NAVY_STRENGTH_DONT_BOTHER = 2.5,				-- If the enemy has a navy at least these many times stronger that the own, don't bother invading
		MIN_SUPPLY_USE_SANITY_CAP = 100,					-- Ignore supply cap if below this value when deciding on how many divisions to produce.
		MAX_SUPPLY_DIVISOR = 1.75,							-- To make sure the AI does not overdeploy divisions. Higher number means more supply per unit.
		MISSING_CONVOYS_BOOST_FACTOR = 18.0,					-- The more convoys a country is missing, the more resources it diverts to cover this.
		TRANSPORTS_PER_PARATROOPER = 20,					-- Air transports only duty is to drop paratroopers.
		MAX_MICRO_ATTACKS_PER_ORDER = 3,					-- AI goes through its orders and checks if there are situations to take advantage of
		FALLBACK_LOSING_FACTOR = 1.0,						-- The lower this number, the longer the AI will hold the line before sending them to the fallback line
		PRODUCTION_MAX_PROGRESS_TO_SWITCH_NAVAL = 0.1,		-- AI will not replace ships being built by newer types if progress is above this
		PRODUCTION_WAIT_TO_FINISH_IF_EXPENSIVE = 0.25,      -- If produced item is expensive (producing less than one/week), wait to finish item if progress is above this
		PRODUCTION_WAIT_TO_FINISH_IF_CHEAP = 0.75,          -- If produced item is cheap (producing more than one/week), wait to finish item if progress is above this
		STATE_CONTROL_FOR_AREA_DEFENSE = 0.4,				-- To avoid AI sending area defense to area with very little foothold
		FORCE_FACTOR_AGAINST_EXTRA_MINOR = 0.25,			-- AI considers generating wargoals against minors below this % of force compared to themselves to get at a bigger enemy.
		MAX_EXTRA_WARGOAL_GENERATION = 2,					-- AI may want to generate wargoals against weak minors to get at larger enemy, but never more that this at any given time.
		NAVAL_MISSION_DISTANCE_BASE = 3500,					-- Base value when AI is evaluating distance score to places
		NAVAL_MISSION_INVASION_BASE = 1000,					-- Base score for region with naval invasion (modified dynamically by prioritizing orders)
		NAVAL_MISSION_AGGRESSIVE_PATROL_DIVISOR = 1,		-- Divides patrol score when not defending
		NAVAL_MISSION_AGGRESSIVE_ESCORT_DIVISOR = 2,		-- Divides escort score when not defending
		NAVAL_MISSION_PATROL_NEAR_OWNED = 500,			-- Extra patrol mission score near owned provinces
		NAVAL_MISSION_ESCORT_NEAR_OWNED = 300,			-- Extra escort mission score near owned provinces
		NAVAL_MISSION_PATROL_NEAR_CONTROLLED = 120,		-- Extra patrol mission score near controlled provinces
		NAVAL_MISSION_ESCORT_NEAR_CONTROLLED = 250,		-- Extra escort mission score near controlled provinces
		NAVAL_MISSION_MINES_PLANTING_NEAR_OWNED = 40000,
		NAVAL_MISSION_MINES_PLANTING_NEAR_CONTROLLED = 30000,
		NAVAL_MISSION_MINES_SWEEPING_NEAR_OWNED = 60000,	 -- How likely the AI will do the sweeping missions. The value is scaled by the amount of mines to sweep.
		NAVAL_MISSION_MINES_SWEEPING_NEAR_CONTROLLED = 50000,-- Same as above, but nearby the controlled territory.
		NEW_LEADER_EXTRA_CP_FACTOR = 2.0,					-- Country must have at least this many times extra command power to get new admirals or army leaders
		SCARY_LEVEL_AVERAGE_DEFENSE = -0.7,                 -- average front defense modifier to make it consider it as a PITA to go for
		ATTACK_HEAVILY_DEFENDED_LIMIT = 0.5,				-- AI will not launch attacks against heavily defended fronts unless they consider to have this level of advantage (1.0 = 100%)
	    CANCEL_COMBAT_DISADVANTAGE_RATIO = 1.5,             -- If the enemy's advantage ratio over us during (normal) combat is more than <value>, allow canceling the attack
	    CANCEL_COMBAT_MIN_DURATION_HOURS = 48,              -- Only allow cancelling (normal) combat if at least <value> hours have passed
	    CANCEL_INVASION_COMBAT_DISADVANTAGE_RATIO = 3.5,    -- If the enemy's advantage ratio over us during invasion combat is more than <value>, allow canceling the attack
	    CANCEL_INVASION_COMBAT_MIN_DURATION_HOURS = 120,     -- Only allow cancelling invasion combat if at least <value> hours have passed
		MIN_PLAN_VALUE_TO_MICRO_INACTIVE = 0.2,				-- The AI will not consider members of groups which plan is not activated AND evaluates lower than this.
		
		MAX_UNITS_FACTOR_AREA_ORDER = 0.85,					-- Factor for max number of units to assign to area defense orders
		DESIRED_UNITS_FACTOR_AREA_ORDER = 0.8,				-- Factor for desired number of units to assign to area defense orders
		MIN_UNITS_FACTOR_AREA_ORDER = 1.0,					-- Factor for min number of units to assign to area defense orders

		MAX_UNITS_FACTOR_FRONT_ORDER = 1.0,					-- Factor for max number of units to assign to area front orders
		DESIRED_UNITS_FACTOR_FRONT_ORDER = 1.1,				-- Factor for desired number of units to assign to area front orders
		MIN_UNITS_FACTOR_FRONT_ORDER = 1.0,					-- Factor for min number of units to assign to area front orders

		MAX_UNITS_FACTOR_INVASION_ORDER = 1.0,				-- Factor for max number of units to assign to naval invasion orders
		DESIRED_UNITS_FACTOR_INVASION_ORDER = 1.0,			-- Factor for desired number of units to assign to naval invasion orders
		MIN_UNITS_FACTOR_INVASION_ORDER = 1.0,				-- Factor for min number of units to assign to naval invasion orders
		
		FRONT_UNITS_CAP_FACTOR = 15.0,						-- A factor applied to total front size and supply use. Primarily effects small fronts
		MAX_DIST_PORT_RUSH = 20.0,							-- If a unit is in enemy territory with no supply it will consider nearby ports within this distance.
		
		MIN_FIELD_STRENGTH_TO_BUILD_UNITS = 0.7,			-- Cancel unit production if below this to get resources out to units in the field
		MIN_MANPOWER_TO_BUILD_UNITS = 0.7,					-- Cancel unit production if below this to get resources out to units in the field
		
		AVERAGE_SUPPLY_USE_PESSIMISM = 1.5,					-- Multiplier for when AI calculates average supply use of entire army.
		
		PROPOSE_LEND_LEASE_AIDESIRE_SAME_IDEOLOGY = 40,				-- Added to AI desire to propose lend lease if recipent is same ideology (and AI can't declare war on recipient)
		PROPOSE_LEND_LEASE_AIDESIRE_SAME_IDEOLOGY_CIVIL_WAR = 25,	-- Added to AI desire to propose lend lease if recipent is same ideology and they are currently in civil war
		SEND_VOLUNTEER_AIDESIRE_SAME_IDEOLOGY = 40,					-- Added to AI desire to send volunteers if recipent is same ideology (and AI can't declare war on recipient)
		SEND_VOLUNTEER_AIDESIRE_SAME_IDEOLOGY_CIVIL_WAR = 25,		-- Added to AI desire to send volunteers if recipent is same ideology and they are currently in civil war

		REQUEST_LEND_LEASE_PROTECT_VALUE = 75,				-- Limit for protect enemy desire for reducing lend lease desire
		REQUEST_LEND_LEASE_CONTAINS_VALUE = 100,			-- Limit of contain enemy desire for boosting friendly help
		
		FRONT_BULGE_RATIO_UPPER_CUTOFF = 1.5,				-- If total bulginess is lower than this, the front is ignored.
		FRONT_BULGE_RATIO_LOWER_CUTOFF = 0.95,				-- If local bulginess drops below this, a point of interest is found
		FRONT_CUTOFF_MIN_EDGE_PROXIMITY = 2,				-- Minimum number of provinces to the front edge to determine for cutoff oportunity.

		
		
		AIR_SCORE_DISTANCE_IMPACT = 0.3,					-- Effect of distance applied to the score calculations
		DAYS_BETWEEN_AIR_PRIORITIES_UPDATE = 4,				-- Amount of days between air ai updates priorities for air wings ( from 1 to N )
		
		NAVAL_AIR_SUPERIORITY_IMPORTANCE = 0.10,			-- Strategic importance of air superiority ( amount of enemy planes in area )
		NAVAL_SHIP_AIR_IMPORTANCE = 2.0,					-- Naval ship air importance
		NAVAL_SHIP_IN_PORT_AIR_IMPORTANCE = 6.0,			-- Naval ship in the port air importance
		NAVAL_COMBAT_AIR_IMPORTANCE = 12.0,					-- Naval combat air importance
		NAVAL_TRANSFER_AIR_IMPORTANCE = 0.0,				-- Naval transfer air importance
		NAVAL_COMBAT_TRANSFER_AIR_IMPORTANCE = 50.0,		-- Naval combat involving enemy land units
		NAVAL_IMPORTANCE_SCALE = 1.0,						-- Naval total importance scale (every naval score get's multiplied by it)
		NAVAL_COMBAT_OUR_NAVY_MULT_ON_IMPORTANCE = 0.35,	-- Naval region importance are scaled by our ships as well
		NAVAL_COMBAT_ALLY_NAVY_MULT_ON_IMPORTANCE = 0.15,	-- Naval region importance are scaled by our ships as well
		NAVAL_COMBAT_MIN_OUR_NAVY_MULT_ON_IMPORTANCE = 0.5, -- Min scale factor for naval region importance from our ships
		NAVAL_COMBAT_MAX_OUR_NAVY_MULT_ON_IMPORTANCE = 1.0, -- Max scale factor for naval region importance from our ships
		
		
		NAVAL_RANGE_FOR_DOCKING_RIGHTS_CHECK = 240.0,		-- Naval range used to check if docking rights would allow us to reach a specific province
		
		NAVAL_PATROL_PLANES_PER_SHIP_PATROLLING = 10.0,		-- Amount of naval patrol planes per ship on a patrol mission
		NAVAL_PATROL_PLANES_PER_SHIP_RAIDING = 10.0,		-- Amount of naval patrol planes per ship on a convoy raid mission
		NAVAL_PATROL_PLANES_PER_SHIP_ESCORTING = 10.0,		-- Amount of naval patrol planes per ship on a convoy escort mission

		NAVAL_FIGHTERS_PER_PLANE = 1.0,						-- Amounts of air superiority planes requested per enemy plane
		NAVAL_STRIKE_PLANES_PER_ARMY = 0,					-- Amount of planes requested per enemy army
		NAVAL_STRIKE_PLANES_PER_SHIP = 20,					-- Amount of bombers requested per enemy ship
		PORT_STRIKE_PLANES_PER_SHIP = 10,					-- Amount of bombers request per enemy ship in the port
		MINES_SWEEPING_PLANES_PER_MAX_MINES = 150, 			-- Amount of air wings request for mines sweeping when there is max amount of mines planted by enemy in certain region
		MINES_PLANTING_PLANES_PER_MAX_DESIRE = 100,			-- Amount of air wings request for mines planting when there is max desire for it.
		MINES_PLANTING_DESIRE_PER_HOME_STATE = 0.4,			-- Scoring for how much do we want to plant naval mines with our air wings if the naval region is adjacent to a home state. Multiple adjacent states increases the score. Max sum of score is 1.0.
		MINES_PLANTING_DESIRE_PER_ENEMY_STATE = 0.1,		-- Scoring for how much do we want to plant naval mines with our air wings if the naval region is adjacent to the enemy state. Multiple adjacent states increases the score. Max sum of score is 1.0.
		MINES_PLANTING_DESIRE_PER_NAVAL_THREAT = 250,		-- How much threat must be generated in the naval region, in order to get the maximum desire to plant naval mines in there.
		NAVAL_MIN_EXCORT_PLANES = 0,						-- Min amount of planes requested to excort operations
		DEMOCRATIC_AI_FACTION_KICKING_PLAYER_THREAT_DIFFERENCE = 6.0, -- World threat generation difference needed to kick a player from a democratic faction
		BEFRIEND_FACTOR_FOR_KICKING_COUNTRIES = 7.5,		-- World threat difference addition per 100 befriend against a country, democratic leaders will forgive allies if they are befriending them
		
		LAND_DEFENSE_AIR_SUPERIORITY_IMPORTANCE = 0.10,		-- Strategic importance of air superiority ( amount of enemy planes in area )
		LAND_DEFENSE_CIVIL_FACTORY_IMPORTANCE = 50,			-- Strategic importance of civil factories
		LAND_DEFENSE_MILITARY_FACTORY_IMPORTANCE = 70,		-- Strategic importance of military factories
		LAND_DEFENSE_NAVAL_FACTORY_IMPORTANCE = 30,			-- Strategic importance of naval factories
		LAND_DEFENSE_SUPPLY_HUB_IMPORTANCE = 4,             -- Strategic importance of supply hubs
		LAND_DEFENSE_AA_IMPORTANCE_FACTOR = 1.0,			-- Factor of AA influence on strategic importance ( 0.0 - 1.0 )
		LAND_DEFENSE_INFRA_IMPORTANCE_FACTOR = 0.5,			-- Factor of infrastructure influence on strategic importance ( 0.0 - 1.0 )
		LAND_DEFENSE_IMPORTANCE_SCALE = 1.5,				-- Lend defence total importance scale (every land defence score get's multiplied by it)
		
		NUM_HOURS_SINCE_LAST_COMBAT_TO_SUPPORT_UNITS_VIA_AIR = 72,			-- units will be considered in combat if they are just out of their last combat for air supporting
		
		LAND_DEFENSE_MIN_FACTORIES_FOR_AIR_IMPORTANCE = 6,	-- If amount of factories is less importance of factories won't apply
		
		LAND_DEFENSE_FIGHERS_PER_PLANE = 1.0,				-- Amount of air superiority planes requested per enemy plane
    	LAND_DEFENSE_INTERCEPTORS_PER_BOMBERS = 0.8,        -- Amount of interceptor planes requested per enemy bomber
    	LAND_DEFENSE_INTERCEPTORS_PER_PLANE = 0.1,          -- Amount of interceptor planes requested per enemy plane (non bomber)
	    LAND_DEFENSE_SAM_MISSILE_IMPORTANCE_FACTOR = 0.2,	-- Importance factor of using sam missiles for regions strategic importance. Higher value will increase the usage
        LAND_COMBAT_MISSILE_IMPORTANCE_FACTOR = 1.5, 		-- Importance factor of using missiles for regions strategic importance. Higher value will increase the usage

	    LAND_DEFENSE_RAID_IMPORTANCE = 500,                 -- Strategic importance of detected raids targetting us
	    LAND_DEFENSE_FIGHERS_PER_RAID = 100,                -- Amount of air superiority planes requested per detected raid targetting us
	    LAND_DEFENSE_INTERCEPTORS_PER_RAID = 100,           -- Amount of interceptor planes requested per detected raid targetting us
		LAND_COMBAT_AIR_SUPERIORITY_IMPORTANCE = 0.20,		-- Strategic importance of air superiority ( amount of enemy planes in area )
		LAND_COMBAT_OUR_ARMIES_AIR_IMPORTANCE = 12,			-- Strategic importance of our armies
		LAND_COMBAT_OUR_COMBATS_AIR_IMPORTANCE = 55,		-- Strategic importance of our armies in the combats
		LAND_COMBAT_FRIEND_ARMIES_AIR_IMPORTANCE = 12,		-- Strategic importance of friendly armies
		LAND_COMBAT_FRIEND_COMBATS_AIR_IMPORTANCE = 6,		-- Strategic importance of friendly armies in the combat
		LAND_COMBAT_ENEMY_ARMIES_AIR_IMPORTANCE = 8,		-- Strategic importance of our armies
		LAND_COMBAT_ENEMY_LAND_FORTS_AIR_IMPORTANCE = 5,	-- Strategic importance of enemy land forts in the region
		LAND_COMBAT_ENEMY_COASTAL_FORTS_AIR_IMPORTANCE = 3,	-- Strategic importance of enemy coastal fronts in the region
		LAND_COMBAT_IMPORTANCE_SCALE = 5.0,					-- Lend combat total importance scale (every land combat score get's multiplied by it)
		
		LAND_COMBAT_FIGHTERS_PER_PLANE = 1.0,				-- Amount of air superiority planes requested per enemy plane
		LAND_COMBAT_CAS_PLANES_PER_ENEMY_ARMY_LIMIT = 200,	-- Limit of CAS planes requested by enemy armies
		LAND_COMBAT_CAS_PER_ENEMY_ARMY = 30,				-- Amount of CAS planes requested per enemy division
		LAND_COMBAT_ANTI_LOGISTICS_PER_ENEMY_ARMY = 0.1,    -- Amount of CAS planes requested per enemy army for anti-logistics
		LAND_COMBAT_CAS_PER_COMBAT = 60,					-- Amount of CAS requested per combat
		LAND_COMBAT_BOMBERS_PER_LAND_FORT_LEVEL = 6,		-- Amount of bomber planes requested per enemy land fort level
		LAND_COMBAT_BOMBERS_PER_COASTAL_FORT_LEVEL = 6,		-- Amount of bomber planes requested per enemy coastal fort level
		LAND_COMBAT_MIN_EXCORT_PLANES = 80,					-- Min amount of planes requested to excort operations
		
		LAND_COMBAT_INTERCEPT_PER_PLANE = 0.25,				-- Amount of interception planes requested per enemy plane
		MIN_ALLIED_DEFENSE_FACTOR_AIRWING_REQUESTS = 0.07,	-- Airwing requests will be factored by a minimum of this when comparing own vs friendly troops in area
		AIR_SUPERIORITY_FOR_FRIENDLY_CAS_RATIO = 0.75,		-- Demand at least this proportion of our cas planes as air superiority regardless of other needs
		LAND_COMBAT_GUIDE_DISTANCE = 290.0,					-- Distance within whch we'll care a bit more about sending planes regardless of whether our boiz are dying
		
		ENEMY_PASSING_THROUGH_PLANES_PER_BOMBER = 0.1,		-- Amount of planes we assign to intercept enemies en-route to a location
		ENEMY_PASSING_THROUGH_PLANES_PER_FIGHTER = 0.1,		-- Amount of planes we assign to intercept enemies en-route to a location
		ENEMY_PASSING_THROUGH_PLANES_PER_SUPPORT = 0.1,		-- Amount of planes we assign to intercept enemies en-route to a location
			
		AI_FRACTION_OF_FIGHTERS_RESERVED_FOR_INTERCEPTION = 0.25,	--Percentage of fighters we reserve for interception vs AS
		MAX_AIR_REGIONS_TO_CARE_ABOUT = 6,							-- Number of regions we'll consider when trying to split planes a bit. Split is NOT equal, just a guide, leftovers still applied elsewhere if needed
		
		ENEMY_PASSING_THROUGH_PLANES_PER_BOMBER_NAVAL_REGION = 0.15,		-- Amount of planes we assign to intercept enemies en-route to a location over a sea region
		ENEMY_PASSING_THROUGH_PLANES_PER_FIGHTER_NAVAL_REGION = 0.15,		-- Amount of planes we assign to intercept enemies en-route to a location over a sea region
		ENEMY_PASSING_THROUGH_PLANES_PER_SUPPORT_NAVAL_REGION = 0.15,		-- Amount of planes we assign to intercept enemies en-route to a location over a sea region
		NAVAL_DEFENSE_INTERCEPTION_IMPORTANCE_FACTOR = 30,	-- Factor on added planes passing through region to strategic importance

		XP_RATIO_REQUIRED_TO_RESEARCH_WITH_XP = 2.0,		-- AI will at least need this amount of xp compared to cost of a tech to reserch it with XP			
		RESEARCH_WITH_XP_AI_WEIGHT_MULT = 1.2, 				-- AI will bump score of a research with this mult if it can use XP
		
		STR_BOMB_AIR_SUPERIORITY_IMPORTANCE = 0.10,			-- Strategic importance of air superiority ( amount of enemy planes in area )
		STR_BOMB_CIVIL_FACTORY_IMPORTANCE = 50,				-- Strategic importance of enemy civil factories
		STR_BOMB_MILITARY_FACTORY_IMPORTANCE = 70,			-- Strategic importance of enemy military factories
		STR_BOMB_NAVAL_FACTORY_IMPORTANCE = 30,				-- Strategic importance of enemy naval factories
		STR_BOMB_SUPPLY_HUB_IMPORTANCE = 4,                 -- Strategic importance of enemy supply hubs
		STR_BOMB_AA_IMPORTANCE_FACTOR = 0.5,				-- Factor of AA influence on strategic importance ( 0.0 - 1.0 )
		STR_BOMB_INFRA_IMPORTANCE_FACTOR = 0.25,			-- Factor of infrastructure influence on strategic importance ( 0.0 - 1.0 )
		STR_BOMB_IMPORTANCE_SCALE = 1.0,					-- str bombing total importance scale (every str bombing score get's multiplied by it)
		
		STR_BOMB_MIN_ENEMY_FIGHTERS_IN_AREA = 300,			-- If amount of enemy fighters is higher than this mission won't perform
		STR_BOMB_FIGHTERS_PER_PLANE = 1.1,					-- Amount of air superiority planes requested per enemy plane
		STR_BOMB_PLANES_PER_CIV_FACTORY = 20,				-- Amount of planes requested per enemy civ factory
		STR_BOMB_PLANES_PER_MIL_FACTORY = 25,				-- Amount of planes requested per enemy military factory
		STR_BOMB_PLANES_PER_NAV_FACTORY = 15,				-- Amount of planes requested per enemy naval factory
		STR_BOMB_PLANES_PER_SUPPLY_HUB = 3,                 -- Amount of planes requested per enemy supply node
		STR_BOMB_MIN_EXCORT_PLANES = 200,					-- Min amount of planes requested to excort operations
		RECON_PLANES_NAVAL = 50,                           -- scale on recon for naval areas 
		RECON_PLANES_LAND_COMBAT = 25,                     -- scale on recon for land combat areas 
		RECON_PLANES_STRATEGIC = 50,                       -- scale on recon for strategic areas 

		ASSIGN_FRONT_ARMY_SOFT_ATTACK_FACTOR = 0.1,                 -- Importance of unit's ARMY_SOFT_ATTACK stat when assigning to a front
		ASSIGN_FRONT_ARMY_HARD_ATTACK_FACTOR = 0.1,                -- Importance of unit's ARMY_HARD_ATTACK stat when assigning to a front
		ASSIGN_FRONT_ARMY_BREAKTHROUGH_FACTOR = 0.2,               -- Importance of unit's ARMY_BREAKTHROUGH stat when assigning to a front
		ASSIGN_DEFENSE_ARMY_DEFENSE_FACTOR = 3.0,                   -- Importance of unit's ARMY_DEFENSE stat when assigning to an area defense order
		ASSIGN_DEFENSE_ARMY_ENTRENCHMENT_FACTOR = 2.0,              -- Importance of unit's ARMY_ENTRENCHMENT stat when assigning to an area defense order
		ASSIGN_DEFENSE_TEMPLATE_CLASS_SCORE = 3.0,                  -- Importance of unit's AI template class (AREA_DEFENSE, CAVALRY) when assigning to an area defense order
		ASSIGN_INVASION_AMPHIBIOUS_ATTACK_FACTOR = 50.0,            -- Importance of unit's amphibious attack adjuster when assigning to an invasion order
		ORDER_ASSIGNMENT_DISTANCE_FACTOR = 100.0,                    -- When the AI assigns units to orders, how much should distance be taken into account?
		REVISITED_PROV_BOOST_FACTOR = 4,                            -- When the AI picks units for a front, it prioritises units already nearby.
		UNIT_ASSIGNMENT_STATS_IMPORTANCE = 3.0,                     -- Stats score for units are multiplied by this when the AI is deciding which front they should be assigned to

		ASSIGN_FRONT_TERRAIN_ATTACK_FACTOR = 3.0,                   -- Importance of unit's terrain adjusted attack stat when assigning to a front
		ASSIGN_FRONT_TERRAIN_DEFENSE_FACTOR = 1.0,                  -- Importance of unit's terrain adjusted defense stat when assigning to a front
		ASSIGN_FRONT_TERRAIN_MOVEMENT_FACTOR = 2.0,                 -- Importance of unit's terrain adjusted movement stat when assigning to a front
		ASSIGN_DEFENSE_TERRAIN_ATTACK_FACTOR = 0.5,                 -- Importance of unit's terrain adjusted attack stat when assigning to an area defense order
		ASSIGN_DEFENSE_TERRAIN_DEFENSE_FACTOR = 4.0,               -- Importance of unit's terrain adjusted defense stat when assigning to an area defense order
		ASSIGN_DEFENSE_TERRAIN_MOVEMENT_FACTOR = 0.5,               -- Importance of unit's terrain adjusted movement stat when assigning to an area defense order
		ASSIGN_MOUNTAINEERS_TO_MOUNTAINS = 10.0,                    -- factor for assigning mountaineer divisions to fronts with mountains (proportional to how much of that terrain type)
		ASSIGN_TANKS_TO_MOUNTAINS = -4.0,                           -- factor for assigning tank divisions to fronts with mountains (proportional to how much of that terrain type)
		ASSIGN_TANKS_TO_JUNGLE = -6.0,                              -- factor for assigning tank divisions to fronts with jungle (proportional to how much of that terrain type)
		UNIT_ASSIGNMENT_TERRAIN_IMPORTANCE = 10.0,                  -- Terrain score for units are multiplied by this when the AI is deciding which front they should be assigned to

		ASSIGN_TANKS_TO_WAR_FRONT = 4.0,                            -- Scoring factor for assigning tank divisions to active war fronts
		ASSIGN_TANKS_TO_NON_WAR_FRONT = 0.4,                        -- Scoring factor for assigning tank divisions to non-war fronts

		REASSIGN_TO_ANOTHER_FRONT_FACTOR = 0.5,                    -- Factor for reassigning to another front. 0.0 < X < 1.0 means reluctant, X > 1.0 means want to.
		REASSIGN_TO_ANOTHER_FRONT_IF_IN_COMBAT_FACTOR = 0.2,       -- Factor for reassigning to another front if in combat. 0.0 < X < 1.0 means reluctant, X > 1.0 means want to.

		ENEMY_FORTIFICATION_FACTOR_FOR_FRONT_REQUESTS = 2.0,		-- front unit request factor at max enemy fortification
		ENEMY_FORTIFICATION_FACTOR_FOR_FRONT_REQUESTS_MAX = 0.7, 	-- max factor that can be added by enemy fortification

		MANPOWER_RATIO_CAREFULNESS_THRESHOLD = 0.05,                -- if manpower ratio (available/used-by-army) is less than this, start being more careful with plan execution (i.e. don't throw your men into the meat grinder if you're running out of manpower)
		
		PLAN_ACTIVATION_SUPERIORITY_AGGRO = 1.0,			-- How aggressive a country is in activating a plan based on how superiour their force is.
		WAIT_YEARS_BEFORE_FREER_BUILDING = 3,				-- The AI will skip considering certain buildings during the buildup phase, after htese many years it starts building them regardless of threat.
		
		MAX_CARRIER_OVERFILL = 1.85,						-- Carriers will be overfilled to this amount if there are doctrines to justify it
		
		FIELDED_EQUIPMENT_BUFFER_RATIO_FOR_OCCUPATION_AI = 0.5, -- garrison ai will try to leave this ratio of buffers while assigning laws
		FIELDED_MANPOWER_BUFFER_RATIO_FOR_OCCUPATION_AI = 0.3,  -- garrison ai will try to leave this ratio of buffers while assigning laws
		
		IMPORTANT_VICTORY_POINT = 15,						-- during occupation ai will only care so much to ask for extra garrisons if VP amount is at least this 

		DOCKYARDS_PER_NAVAL_DESIRE_EFFECT = -20.0,			-- Effects how much AI wants to build dockyards based on how navally focused they are in general. Recommended range -100.0 to 100.0.

		DECISION_PRIORITY_RANDOMIZER = 0.1,					-- random factor that is used while picking decisions. ai is able to pick a lower priority decision earler than a higher one if it is within this threshold
		
		DESIGN_COMPANY_SCORE_MULTIPLIER = 2.0,              -- score multiplier for hiring a design company
		ARMY_CHIEF_SCORE_MULTIPLIER = 1.0,                  -- score multiplier for hiring an army chief
		AIR_CHIEF_SCORE_MULTIPLIER = 1.0,                   -- score multiplier for hiring an air chief
		NAVY_CHIEF_SCORE_MULTIPLIER = 1.0,                  -- score multiplier for hiring an navy chief
		POLITICAL_ADVISOR_SCORE_MULTIPLIER = 1.0,           -- score multiplier for hiring political advisors
		THEORIST_ACCEPTANCE_MULTIPLIER = 0.7,						-- scale the acceptance of hiring a theorist by this number times the amount of non-theorists we have, capped at one.
		MIN_SCALED_IDEA_WEIGHT_TO_COMPARE_WITH_DECISIONS = 100,      -- idea scores are scaled between these two values while comparing them to decisions
		MAX_SCALED_IDEA_WEIGHT_TO_COMPARE_WITH_DECISIONS = 200,      -- idea scores are scaled between these two values while comparing them to decisions
		
		CRITICAL_DECISION_PRIORITY = 200,					-- critical ai score for decisions, ai will be able to pick decisions if it has higher prio even if it is not time to pick them (0 to disable)
		CRITICAL_IDEA_PRIORITY = 400,							-- critical ai score for ideas, ai will be able to pick ideas if it has higher prio even if it is not time to pick them (0 to disable)
		
		MAX_PP_TO_SPEND_ON_LOWER_PRIO_TASKS = 25,			-- max pp cost for ai to allow spend pp on lower prio things while a higher prio things are available
		MIN_SCORE_FOR_LOWER_PRIO_TASKS = 100,				-- this is a threshold for low prio tasks that will be considered critical
		
		LOW_PRIO_TEMPLATE_BONUS_FOR_GARRISONS = 10000,		-- bonus to make ai more likely to assign low prio units to garrisons
		LOW_PRIO_TEMPLATE_PENALTY_FOR_FRONTS = 10000,		-- penalty to make ai less likely to assign low prio units to fronts
		

		DEPLOYED_UNIT_MANPOWER_RATIO_TO_BUFFER_WARTIME = 0.3, 				-- deployment will try to buffer a ratio of deployed manpower (for reinforcements) during war time
		DEPLOYED_UNIT_MANPOWER_RATIO_TO_BUFFER_PEACETIME = 0.1,     		-- deployment will try to buffer a ratio of deployed manpower (for reinforcements) during peace time
		
		MAX_AVAILABLE_MANPOWER_RATIO_TO_BUFFER_WARTIME = 0.4,			-- deployment will try to buffer a ratio of manpower (for reinforcements) during war time
		MAX_AVAILABLE_MANPOWER_RATIO_TO_BUFFER_PEACETIME = 0.2,		-- deployment will try to buffer a ratio of manpower (for reinforcements) during peace time
		
		MANPOWER_RATIO_REQUIRED_TO_PRIO_MOBILIZATION_LAW = 0.4,		-- percentage of manpower in field is desired to be buffered for AI when it has upcoming wars or already at war. if it has less manpower, it will prio manpower laws
		UPGRADES_DEFICIT_LIMIT_DAYS = 50,                           -- Ai will avoid upgrading units in the field to new templates if it takes longer than this to fullfill their equipment need

		GIE_EXILE_AIR_MANPOWER_USAGE_RATIO = 0.2, -- AI will not deploy new exile wings when this percentage of available exile manpower is already used for wing recruitment.

		CARRIER_TASKFORCE_MAX_CARRIER_COUNT = 4, 		-- optimum carrier count for carrier taskforces
		CAPITAL_TASKFORCE_MAX_CAPITAL_COUNT = 12, 		-- optimum capital count for capital taskforces
		SCREEN_TASKFORCE_MAX_SHIP_COUNT = 12,			-- optimum screen count for screen taskforces
		SUB_TASKFORCE_MAX_SHIP_COUNT = 16 ,				-- optimum sub count for sub taskforces
		
		MIN_CAPITALS_FOR_CARRIER_TASKFORCE = 10,			-- carrier fleets will at least have this amount of capitals
		CAPITALS_TO_CARRIER_RATIO = 1.5,				-- capital to carrier count in carrier taskfoces
		SCREENS_TO_CAPITAL_RATIO = 4.0,					-- screens to capital/carrier count in carrier & capital taskforces
		
		MIN_MAIN_SHIP_RATIO = 0.3,                      -- if main ship ratio is below this, steal other ships.
		MIN_SUPPORT_SHIP_RATIO = 0.7,                   -- if support ship ratio is below this, steal other ships.
		MIN_MAIN_SHIP_RATIO_TO_REINFORCE = 0.5,         -- the main ships will be tried to reinforce this level.
		MIN_SUPPORT_SHIP_RATIO_TO_REINFORCE = 0.9,      -- the support ships will be tried to reinforce this level.
		MIN_MAIN_SHIP_TO_SPARE = 0.7,                   -- can only steal ships from a task force if their main ship ratio is above this.
		MIN_SUPPORT_SHIP_TO_SPARE = 1.0,                -- can only steal ships from a task force if their support ship ratio is above this.
		MIN_MAIN_SHIP_RATIO_TO_MERGE = 0.7,             -- try merge task force if main ship ratio is lower than this.
		MAX_MAIN_SHIP_RATIO_TO_MERGE = 1.001,           -- if resulting main ship ratio would be at most this, allow merging into this task force.
		MAIN_SHIP_RATIO_TO_SPLIT = 1.8,                 -- if main ship ratio in a task force is larger than this, split it. (If a carrier TF wants 4 carriers (see defines above), but it has more than [this * 4] carriers, then we try to split the TF.)

		MISSION_FLEET_ICONS = {
			4, -- HOLD 
			29, -- PATROL		
			21, -- STRIKE FORCE 
			15, -- CONVOY RAIDING
			23, -- CONVOY ESCORT
			24, -- MINES PLANTING	
			5, -- MINES SWEEPING	
			4, -- TRAIN
			4, -- RESERVE_FLEET
			9, -- NAVAL INVASION SUPPORT
		},
		
		MIN_NAVAL_MISSION_PRIO_TO_ASSIGN = {  -- priorities for regions to get assigned to a mission
			0, -- HOLD (consumes fuel HOLD_MISSION_MOVEMENT_COST fuel while moving)
			200, -- PATROL		
			200, -- STRIKE FORCE 
			200, -- CONVOY RAIDING
			100, -- CONVOY ESCORT
			200, -- MINES PLANTING	
			100, -- MINES SWEEPING	
			0, -- TRAIN
			0, -- RESERVE_FLEET
			100, -- NAVAL INVASION SUPPORT
		},
		
		HIGH_PRIO_NAVAL_MISSION_SCORES = {  -- priorities for regions to get assigned to a mission
			0, -- HOLD (consumes fuel HOLD_MISSION_MOVEMENT_COST fuel while moving)
			100000, -- PATROL		
			1000, -- STRIKE FORCE 
			1500, -- CONVOY RAIDING
			1000, -- CONVOY ESCORT
			-1, -- MINES PLANTING	
			300, -- MINES SWEEPING	
			0, -- TRAIN
			0, -- RESERVE_FLEET
			1000, -- NAVAL INVASION SUPPORT
		},
		
		MAX_MISSION_PER_TASKFORCE = {  -- max mission region/taskforce ratio
			0, -- HOLD (consumes fuel HOLD_MISSION_MOVEMENT_COST fuel while moving)
			1.5, -- PATROL		
			6, -- STRIKE FORCE 
			1.5, -- CONVOY RAIDING
			4, -- CONVOY ESCORT
			2, -- MINES PLANTING
			2, -- MINES SWEEPING
			0, -- TRAIN
			0, -- RESERVE_FLEET
			10, -- NAVAL INVASION SUPPORT
		},
		
		-- all-screen taskforces will be shared between convoy defense, mine missions and patrols (in this prio) 
		-- and these ratios limits the maximum ratio of these taskforces to allocate on type
		MAX_SCREEN_TASKFORCES_FOR_CONVOY_DEFENSE_MIN = 0.20, -- maximum ratio of all screen-ships forces to be used in convoy defense (increases up to max as AI loses convoys).
		MAX_SCREEN_TASKFORCES_FOR_CONVOY_DEFENSE_MAX = 0.70, -- maximum ratio of all screen-ships forces to be used in convoy defense (increases up to max as AI loses convoys).
		MAX_SCREEN_TASKFORCES_FOR_CONVOY_DEFENSE_MIN_CONVOY_THREAT = 100, -- AI will increase screen assignment for escort missions as threate increases
		MAX_SCREEN_TASKFORCES_FOR_CONVOY_DEFENSE_MAX_CONVOY_THREAT = 1500,-- AI will increase screen assignment for escort missions as threate increases
		
		
		MAX_SCREEN_TASKFORCES_FOR_MINE_SWEEPING = 0.15, -- maximum ratio of screens forces to be used in mine sweeping
		MAX_SCREEN_TASKFORCES_FOR_MINE_SWEEPING_PRIO = 0.8, -- if you have mines near your owned states, you will start priotize mine missions and will assign this ratio of screens
		MAX_SCREEN_TASKFORCES_FOR_MINE_SWEEPING_PRIO_MIN_MINES = 10, -- lowest mine for prioing mine missions
		MAX_SCREEN_TASKFORCES_FOR_MINE_SWEEPING_PRIO_MAX_MINES = 1000, -- highest mines for highest prio for mine missions
		
		
		MAX_SCREEN_TASKFORCES_FOR_MINE_LAYING = 0.15, -- maximum ratio of screens forces to be used in mine laying
		MAX_SCREEN_FORCES_FOR_INVASION_SUPPORT = 0.0, -- max ratio of screens forces to be used in naval invasion missions
		MAX_CAPITAL_FORCES_FOR_INVASION_SUPPORT = 0.4, -- max ratio of capital forces to be used in naval invasion missions
		MAX_PATROL_TO_STRIKE_FORCE_RATIO = 3.0,	-- maximum patrol/strike force ratio
		
		-- <start> construction prioritization
		CONSTRUCTION_PRIO_INFRASTRUCTURE = 0.20,                                    -- base prio for infrastructure in the construction queue
		CONSTRUCTION_PRIO_CIV_FACTORY = 0.80,                                       -- base prio for civilian factories in the construction queue
		CONSTRUCTION_PRIO_MIL_FACTORY = 0.70,                                       -- base prio for military factories in the construction queue
		CONSTRUCTION_PRIO_RAILWAY = 4.00,                                           -- base prio for railways in the construction queue
		CONSTRUCTION_PRIO_RAILWAY_GUN_REPAIR = 15.00,                               -- base prio for railway gun repairs in the construction queue
		CONSTRUCTION_PRIO_UNSPECIFIED = 0.50,                                       -- base prio for unspecified buildings (none of the categories above) in the construction queue
		CONSTRUCTION_PRIO_FACTOR_OCCUPIED_TERRITORY = 1.00,                         -- factor prio with this if occupied territory
		CONSTRUCTION_PRIO_FACTOR_OWNED_NONCORE = 1.50,                              -- factor prio with this if owned non-core territory
		CONSTRUCTION_PRIO_FACTOR_OWNED_CORE = 2.00,                                 -- factor prio with this if owned core territory
		CONSTRUCTION_PRIO_FACTOR_REPAIRING = 0.30,                                  -- factor prio with this if building is being repaired
    	CONSTRUCTION_PRIO_SUPPLY_BUILDING = 1.10,                                   -- base prio for supply buildings (supply hubs, ports) in the construction queue

		-- <end> construction prioritization
		
		
		MAX_FACTORY_TO_SPARE_FOR_MISSION_FUEL_TRADE = 0.12, 						-- amount of factories to spend on oil trade in case of fuel need for missions
		MAX_FACTORY_TO_SPARE_FOR_CRITICAL_MISSION_FUEL_TRADE = 0.3, 			-- amount of factories to spend on oil trade in case of fuel need for prio missions
		MAX_FACTORY_TO_TRADE_FOR_FUEL = 0.5,
		FUEL_TRADE_PRIO_FOR_CONVOY_DEFENSE = 0.3,								-- AI will be less reluctant to cancel convoy missions if it is trading for oil
		
		MAX_FACTORY_TO_SPARE_FOR_MISSION_FUEL_TRADE_IN_PEACE = 0.03, 			-- amount of factories to spend on oil trade in case of fuel need for missions in peace time
		MAX_FACTORY_TO_SPARE_FOR_CRITICAL_MISSION_FUEL_TRADE_IN_PEACE = 0.1, 	-- amount of factories to spend on oil trade in case of fuel need for prio missions in peace time
		MAX_FACTORY_TO_TRADE_FOR_FUEL_IN_PEACE = 0.15,


		FUEL_REQUEST_RATIO_FOR_COMBATS = 0.6,									-- ratio of ship combat fuel cost that is to be considered in fuel usage and request system
		PRIO_FUEL_REQUEST_RATIO_FOR_COMBATS = 0.8,								-- ratio of ship combat fuel cost that is to be considered in prio fuel usage and request system
		
		FUEL_REQUEST_RATIO_FOR_MOVEMENT = 0.4,									-- ratio of ship movement fuel cost that is to be considered in fuel usage and request system
		PRIO_FUEL_REQUEST_RATIO_FOR_MOVEMENT = 0.2,								-- ratio of ship movement fuel cost that is to be considered in prio fuel usage and request system
		
		NAVY_ACTUAL_FUEL_USAGE_WEIGHT_ON_OIL_REQUEST = 0.5, 					-- weight of actual fuel usage of ships compared to what is being asked for missions while calculating oil needed for trade
		AIR_ACTUAL_FUEL_USAGE_WEIGHT_ON_OIL_REQUEST = 0.5, 						-- weight of actual fuel usage of planes compared to what is being asked for missions while calculating oil needed for trade
		
		MONTHS_TO_FILL_FUEL_BUFFER_WITH_OIL_REQUESTS = 6.0, 					-- in war time, coutries will try to fill their buffer in this duration and trade for oil if necesarry
		MONTHS_TO_FILL_FUEL_BUFFER_WITH_OIL_REQUESTS_IN_PEACE_TIME = 10.0,      -- in peace time, coutries will try to fill their buffer in this duration and trade for oil if necesarry
		
		FUEL_CONSUMPTION_MULT_FOR_FUEL_SAVING_MODE = 0.25,				-- fuel consumptions will be limited by this ratio in fuel saving mode
		FUEL_CONSUMPTION_MULT_REGULAR_FUEL_MODE = 1.0,					-- fuel consumptions will be limited by this ratio in regular fuel mode
		FUEL_CONSUMPTION_MULT_AGRESSIVE_FUEL_MODE = 3.0,				-- fuel consumptions will be limited by this ratio in aggressive fuel usage mode
		
		DAYS_FUEL_REMAINING_TO_ENTER_FUEL_SAVING_MODE = 30,				-- countries will enter fuel saving mode if they will be out of fuel in this number of days and their fuel ratio is below next define
		DAYS_FUEL_REMAINING_TO_ENTER_FUEL_SAVING_MODE_FUEL_RATIO = 0.4,
		
		FUEL_RATIO_TO_EXIST_FUEL_SAVING_MODE = 0.60, 					-- countries will exit fuel saving mode if they have more fuel ratio than this
		
		
		

		WANTED_MAX_FUEL_BUFFER_IN_DAYS_FOR_ARMY_MAX_CONSUMPTION = 60,  -- AI will try to buffer at least this amount of days on max consumption, will trade if necesarry and will go into fuel saving mode/aggresive mode using this buffer 
		WANTED_MAX_FUEL_BUFFER_IN_DAYS_FOR_AIR_MAX_CONSUMPTION  = 60,  -- AI will try to buffer at least this amount of days on max consumption, will trade if necesarry and will go into fuel saving mode/aggresive mode using this buffer
		WANTED_MAX_FUEL_BUFFER_IN_DAYS_FOR_NAVY_MAX_CONSUMPTION = 60,  -- AI will try to buffer at least this amount of days on max consumption, will trade if necesarry and will go into fuel saving mode/aggresive mode using this buffer
		MIN_WANTED_MAX_FUEL = 50,									   -- minimum value for wanted fuel buffers for AI (in thousands)

		GIE_LEND_LEASE_TO_PLAYER_EXILE_DESIRE_BONUS = 40, -- AI host is more likely to accept lend lease requests from a player.

		NAVAL_BASE_RATIO_ALLOCATED_FOR_REPAIRS = 0.15,				-- ai will allocate at most this ratio of dockyards for repairs in peace time
		NAVAL_BASE_RATIO_ALLOCATED_FOR_REPAIRS_IN_WAR_TIME = 0.25,	-- ai will allocate at most this ratio of dockyards for repairs in war time
		
		MAX_FUEL_CONSUMPTION_RATIO_FOR_AIR_TRAINING = 0.25,			-- ai will use at most this ratio of affordable fuel for air training
		MAX_FUEL_CONSUMPTION_RATIO_FOR_NAVY_TRAINING = 0.25,		-- ai will use at most this ratio of affordable fuel for naval training
		
		MAX_FULLY_TRAINED_SHIP_RATIO_FOR_TRAINING = 0.7,			-- ai will not train a taskforce if fully trained ships are above this ratio
		
		NUM_SILOS_PER_CIVILIAN_FACTORIES = 0.0025,					-- ai will try to build a silo per this ratio of civ factories
		NUM_SILOS_PER_MILITARY_FACTORIES = 0.012,					-- ai will try to build a silo per this ratio of mil factories
		NUM_SILOS_PER_DOCKYARDS = 0.02,								-- ai will try to build a silo per this ratio of dockyards
		
		SHIP_STR_RATIO_PUT_ON_REPAIRS = 0.8,						-- if ships are damaged below this ratio, they are put for repairs
		SHIP_STR_RATIO_EXIT_REPAIRS = 1.00,							-- the ships will leave repairs if they are >= this ratio of total str
		REPAIR_TASKFORCE_SIZE = 4,									-- repair taskforce sizes are limited to this many ships
		
		PLAN_VALUE_BONUS_FOR_MOVING_UNITS = 0.35,					-- AI plans gets a bonus when units are not moving and ready to fight
		AGGRESSIVENESS_BONUS_FOR_FRONTS_THAT_ARE_ON_HIGH_AGGRESSIVENESS = -0.4,	-- AI gets a bonus to aggresiveness if it is already executing an aggressive plan (lower is more aggressive)
		AGGRESSIVENESS_CHECK_BASE = 2.0,							-- front comparison where ai will consider aggressive stance, unless it is already then the number above is used
		AGGRESSIVENESS_CHECK_EASY_TARGET = -0.4,					-- if target nation is flagged as easy target we also adjust down the front comparison needed
		AGGRESSIVENESS_CHECK_CAREFUL = 0.6,							-- at what front strength balance do we go careful
		AGGRESSIVENESS_CHECK_PARTLY_FORTIFIED = 2.0,				-- if front strength balance is at or above this value versus a party fortified enemy, we do a balanced attack
		AGGRESSIVENESS_CHECK_PARTLY_FORTIFIED_WEAK_POINTS = 0.75,	-- if front strength balance is at or above this value versus a party fortified enemy, we rush attack weak points; below this value, we are careful
		AGGRESSIVENESS_CHECK_FULLY_FORTIFIED = 10,					-- if front strength balance is at or above this value versus a fully fortified enemy with no weak points, we do a balanced attack instead being careful
		AGGRESSIVENESS_CHECK_FULLY_FORTIFIED_POCKET = 6,			-- if front strength balance is at or above this value versus a fully fortified enemy in a pocket, we do a balanced attack instead being careful
		FRONT_EVAL_UNIT_ACCURACY = 1.0,								-- scale how stupid ai will act on fronts. 0 is potato
		FRONT_EVAL_UNIT_AIR_SUP_IMPACT = 1.0,                       -- scale how good the AI thinks air superiority is for units
		FRONT_EVAL_UNIT_SUPPLY_AND_ORG_LACK_IMPACT = 1.0,			-- scale how painful the AI thinks a combined lack of supply and organization is for units
		FRONT_EVAL_PERCENT_TO_ASSIST_ALLY_FRONT = 0.5, 				-- percentage of how many units the AI thinks it should have compared to an ally before considering sending units

		PRODUCTION_CARRIER_PLANE_BUFFER_RATIO = 1.5,				-- in addition to total deck size of carriers, we want at least this ratio to buffer it
		PRODUCTION_CARRIER_PLANE_PRODUCTION_BOOST_TO_BUFFER = 4.0,  -- production of carrier planes will go up by this ratio if we lack buffers
		
		
		NAVAL_MAX_CONVOY_TO_INTEL_FOR_CONVOY_RAIDS = 200,            -- number of convoys in region will be clamped to this max, anything more will be ignored while assigning raids
		EXTRA_NAVY_INTEL_FOR_CONVOY_RAIDING = 0.0,                   -- this amount of intel is added to navy intel while ai is assigning convoy raiding mission 
		INTEL_NEEDED_TO_NEGATVE_CONVOY_COUNT_REDUCTION = 80.0,       -- navy intel is divided by this ratio to negate NAVAL_CONVOY_COUNT_INTEL_DROPOFF_DUE_TO_LOW_DECYPTION
		NAVAL_CONVOY_COUNT_INTEL_DROPOFF_DUE_TO_LOW_DECYPTION = 200, -- on lowest navy intel, ai won't be able to see enemy convoys lower than this ratio

		CONVOY_RAID_SCORE_FROM_CONVOY_INTELLIGENCE = 2.5,			 -- each convoy intelligenge will incease raid score by this

		AIR_AI_ENEMY_PROV_RATIO_FOR_COMBAT_REGION = 0.15,			 -- if a region has more than this ratio of provinces controlled by enemy, AI will consider it as a combat zone while assigning planes

		RESEARCH_MULTI_DOCTRINE_SCORE = 0.3,                         -- score penalty to researchign multiple doctrines at once for AI
		CONVOY_ESCORT_SCORE_FROM_CONVOYS = 15,                        -- score for each convoy you have in area
		CONVOY_ESCORT_MUL_FROM_NO_CONVOYS = 0.02,                     -- score multiplier when no convoys are around
		CONVOY_RAID_MIN_ENEMY_THREAT = 0.05,
		
		RAILWAY_GUN_PRODUCTION_BASE_DIVISIONS_RATIO_PERCENT = 0,	-- Base ratio of desired railway guns to divisions for AI (5 means 5%). Can be modified by railway_guns_divisions_ratio AI strategy value
		RAILWAY_GUN_PRODUCTION_MIN_DIVISONS = 20,					-- Minimum required number of divisions for the AI to consider producing railway guns
		RAILWAY_GUN_PRODUCTION_MIN_FACTORIES = 10,					-- Minimum required number of military factories for the AI to consider producing railway guns
		RAILWAY_GUN_PER_ARMY_CAP = 5,								-- Maximum railway guns assigned to one army for the AI
		RAILWAY_GUN_ASSIGNMENT_SCORE_UNITCOUNT_MULTIPLIER = 10.0,	-- Score multiplier for favoring orders groups with more units when assigning railway guns
		RAILWAY_GUN_ASSIGNMENT_SCORE_HOLD = 20,						-- Score for keeping current assignment when assigning railway guns

		MAX_UNIT_RATIO_FOR_INVASIONS = 0.5,							-- countries won't use armies more than this ratio of total units for invasions
		MIN_UNIT_RATIO_FOR_INVASIONS = 0.1,                         -- don't allocate more divisions than this for naval invasions
		MAX_INVASION_FRONT_SCORE = 2000,							-- max score for naval invasion front scores
		MIN_FRONT_SCORE_FOR_AFTER_INVASION_AREAS = 1500,			-- min score for army fronts that are created on recently invaded regions
		
		MIN_CONVOY_EFFICIENCY_TO_CANCEL_TRADES = 0.4,				-- min efficiency (due to convoy raid) to cancel trades
		MIN_CONVOY_EFFICIENCY_TO_START_TRADES = 0.6,				-- min efficiency (due to convoy raid) to start be able to trades
		MIN_CONVOY_EFFICIENCY_PER_WAR_SUPPORT_HIT = 0.6,			-- percentage of warsupport hit you get is multiplied by this value and added to min convoy efficiencies

		NAVAL_INVADED_AREA_PRIO_DURATION = 90,								-- after successful invasion, AI will prio the enemy area for this number of days
		NAVAL_INVADED_AREA_PRIO_MULT = 2.0,									-- fronts that belongs to recent invasions gets more prio
		MIN_NUM_CONQUERED_PROVINCES_TO_DEPRIO_NAVAL_INVADED_FRONTS = 30,	-- if you conquer this amount of provinces after a naval invasion, it will lose its prio status and will act as a regular front
	    INVASION_TARGET_DISTANCE_DENOMINATOR = 1000,            -- When selecting invasion target, divide this with (pixel) distance to get distance score factor. (Doesn't really affect the relative scoring, but it affects the linearity of the score function.)
	    INVASION_TARGET_NO_PORT_FACTOR = 0.3,                   -- When selecting invasion target, multiply score with this if the target has no port
	    INVASION_TARGET_TRUNCATION_SELECT_THRESHOLD = 0.6,      -- When selecting invasion target, use this threshold for truncation selection. (1.0 means select highest scored target, 0.0 means select randomly from all possible target, 0.5 means select randomly from all targets with more than 50 % of highest score)
	    INVASION_TARGET_PRIO_NOT_ENEMY_FACTOR = 0.17,           -- When calculating priority for an invasion, factor the score with this if the target is not an actual enemy.

		FAILED_INVASION_AVOID_DURATION = 135,                   -- after a failed invasion, AI will down-prioritize invading the same area again for this number of days
		FAILED_INVASION_AREA_PRIO_FACTOR = 0.5,                 -- for every failed invasion on an area, factor that area's invasion prio with this value
		FAILED_INVASION_PORT_PRIO_FACTOR = 0.66,                -- for every failed invasion on a target port (province), factor the chance that we try to invade that same port again (relative to other ports)

		BUILDING_TARGETS_BUILDING_PRIORITIES = {				-- buildings in order of pirority when considering building targets strategies. First has the greatest priority, omitted has the lowest. NOTE: not all buildings are supported by building targets strategies.
			'industrial_complex',
		},

		MIN_INVASION_PLAN_VALUE_TO_EXECUTE = 0.3,				-- ai will only activate invasions if it is above this
		MIN_INVASION_ORG_FACTOR_TO_EXECUTE = 0.9,				-- ai will only activate invasions if average org factor is above this
	    MIN_INVASION_UNITS_READY_TO_EXECUTE = 0.9,              -- ai will only activate invasions if this ratio of assigned units are ready
		MAX_INVASION_SIZE = 24,									-- max invasion group size
		
		MAX_PORT_STRIKE_HISTORY_TO_REMEMBER = 5000,				-- maximum port strike history to keep track (will be used to disable ports
		PORT_STRIKE_HISTORY_DECAY_MIN = 10,						-- minimum decay for port strike history (<7 days since last port strike)
		PORT_STRIKE_HISTORY_DECAY_MAX = 400,					-- maximum decay for port strike history (>=37 days since last port strike)
		MAX_PORT_RATIO_TO_DISABLE = 0.8,						-- max ratio of ports to disable due to port strikes
		PORT_STRIKE_HISTORY_VALUE_TO_DISABLE_REPAIRS = 200,		-- cut off for disabling ports above this threshold
		PORT_STRIKE_HISTORY_VALUE_TO_REENABLE_REPAIRS = 10,     -- cut off for reenabling ports bloew this threshold
		
		
		CURRENT_LAW_SCORE_BONUS = 50.0,							-- current score will get an additional bonus to its ai weight
		-- these values are used for ai_desire_ variables that are used occupation law selection
		OIL_WANT_PER_POTENTIAL_LAND_CONSUMPTION_K = 0.05,       	-- how much extra oil requested on top of balance for country's potential oil consumptions
		OIL_WANT_PER_POTENTIAL_NAVY_CONSUMPTION_K = 0.03,       	
		OIL_WANT_PER_POTENTIAL_AIR_CONSUMPTION_K = 0.03,        	
		OIL_WANT_PER_POTENTIAL_MISC_CONSUMPTION_K = 0.1,        	
		OIL_WANT_AT_PEACE_PER_POTENTIAL_LAND_CONSUMPTION_K = 0.02,  
		OIL_WANT_AT_PEACE_PER_POTENTIAL_NAVY_CONSUMPTION_K = 0.0,   
		OIL_WANT_AT_PEACE_PER_POTENTIAL_AIR_CONSUMPTION_K = 0.0,    
		OIL_WANT_AT_PEACE_PER_POTENTIAL_MISC_CONSUMPTION_K = 0.1,   
		RESOURCE_WANT_PER_MISSING_BALANCE = 0.2,					-- negative balance increases the desire on a resource
		RESOURCE_WANT_PER_CONSUMED = 0.05,							-- if resource is being used in production, increase the desire
		-- ~end
		
		-- crypto ai calculates a score & a threshold for each cracked crypto
		-- if score > crypto, it activates the crypto
		CRYPTO_ACTIVATION_THRESHOLD = 1.25,				-- will multiply crypto activation threshold. larger
		
		CRYPTO_ACTIVATE_NUM_DAYS_DROP_OFF = 0.4,		-- longer decrypted crypto waits, lower threshold it will have. threshold will be multiplied by this value at most
		CRYPTO_ACTIVATE_NUM_DAYS_DECAY = 60,			-- at this number of days, it will decay by %50 of prev define
		
		CRYPTO_ACTIVATE_NUM_ACTIVATED_DROP_OFF = 0.6,				-- having an already activated cryptos will further multiply threshold, down to this value  
		
		CRYPTO_ACTIVATION_SCORE_ARMIES_IN_COMBAT_BONUS = 0.2, 		-- having units in combat will increase the score by this ratio
		CRYPTO_ACTIVATION_SCORE_OUR_CAPITAL_BONUS = 0.2, 			-- fronts of our capital get a bonus by this ratio
		CRYPTO_ACTIVATION_SCORE_ENEMY_CAPITAL_BONUS = 0.2, 			-- fronts of enemy capital get a bonus by this ratio
		CRYPTO_AFTER_SCORE_INVASION_FRONT_BONUS = 1.0, 				-- a front that is naval invading will increase the score by this ratio
		-- ~crypto ai

		MAX_MODULAR_EQUIPMENT_EQUIPMENT_UPGRADE_COUNT_PER_PASS = 4, -- the maximum number of level AI will try to add to an equipment upgrade of an equipment defined in common/ai_equipment in one pass

		EQUIPMENT_UPGRADE_VARIANT_MATCH_SCORE_FACTOR = 0.2, -- the weight of equipment upgrade level when computing the match score of a variant to an ai equipment design.

		AI_UPDATE_ROLES_FREQUENCY_HOURS = 48;               -- Update the roles for a country AI this often (affects performance)

		UPDATE_SUPPLY_BOTTLENECKS_FREQUENCY_HOURS = 168;     -- Check for and try to fix supply bottlenecks this often. (168 hours = 1 week)
		FIX_SUPPLY_BOTTLENECK_SATURATION_THRESHOLD = 0.75;  -- Try to fix supply bottlenecks if supply node saturation exceeds this value.

		UPDATE_SUPPLY_MOTORIZATION_FREQUENCY_HOURS = 52;     -- Check if activating motorization would improve supply situation this often.

		AI_PREFERRED_TACTIC_WEEKLY_CHANGE_CHANCE = 0.05, 	-- Chance for AI to select a new preferred tactic if they don't have one selected

		-- <start> assigning leaders to armies
		ARMY_LEADER_ASSIGN_FIELD_MARSHAL_TO_ARMY = -500,            -- Score for assigning a field marshal to a normal army (want to use them for army groups)
		ARMY_LEADER_ASSIGN_EMPTYNESS_MALUS = 0.2,                   -- Factor for avoiding assigning leaders that can lead large armies to small armies (a value of 0.2 reduces the score by max 20 %)
		ARMY_LEADER_ASSIGN_OVERCAPACITY = -200,                     -- Score for assigning leader to a too large army
		ARMY_LEADER_ASSIGN_OVERALL_SKILL_FACTOR = 50,               -- This times general's overall skill is added to score
		ARMY_LEADER_ASSIGN_DEFENSE_OVERALL_SKILL_FACTOR = 10,       -- If defensive army, this times general's overall skill is added to score
		ARMY_LEADER_ASSIGN_DEFENSE_ATTACK_SKILL_FACTOR = 3,         -- If defensive army, this times general's attack skill is added to score
		ARMY_LEADER_ASSIGN_DEFENSE_DEFENSE_SKILL_FACTOR = 20,       -- If defensive army, this times general's defense skill is added to score
		ARMY_LEADER_ASSIGN_DEFENSE_LOGISTICS_SKILL_FACTOR = 3,      -- If defensive army, this times general's logistics skill is added to score
		ARMY_LEADER_ASSIGN_DEFENSE_PLANNING_SKILL_FACTOR = 3,       -- If defensive army, this times general's planning skill is added to score
		ARMY_LEADER_ASSIGN_INVASION_ATTACK_SKILL_FACTOR = 10,       -- If invasion army, this times general's attack skill is added to score
		ARMY_LEADER_ASSIGN_INVASION_DEFENSE_SKILL_FACTOR = 10,      -- If invasion army, this times general's defense skill is added to score
		ARMY_LEADER_ASSIGN_INVASION_LOGISTICS_SKILL_FACTOR = 20,    -- If invasion army, this times general's logistics skill is added to score
		ARMY_LEADER_ASSIGN_INVASION_PLANNING_SKILL_FACTOR = 20,     -- If invasion army, this times general's planning skill is added to score
		ARMY_LEADER_ASSIGN_ATTACK_SKILL_FACTOR = 20,                -- This times general's attack skill is added to score
		ARMY_LEADER_ASSIGN_DEFENSE_SKILL_FACTOR = 10,               -- This times general's defense skill is added to score
		ARMY_LEADER_ASSIGN_LOGISTICS_SKILL_FACTOR = 7,              -- This times general's logistics skill is added to score
		ARMY_LEADER_ASSIGN_PLANNING_SKILL_FACTOR = 7,               -- This times general's planning skill is added to score
		ARMY_LEADER_ASSIGN_NR_TRAITS = 5,                           -- This times general's nr of active traits is added to score
		ARMY_LEADER_ASSIGN_EXILED_LEADS_EXILED_TROOPS = 10,         -- If exiled leader, increase chance of leading army with exiled troops
		ARMY_LEADER_ASSIGN_EXILED_LEADS_OWN_EXILED_TROOPS = 100,    -- If exiled leader, increase chance of leading army with exiled troops from same country as the leader
    	ARMY_LEADER_ASSIGN_KEEP_CURRENT_LEADER_FACTOR = 1.2,        -- Boosts the score for keeping the current leader. Value > 1.0 favors the current leader.
    	ARMY_LEADER_ASSIGN_DONT_STEAL_OTHER_FACTOR = 0.75,          -- Reduces the score for leaders assigned elsewhere. Value < 1.0 discourages reassigning these leaders.
		-- the following defines concern the general's modifiers
		ARMY_LEADER_ASSIGN_DEFENSE_MAX_DIG_IN_FACTOR = 1.0,         -- If defensive army, importance of general's MAX_DIG_IN_FACTOR modifier
		ARMY_LEADER_ASSIGN_DEFENSE_ARMY_ARMOR_DEFENCE_FACTOR = 1.0, -- If defensive army, importance of general's ARMY_ARMOR_DEFENCE_FACTOR modifier (proportional to armor ratio in the army)
		ARMY_LEADER_ASSIGN_PLANNING_SPEED = 0.1,                    -- Importance of general's PLANNING_SPEED modifier
		ARMY_LEADER_ASSIGN_MAX_PLANNING = 0.1,                      -- Importance of general's MAX_PLANNING modifier
		ARMY_LEADER_ASSIGN_RECON_FACTOR = 2.0,                      -- Importance of general's RECON_FACTOR modifier
		ARMY_LEADER_ASSIGN_OUT_OF_SUPPLY_FACTOR = 1.0,              -- Importance of general's OUT_OF_SUPPLY_FACTOR modifier
		ARMY_LEADER_ASSIGN_WINTER_ATTRITION_FACTOR = 1.0,           -- Importance of general's WINTER_ATTRITION_FACTOR modifier
		ARMY_LEADER_ASSIGN_ARMY_ARMOR_SPEED_FACTOR = 20.0,          -- Importance of general's ARMY_ARMOR_SPEED_FACTOR modifier (proportional to armor ratio in the army)
		ARMY_LEADER_ASSIGN_ARMY_ARMOR_ATTACK_FACTOR = 20.0,         -- Importance of general's ARMY_ARMOR_ATTACK_FACTOR modifier (proportional to armor ratio in the army)
		ARMY_LEADER_ASSIGN_BOOST_ARMOR_SKILL = 20.0,                -- Importance of general's trait where armor skill is boosted, e.g. armor_officer which boosts panzer_leader (proportional to armor ratio in the army)
		ARMY_LEADER_ASSIGN_ARMOR_LEADER_IF_NO_ARMOR = -0.5,         -- Avoid assigning a general with armor skills to an army with no armor (can be negative)
		ARMY_LEADER_ASSIGN_AMPHIBIOUS_INVASION = 1.0,               -- If involved in invasion, importance of general's AMPHIBIOUS_INVASION modifier
		ARMY_LEADER_ASSIGN_NAVAL_INVASION_PREPARATION = 1.0,        -- If involved in invasion, importance of general's NAVAL_INVASION_PREPARATION modifier
		ARMY_LEADER_ASSIGN_XP_GAIN_FACTOR = 2.0,                    -- Importance of general's XP_GAIN_FACTOR modifier
		ARMY_LEADER_ASSIGN_SUPPLY_CONSUMPTION_FACTOR = 1.0,         -- Importance of general's SUPPLY_CONSUMPTION_FACTOR modifier
		ARMY_LEADER_ASSIGN_LAND_REINFORCE_RATE = 1.0,               -- Importance of general's LAND_REINFORCE_RATE modifier
		ARMY_LEADER_ASSIGN_ARMY_MORALE_FACTOR = 1.0,                -- Importance of general's ARMY_MORALE_FACTOR modifier
		ARMY_LEADER_ASSIGN_TERRAIN_FACTOR = 0.2,                    -- Importance of general's terrain skills
		-- <end> assigning leaders to armies

		-- Which settings will AI use for area defense by default
		AREA_DEFENSE_SETTING_VP = false,
		AREA_DEFENSE_SETTING_PORTS = true,
 	    AREA_DEFENSE_SETTING_BORDERS = false,
    	AREA_DEFENSE_SETTING_FACILITY = false,

		AREA_DEFENSE_SETTING_AIRBASES = false,
		AREA_DEFENSE_SETTING_FORTS = false,
		AREA_DEFENSE_SETTING_COASTLINES = true,
		AREA_DEFENSE_SETTING_RAILWAYS = false,

		AREA_DEFENSE_MINCAP_MAX_CAPITAL_DEFENSE = 100,              -- MaxUnits for capital defense is at least this. (basically use capital defense as a buffer if we have "too many units")
		AREA_DEFENSE_MINCAP_DESIRED_CAPITAL_DEFENSE = 5,            -- DesiredUnits for capital defense is at least this.
		AREA_DEFENSE_MINCAP_MAX_HOME_AREA = 10,                     -- MaxUnits for home area is at least this.
		AREA_DEFENSE_MINCAP_DESIRED_HOME_AREA = 3,                  -- DesiredUnits for home area is at least this.

		COMMAND_POWER_BEFORE_SPEND_ON_TRAITS = 30.0,	

		PEACE_BID_FOLD_TURNS_AGAINST_OTHER_AI = 2,					--Resolve contests against other AIs after this many turns. Don't always contest forever, it yields the same results.
		PEACE_BID_FOLD_AGAINST_PLAYER_CHANCE = 0.5,                 -- Likelihood that AI will fold in a bidding contest against human player.
		PEACE_BID_FOLD_AGAINST_AI_CHANCE_UNCONTROLLED = 0.40,		-- Likelihood an AI will fold against an AI in a bidding contest where they do not control the state in question, if their own bid is take_states and there is a bidder with more points.
		PEACE_BID_FOLD_AGAINST_LIBERATE_CONTEST = 1.0,				-- Likelihood that the AI will back down against a same-ideology country performing a contesting liberate bid ##Bordergore prevention therapy
		PEACE_BID_FOLD_MINOR_VS_MAJOR = 1.0,						-- Likelihood that AI minors will fold against majors (majors will already try and return cores and claims, so this should not be a particularly big deal)
		PEACE_AI_GROUP_PEACE_ACTIONS = true,                        -- Whether AI should group peace actions or greedily just select the most-desired peace actions
		PEACE_AI_EVALUATE_FOR_SUBJECTS = true,                      -- Whether AI should include subjects when evaluating giving states to other winners (may affect performance on new conference turn)
		PEACE_AI_EVALUATE_FOR_ALLIES = true,                        -- Whether AI should include allies when evaluating giving states to other winners (may affect performance on new conference turn)
		PEACE_AI_EVALUATE_FOR_NON_ALLIES = false,                   -- Whether AI should include non-allies (not in same faction) when evaluating giving states to other winners (may affect performance on new conference turn)
		PEACE_AI_EVALUATE_OTHER_IF_CORE = true,                     -- Whether AI should evaluate giving states to other winners if state is their core (may affect performance on new conference turn)
		PEACE_AI_EVALUATE_OTHER_IF_CLAIM = true,                    -- Whether AI should evaluate giving states to other winners if they have a claim on the state (may affect performance on new conference turn)
		PEACE_AI_EVALUATE_OTHER_ALWAYS = false,                     -- Whether AI should always evaluate giving states to other winners (!!! may heavily affect performance on new conference turn for large peace conferences !!!)

		DIVISION_SUPPLY_RATIO_TO_MOTORIZE = 0.80,						-- If supply ratio is less than this, consider motorizing any applicable nearby supply hub

		INDUSTRIAL_ORG_TRAIT_UNLOCK_RANDOMNESS = 3,		-- AI will pick a random from N top traits when choosing a trait to unlock
		INDUSTRIAL_ORG_POLICY_CHANGE_RANDOMNESS = 3,	-- AI will pick a random from N top policies when choosing a policy to attach to an MIO
		INDUSTRIAL_ORG_RESEARCH_ASSIGN_RANDOMNESS = 3,	-- AI will pick a random from N top MIOs when choosing an MIO to assign to a research
		INDUSTRIAL_ORG_PRODUCTION_ASSIGN_RANDOMNESS = 3,-- AI will pick a random from N top MIOs when choosing an MIO to assign to a production line
		INDUSTRIAL_ORG_POLICY_CHANGE_SCALE = 1.0,		-- Policy change weight will be scaled by this value
		INDUSTRIAL_ORG_TRAIT_RANK_FACTOR = 0.80,		-- When precomputing weights, traits will affect the final score less the further down the tree they are, by this factor
		INDUSTRIAL_ORG_RESEARCH_BONUS_FACTOR = 1.0,		-- Research bonus will be multiplied by this factor when evaluating design teams
	
		AI_WANTED_LAND_BASED_PLANES_FACTOR = 0.50,		-- Factor applied to desire for land based planes (total airbase space * define)
		AI_WANTED_CARRIER_BASED_PLANES_FACTOR = 1.0,	-- Factor applied to desire for carrier based planes (total carrier space * define)
	    -- AIFC stands for "AI Force Concentration". Using acronym to keep define names shorter.
	    AIFC_UPDATE_FREQUENCY_DAYS = 5,                             -- How often will AI run its AI force concentration logic. Lowering this number may decrease performance.
	    AIFC_FRESHNESS_BASE_VALUE = 45.0,                           -- AIFC fronts have a "freshness value" which decreases if no progress is made. When it reaches zero, it will give up on the current target and try another.
	    AIFC_REFRESH_NEED_PER_DAY = 1.0,                            -- Decrease freshness value with this every day.
	    AIFC_REFRESH_NEED_SUPPLY_FACTOR_PER_DAY = 0.8,              -- Decrease freshness value with this multiplied by average supply ratio every day.
	    AIFC_FRESHNESS_ADD_ON_PROGRESS = 25.0,                      -- Increase freshness value with this when we advance a province along the target path.
	    AIFC_UNIT_RATIO_BASE = 0.15,                                -- After fulfilling minimum front unit needs, this ratio of the "extra"/desired units can be allocated to AI force concentration duty
	    AIFC_MAX_NR_FRONTS = 4,                                     -- The X (this) fronts with highest AIFC score are considered for AI force concentration
	    AIFC_CA_DIVISIONS_PER_PROVINCE = 3,                         -- AI will use this as a baseline of how many divisions to have per province
	    AIFC_ACTIVATE_AVG_ORG_RATIO_THRESHOLD = 0.2,                -- Only activate the offensive order if average organisation is above this.
	    AIFC_ACTIVATE_IN_POSITION_RATIO_THRESHOLD = 0.3,            -- Only activate the offensive order if divisions in position is more than this ratio.
    	AIFC_OFFENSIVE_DEACTIVATION_DAYS_THRESHOLD = 5,             -- Deactivate the offensive order only if the conditions have been unfulfilled for this many days.
    	AIFC_UNIT_NUDGE_FREQUENCY_DAYS = 15,                        -- On average every X day (randomly), check if another division (within same front) is better for AIFC based on score factors below.
    	-- Unit offensiveness score factors for AIFC. Division stats are factored by this before adding up to total score.
    	AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_BREAKTHROUGH = 11.0,
    	AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_SOFT_ATTACK = 6.0,
	    AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_HARD_ATTACK = 8.0,
	    AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_ARMOR = 30.0,
	    AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_PIERCING = 4.0,
	    AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_HARDNESS = 300.0,
	    AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_SPEED = 15.0,
	    AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_INITIATIVE = 5.0,
    	AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_ORGANISATION = 0.3,
    	AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_HITPOINTS = 0.3,
    	AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_DEFENSE = -0.2,
    	AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_ENTRENCHMENT = -0.5,
    	AIFC_UNIT_OFFENSIVE_SCORE_FACTOR_EXPERIENCE = 300.0,
    	-- End of unit offensiveness score factors for AIFC
    	-- Strategic target scoring for AIFC
    	AIFC_TARGET_IGNORE_VP_THRESHOLD = 10,                       -- VP target needs at leas this many victory points to be considered a target
    	AIFC_TARGET_SUPPLY_HUB_BASE_SCORE = 20.0,                   -- Base score for supply hubs
        AIFC_TARGET_NAVAL_BASE_BASE_SCORE = 10.0,                   -- Base score for naval bases
	    AIFC_TARGET_NAVAL_BASE_SCORE_PER_LEVEL = 1.0,               -- Score for naval bases increases by this for each level
	    AIFC_TARGET_VP_SCORE_FACTOR = 1.0,                          -- Score for VPs increases by this for every victory point
	    AIFC_TARGET_CAPITAL_SCORE_EXTRA = 5.0,                      -- Extra score for Capitals (in addition to VP score)
	    AIFC_TARGET_SHORT_PATH_PENALTY_FACTOR = 0.1,                -- Penalty factor for short AIFC paths (path <= 3 (including own start province))
    	AIFC_TARGET_PERSISTED_FACTOR = 30.0,                        -- Bonus factor for persisted targets (used to incentivize AI to select target again after e.g. front lines have reformed or save file is loaded)
    	-- End of strategic target scoring for AIFC
    	-- Offensive path scoring (cost multipliers) for AIFC
	    AIFC_PATH_MAX_COST = 7.0,                                   -- Only allow paths with total cost <= this. WARNING: increasing this value may cause stuttering and other performance issues (since AIFC will evaluate larger areas)
	    AIFC_PATH_COST_ADJ_NORMAL = 1.0,
	    AIFC_PATH_COST_ADJ_STRAIT = 4.0,
	    AIFC_PATH_COST_ADJ_RIVER = 2.0,
	    AIFC_PATH_COST_ADJ_RIVER_LARGE = 3.0,
	    AIFC_PATH_COST_TRN_MOUNTAINS = 2.0,
	    AIFC_PATH_COST_TRN_FOREST = 1.5,
	    AIFC_PATH_COST_TRN_DESERT = 1.5,
	    AIFC_PATH_COST_TRN_HILLS = 1.2,
	    AIFC_PATH_COST_TRN_JUNGLE = 3.0,
	    AIFC_PATH_COST_TRN_PLAINS = 0.8,
	    AIFC_PATH_COST_TRN_URBAN = 1.0,
	    AIFC_PATH_COST_TRN_MARSH = 3.0,
	    AIFC_PATH_COST_PER_FORT_LEVEL = 0.3,                        -- This multiplier is calculated as: 1.0 + <define>*fort_level    (only for fort levels > 0)
	    AIFC_PATH_COST_HAS_SUPPLY_HUB = 0.5,                        -- If the province we're entering has a supply hub
        AIFC_PATH_COST_HAS_NAVAL_BASE = 0.5,                        -- If the province we're entering has a naval base
        AIFC_PATH_COST_RAILWAY_CONNECTION = 0.75,                   -- If the provinces are connected by a railway with level > 0
	    -- End of offensive path scoring for AIFC
    	RAIDS_ENABLE_AI = true,                                -- Whether AI should use the raid system
    	RAIDS_CREATE_FREQUENCY_DAYS = 7,                       -- How often will AI run its raid creation logic. Lowering this number may decrease performance.
		RAIDS_SCORE_DIFF_TO_CANCEL = 0.3,                      -- If already-created low-scoring raids are blocking higher-scoring ones from being created due to command power, this allows the AI to cancel the lower-scoring raids. If `lowerScore < <value>*higherScore`, then the lower-scoring one may be cancelled. A value of 0.0 means it will never allow cancelling lower-scoring raids, while a value of 1.0 means it will always allow cancelling lower-scoring raids.	    
		RAIDS_COMMAND_POWER_CAP_TO_CREATE = 60.0,              -- The AI will only try to create new raids if the command power cap is at least this.
	    RAIDS_MIN_SUCCESS_FOR_LAUNCH = 0.65,                   -- The AI will not launch a raid if the chance of success is lower than this.
	    RAIDS_CANCEL_AFTER_DAYS_LAUNCHABLE = 60,               -- If a raid has been launchable for more than <this> days but not been launched (e.g. due to bad success chance), the AI will cancel the raid.
	    RAIDS_NUKE_TARGET_CUT_OFF = 10,                        -- When AI selects targets for nukes, only pick from the <x> highest-scoring targets.
    	RAIDS_UNIT_SCORE_SUCCESS_CHANCE_FACTOR = 500.0,        -- When AI selects which units to use for raids, multiply the unit success chance modifier with this.
    	RAIDS_UNIT_SCORE_DISTANCE_KM_FACTOR = 0.1,             -- When AI selects which units to use for raids, multiply the km distance with this.
		RAIDS_AVOID_SAME_TARGET_DURATION_DAYS = 180,           -- After a raid is finished/canceled, AI is less likely to raid the same target for this time.
		RAIDS_AVOID_SAME_TARGET_FACTOR = 0.4,                  -- If AI has already raided (or tried to raid) a target, score of new raids against same target is factored by this
	},

	NFocus = {
		FOCUS_POINT_DAYS = 1,						-- Each point takes a day
		FOCUS_PROGRESS_PEACE = 1,					-- Progress during peace
		FOCUS_PROGRESS_WAR = 1,					-- Progress during war
		MAX_SAVED_FOCUS_PROGRESS = 10,				-- This much progress can be saved while not having a focus selected
	},

	NOperatives = {
		AGENCY_CREATION_DAYS = 30,						-- Number of days needed to create an intelligence agency
		AGENCY_UPGRADE_DAYS = 30,						-- Number of days needed to upgrade an intelligence agency
		AGENCY_CREATION_FACTORIES = 5,					-- Number of factories used to create an intelligence agency
		AGENCY_AI_BASE_NUM_FACTORIES = 25.0,				-- Used by AI to pace the upgrades. Formula : if( AGENCY_AI_BASE_NUM_FACTORIES <= num_civ_factories - num_upgrades * AGENCY_AI_PER_UPGRADE_FACTORIES )
		AGENCY_AI_PER_UPGRADE_FACTORIES = 6.0,			-- Used by AI to pace the upgrades. Formula : if( AGENCY_AI_BASE_NUM_FACTORIES <= num_civ_factories - num_upgrades * AGENCY_AI_PER_UPGRADE_FACTORIES )
		AGENCY_UPGRADE_PER_OPERATIVE_SLOT = 5,			-- Number of upgrade needed to unlock an additional operative slot
		MAX_OPERATIVE_SLOT_FROM_AGENCY_UPGRADES = 1,	-- max operative slots gained from upgrades
		AGENCY_OPERATIVE_RECRUITMENT_TIME = 30,			-- Number of days to wait to have operative to recruit when an operative slot first becomes available
		BECOME_SPYMASTER_PP_COST = 50,					-- Number of political power used to become Spy Master
		BECOME_SPYMASTER_MIN_UPGRADES = 3,				-- Number of agency upgrades you need before becoming Spy Master
		BASE_COUNTER_INTELLIGENCE_RATING = 0.0,					-- Base national counter intelligence rating for all countries
		AGENCY_DEFENSE_EFFECT_ON_HOSTILE_ACTION_COST = 0.2,			-- Defense factor that is responsible for multiplying the cost hostile actions against our country by its level and this value
		INTEL_NETWORK_GAIN_RATE_ON_WRONG_CONTROLLER = -10.0,			-- Amount of network strength lost in a state when it does not have the right controller anymore
		INTEL_NETWORK_GAIN_RATE_ON_OUT_OF_RANGE = -1.75,				-- Amount of network strength lost in a state that has the right controller but is out of range of any operative
		INTEL_NETWORK_GAIN_FROM_ADJACENCY_FACTOR = 0.5,				-- Factor multiplied to the sum of the positive difference between a state's strength and its neighbors'. In other words, how strongly neighbors impact the strength gained in a state. Values greater or equal to 1 are discouraged.
		INTEL_NETWORK_GAIN_DECAY_PER_STEP_FACTOR = 0.5,				-- Factor multiplied to the gain of the previous node in the netowrk initially contributed by the agent. In other words, before adjacency, the strength gain in a state would be GainFromOperative * ( INTEL_NETWORK_GAIN_DECAY_PER_STEP_FACTOR ^ NodeDepth ) where NodeDepth is the distance between the state and the operative's location.
		INTEL_NETWORK_STRENGTH_TARGET_OFFSET_PER_OPERATIVE = 15.0,		-- The amount of strength each operative on build intel network mission in a sub network add to the base target network strength
		INTEL_NETWORK_STRENGTH_DECAY_WHEN_ABOVE_TARGET = -2.5,			-- The amount of strength removed each tick from a state that has more strength than the target
		INTEL_NETWORK_BASE_STRENGTH_TARGET_COUNTERINTELLIGENCE_FACTOR = -10.0,	-- BaseStrengthTarget = Factor * CounterIntelligenceRating + Offset
		INTEL_NETWORK_BASE_STRENGTH_TARGET_COUNTERINTELLIGENCE_OFFSET = 90,	-- Offset mentioned above
		INTEL_NETWORK_MIN_VP_TO_TARGET = 15,					-- The minimum value of the highest VP in a state to consider the state as a valid target to start building an intel network
		INTEL_NETWORK_MIN_STRENGTH_TO_TARGET = 101.0,				-- The minimum value of the intel network in a state to consider it a valid target to deploy an operative in
		INTEL_NETWORK_MIN_STRENGTH_TO_LINK_SUBNETWORKS = 0.0,			-- Where the influence of two operative meet, the two nodes on each side have to have strictly more than the given strength before the two operatives have a chance of being considered in the same network
		INTEL_NETWORK_OPERATIVE_GAIN_STACKING_FACTOR = 0.5,			-- When multiple operative are present in the same location, this factor is applied for each operative with a lower gain than the max. So if operatives have the gain [ 3, 1, 2 ] in the same location, it is sorted to [ 1, 2, 3 ] then converted to [ 1*D^2, 2*D^1, 3 ], with D being this define, so if D=0.5 we have [ 0.25, 1, 3 ] and the final gain from operative at this location will be 4.25. Putting this define to 0 is equivalent to considering the maximum value only.
		INTEL_NETWORK_MIN_STRENGTH_FOR_STATE_TO_COUNT_TOWARD_NATIONAL_COVERAGE = 0.0,	-- Amount of strength (0, 100) in a state required for it to count toward the national coverage
		INTEL_NETWORK_NATIONAL_COVERAGE_CONTROLLED_STATES_WEIGHT = 0.2,		-- Weight (expected [0,1]) multiplied by the number of states covered by the network that are controlled by the target over the total number of states the target controls
		INTEL_NETWORK_NATIONAL_COVERAGE_CORE_STATES_WEIGHT = 0.6,			-- Weight (expected [0,1]) multiplied by the number of states covered by the network that are core to the target over the total number of states the target has for core
		INTEL_NETWORK_NATIONAL_COVERAGE_OWNED_WORTH_WEIGHT = 0.2,		-- Weight (expected [0,1]) multiplied by the value of victory points covered by the network over the total value of victory points controlled by the targets
		INTEL_NETWORK_OCCUPIED_TAG_STATES_WEIGHT = 0.5,				-- Weight (expected [0,1]) multiplied to the fraction of number of state covered by the intel network divided by the number of states occupied by the target of the network, per occupied tag
		INTEL_NETWORK_OCCUPIED_TAG_WORTH_WEIGHT = 0.5,				-- Weight (expected [0,1]) multiplied to the fraction of victory points worth of states covered by the intel network divided by the worth of states occupied by the target of the network, per occupied tag
		INTEL_NETWORK_MIN_SUB_NETWORK_SIZE_FOR_DETECTION = 0,			-- minimum number of state of a sub-intel network before an operative on build intel network mission in this network can be detected
		INTEL_NETWORK_MIN_NATIONAL_COVERAGE_FOR_DETECTION = 0.02,		-- [0, 1] minimum national coverage required for an operative on build intel network to have a chance to be discovered
		INTEL_NETWORK_MIN_SUB_NETWORK_NATIONAL_COVERAGE_FOR_DETECTION = 0.01,	-- [0, 1] minimum national coverage of the network the operative on build intel network is in to have a chance to be discovered
		INTEL_NETWORK_MIN_SUB_NETWORK_STRENGTH_FOR_DETECTION = 10.0,		-- [0, 100] minimum network strength of the network the operative on build intel network mission is in to have a chance to be discovered

		INTEL_NETWORK_INTELLIGENCE_AGENCY_DEFENSE_TO_DETECTION_FACTOR = 2.0,	-- multiplied to the intelligence agency defense of the target of the intel network
		INTEL_NETWORK_INTELLIGENCE_AGENCY_DEFENSE_DETECTION_SCALE_FACTOR = 0.0,	-- factor multiplied to the intelligence agency defense of the target of the intel network before being factored to the detection chance
		INTEL_NETWORK_MAX_INTELLIGENCE_AGENCY_DEFENSE_DETECTION_SCALE_FACTOR = 1.0,	-- clamp the value from the multiplication of the above factor
		INTEL_NETWORK_NATIONAL_COVERAGE_TO_DETECTION_CHANCE_FACTOR = 1.0,	-- multiplied to the national coverage (a value in range [0, 1]
		INTEL_NETWORK_SUB_NETWORK_STRENGTH_TO_DETECTION_CHANCE_FACTOR = 0.1,	-- multiplied to the network strength (a value in range [0, 100]
		INTEL_NETWORK_SUB_NETWORK_NATIONAL_COVERAGE_TO_DETECTION_CHANCE_FACTOR = 3.0,	-- multiplied to the contribution to the national coverage of the sub network (a value in range [0, 1])
		INTEL_NETWORK_DETECTION_GLOBAL_FACTOR = 0.01,				-- global factor multiplied to the detection chance before it is multiplied a dice roll in the range [0,1000)
		BUILD_INTEL_NETWORK_DAILY_XP_GAIN = 1,
		QUIET_INTEL_NETWORK_DAILY_XP_GAIN = 0,
		OPERATIVE_MISSION_DETECTION_CHANCE_FACTOR = {
			-- Factor multiplied to the detection chance of an agent on mission before the offsets
			0.0, -- NoMission
			1.0, -- BuildIntelNetwork
			1.0, -- QuietIntelNetwork
			1.0, -- CounterIntelligence
			0.0, -- RootOutResistance
			3.0, -- BoostIdeology
			0.1, -- ControlTrade
			0.1, -- DiplomaticPressure
			3.0, -- Propaganda	
		},	
		
		-- used for calculating how many operatives will a spy master gain from its faction members
		-- first number in every now is number of operatives gained
		-- second number is total factory needed (mil and civ) for giving previous ratio
		OPERATIVE_SLOTS_FROM_FACTION_MEMBERS_FOR_SPY_MASTER = {
			0.0, 	0.0, -- 0 operative for [0, 10)
			0.25,  	10.0, -- 0.25 operative for [10, 50)
			0.5, 	50.0, -- 0.5 operative for >= 50
		},

		INTEL_NETWORK_STATE_MODIFIER_STRENGTH_THRESHOLD = 10,			-- Minimum amount of strength required in a state for the intel network related modifiers to start being applied

		INTEL_NETWORK_MIN_DEFAULT_FOR_SHOWING = 25,              -- default min level for networks used to filter operation requirements if not overriden

		OPERATIVE_BASE_INTEL_NETWORK_GAIN = 0.4,				-- Base amount of network strength gain per day provided by an operative
		OPERATIVE_MAX_INTEL_NETWORK_GAIN = -1.0,				-- Max amount of network strength gain per day provided by an operative after modifiers have been applied (negative value means no max)
		COUNTER_INTELLIGENCE_FOREIGN_AGENT_FACTOR = 0.0,			-- Multiplier to the counter intelligence provided by foreign (ally) operatives
		COUNTER_INTELLIGENCE_STACKING_FACTOR = 0.5,				-- Multiplier applied to each operative after the first one. So if we have the following counter intelligence rating values [ 0.1, 0.3, 0.2 ], the factor is applied twice for the lowest value and once for the 2nd lowest one as such : [ 0.3, 0.2 * D, 0.1 * D * D ] and then the result is summed up to give the final rating value
		COUNTER_INTELLIGENCE_TO_DEFENSE_LOG_FACTOR = 0.0,			-- Defense = LogFactor * log( 1 + CounterIntelligence ) + CounterIntelligence / Divisor
		COUNTER_INTELLIGENCE_TO_DEFENSE_DIVISOR = 1.0,				-- see above
		COUNTER_INTELLIGENCE_DAILY_XP_GAIN = 0.112,
		BOOST_IDEOLOGY_NATIONAL_COVERAGE_FACTOR = 1.0,				-- used to compute the drift factor as follow: BASE * SUB_NETWORK_NC * BOOST_IDEOLOGY_DEFENSE_FACTOR
		BOOST_IDEOLOGY_MAX_DRIFT_BY_OPERATIVE = 0.25,				-- the maximum drift an operative can cause, a negative value means no maximum
		BOOST_IDEOLOGY_DRIFT_STACKING_FACTOR = 0.5,				-- multiplied to the drift of an operative for each operative after the first one, with the greatest drift. So if we have the following drift values [ 0.1, 0.3, 0.2 ], the factor is applied twice for the lowest value and once for the 2nd lowest one as such : [ 0.3, 0.2 * D, 0.1 * D * D ] and then the result is summed up to give the final drift value.
		BOOST_IDEOLOGY_DEFENSE_FACTOR = 0.2,					-- multiplied to the target's defense to get the amount of drift to remove from each operative's drift
		BOOST_IDEOLOGY_DAILY_XP_GAIN = 0.274,
		OPERATIVE_BASE_INTEL_AGENCY_DEFENSE = 1.0,				-- Base amount of intel agency defense contributed by an operative on counter_intelligence mission
		OPERATIVE_BASE_BOOST_IDEOLOGY = 0.1,					-- Base amount of daily ideology drift provoked by an operative
		OPERATIVE_BASE_PROPAGANDA_POWER = 0.0005,					-- Base amount of daily war support and stability change when an operative is assigned to propaganda
		PROPAGANDA_SUB_NETWORK_STRENGTH_FACTOR = 1.0,				-- Multiplied to the network strength before being multiplied to the Stability/WarSupport drift caused by an operative 
		PROPAGANDA_DEFENSE_FACTOR = 0.01,					-- Multiplied to the target's defense before being subtracted from the Stability/WarSupport drift caused by an operative
		PROPAGANDA_OPERATIVE_STACKING_FACTOR = 0.5,				-- Multiplied to the Stability/WarSupport drift values of each operative after the one with the greatest values. The process is done separatly for Stability and WarSupport
		PROPAGANDA_COUNTRY_STACKING_FACTOR = 0.5,				-- Multiplied to the Stability/WarSupport drift values of each country after the one with the greatest values. The process is done separatly for Stability and WarSupport
		PROPAGANDA_DAILY_XP_GAIN = 0.350,
		OPERATIVE_BASE_ROOT_OUT_RESISTANCE_EFFICIENCY = 1.0,			-- The base efficiency of an operative at the RootOutResistance mission (this is a percentage, 1.0 == 100%)
		ROOT_OUT_RESISTANCE_STACKING_FACTOR = 0.5,				-- Multiplied to each operative efficiency after the first one
		ROOT_OUT_RESISTANCE_RANGE_STEP_FACTOR = 0.5,				-- Multiplied to the summed up efficiency from all operative operating in a same state to determine the efficiency in neighboring states
		ROOT_OUT_RESISTANCE_DAILY_XP_GAIN = 0.068,
		OPERATIVE_BASE_CONTROL_TRADE_DRIFT = 0.5,				-- The base daily drift in trade influence caused by an operative
		CONTROL_TRADE_STACKING_FACTOR = 0.5,					-- Multiplied to the drift of each operative after the first one
		CONTROL_TRADE_MAX_INFLUENCE = 50.0,					-- The maximum amount of trade influence that can be gained through the control trade mission
		CONTROL_TRADE_INFLUENCE_DAILY_DECAY = 0.1,				-- The amount of trade influence lost when no operative are assigned to the mission
		CONTROL_TRADE_DAILY_XP_GAIN = 0.137,
		OPERATIVE_BASE_DIPLOMATIC_PRESSURE_AI_ACCEPTANCE_SCORE_DRIFT = 0.4,	-- The daily change in the amount of opinion requiered to join a faction
		OPERATIVE_BASE_DIPLOMATIC_PRESSURE_TENSION_REQUIREMENTS_DRIFT = 0.001,	-- The daily change in world tension requiered to join a faction
		DIPLOMATIC_PRESSURE_MAX_AI_ACCEPTANCE_SCORE_INCREASE = 20.0,	-- the maximum amount of ai acceptance score from diplomatic pressure
		DIPLOMATIC_PRESSURE_MAX_TENSION_REQUIREMENTS_DECREASE = 0.20,	-- amount of tension (tensions is in range [0,1]) that can be removed from the requirements imposed by the modifier join_faction_tension_limit
		DIPLOMATIC_PRESSURE_OPERATIVE_STACKING_FACTOR = 0.5,		-- The diminishing return factor to apply to operative working for the same faction after the first one. Operatives operating for a same faction are ranked by their efficiency and their opinion and tension drift are individually applyied a stacking factor like so: DRIFT * STACKING_FACTOR^RANK where RANK is a value from 0 to the number of operative -1 where the opperative with the highest drift value has rank 0
		DIPLOMATIC_PRESSURE_AI_ACCEPTANCE_SCORE_DECAY = 0.4,			-- daily decay when the mission is not active
		DIPLOMATIC_PRESSURE_TENSION_REQUIREMENTS_DECAY = 0.001,			--
		DIPLOMATIC_PRESSURE_DAILY_XP_GAIN = 0.137,
		MIN_NATIONAL_COVERAGE_FOR_BOOST_IDEOLOGY = 0.01,			-- Minimum network coverage required to start the mission (the code ensures that a network exists at all)
		MIN_NATIONAL_COVERAGE_FOR_PROPAGANDA = 0.01,			-- Minimum network coverage required to start the mission (the code ensures that a network exists at all)
		OPERATIVE_MIN_DAYS_HARMED = 30,						-- Minimum number of days an operative can be harmed. Applied after modifiers. Can be zero.
		OPERATIVE_MAX_DAYS_HARMED = 120,						-- Maximum number of days an operative can be harmed. Applied after modifiers. Is ignored if negative
		OPERATIVE_MIN_DAYS_FORCED_INTO_HIDING = 7,				-- Minimum number of days an operative can be forced into hiding. Applied after modifiers. Can be zero.
		OPERATIVE_MAX_DAYS_FORCED_INTO_HIDING = 120,				-- Maximum number of days an operative can be forced into hiding. Applied after modifiers. Is ignored if negative
		OPERATIVE_MAX_DAYS_TO_AUTO_RESUME_MISSION = 30,				-- Maximum number of days an operative has to be disabled before its mission is not automatically resumed once he is available again
		MAX_RECRUITED_OPERATIVES = 20,
		
		CRYPTO_BASE_CRYPTO_LEVEL = 12000,						-- base crypto strength for a country
		CRYPTO_CRYPTO_LEVEL_PER_CRYPTO_UPGRADE = 4250,			-- crypto strength per crypto upgrade
		
		CRYPTO_CRYPTO_ACTIVE_BONUS_DURATION = 30,				-- number of days the active decryption bonuses will be applied before enemy resets their intelligence
		CYRPTO_ACTIVE_BONUS_ACTIVATION_PROGRESS_RATIO = 0.5,	-- once bonus is activated, decryption progress will be reduced to this ratio
		
		OPERATION_AI_MINIMUM_SCORE = 10.0,						-- Once an operation's AI weight falls below the minimum score it will be scrapped if it is being prepared
		OPERATION_COMPLETION_XP = 18,

		OPERATIVE_CAPTURE_DURATION_IN_DAYS = 9*30,

		-- operation cost & time are increased by default this ratios for each 
		-- instance of operation that were already executed against same target. 
		-- can be overridden using time_multiplier & cost_multiplier in operation.
		DEFAULT_OPERATION_COST_MULTIPLIER = 0.15,
		DEFAULT_OPERATION_TIME_MULTIPLIER = 0.0, 

		-- The following defines are multiplied to the number of operatives operating in the target country the activity level is computed for
		BUILD_INTEL_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
		BOOST_IDEOLOGY_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
		PROPAGANDA_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 10,
		CONTROL_TRADE_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 1,
		DIPLOMATIC_PRESSURE_NETWORK_MISSION_ACTIVITY_INDICATOR_FACTOR = 1,

		-- multiplied to the sum of the network coverage [0,1] all countries have over the target
		INTEL_NETWORK_COVERAGE_ACTIVITY_FACTOR = 100,

		-- multiplied to the strength [0,100] of the strongest network over that country
		INTEL_NETWORK_STRENGTH_DANGER_FACTOR = 1,

		-- Activity level PID values
		ACTIVITY_LEVEL_PROPORTIONAL_FACTOR = 0.01,
		ACTIVITY_LEVEL_INTEGRAL_FACTOR = 0.001,
		ACTIVITY_LEVEL_DERIVATIVE_FACTOR = 0,

		-- Danger level PID values
		DANGER_LEVEL_PROPORTIONAL_FACTOR = 0.01,
		DANGER_LEVEL_INTEGRAL_FACTOR = 0.001,
		DANGER_LEVEL_DERIVATIVE_FACTOR = 0,

		NUM_DAYS_BEFORE_REMOVING_PREPARED_OPERATIONS = 60, -- num days before removing prepared operations

		ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_XP_GAIN = 100,					-- Xp gain when an enemy operative is captured in the country the operative is assigned to counter intelligence to. Apply to a single randomly selected operative
		ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_WEIGHT_OWN_COUNTRY_FOR_XP = 2,			-- An integer on how likely an operative operating in his own country is to get selected for the xp reward on enemy operative capture
		ON_CAPTURE_COUNTERINTELLIGENCE_OPERATIVE_WEIGHT_DIFFERENT_COUNTRY_FOR_XP = 1,		-- same for an operative assigned to counter intelligence in a different country than his own

		
		-- risk and outcome texts. each number array should match its labels in size, but its ok to have different amount of risk levels than outcomes
		RISK_LEVELS = { 0.1, 0.2, 0.3 },       -- each risk level comes with a label to display for operations if it goes abve that number. If below the first it will isntead show the good outcomes 
		RISK_LEVELS_LABELS = { "RISK_LOW", "RISK_MID", "RISK_HIGH" },
		OUTCOME_LEVELS = { 0.0, 0.2, 0.3 },    -- outcome levels are shown if risk is below its first entry instead
		OUTCOME_LEVELS_LABELS = { "OUTCOME_BASE", "OUTCOME_GOOD", "OUTCOME_VGOOD" },

		TECH_STEAL_EQUIPMENT_FACTOR = 2,
		TECH_STEAL_YEAR_FACTOR = 4,
	},

	NIntel = {
		COUNTRY_LEVEL_INTEL_MAXIMUMS = {			-- The maximum intel a country can have over another
			100.0, -- Civilian
			100.0, -- Army
			100.0, -- Navy
			100.0, -- Airforce
		},

		-- Static sources:
		--
		-- A static source is a source that will fully decay once its origin disappear.
		-- (e.g. radar destroyed)
		--
		-- MAXIMUMS:
		-- if set to an non-empty arrays, overrides COUNTRY_LEVEL_INTEL_MAXIMUMS
		-- for this specific source (note that COUNTRY_LEVEL_INTEL_MAXIMUMS is
		-- applied after INTEL_SOURCE_XXX_MAXIMUMS)

		STATIC_INTEL_SOURCE_OPERATION_TOKENS_MAXIMUMS = {},
		STATIC_INTEL_SOURCE_BROKEN_CYPHER_MAXIMUMS = { 60.0, 60.0, 60.0, 60.0 },
		STATIC_INTEL_SOURCE_RADAR_MAXIMUMS = { 10.0, 10.0, 20.0, 20.0 },
		STATIC_INTEL_SOURCE_INTEL_NETWORK_MAXIMUMS = { 30.0, 30.0, 40.0, 30.0},

		-- Dynamic intel pool can be manipulated through the following defines:
		--
		-- FLAT_DECAY and MULT_DECAY control the rate at which the intel decays
		-- The formula is applied as follow (runs daily):
		-- NextIntel = ( Intel - FLAT_DECAY ) * MULT_DECAY
		--
		-- AGGREGAT_LOG_FACTOR and AGGREGAT_DIVISOR control the rate at which
		-- intel accumulates. It is applied to the sum of the intel generated
		-- throughout the day as follow:
		-- Aggregat = LOG_FACTOR * log( 1 + IntelOfTheDay ) + IntelOfTheDay / DIVISOR
		-- The Aggregat is then added to the pool of intel.
		-- If DIVISOR is zero then the division is evaluated to zero.
		--
		-- MAXIMUMS controls the maximum value that the pool can contribute to
		-- the final intel values.
		--
		-- ABSOLUTE_MAXIMUMS defines a ceiling for the intel in the pool that
		-- will never be exceeded. They are meant to be greater or equal to
		-- MAXIMUMS. If the array is empty, no absolute maximum is defined.

		-- Dynamic pool EVENT
		DYNAMIC_INTEL_SOURCE_EVENT_FLAT_DECAY = 0.0,
		DYNAMIC_INTEL_SOURCE_EVENT_MULT_DECAY = 0.985,
		DYNAMIC_INTEL_SOURCE_EVENT_AGGREGAT_LOG_FACTOR = 0,
		DYNAMIC_INTEL_SOURCE_EVENT_AGGREGAT_DIVISOR = 1,
		DYNAMIC_INTEL_SOURCE_EVENT_MAXIMUMS = { 40, 40, 40, 40 },
		DYNAMIC_INTEL_SOURCE_EVENT_ABSOLUTE_MAXIMUMS = { 50, 50, 50, 50 },

		-- Dynamic pool LAND_COMBAT
		DYNAMIC_INTEL_SOURCE_LAND_COMBAT_FLAT_DECAY = 0.0,
		DYNAMIC_INTEL_SOURCE_LAND_COMBAT_MULT_DECAY = 0.985,
		DYNAMIC_INTEL_SOURCE_LAND_COMBAT_AGGREGAT_LOG_FACTOR = 0.25,
		DYNAMIC_INTEL_SOURCE_LAND_COMBAT_AGGREGAT_DIVISOR = 10,
		DYNAMIC_INTEL_SOURCE_LAND_COMBAT_MAXIMUMS = { 0, 30, 5, 10 },
		DYNAMIC_INTEL_SOURCE_LAND_COMBAT_ABSOLUTE_MAXIMUMS = { 0, 40, 10, 15 },

		-- Dynamic pool NAVAL_COMBAT
		DYNAMIC_INTEL_SOURCE_NAVAL_COMBAT_FLAT_DECAY = 0.0,
		DYNAMIC_INTEL_SOURCE_NAVAL_COMBAT_MULT_DECAY = 0.985,
		DYNAMIC_INTEL_SOURCE_NAVAL_COMBAT_AGGREGAT_LOG_FACTOR = 0.02,
		DYNAMIC_INTEL_SOURCE_NAVAL_COMBAT_AGGREGAT_DIVISOR = 200,
		DYNAMIC_INTEL_SOURCE_NAVAL_COMBAT_MAXIMUMS = { 10, 0, 40, 20 },
		DYNAMIC_INTEL_SOURCE_NAVAL_COMBAT_ABSOLUTE_MAXIMUMS = { 15, 0, 45, 25 },

		-- Dynamic pool AIR_COMBAT
		DYNAMIC_INTEL_SOURCE_AIR_COMBAT_FLAT_DECAY = 0.0,
		DYNAMIC_INTEL_SOURCE_AIR_COMBAT_MULT_DECAY = 0.985,
		DYNAMIC_INTEL_SOURCE_AIR_COMBAT_AGGREGAT_LOG_FACTOR = 1,
		DYNAMIC_INTEL_SOURCE_AIR_COMBAT_AGGREGAT_DIVISOR = 2,
		DYNAMIC_INTEL_SOURCE_AIR_COMBAT_MAXIMUMS = { 0, 0, 0, 25 },
		DYNAMIC_INTEL_SOURCE_AIR_COMBAT_ABSOLUTE_MAXIMUMS = { 0, 0, 0, 30 },

		-- Dynamic pool AIR_RECON 
		DYNAMIC_INTEL_SOURCE_AIR_RECON_FLAT_DECAY = 0.0,
		DYNAMIC_INTEL_SOURCE_AIR_RECON_MULT_DECAY = 0.995,
		DYNAMIC_INTEL_SOURCE_AIR_RECON_AGGREGAT_LOG_FACTOR = 0.05,
		DYNAMIC_INTEL_SOURCE_AIR_RECON_AGGREGAT_DIVISOR = 200,
		DYNAMIC_INTEL_SOURCE_AIR_RECON_MAXIMUMS = { 25, 20, 30, 20 },
		DYNAMIC_INTEL_SOURCE_AIR_RECON_ABSOLUTE_MAXIMUMS = { 30, 25, 35, 25 },

		-- Dynamic pool CAPTURED_OPERATIVE
		DYNAMIC_INTEL_SOURCE_CAPTURED_OPERATIVE_FLAT_DECAY = 0.0,
		DYNAMIC_INTEL_SOURCE_CAPTURED_OPERATIVE_MULT_DECAY = 0.95,
		DYNAMIC_INTEL_SOURCE_CAPTURED_OPERATIVE_AGGREGAT_LOG_FACTOR = 1,
		DYNAMIC_INTEL_SOURCE_CAPTURED_OPERATIVE_AGGREGAT_DIVISOR = 2,
		DYNAMIC_INTEL_SOURCE_CAPTURED_OPERATIVE_MAXIMUMS = { 50, 40, 40, 30 },
		DYNAMIC_INTEL_SOURCE_CAPTURED_OPERATIVE_ABSOLUTE_MAXIMUMS = { 50, 40, 40, 30 },

		LAND_COMBAT_ARMY_INTEL_OVER_OPPONENT_PER_INSTANCE = 1.0,			-- if the opponent has any division present, flat intel value generated py a participant against an opponent
		LAND_COMBAT_ARMY_INTEL_OVER_OPPONENT_PER_COMITTED_DIVISIONS = 0.5,		-- multiplied to the number of comitted divisions of the opponent
		LAND_COMBAT_ARMY_INTEL_OVER_OPPONENT_PER_RESERVE_DIVISIONS = 0.1,		-- same for divisions in reserve
		LAND_COMBAT_ARMY_INTEL_OVER_OPPONENT_PER_RETREATING_DIVISIONS = 0.2,		-- same for retreating divisions
		LAND_COMBAT_ARMY_INTEL_FACTOR = 0.01,						-- factor applied once all values have been added together
		LAND_COMBAT_AIR_INTEL_OVER_OPPONENT_PER_INSTANCE = 1.0,				-- if the opponent has any plane active in the, flat intel value generated by a participant against that opponent
		LAND_COMBAT_AIR_INTEL_OVER_OPPONENT_PER_PLANE = 0.1,				-- multiplied to the number of plane that opponent has in the combat
		LAND_COMBAT_AIR_INTEL_FACTOR = 0.01,						-- factor applied once all values have been added together
		RECON_INTEL_BONUS = 0.075,                                      -- each recon gives this bonus to overall gathered land intel in combat

		NAVAL_COMBAT_NAVY_INTEL_OVER_OPPONENT_PER_INSTANCE = 1.0,
		NAVAL_COMBAT_NAVY_INTEL_OVER_OPPONENT_PER_SUBMARINE = 0.2,
		NAVAL_COMBAT_NAVY_INTEL_OVER_OPPONENT_PER_SCREEN_SHIP = 0.5,
		NAVAL_COMBAT_NAVY_INTEL_OVER_OPPONENT_PER_CAPITAL_SHIP = 1.0,
		NAVAL_COMBAT_NAVY_INTEL_OVER_OPPONENT_PER_INTERNAL_PLANES = 0.05,
		NAVAL_COMBAT_NAVY_INTEL_FACTOR = 1.0,
		NAVAL_COMBAT_CIVILIAN_INTEL_OVER_OPPONENT_PER_INSTANCE = 0.0,
		NAVAL_COMBAT_CIVILIAN_INTEL_OVER_OPPONENT_PER_TRADE_CONVOY = 1.0,
		NAVAL_COMBAT_CIVILIAN_INTEL_FACTOR = 1.0,
		NAVAL_COMBAT_ARMY_INTEL_OVER_OPPONENT_PER_INSTANCE = 0.0,
		NAVAL_COMBAT_ARMY_INTEL_OVER_OPPONENT_PER_TRANSFER_CONVOY = 1.0,
		NAVAL_COMBAT_ARMY_INTEL_FACTOR = 1.0,
		NAVAL_COMBAT_AIR_INTEL_OVER_OPPONENT_PER_INSTANCE = 1.0,
		NAVAL_COMBAT_AIR_INTEL_OVER_OPPONENT_PER_INTERNAL_PLANES = 0.0,
		NAVAL_COMBAT_AIR_INTEL_OVER_OPPONENT_PER_EXTERNAL_PLANES = 0.01,
		NAVAL_COMBAT_AIR_INTEL_FACTOR = 1.0,

		NAVY_INTEL_BASE_SPOTTING_BONUS_MIN_INTEL_FOR_BONUS = 5, -- at least this intel diff is needed for start applying BASE_SPOTTING_FROM_DECRYPTION bonus
		NAVY_INTEL_BASE_SPOTTING_BONUS_MAX_INTEL_FOR_BONUS = 40, -- at this intel BASE_SPOTTING_FROM_DECRYPTION will be applied fully
		
		NAVY_INTEL_MINE_DAMAGE_REDUCTION_FACTOR_MIN_INTEL_FOR_BONUS = 5, -- at least this intel diff is needed for start applying NAVAL_MINES_INTEL_DIFF_FACTOR bonus
		NAVY_INTEL_MINE_DAMAGE_REDUCTION_FACTOR_MAX_INTEL_FOR_BONUS = 40, -- t this intel NAVAL_MINES_INTEL_DIFF_FACTOR will be applied fully

		AIR_COMBAT_AIR_INTEL_PER_INSTANCE = 1.0,
		AIR_COMBAT_AIR_INTEL_PER_OPPONENT_PLANE = 0.0,
		AIR_COMBAT_AIR_INTEL_FACTOR = 0.2,

		INTEL_NETWORK_NATIONAL_COVERAGE_FACTOR = 2.0,			 -- multiplied to the national coverage to deduce the fraction of the maximum value listed below that will be added to the intel against the network's target
		INTEL_NETWORK_NATIONAL_COVERAGE_NAVAL_BASE_FACTOR = 15.0, -- factor used instead of above in case you dont cover naval bases etc 

		-- the maximum intel values that an intel network will provide against a target
		INTEL_NETWORK_MAX_CIVILIAN_INTEL = 20.0,
		INTEL_NETWORK_MAX_ARMY_INTEL = 20.0,
		INTEL_NETWORK_MAX_NAVY_INTEL = 25.0,				-- only apply if the network encompass a naval base controlled by the network's target
		INTEL_NETWORK_MAX_AIRFORCE_INTEL = 15.0,

		RADAR_LEVEL_INTEL_FACTOR = 1.25,					-- Multiplied to the radar level to tell the fraction of intel per covered province we get. The radar level is computed as BuildingLevel / MaxBuildingLevel.
		RADAR_INTEL_STACKING_FACTOR = 0.5,				-- Used when multiple radars cover the same province
		RADAR_BASE_INTEL_VALUES_FOR_COUNTRY_COVERAGE_PERCENTAGE = {
			-- Values are the same order as in COUNTRY_LEVEL_INTEL_MAXIMUMS
			-- Multiplied by the total radar efficiency over the provinces of
			-- a specific country divided by the number of provinces controlled
			-- by that same country.
			9.0,
			9.0,
			0.0,
			18.0,
		},
		RADAR_BASE_INTEL_VALUES_FOR_COVERED_LAND_PROVINCES = {
			-- Values are the same order as in COUNTRY_LEVEL_INTEL_MAXIMUMS
			-- Multiplied by the total radar efficiency of the provinces of
			-- a specific country divided by the individual radar's
			-- percentage of covered provinces.
			5.0,
			5.0,
			0.0,
			12.0,
		},
		RADAR_BASE_INTEL_VALUES_FOR_COVERED_SEA_PROVINCES = {
			-- Values are the same order as in COUNTRY_LEVEL_INTEL_MAXIMUMS
			-- Multiplied by the total radar efficiency of the provinces
			-- covered by the radar for each strategic region that has
			-- convoy routes and multiplied by the fraction of convoy
			-- that country has going through the region (excluding the
			-- convoys of the radar's owner)
			0.0,
			0.0,
			280.0,
			0.0,
		},
		RADAR_NAVY_INTEL_FACTOR_PER_SHIP_TYPE = {
			-- Navy intel value factored to the fraction of the country's
			-- ships in the sea zone covered by the radar, by ship type
			5.0, -- Submarine
			10.0, -- Screen ship
			20.0, -- Capital ship
			30.0, -- Carrier ship
		},
		CAPTURED_OPERATIVE_MAX_FACTOR = 35.0,	-- Define the maximum of the randomized factor, before the factor from operative is applied
		CAPTURED_OPERATIVE_MIN_FACTOR = 10.0,	-- Define the minimum of the randomized factor, before the factor from operative is applied
		CAPTURED_OPERATIVE_INTEL_YIELD = {
			-- Values are the same order as in COUNTRY_LEVEL_INTEL_MAXIMUMS
			-- Daily base intel yield from an operative, before the
			-- factors defined above are applied
			0.3,
			0.3,
			0.3,
			0.3,
		},

		RECON_PLANE_INTEL_BASE = 0.02, 				-- intel base amount for a strategic area per plane
		RECON_PLANE_LAND_DISTRIBUTION = { 10.0, 6.0, 0.0, 3.0 },    -- controls for land and sea zones how much of each intel typee is given (civ, army, navy, air)
		RECON_PLANE_SEA_DISTRIBUTION = { 0.0, 0.0, 10.0, 0.0 },

		LAND_SPOT_DECAY = 0.05,
		NAVAL_SPOT_DECAY = 1,

		ENCRYPTION_DECRYPTION_INTEL_FACTORS = {
			-- Factored to ( 1 + A.decryption ) / ( 1 + B.encryption ) to determine the intel
			-- A has over B when legacy encryption and decryption modifier are used.
			-- Note that if A.decryption is zero, the result is forced to zero
			-- In the ame order as COUNTRY_LEVEL_INTEL_MAXIMUMS
			15.0, 15.0, 15.0, 15.0
		},

		-- intel ledger defines
		CIVILIAN_PRODUCTION_RANGE_INTEL_MIN = 0.1, -- minimum value to show fuzzy factory counts below this you will get ???
		CIVILIAN_PRODUCTION_RANGE_INTEL_MAX = 0.5, -- maximum value to show fuzzy factory counts. above this you will get full count
		CIVILIAN_PRODUCTION_INTEL_RANGE_AT_LOWEST_INTEL = 0.5, -- range of intel values at lowest intel
		
		CIVILIAN_FUEL_RANGE_INTEL_MIN = 0.3, -- minimum value to show fuzzy factory counts below this you will get ???
		CIVILIAN_FUEL_RANGE_INTEL_MAX = 0.7, -- maximum value to show fuzzy factory counts. above this you will get full count
		CIVILIAN_FUEL_INTEL_RANGE_AT_LOWEST_INTEL = 0.5, -- range of intel values at lowest intel
		
		CIVILIAN_MANPOWER_RANGE_INTEL_MIN = 0.1, -- minimum value to show fuzzy factory counts below this you will get ???
		CIVILIAN_MANPOWER_RANGE_INTEL_MAX = 0.7, -- maximum value to show fuzzy factory counts. above this you will get full count
		CIVILIAN_MANPOWER_INTEL_RANGE_AT_LOWEST_INTEL = 0.5, -- range of intel values at lowest intel
		
		CIVILIAN_CONVOYS_RANGE_INTEL_MIN = 0.1, -- minimum value to show fuzzy factory counts below this you will get ???
		CIVILIAN_CONVOYS_INTEL_RANGE_AT_LOWEST_INTEL = 0.5, -- range of intel values at lowest intel

		CIVILIAN_TRUCKS_RANGE_INTEL_MIN = 0.1, -- minimum value to show fuzzy factory counts below this you will get ???
		CIVILIAN_TRUCKS_RANGE_INTEL_MAX = 0.5, -- maximum value to show fuzzy factory counts. above this you will get full count
		CIVILIAN_TRUCKS_INTEL_RANGE_AT_LOWEST_INTEL = 0.5, -- range of intel values at lowest intel

		CIVILIAN_TRAINS_RANGE_INTEL_MIN = 0.1, -- minimum value to show fuzzy factory counts below this you will get ???
		CIVILIAN_TRAINS_RANGE_INTEL_MAX = 0.5, -- maximum value to show fuzzy factory counts. above this you will get full count
		CIVILIAN_TRAINS_INTEL_RANGE_AT_LOWEST_INTEL = 0.5, -- range of intel values at lowest intel

		CIVILIAN_SUPPLY_RANGE_INTEL_MIN = 0.1, -- minimum value to show fuzzy factory counts below this you will get ???
		CIVILIAN_SUPPLY_RANGE_INTEL_MAX = 0.5, -- maximum value to show fuzzy factory counts. above this you will get full count
		CIVILIAN_SUPPLY_INTEL_RANGE_AT_LOWEST_INTEL = 0.5, -- range of intel values at lowest intel
		
		CIVILIAN_TRADE_SHOW_TRADE_AMOUNTS = 0.0, -- minimum value to show how much a country trades a resource
		CIVILIAN_TRADE_SHOW_TRADE_PARTNERS = 0.1, -- minimum value to show who a country trades with
		CIVILIAN_MIN_INTEL_FOR_RESOURCE_ROUTES_TOOLTIPS = 0.9, -- minimum value to show convoy routes for resource transfer
		CIVILIAN_MIN_INTEL_FOR_TRADE_ROUTES = 0.7, -- minimum value to show trade routes on map
		CIVILIAN_MIN_INTEL_FOR_RESOURCE_ORIGIN_ROUTES = 0.5, -- minimum value to show resource transfers to mainland on map
		
		ARMY_MIN_INTEL_FOR_SUPPLY_ROUTES = 0.5, -- minimum value to show convoy routes for supply transfer
		ARMY_MIN_INTEL_FOR_SUPPLY_ROUTES_TOOLTIPS = 0.7, -- minimum value to show convoy route tooltips for supply transfer

		CIVILIAN_INTEL_NEEDED_TO_SHOW_ANTI_AIR_REDUCTION = 0.3, -- minimum value to show anti air damage reduction

		CIVILIAN_INTEL_NEEDED_TO_SHOW_FOCUS_TREE = 0.7, -- min required intel to focus tree with taken focuses
		CIVILIAN_INTEL_NEEDED_TO_SHOW_CURRENT_FOCUS = 0.3,  -- min required intel to show currently focus
		CIVILIAN_INTEL_NEEDED_TO_SHOW_CURRENT_FOCUS_PROGRESS = 0.5,  -- min required intel to show current focus progress
		
		CIVILIAN_MIN_INTEL_TO_SHOW_INDUSTRY_GRAPH = 0.30,
		CIVILIAN_MIN_INTEL_TO_SHOW_CONVOYS_GRAPH = 0.70,
		CIVILIAN_MIN_INTEL_TO_SHOW_BOMBERS_GRAPH = 0.8,
		CIVILIAN_MIN_INTEL_TO_SHOW_TRUCKS_GRAPH = 0.5,
		CIVILIAN_MIN_INTEL_TO_SHOW_TRAINS_GRAPH = 0.5,

		CIVILIAN_MIN_INTEL_TO_SHOW_RAIL_STAUS = 0.4, -- when mousing over supply map mode, shows damage/construction status
		
		OLD_TECH_COUNT_NUM_DAYS = 180, -- num days after researched to consider a tech as "old"
		INTEL_TO_SHOW_TECH_COUNT = { 0.5, 0.3, 0.3, 0.3 },  -- minimum value to show current tech count and current doctrine
		INTEL_TO_SHOW_PREVIOUSLY_RESEARCHED = { 0.7, 0.7, 0.7, 0.7 }, -- minimum value to show previously researched tech
		INTEL_TO_SHOW_CURRENTLY_RESEARCHED = { 0.8, 0.8, 0.8, 0.8 }, -- minimum value to show currently being researched tech
		
		INTEL_TO_SHOW_IDEAS = { 0.0, 0.0, 0.0, 0.0 },
		
		ARMY_ARMY_COUNT_RANGE_INTEL_MIN = 0.1,
		ARMY_ARMY_COUNT_RANGE_INTEL_MAX = 0.7,
		ARMY_ARMY_COUNT_RANGE_INTEL_RANGE_AT_LOWEST_INTEL = 0.8,
		
		ARMY_SPECIAL_FORCES_COUNT_RANGE_INTEL_RANGE_AT_LOWEST_INTEL = 0.7,
		
		ARMY_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_MIN = 0.1,
		ARMY_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_MAX = 0.7,
		ARMY_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		ARMY_MIN_INTEL_TO_SHOW_EQUIPMENT_RATIO = 0.7,
		
		ARMY_MIN_INTEL_TO_SHOW_BASIC_TEMPLATE_INFO = 0.3,
		ARMY_TEMPLATE_UNIT_COUNT_INTEL_MIN = 0.5,
		ARMY_TEMPLATE_UNIT_COUNT_INTEL_MAX = 0.7,
		ARMY_TEMPLATE_UNIT_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 1.0,
		ARMY_MIN_INTEL_TO_SHOW_EXACT_TEMPLATE_INFO = 0.8,
		
		ARMY_STOCKPILE_COUNT_INTEL_MIN = 0.3,
		ARMY_STOCKPILE_COUNT_INTEL_MAX = 0.7,
		ARMY_STOCKPILE_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		ARMY_MIN_INTEL_TO_SHOW_EQUIPMENT_DESIGN_DETAILS = 0.8,
		
		ARMY_MIN_INTEL_RATIO_NEEDED_FOR_DISPLAYING_FAKE_ENEMY_INTEL_IN_LEDGER = 0.9,
		ARMY_MIN_INTEL_RATIO_NEEDED_FOR_REVEALING_FAKE_ENEMY_INTEL = 0.9,
		
		ARMY_INTEL_COMBAT_BONUS_MAX_BONUS = 0.15, -- max combat bonus that will apply when intel is high enough
		ARMY_INTEL_COMBAT_BONUS_FACTOR_ATTACK = 1.0, -- multiplier for attack value of intel combat bonus
		ARMY_INTEL_COMBAT_BONUS_FACTOR_DEFENSE = 1.0, -- multiplier for defense value of intel combat bonus
		
		ARMY_INTEL_COMBAT_BONUS_MIN_INTEL_FOR_BONUS = 5, -- min intel needed to start applying ARMY_INTEL_COMBAT_BONUS_MAX_BONUS
		ARMY_INTEL_COMBAT_BONUS_MAX_INTEL_FOR_BONUS = 50, -- intel needed to fully apply ARMY_INTEL_COMBAT_BONUS_MAX_BONUS

		NAVAL_SUPREMACY_INTEL_LOW = 0.3,								-- we need more intel than this to get any supremacy
		NAVAL_SUPREMACY_INTEL_LOW_SUPREMACY_PENALTY_START = 0.1,		-- supremacy is reduced to NAVAL_SUPREMACY_INTEL_LOW_SUPREMACY_MIN_PENALTY at or below this intel
		NAVAL_SUPREMACY_INTEL_LOW_SUPREMACY_MIN_PENALTY = 0.5, -- you get this much supremacy at NAVAL_SUPREMACY_INTEL_LOW_SUPREMACY_PENALTY_START and scales up to 1 at NAVAL_SUPREMACY_INTEL_LOW

		NAVY_FLEET_COUNT_INTEL_MIN = 0.1,
		NAVY_FLEET_COUNT_INTEL_MAX = 0.3,
		NAVY_FLEET_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		NAVY_TASKFORCE_COUNT_INTEL_MIN = 0.3,
		NAVY_TASKFORCE_COUNT_INTEL_MAX = 0.7,
		NAVY_TASKFORCE_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		NAVY_SHIP_COUNT_INTEL_MIN = 0.1,
		NAVY_SHIP_COUNT_INTEL_MAX = 0.8,
		NAVY_SHIP_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		NAVY_MIN_INTEL_TO_SHOW_EXISTING_CATEGORY_TYPES = 0.1,   --this is about disaplying ships by class category
		NAVY_SHIP_TYPE_COUNT_INTEL_MIN = 0.3,					--this range is used both when for disaplying counts by class and counts by variant					
		NAVY_SHIP_TYPE_COUNT_INTEL_MAX = 0.7,
		NAVY_SHIP_TYPE_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		NAVY_MIN_INTEL_TO_SHOW_SHIP_CLASSES = 0.5, --this unclocks the display of a given variant
		NAVY_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_MIN = 0.1,
		NAVY_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_MAX = 0.7,
		NAVY_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		NAVY_MIN_INTEL_TO_SHOW_SHIP_DESIGN_DETAILS = 0.8,
		
		AIR_AIRWING_COUNT_INTEL_MIN = 0.0,
		AIR_AIRWING_COUNT_INTEL_MAX = 0.7,
		AIR_AIRWING_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		AIR_MIN_INTEL_TO_SHOW_AIRWING_CLASSES = 0.3,
		AIR_WING_TYPE_COUNT_INTEL_MIN = 0.5,
		AIR_WING_TYPE_COUNT_INTEL_MAX = 0.7,
		AIR_WING_TYPE_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,
		
		AIR_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_MIN = 0.1,
		AIR_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_MAX = 0.7,
		AIR_DEPLOYED_MANPOWER_COUNT_RANGE_INTEL_RANGE_AT_LOWEST_INTEL = 0.5,

		CIVILIAN_MAPICON_INDUSTRY_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = 0.7,
		
		MAP_INTEL_VISIBILITY_CUTOFFS = { -- how much map intel is gained with intel over a country. first number is threshold, second is amount of intel map intel gained
			0.1, -50,
			0.4, 0,
			0.6, 50,
			1.0, 100,
		},
		
		-- these are used in some triggers
		ARMY_AVG_ARMOR_INTEL_MIN = 0.0,
		ARMY_AVG_ARMOR_INTEL_MAX = 0.5,
		ARMY_AVG_ARMOR_RANGE_AT_LOWEST_INTEL = 1.0,
		
		ARMY_MAX_ARMOR_INTEL_MIN = 0.0,
		ARMY_MAX_ARMOR_INTEL_MAX = 0.5,
		ARMY_MAX_ARMOR_RANGE_AT_LOWEST_INTEL = 1.0,
		
		ARMY_AVG_PIERCING_INTEL_MIN = 0.0,
		ARMY_AVG_PIERCING_INTEL_MAX = 0.5,
		ARMY_AVG_PIERCING_RANGE_AT_LOWEST_INTEL = 1.0,
		
		ARMY_MAX_PIERCING_INTEL_MIN = 0.0,
		ARMY_MAX_PIERCING_INTEL_MAX = 0.5,
		ARMY_MAX_PIERCING_RANGE_AT_LOWEST_INTEL = 1.0,
		--~
		
		NAVY_MAPICON_MISSION_COUNT_INTEL_MIN = 0.5,  -- min intel to show assigned naval missions
		NAVY_MAPICON_MISSION_COUNT_INTEL_MAX = 0.8,  -- min intel to show assigned naval missions with perfect accuracy, and taskforces count

		NAVY_MAPICON_SHOW_ALL_NAVAL_PORTS = 0.3,  -- min intel to show all naval ports (otherwise you will only see nearby ones)
		NAVY_MAPICON_NAVAL_PORT_VISIBILITY_DETAIL_THRESHOLDS = { -- how detailed the post tooltips will be
			0.0,	-- for no intel
			0.1,	-- show port level
			0.3,	-- show fuzzy taskforce count
			0.7,	-- show full taskforce count
			0.8,	-- show taskforce details
		},
		NAVY_MAPICON_NAVAL_PORT_TASKFORCE_FUZZY_THRESHOLD = 0.5,
		
		AIR_MAPICON_MISSION_COUNT_INTEL_MIN = {
			0.3, -- AIR_SUPERIORITY
			0.3, -- CAS		
			0.3, -- INTERCEPTION	
			0.3, -- STRATEGIC_BOMBER
			0.3, -- NAVAL_BOMBER	
			0.3, -- DROP_NUKE		
			0.3, -- PARADROP		
			0.3, -- NAVAL_KAMIKAZE	
			0.3, -- PORT_STRIKE		
			0.3, -- ATTACK_LOGISTICS
			0.3, -- AIR_SUPPLY		
			0.3, -- TRAINING
			0.3, -- NAVAL_MINES_PLANTING
			0.3, -- NAVAL_MINES_SWEEPING
			0.3, -- RECON
			0.3, -- NAVAL_PATROL
		},
		AIR_MAPICON_MISSION_COUNT_INTEL_MAX = {
			0.6, -- AIR_SUPERIORITY
			0.6, -- CAS		
			0.6, -- INTERCEPTION	
			0.6, -- STRATEGIC_BOMBER
			0.6, -- NAVAL_BOMBER	
			0.6, -- DROP_NUKE		
			0.6, -- PARADROP		
			0.6, -- NAVAL_KAMIKAZE	
			0.6, -- PORT_STRIKE		
			0.6, -- ATTACK_LOGISTICS
			0.6, -- AIR_SUPPLY		
			0.6, -- TRAINING
			0.6, -- NAVAL_MINES_PLANTING
			0.6, -- NAVAL_MINES_SWEEPING
			0.6, -- RECON
			0.6, -- NAVAL_PATROL
		},
		AIR_MAPICON_MISSION_COUNT_INTEL_RANGE_AT_LOWEST_INTEL = {
			0.5, -- AIR_SUPERIORITY
			0.5, -- CAS		
			0.5, -- INTERCEPTION	
			0.5, -- STRATEGIC_BOMBER
			0.5, -- NAVAL_BOMBER	
			0.5, -- DROP_NUKE		
			0.5, -- PARADROP		
			0.5, -- NAVAL_KAMIKAZE	
			0.5, -- PORT_STRIKE		
			0.5, -- ATTACK_LOGISTICS
			0.5, -- AIR_SUPPLY		
			0.5, -- TRAINING
			0.5, -- NAVAL_MINES_PLANTING
			0.5, -- NAVAL_MINES_SWEEPING
			0.5, -- RECON
			0.5, -- NAVAL_PATROL
		},
		
		AIR_MAPICON_SHOW_ALL_AIR_PORTS = 0.3,  -- min intel to show all air ports (otherwise you will only see nearby ones)
		AIR_MAPICON_AIR_PORT_VISIBILITY_DETAIL_THRESHOLDS = { -- how detailed the post tooltips will be
			0.0,	-- for no intel
			0.3,	-- show fuzzy air plane count
			0.7,	-- show full air count
			0.8,	-- show air plane details
		},
		AIR_MAPICON_AIR_PORT_PLANE_FUZZY_THRESHOLD = 0.5,
		AIR_MIN_INTEL_TO_SHOW_EQUIPMENT_DESIGN_DETAILS = 0.8,
		RAID_MIN_INTEL_FOR_WARNING_ON_LAUNCH = 0.1,           -- how much intel (of the relevant type) is needed to show a warning when raid is launched
		RAID_MIN_INTEL_FOR_WARNING_HALFWAY_TO_LAUNCH = 0.5,   -- how much intel (of the relevant type) is needed to show a warning halfway through preparation
															  --     (this limit is a dummy value only used for communicating the role of intel in the intel ledger )
															  --     (in reality, detection scales linearly with intel. 70% intel = detection at 30% preparation, 50% intel = detection at 50% preparation, etc.
		RAID_MIN_INTEL_FOR_WARNING_EARLY_PREPARATION = 0.8,   -- how much intel (of the relevant type) is needed to show a warning early in the preparation
															  --     (this limit is a dummy value only used for communicating the role of intel in the intel ledger )
															  --     (in reality, detection scales linearly with intel. 70% intel = detection at 30% preparation, 50% intel = detection at 50% preparation, etc.
		-- ~intel ledger defines
	},

	NCharacter = {
		OFFICER_CORP_ADVISOR_ENTRIES_IN_MENU = { "high_command", "theorist", "army_chief", "air_chief", "navy_chief" },
		OFFICER_CORP_HIGH_COMMAND_SLOTS_IN_MENU = 3, --For Alert manager to count the number of High Command Slots in the UI
		POLITICAL_ADVISOR_SLOTS_IN_MENU = 3, --For Alert manager to count the number of Political Advisor Slots in the UI

		DEFAULT_PP_COST_FOR_MILITARY_ADVISOR = 50,	-- When an advisor does not have cost assigned this is the default used
		DEFAULT_PP_COST_FOR_POLITICAL_ADVISOR = 150,
		DEFAULT_CP_COST_FOR_ADVISOR = 0,	-- For Starting Advisors
		DEFAULT_CP_COST_FOR_DYNAMIC_ADVISORS = 0,	-- For Advisors created during gameplay
		ADVISOR_PROMOTION_COST = 5,	-- Cost to promote someone to advisor

		COUNTRY_LEADER_BASE_EXPIRE_YEAR_LENGTH = 5, -- When creating a dynamic country leader if an expire date is not set it will have 5 years as a base expiration date
		COUNTRY_LEADER_BASE_RANDOM_MAX_YEAR_LENGTH = 15, -- Max random value added to COUNTRY_LEADER_BASE_EXPIRE_YEAR_LENGTH

		SPECIALIST_ADVISOR_MIN_RANK = 4,
		EXPERT_ADVISOR_MIN_RANK = 6,
		GENIUS_ADVISOR_MIN_RANK = 8,
	},

	NSupply = {
		MAX_RAILWAY_LEVEL = 5, -- update railway texture as well, each frame corresponds to a level

		--defines to calculate the capitals supply. This will be also used for max supply of other nodes depending on how well they are connected to capital. Using the formula:
		--CapitalSupply = CAPITAL_SUPPLY_BASE + (NumberOfCivilianFactories * CAPITAL_SUPPLY_CIVILIAN_FACTORIES) + (NumberOfMilitaryFactories * CAPITAL_SUPPLY_MILITARY_FACTORIES) + (NumberOfDockyards * CAPITAL_SUPPLY_DOCKYARDS)
		CAPITAL_SUPPLY_BASE = 5.0, -- base supply for capital
		CAPITAL_SUPPLY_CIVILIAN_FACTORIES = 0.3, -- supply from one civilian factory
		CAPITAL_SUPPLY_MILITARY_FACTORIES = 0.6, -- supply from one military factory
		CAPITAL_SUPPLY_DOCKYARDS = 0.4, --supply from one naval factory

		-- defines that are used for supply reach for capital
		-- supply flow will start from INITIAL_SUPPLY_FLOW and will be reduced by a penalty on each province it travels (which depends on how far we are from our origin, terrain etc)
		-- a supply reach >= 1.0 considered "perfect" and will be able to fully support units on that particular province (assuming you are not over capacity)
		CAPITAL_INITIAL_SUPPLY_FLOW = 5.0, -- starting supply from
		CAPITAL_STARTING_PENALTY_PER_PROVINCE = 0.5, -- starting penalty that will be added as supply moves away from its origin (modified by stuff like terrain)
		CAPITAL_ADDED_PENALTY_PER_PROVINCE = 1.2, -- added penalty as we move away from origin

		-- defines that are used for supply reach for built nodes
		NODE_INITIAL_SUPPLY_FLOW = 2.8,
		NODE_STARTING_PENALTY_PER_PROVINCE = 0.50,
		NODE_ADDED_PENALTY_PER_PROVINCE = 0.70,

		-- defines that are used for supply reach for dockyards
		NAVAL_BASE_INITIAL_SUPPLY_FLOW = 3.5,
		NAVAL_BASE_STARTING_PENALTY_PER_PROVINCE = 0.8,
		NAVAL_BASE_ADDED_PENALTY_PER_PROVINCE = 1.0,

		-- Node Flow (i.e. province caps) increase by this amount per railway level of the node's bottleneck
		NODE_FLOW_BONUS_PER_RAIL_LEVEL = 0.34,

		-- rivers will transfer in between nodes as if they were this level
		RIVER_RAILWAY_LEVEL = 1,

		-- defines that are used for supply reach for floating harbors
		FLOATING_HARBOR_INITIAL_SUPPLY_FLOW = 2.6,
		FLOATING_HARBOR_STARTING_PENALTY_PER_PROVINCE = 0.8,
		FLOATING_HARBOR_ADDED_PENALTY_PER_PROVINCE = 0.8,

		FLOATING_HARBOR_BASE_SUPPLY = 15.0, -- supply given by a floating harbor
		FLOATING_HARBOR_BASE_DURATION = 21, -- duration of a full hp floating harbor
		FLOATING_HARBOR_DURATION_RATIO_AT_MIN_HP = 0.0,  -- duration mult for a harbor that was reduced to 0 hp

		FLOATING_HARBOR_MIN_DECAY = 0.2, -- Always reduce Floating Harbor longevity by this many "hours" per hour
		FLOATING_HARBOR_DECAY_MAX_AIR_BONUS = -0.1, -- At 100% Friendly Air superiourity, change decay rate by this many "hours" per hour
		FLOATING_HARBOR_DECAY_MAX_AIR_PENALTY = 0.4, -- At 100% Enemy Air superiourity, change decay rate by this many "hours" per hour
		FLOATING_HARBOR_DECAY_MAX_NAVAL_BONUS = -0.2, -- At 100% Friendly naval superiourity, change decay rate by this many "hours" per hour
		FLOATING_HARBOR_DECAY_MAX_NAVAL_PENALTY = 0.5, -- At 100% Enemy Naval superiourity, change decay rate by this many "hours" per hour
		FLOATING_HARBOR_DECAY_NO_CONTROL_PENALTY = 1.0, -- If adjacent land province is not held, change decay rate by this many "hours" per hour

		SUPPLY_FLOW_DROP_REDUCTION_AT_MAX_INFRA = 0.30, -- max infrastructure level will reduce the supply flow drop off by this ratio
		SUPPLY_FLOW_PENALTY_CROSSING_RIVERS = 0.20, -- crossing rivers introduces additional penalty

		-- node flow terrain falloff is scaled by logistics curve based on distance(d) (scalar / (1+e^(-k(d-midpoint))))
		SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_K = 1.3, -- How steep the curve is
		SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIDPOINT = 2.3, -- sigmoid inflection point
		SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_SCALAR = 0.9, -- Max Penalty adjustment due to distance
		SUPPLY_FLOW_DIST_LOGISTICS_FALLOFF_MIN_PENALTY_SCALE = 0.25, -- Logistics curve never reduces penalty facor below this limit

		-- The range bonus added to a fully motorized hub. This supply is added on top of the XXX_INITIAL_SUPPLY_FLOW defined above.
		SUPPLY_HUB_FULL_MOTORIZATION_BONUS = 2.2,
		-- How many trucks does it cost to fully motorize a hub
		SUPPLY_HUB_FULL_MOTORIZATION_TRUCK_COST = 50.0,
		-- For each additional level of motorization on a hub (i.e. contry with set motoriazation) reduce max bonus for next level by this amount
		SUPPLY_HUB_MOTORIZATION_MARGINAL_EFFECT_DECAY = 1.6,


		-- used for calculating "flow" for railways.
		RAILWAY_BASE_FLOW = 10.0, 		-- how much base flow railway gives when a node connected to its capital/a naval node by a railway
		RAILWAY_FLOW_PER_LEVEL = 5.0, 	-- how much additional flow a railway level gives
		RAILWAY_FLOW_PENALTY_PER_DAMAGED = 5.0, -- penalty to flow per damaged railway
		RAILWAY_MIN_FLOW = 5.0, 		-- minimum railway flow can be reduced to

		-- used for calculating "flow" from a naval node to another naval node when it is connected via a convoy route
		-- NAVAL_BASE_MAX_SUPPLY_FLOW_FACTOR = 0.9, -- flow of the parent node is factored to this ratio (so at most it can transfer parent naval node flow * this define)
		NAVAL_BASE_FLOW = 15.0, -- max output/input of a naval node is limited by this base value + additional ratio for each level
		NAVAL_FLOW_PER_LEVEL = 5.0, -- max output/input of a naval node is limited by previous base value + this define per its level

		SUPPLY_NODE_MIN_SUPPLY_THRESHOLD = 1.0, -- if supply of a node is below this value it will be set to 0 -- Currently unused?

		INFRA_TO_SUPPLY = 0.3,							-- each level of infra gives this many supply
		VP_TO_SUPPLY_BASE = 0.2,							-- Bonus to supply from a VP, no matter the level
		VP_TO_SUPPLY_BONUS_CONVERSION = 0.05,			-- Bonus to supply local supplies from Victory Points, multiplied by this aspect and rounded to closest integer
		SUPPLY_FROM_DAMAGED_INFRA = 0.15,                -- damaged infrastructure counts as this in supply calcs
		SUPPLY_BASE_MULT = 0.2,							-- multiplier on supply base values
		SUPPLY_DISRUPTION_DAILY_RECOVERY = 1.5,		-- every day nodes recover this much of their accumulated disruption.

		RAILWAY_CONVERSION_COOLDOWN = 10, -- railways will be put on cooldown when they are captured by enemy and will not be usable during the cooldown
		RAILWAY_CONVERSION_COOLDOWN_CORE = 5,
		RAILWAY_CONVERSION_COOLDOWN_CIVILWAR = 0,

		DEFAULT_STARTING_TRUCK_RATIO = 1.5, -- countries get this ratio of starting truck in their buffers compared to their need
		DEFAULT_STARTING_TRAIN_RATIO = 1, -- countries get this ratio of starting trains in their buffers compared to their need

		SUPPLY_POINTS_PER_TRAIN = 1.0,  -- old default 1.25 -- Amount of supply that can fit in a train. (Trains distribute supply from capital to a supply node.)
		NUM_RAILWAYS_TRAIN_FACTOR = 0.03, -- the train usage is scaled by railway distance between the supply node and the capital multiplied by this factor

		BASE_SUPPLY_MULT_FOR_TRUCK_DEFAULT_BUFFER = 1.0,  -- initial value for wanted buffers over potential truck usage
		BASE_SUPPLY_MULT_FOR_TRUCK_MIN_BUFFER = 0.0, -- min and max values for buffer ratio
		BASE_SUPPLY_MULT_FOR_TRUCK_MAX_BUFFER = 100.0,

		TRUCK_ATTRITION = 0.003, -- base truck attrition
		TRUCK_ATTRITION_FACTOR = 0.65, --a scale on total truck attrition

		BASE_TRUCK_HP = 100.0,
		TRUCK_HP_PER_ARMOR = 2,

		BASE_TRAIN_HP = 100.0,
		TRAIN_ARMOR_TARGETING_WEIGHT = 0.01, -- For each health point gained by armor_value, enemy bombers are this much more likely to target
		TRAIN_ANTI_AIR_HIT_CHANCE = 0.07, -- Balancing value to determine the chance of train anti-air hitting an attacking airwing.
		TRAIN_ANTI_AIR_HIT_ROLL_COUNT = 12, -- The air_attack of all attacked trains are accumulated, and then we do this many random rolls each with the hit chance set above to determine the fraction of the accumulated air_attack that hits.
		TRAIN_ANTI_AIR_ATTACK_TO_AMOUNT = 0.001, -- Balancing value to convert the hitting air_attack to a percentage value of the attacking planes that are killed.

		MIN_TRAIN_SUPPLY_FACTOR = 0.5, -- Having 0 trains in stockpile only applies this penalty factor, scaling up to 1.0 when need is met
		MIN_TRAIN_REQUIREMENT = 2, -- If total train need <= this, then don't apply any supply penalty, even if stockpile is insufficient

		SUPPLY_FLOW_REDUCTION_THRESHOLD = 0.1, -- if supply flow is lower than this, it is not applied

		-- following values are used for calculating potential truck usage
		-- generally potential is ~= current usage but as units moves along the map
		-- they are assigned to different nodes which adds slightly higher usage due to minimum truck needed being 1
		BASE_AIR_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
		BASE_ARMY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,
		BASE_NAVY_SUPPLY_MULT_FOR_TRUCK_BUFFER = 1.0,

		CAPITAL_NODE_BASE_SUPPLY_ADD = 0,
		BUILT_NODE_BASE_SUPPLY_ADD = 0.6,
		LOCAL_NODE_BASE_SUPPLY_ADD = 0.5,
		NAVAL_NODE_BASE_SUPPLY_ADD = 0.3,
		-- ~end

		-- armies slowly gains and buffers supply above >100% up to their supply grace if they have efficent supply flow
		-- otherwuse they will lose up to 100% supply every day depending on how bad supply flow is
		ARMY_SUPPLY_RATIO_STARTING_GAIN = 0.0,
		ARMY_SUPPLY_RATIO_SPEED_GAIN_PER_HOUR = 0.01,
		ARMY_MAX_SUPPLY_RATIO_GAIN_PER_HOUR = 0.15,

		MIN_SURRENDER_LIMIT_TO_MOVE_SUPPLY_CAPITAL = 0.15, -- country needs to be above thos surrender ratio to be able to move its capital
		COOLDOWN_DAYS_AFTER_MOVING_SUPPLY_CAPITAL = 30, -- cooldown for moving supply again after last move
		DAYS_TO_START_GIVING_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL = 7,  -- the country will start gaining supply after this many days moving its capital
		DAYS_TO_START_GIVING_FULL_SUPPLY_AFTER_MOVING_SUPPLY_CAPITAL =  21, -- the country will reach max supply after this many days moving its capital

		MIN_DIFF_FOR_AUTO_UPDATING_EXISTING_RAILWAYS = 5, -- while building railways, the system will prefer updating existing railway if new railway is close enough to existing one

		-- reinforcements depends on distance to capital and following defines are used for calculating reinforcement time
		SUPPLY_PATH_MAX_DISTANCE = 15,	-- max time it can take
		RAILWAY_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.3, -- time factor for total railway distance
		TRUCK_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.01, -- time factor for total truck distance
		NAVAL_DISTANCE_FACTOR_FOR_REINFORCEMENT_SPEED = 0.08, -- time factor for total naval distance

		ALERT_VERY_LOW_SUPPLY_LEVEL = 0.2,			   -- At which point we show up the low and very low supply level alert. Value is in % of supplies supported vs required.
		ALERT_LOW_SUPPLY_LEVEL = 0.5,

		AI_FRONT_MINIMUM_UNITS_PER_PROVINCE_FOR_SUPPLY_CALCULATIONS = 1,    -- AI will try to keep this amount of divisions per province as a minimum when evaluating supply limitations for war fronts
		AI_FRONT_DIVISIONS_PER_SUPPLY_POINT = 1.0, -- How many divisions should the AI consider it can supply per available supply point
		AI_FRONT_MAX_UNITS_ENEMY_COUNT_FACTOR = 1.2, -- Make sure AI front MaxNrUnits is at least EnemyCount multiplied by this factor
		SUPPLY_THRESHOLD_FOR_ARMY_ATTRITION = 0.35, -- armies will only get attrition below this supply
		NUMBER_OF_SHOWN_SUPPLY_SOURCES_IN_SUPPLY_MAPMODE = 3, -- number of supply flow sources shown in breakdown tooltip
		ESTIMATED_DIVISION_WEIGHT_FOR_SUPPLY_ESTIMATIONS_GUI = 1.0,	--Division supply consumption used for estimating frontline weight for order tooltips
		AVAILABLE_MANPOWER_STATE_SUPPLY = 0.18,						--Factor for state supply from max manpower (population)
		NON_CORE_MANPOWER_STATE_SUPPLY = 0.2,						--Factor for population sttate supply when controlled by an occupier (NO TAKE FOOD)
		STORED_SUPPLY_CONSUMPTION_RATE_FACTOR = 0.75,				--Multiplies consumption rate of stored supply (more/less easement)
	},
	NAITheatre = {
		AI_THEATRE_GENERATION_HOME_THEATRE_DEPTH_RESTRICTION = 2,			-- The home theatre is generated based off a initial depth restriction
		AI_THEATRE_GENERATION_BORDER_SIZE_RESTRICTION = 7,					-- Theatres are generated based off borders, Higher value means larger theatres
		AI_THEATRE_GENERATION_DEPTH_TO_START_CONSIDERING_BORDERSTATES = 2,	-- Distance from capital in terms of states
		AI_THEATRE_GENERATION_MINIMUM_STATE_COUNT = 3,						-- Small Theatres - Minimum state count for a theatre
		AI_THEATRE_GENERATION_MAX_DISTANCE_TO_MERGE = 200,					-- Small Theatres - Dont merge with too far away theatres, higher value means less merging will occur
		AI_THEATRE_GENERATION_MAX_DISTANCE_TO_FILL = 350,					-- Final generation step - Max distance to fill states, higher values means less theatres

		AI_THEATRE_DISTRIBUTION_SAME_THEATRE_SCORE_MODIFIER = 0.25, 			-- Value that affects the score of units when distributing to fronts within the same theatre, its a percentage multiplier, the higher it is the higher the chance of units staying in close proximity
		AI_THEATRE_DISTRIBUTION_MAX_SCORE = 250000, 						-- Max Score that a unit can have when being distributed to ai fronts, higher value means more granularity in score changes, lower values means less variation in where units can go
		AI_THEATRE_DISTRIBUTION_PERCENTAGE_OF_MINIMUM_UNITS_TO_KEEP = 1.0,	-- How much should a frontline adheer to its minimum unit demand, when removing/reassigning units
		AI_THEATRE_DISTRIBUTION_MAX_PERCENT_UNMET_DEMAND_PER_FRONT = 0.5,   -- Percentage of how much fronts should request from other lower priority fronts, 0 means once a front gets hold of a unit it stays there forever until its demand is reduced, controlls shuffling of units.

		AI_THEATRE_STATE_UPDATE_MAX_STATE_COUNT_TO_EXPAND = 25,				-- Max theatre size

		AI_THEATRE_BREAKDOWN_MIN_STATE_COUNT = 3,							-- Theatres below this size will break and merge with others
		AI_THEATRE_BREAKDOWN_MAX_DISTANCE_TO_MERGE = 200,					-- Dont merge with too far away theatres, higher value means less merging will occur


		AI_THEATRE_SEARCH_SUPPLY_NODE_MAX_DEPTH = 5,						-- Max depth of breadth-first search while looking for supply nodes when out of supply
		AI_THEATRE_SUPPLY_CRISIS_LIMIT = 0.1,                               -- If a unit is standing in an area with this supply ratio it will try to escape
		AI_THEATRE_AI_FRONT_MIN_DESIRED_RATIO = 0.18,						-- Fronts are sorted based on priority, we nudge unit demand based on this sorting, the higher the value the more units the most important front gets
	},
	NIndustrialOrganisation = {
		ASSIGN_DESIGN_TEAM_PP_COST_PER_DAY = 0.05,					-- Cost in Political Power daily generation when one MIO is assigned to a research slot
		ASSIGN_INDUSTRIAL_MANUFACTURER_PP_COST_PER_DAY = 0.0,		-- Cost in Political Power daily generation when one MIO is assigned to a production line
		FUNDS_FOR_SIZE_UP = 1000,					-- Funds needed for a MIO to increment its size and get points to unlock traits
		FUNDS_FOR_SIZE_UP_LEVEL_FACTOR = 0.5, 			-- How much each level mutliplies the funds for size up 
		FUNDS_FOR_SIZE_UP_LEVEL_POW = 1.8, 							-- the power we applie to the mio size when calculating funds to level up. 
		UNLOCKED_TRAITS_PER_SIZE_UP = 1,			-- Number of points for unlocking traits obtained when the MIO increments its size
		DESIGN_TEAM_CHANGE_XP_COST = 3,				-- Flat cost added to the XP cost of a new equipment design
		FUNDS_FOR_RESEARCH_COMPLETION_PER_RESEARCH_COST = 1000,     -- Funds added to MIO when the Design Team has completed a research, multiplied by research_cost in technology template
		FUNDS_FOR_CREATING_EQUIPMENT_VARIANT = 0,		-- Funds added to MIO when a new variant is created with the Design Team assigned to it
		FUNDS_FROM_MANUFACTURER_PER_IC_PER_DAY = 0.1,		-- Funds added to MIO when a manufacturer is attached to a production line. Added every day proportional to IC produced.
		MAX_FUNDS_FROM_MANUFACTURER_PER_DAY = 100,		-- Max funds generated per manufacturer per day. Set to 0 for no Maximum.
		DESIGN_TEAM_RESEARCH_BONUS = 0.1,				-- Research bonus for applying a Design Team that matches the technology
		ENABLE_TASK_CAPACITY = false,					-- Enable limited task capacity for MIOs
		DEFAULT_INITIAL_TASK_CAPACITY = 0,				-- Default start task capacity for each MIO (may be overriden in DB)
		DEFAULT_INITIAL_POLICY_ATTACH_COST = 10,		-- Default start attach cost in PP for policies
		DEFAULT_INITIAL_ATTACH_POLICY_COOLDOWN = 2,		-- Default start cooldown in days after attaching a policy
		LEGACY_COST_FACTOR_SCALE = 1.0,					-- Multiplier to use when legacy Designer cost factors is applied to MIOs (<IdeaGroup>_cost_factor)
	},
    NProject = {
    	FACILITY_SUPPLY_WARNING_RED_RATIO = 0.66,		-- When lacking supply for a facility it will be a yellow icon shown until the supply is less than this value, where it will turn red.
	    DEFAULT_COMPLEXITY = 100,						-- Default special project prototype phase to only require one iteration.
	    DEFAULT_EMPTY_REWARD_WEIGHT = 1.0,				-- The weight for no reward being given after a prototype iteration.
	    DEFAULT_STOP_PROJECT_DAYS = 10,					-- The amount of days it takes for a cancelled project to be stopped.
	    DAYS_TO_REMOVE_SCIENTIST = 10,					-- Amount of days needed for a scientist to be unassigned.
	    DISMANTLE_FACILITY_DAYS = 100,                   -- Amount of days needed to dismantle a facility.
	    PROTOTYPE_PHASE_MAX_PROGRESS = 100,				-- the number of progress points needed to finish the prototype phase and complete the project
	    MINIMUM_PROJECT_SPEED_FACTOR_FROM_SUPPLY = 0.2,	-- Minimum special project research speed based on supply
	    NEEDED_SUPPLY_FOR_FULL_SPEED_PROJECT = 3.0,	-- Supply needed in province to get full research speed for special project
      MINIMUM_PROJECT_SPEED_FACTOR_FROM_RESOURCE_SHORTAGE = 0.2, -- Minimum special project research speed factor based on resource shortage^M
	    HIDE_UNAVAILABLE_PROJECTS = true,				-- Hide projects that are unavailable to start due to pre-req
	    ITERATION_REWARD_DEFAULT_WEIGHT = 1.0,			-- If no weight is specified, set it to 1.0
    	DEFAULT_PROJECT_COMPLETION_SCIENTIST_EXPERIENCE_GAIN = 192.0,	-- Default experience gain for assigned scientist when a project is completed
    	SCIENTIST_INJURED_FACTOR = 0.0,                 -- A factor to reduce the amount of progress gained in a program with attached injured scientist. E.g. 0.5 reduces the progress by 50%
    	RECRUIT_SCIENTIST_ONE_TRAIT_CHANCE = 0.35,		-- Chance to get one trait when creating a scientist. E.g. 0.35 = 35% chance to get a trait
    	SCIENTIST_BASIC_RESEARCH_DAILY_XP_GAIN = 0.28,	-- Daily experience gain for doing basic research
		RECRUIT_SCIENTIST_COST = {						-- Amount of pp to hire a scientist based on available scientist
			25,			-- pp cost if no available scientist
			50,			-- pp cost if 1 available scientist
			75,			-- pp cost if 2 available scientist
			100			-- pp cost if more than 2 available scientist
    	},
		SCIENTIST_SKILL_LEVEL_THRESHOLDS = {			-- Threshold for scientist to level up
	    	100,		-- to go from level 0 to level 1
	    	100,		-- to go from level 1 to level 2
		    300,		-- to go from level 2 to level 3
		    700,		-- ...
	    	1500,		-- Max level = Array size
	    },
	    SCIENTIST_SKILL_LEVEL_SPEED_MODIFIER = {		-- Bonus to apply to daily phase progress according to the skill level of the scientist
	        -1.0,    -- -1.0 means -100%         also name loc key is SCIENTIST_SKILL_LEVEL_NAME_0
		    -0.05,  -- -0.05 means -5%			also name loc key is SCIENTIST_SKILL_LEVEL_NAME_1
		    0.05,	-- 0 means no change		also name loc key is SCIENTIST_SKILL_LEVEL_NAME_2
		    0.1,   -- 0.15 means +15%			...
		    0.15,
		    0.25,	-- Size MUST be SCIENTIST_SKILL_LEVEL_THRESHOLDS's size + 1
	    },
	    PROJECT_LOSS_FACTOR_ON_CAPTURE = 0.2,              -- Factor of lost progress on project when facility is captured
	    PROJECT_CAPTURE_GAIN_RATIO = 0.2,                  -- Ratio of difference from captured facilities ongoing project to receive to the captors' progress
	    PROJECT_CAPTURE_BREAKTHROUGH_PROGRESS = 0.1,        -- Ratio of breakthrough progress on capture to the captor for the facilities specialization
	    PROJECT_CAPTURE_DIMINISHING_RETURN = 0.6,          -- Reduced amount of gain when capturing a facility with a project you already gained. Will apply the factor each time a capture occurs. 0.6 means a reduction of 60% on next project capture.
	    BASIC_RESEARCH_TECHNOLOGY_BONUS_FACTOR = 0.02,     -- Bonus research factor applied to technologies per scientist skill level when performing basic research in a matching facility.
	    BASIC_RESEARCH_TECHNOLOGY_BONUS_DIMINISHING_RETURN_FACTOR = 0.5, -- Diminishing return on BASIC_RESEARCH_TECHNOLOGY_BONUS_FACTOR for each extra scientist performing basic research for multiple facilities.
		BREAKTHROUGH_DAILY_TECHNOLOGY_GAIN = 10,           -- Amount in 1/100th percentage. E.g. 25 = 0.25%
	    BREAKTHROUGH_DAILY_SCIENTIST_SKILL_GAIN = 4,       -- Amount in 1/100th percentage gained per skill when doing basic research. E.g. 5 = 0.05% per skill level.
	    BREAKTHROUGH_DAILY_ROCKET_SITE_GAIN = 1,		   -- Amount in 1/100th percentage gained per rocket site level. E.g. 1 = 0.01% per rocket site level.
	    BREAKTHROUGH_DAILY_NUCLEAR_REACTOR_GAIN = 1,       -- Amount in 1/100th percentage gained per nuclear reactor. E.g. 2 = 0.02% per nuclear reactor.
	    BREAKTHROUGH_GAIN_ANIMATION_SPEED_MAX = 1.0,	   -- The animation for gaining breakthrough progress is a ratio of this value and current daily gain.
    },
    NRaids = {
	    BASE_DAYS_TO_PREPARE = 7,						   -- Base number of days required to complete raid preparation phase
	    MAX_STATE_TARGETS_TO_EVALUATE_PER_HOUR = 50,	   -- PERFORMANCE (HOURLY TICK) : higher number = faster state target re-evaulation + lower performance
	    RAID_TARGET_ITEM_POOL_SIZE = 512,				   -- PERFORMANCE (UI) : number of entries to reserve in the raid target item pool
	    RAID_TYPE_ICON_ITEM_POOL_SIZE = 512,			   -- PERFORMANCE (UI) : number of entries to reserve in the raid type icon item pool
        RAID_LOW_RISK_SETTING_DISASTER_MODIFIER = 0,       -- How much the disaster risk is modified when the dial is set to "low"
        RAID_MEDIUM_RISK_SETTING_DISASTER_MODIFIER = 0.1,  -- How much the disaster risk is modified when the dial is set to "medium"
        RAID_HIGH_RISK_SETTING_DISASTER_MODIFIER = 0.25,   -- How much the disaster risk is modified when the dial is set to "high"
	    RAID_SUCCESS_MODIFIER_THRESHOLD_BAD = -10.0,       -- If a success chance modifier is below this value, it will be displayed in red
		RAID_SUCCESS_MODIFIER_THRESHOLD_NEUTRAL = 0.0,     -- If a success chance modifier is below this value, it will be displayed in yellow
		MAX_DETECTED_TARGETS_PER_HOUR = 1,                 -- PERFORMANCE (HOURLY TICK) : max number of targets to be detected per hour, NOTE : keep this low because detection is checked against every country!
	    RAID_DEFAULT_TARGET_COOLDOWN_DAYS = 365,           -- The default cooldown (in days) for raiding the same target, can be overriden for specific raid types through script
	    RAID_UNIT_SPEED_MULTIPLIER = 0.1,                  -- Global speed control
	    BASE_NAVAL_COMMANDO_RAID_DISTANCE = 1500,         -- Max distance in kilometers

        RAID_LOW_RISK_SETTING_SUCCESS_MODIFIER = 0.0,       -- How much the success chance is modified when the dial is set to "low"
        RAID_MEDIUM_RISK_SETTING_SUCCESS_MODIFIER = 0.1,    -- How much the success chance is modified when the dial is set to "low"
        RAID_HIGH_RISK_SETTING_SUCCESS_MODIFIER = 0.25,     -- How much the success chance is modified when the dial is set to "low"

	    TARGET_DETECTION_INTEL_TRESHOLD = 20.0,             -- How much intel is needed for a target to be detected?
	    
	    TARGET_INTEL_PER_CIVILIAN_INTEL_OVER_COUNTRY = 0.5,		-- Intel level over target country is scaled by this value
	    TARGET_INTEL_PER_ARMY_INTEL_OVER_COUNTRY = 0.5,			-- Intel level over target country is scaled by this value
		TARGET_INTEL_PER_NAVY_INTEL_OVER_COUNTRY = 0.5,			-- Intel level over target country is scaled by this value
		TARGET_INTEL_PER_AIRFORCE_INTEL_OVER_COUNTRY = 0.5,		-- Intel level over target country is scaled by this value
			
		TARGET_INTEL_PER_NETWORK_STRENGTH = 0.5,				-- Intel network strength in target state is scaled by this value
	    TARGET_INTEL_FROM_CONTROLLED_NEIGHBOUR_STATES = 15.0,	-- Flat bonus for having control over at least one neighbour state
	    TARGET_INTEL_PER_AIR_SUPERIORITY = 0.5,					-- Air superiority over target region is scaled by this value
	    TARGET_INTEL_FROM_DECRYPTION = 25.0,					-- Flat bonus for having fully decrypted their ciphers
	    TARGET_INTEL_PENALTY_PER_ENEMY_COUNTER_INTEL = 5.0,		-- Enemy counter intel is scaled by this value

		RAID_OUTCOME_REPORT_DAYS_TO_LIVE = 30,                  -- How many days after a raid has ended will the raid outcome report be visible on the map before being automatically dismissed
		
	    NUCLEAR_BOMB_PRODUCTION_SCALE = 2555.0,					-- +1 nuclear_production gives 1 nuke per 7 years
	    THERMONUCLEAR_BOMB_PRODUCTION_SCALE = 2555.0,			-- +1 nuclear_production gives 1 nuke per 7 years

	    NUCLEAR_BOMB_MIN_DAMAGE_PERCENT = 0.1,					-- Minimum damage from nukes as a percentage of current strength/organisation
	    NUCLEAR_BOMB_MAX_DAMAGE_PERCENT = 0.9,					-- Minimum damage from nukes as a percentage of current strength/organisation
	    THERMONUCLEAR_BOMB_MIN_DAMAGE_PERCENT = 0.6,			-- Minimum damage from nukes as a percentage of current strength/organisation
	    THERMONUCLEAR_BOMB_MAX_DAMAGE_PERCENT = 0.9,			-- Minimum damage from nukes as a percentage of current strength/organisation

	    ARMY_TRANSFER_MOVE_SAFELY = true,						-- Whether to move safely when transferring divisions to the raid source
	    ARMY_TRANSFER_AVOID_ENEMY = true,						-- Whether to avoid enemy when transferring divisions to the raid source

	    MAX_TARGETS_TO_UPDATE_PER_FRAME = 100,					-- PERFORMANCE (FRAME) : max raid targets to evaluate per frame (affects raid map icon refresh rate)
    },
}
