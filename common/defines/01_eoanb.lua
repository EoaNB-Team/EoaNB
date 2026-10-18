-- NGame
NDefines.NGame.START_DATE = "1857.5.10.24"
NDefines.NGame.END_DATE = "1930.1.1.1"
NDefines.NGame.HANDS_OFF_START_TAG = "UTC"
NDefines.NGame.TRADE_ROUTE_RECALCULATE_FREQUENCY_DAYS = 99
NDefines.NGame.EVENT_PROCESS_OFFSET = 28 -- Default 20, Made event checking roughly Monthly.
NDefines.NGame.COMBAT_LOG_MAX_MONTHS = 6 -- Default 12.

-- NNavy
NDefines.NNavy.CONVOY_LOSS_HISTORY_TIMEOUT_MONTHS = 12 -- Default 24.
NDefines.NNavy.NAVAL_COMBAT_RESULT_TIMEOUT_YEARS = 0.5 -- Default 2 years. (0.5 years = 6 months)
NDefines.NNavy.NAVAL_ACCIDENTS_DAYS_TO_LIVE = 30 -- Default 120. Reduce naval accident log memory bloat.

-- NDiplomacy
NDefines.NDiplomacy.MAX_TRUST_VALUE = 80
NDefines.NDiplomacy.MIN_TRUST_VALUE = -80
NDefines.NDiplomacy.MAX_OPINION_VALUE = 200
NDefines.NDiplomacy.MIN_OPINION_VALUE = -200
NDefines.NDiplomacy.BASE_TRUCE_PERIOD = 30
NDefines.NDiplomacy.TRUCE_PERIOD_AFTER_KICKING_FROM_FACTION = 30
NDefines.NDiplomacy.PEACE_INCREASE_COST_FACTOR_PER_MISSING_PERCENT_FOR_CAPITULATION = 0.01
NDefines.NDiplomacy.OPINION_FOR_DEMO_FROM_WT_GENERATION = 0
NDefines.NDiplomacy.DIPLOMACY_HOURS_BETWEEN_REQUESTS = 96 -- Default 24. AI diplomacy and trade evaluation restricted to every 4 days. AI sends diplomacy requests less frequently.

-- NCountry
NDefines.NCountry.POPULATION_YEARLY_GROWTH_BASE = 0.0082
NDefines.NCountry.BASE_STABILITY_WAR_FACTOR = -0.3
NDefines.NCountry.WAR_SUPPORT_OFFNSIVE_WAR = -0.1
NDefines.NCountry.WAR_SUPPORT_TENSION_IMPACT = 0.3
NDefines.NCountry.RESOURCE_IMPORTANCE_FACTOR = 0.1
NDefines.NCountry.INTERPOLATED_FRONT_STEPS_SHORT = 1
NDefines.NCountry.CIVIL_WAR_INVOLVEMENT_MIN_TENSION = 0.0
NDefines.NCountry.MIN_SURRENDER_LIMIT = 0.1
NDefines.NCountry.BASE_MOBILIZATION_SPEED = 0.005
NDefines.NCountry.HEROES_BEING_KILLED_WAR_SUPPORT_PENALTY_SCALE = -0.05
NDefines.NCountry.MAX_HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY = -0.04
NDefines.NCountry.HEROES_BEING_KILLED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.0001
NDefines.NCountry.MAX_CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY = 0.025
NDefines.NCountry.CONVOYS_BEING_RAIDED_WEEKLY_WAR_SUPPORT_PENALTY_DECAY = 0.003
NDefines.NCountry.AIR_SUPPLY_CONVERSION_SCALE = 0.05
NDefines.NCountry.ATTACHE_XP_SHARE = 0.2
NDefines.NCountry.STARTING_FUEL_RATIO = 0.0
NDefines.NCountry.BASE_FUEL_GAIN_PER_OIL = 0.25
NDefines.NCountry.BASE_FUEL_GAIN = 1.0
NDefines.NCountry.BASE_FUEL_CAPACITY = 500
NDefines.NCountry.GIE_EXILE_TROOPS_DEPLOY_TRAINING_MAX_LEVEL = 3
NDefines.NCountry.GIE_EXILE_ARMY_LEADER_START_LEVEL = 3
NDefines.NCountry.SURRENDER_LIMIT_REDUCTION_PER_COLLABORATION = 0.3
NDefines.NCountry.COMPLIANCE_FACTOR_ON_STATE_CONTROLLER_CHANGE = -0.1
NDefines.NCountry.FEMALE_UNIT_LEADER_BASE_CHANCE = {
    -- applies as a factor to female unit leader randomization
    -- the values needs to be zero if you don't actually have random portraits
    0.0, -- country leaders
    0.0, -- army leaders
    0.0, -- navy leaders
    0.0, -- air leaders
}

-- NResistance
Defines.NResistance.GARRISON_LOG_MAX_MONTHS = 6 -- Default 12.
NDefines.NResistance.COMPLIANCE_GROWTH_BASE = 0.07
NDefines.NResistance.COMPLIANCE_DECAY_AT_MAX_COMPLIANCE = -0.1
NDefines.NResistance.GARRISON_MANPOWER_LOST_BY_ATTACK = 0.03

NDefines.NProduction.MAX_EQUIPMENT_RESOURCES_NEED = 6
NDefines.NProduction.MIN_POSSIBLE_TRAINING_MANPOWER = 5000
NDefines.NProduction.CONVERSION_SPEED_BONUS = 2.0
NDefines.NProduction.BASE_LAND_EQUIPMENT_CONVERSION_IC_COST_FACTOR = 0.2
NDefines.NProduction.BASE_TECH_COST = 1000
NDefines.NProduction.MIN_RESEARCH_SPEED = 0.0

NDefines.NPolitics.ARMY_LEADER_MAX_COST = 100
NDefines.NPolitics.NAVY_LEADER_MAX_COST = 100

NDefines.NBuildings.NAVALBASE_REPAIR_MULT = 0.025
NDefines.NBuildings.BASE_FACTORY_REPAIR = 0.3
NDefines.NBuildings.MAX_SHARED_SLOTS = 80
NDefines.NBuildings.OWNER_CHANGE_EXTRA_SHARED_SLOTS_FACTOR = 0.5
NDefines.NBuildings.INFRASTRUCTURE_RESOURCE_BONUS = 0.025

NDefines.NMilitary.DIVISIONAL_COMMANDER_TRAIT_XP_REQUIREMENT = 600.0
NDefines.NMilitary.HOURLY_ORG_MOVEMENT_IMPACT = -0.1
NDefines.NMilitary.SHORE_BOMBARDMENT_COLLATERAL_DAMAGE_CRIT_CHANCE_FACTOR = 0.25
NDefines.NMilitary.WAR_SCORE_AIR_IC_LOSS_FACTOR = 0.1
NDefines.NMilitary.WAR_SCORE_LAND_IC_LOSS_FACTOR = 0.1
NDefines.NMilitary.WAR_SCORE_PROVINCE_FACTOR = 0.3
NDefines.NMilitary.WAR_SCORE_LEND_LEASE_GIVEN_IC_FACTOR = 0.1
NDefines.NMilitary.WAR_SCORE_LEND_LEASE_GIVEN_FUEL_FACTOR = 0.01
NDefines.NMilitary.WAR_SCORE_LEND_LEASE_RECEIVED_IC_FACTOR = 0.1
NDefines.NMilitary.WAR_SCORE_LEND_LEASE_RECEIVED_FUEL_FACTOR = 0.01
NDefines.NMilitary.LAND_COMBAT_STR_DAMAGE_MODIFIER = 0.03
NDefines.NMilitary.LAND_COMBAT_ORG_DAMAGE_MODIFIER = 0.04
NDefines.NMilitary.LAND_AIR_COMBAT_STR_DAMAGE_MODIFIER = 0.04
NDefines.NMilitary.LAND_AIR_COMBAT_ORG_DAMAGE_MODIFIER = 0.04
NDefines.NMilitary.ATTRITION_WHILE_MOVING_FACTOR = 1.1
NDefines.NMilitary.RELIABILTY_RECOVERY = 0.1
NDefines.NMilitary.TACTIC_SWAP_FREQUENCEY = 24
NDefines.NMilitary.UNIT_EXPERIENCE_PER_TRAINING_DAY = 0.0010
NDefines.NMilitary.TRAINING_MAX_LEVEL = 10
NDefines.NMilitary.DEPLOY_TRAINING_MAX_LEVEL = 5
NDefines.NMilitary.ARMY_EXP_BASE_LEVEL = 5
NDefines.NMilitary.UNIT_EXP_LEVELS = { 0.02, 0.04, 0.06, 0.08, 0.1, 0.15, 0.2, 0.25, 0.3, 0.425, 0.55, 0.675, 0.75, 0.775, 0.8, 0.825, 0.85, 0.9, 0.95, 0.99 }
NDefines.NMilitary.FIELD_EXPERIENCE_SCALE = 0.002
NDefines.NMilitary.FIELD_EXPERIENCE_MAX_PER_DAY = 3
NDefines.NMilitary.EXPEDITIONARY_FIELD_EXPERIENCE_SCALE = 0.5
NDefines.NMilitary.LEND_LEASE_FIELD_EXPERIENCE_SCALE = 0.005
NDefines.NMilitary.EXPERIENCE_COMBAT_FACTOR = 0.05
NDefines.NMilitary.SUPPLY_ORG_MAX_CAP = 0.30
NDefines.NMilitary.OUT_OF_SUPPLY_MORALE = -0.3
NDefines.NMilitary.TRAINING_MAX_DAILY_COUNTRY_EXP = 0.06
NDefines.NMilitary.AIR_SUPPORT_BASE = 0.3
NDefines.NMilitary.BORDER_WAR_ATTRITION_FACTOR = 0.01
NDefines.NMilitary.REINFORCE_CHANCE = 0.03
NDefines.NMilitary.LOW_ORG_FOR_ATTACK = 0.5
NDefines.NMilitary.PLAYER_ORDER_PLANNING_DECAY = 0.08
NDefines.NMilitary.PLANNING_MAX = 0.2
NDefines.NMilitary.PLAN_SPREAD_ATTACK_WEIGHT = 13.0
NDefines.NMilitary.PLAN_AREA_DEFENSE_ENEMY_CONTROLLER_SCORE = 15.0
NDefines.NMilitary.PLAN_PROVINCE_PRIO_DISTRIBUTION_MIN = 0.8
NDefines.NMilitary.PLAN_PROVINCE_PRIO_DISTRIBUTION_DPP_HIGH = 4.0
NDefines.NMilitary.COMBAT_SUPPLY_LACK_ATTACKER_ATTACK = -0.20
NDefines.NMilitary.COMBAT_SUPPLY_LACK_ATTACKER_DEFEND = -0.70
NDefines.NMilitary.COMBAT_SUPPLY_LACK_DEFENDER_ATTACK = -0.50
NDefines.NMilitary.COMBAT_STACKING_START = 8
NDefines.NMilitary.COMBAT_STACKING_EXTRA = 4
NDefines.NMilitary.COMBAT_OVER_WIDTH_PENALTY = -2
NDefines.NMilitary.STRATEGIC_SPEED_RAIL_BASE = 15.0
NDefines.NMilitary.ARMOR_VS_AVERAGE = 0.3
NDefines.NMilitary.SLOWER_ORG_REGAIN_LEVEL = 0.75
NDefines.NMilitary.DISBAND_MANPOWER_LOSS = 0.7
NDefines.NMilitary.MIN_DIVISION_DEPLOYMENT_TRAINING = 0.05
NDefines.NMilitary.HOURS_REQ_REJOIN_BORDER_WAR_FOR_INJURED_UNITS = 336
NDefines.NMilitary.UNIT_LEADER_MODIFIER_COOLDOWN_REFERENCE_MANPOWER = 9600
NDefines.NMilitary.UNIT_LEADER_MODIFIER_COOLDOWN_MANPOWER_EXPONENT = 1.5
NDefines.NMilitary.BORDER_WAR_WIN_DAYS_AGAINST_EMPTY_OPPONENTS = 15
NDefines.NMilitary.ARMY_FUEL_COST_MULT = 0.3
NDefines.NMilitary.ARMY_COMBAT_FUEL_MULT = 2.0
NDefines.NMilitary.GENERATE_AI_DIV_COMMAND_HISTORY_ENTRIES = false -- Default true. Stop recording AI division paths.
NDefines.NMilitary.DIVISIONAL_COMMANDER_RANK_XP_THRESHOLD = {
    0,
    100.0,
    300.0,
    600.0,
    1000.0,
}



NDefines.NFactions.FACTION_INTELLIGENCE_ALLOWED_ADVISOR_TRAIT = {

}

-- AI OPTIMIZATIONS --
NDefines.NAI.DAYS_BETWEEN_CHECK_BEST_TEMPLATE = 30 -- Default 7. AI calculates template designs less frequently.
NDefines.NAI.REMOVE_OBSOLETE_TEMPLATE_DAYS = 90 -- Default 180. AI cleans up empty unused templates faster to save RAM.
NDefines.NAI.DAYS_BETWEEN_CHECK_BEST_DOCTRINE = 90 -- Default 30. AI checks for doctrine upgrades less frequently.
NDefines.NAI.RESEARCH_DAYS_BETWEEN_WEIGHT_UPDATE = 20 -- Default 7.
NDefines.NAI.DAYS_BETWEEN_CHECK_BEST_EQUIPMENT = 30 -- Default 7.
NDefines.NAI.MAX_STATE_TARGETS_TO_EVALUATE_PER_HOUR = 20 -- Default 50.
NDefines.NAI.AI_OBJECTIVE_DEFAULT_TARGET_RECALC_DAYS = 14 -- Default 5. Naval/Air targeting pathfinding restricted to 1 week.
NDefines.NAI.STRIKE_FORCE_TARGET_RECALC_DAYS = 14 -- Default 5. Naval strike force pathfinding restricted.

NDefines_Graphics.NGraphics.POLITICAL_GRID_SMALL_BOX_LIMIT = 50
NDefines_Graphics.NMapMode.MAP_MODE_MANPOWER_RANGE_MAX = 1000000
NDefines_Graphics.NGraphics.COMMANDGROUP_PRESET_COLORS_HSV = { -- thanks Better Preset Colors
    00.0/360.0, 0.95, 0.86,
    39.0/360.0, 0.95, 0.86,
    55.0/360.0, 0.95, 0.86,
    80.0/360.0, 0.95, 0.86,
    117.0/360.0, 0.95, 0.80,
    177.0/360.0, 0.95, 0.86,
    201.0/360.0, 0.95, 0.80,
    279.0/360.0, 0.95, 0.92,
    318.0/360.0, 0.95, 0.86,
    00.0/360.0, 0.00, 0.86
}

-- GRAPHICS OPTIMIZATIONS --
NDefines.NGraphics.MAX_TRAIN_WAGON_COUNT = 2 -- Default 6. Less wagons per train.
NDefines.NGraphics.MAPICON_GROUP_PASSES = 5 -- Default 20. Faster UI icon grouping.
NDefines.NGraphics.TRADE_ROUTE_MAX_LINES = 2 -- Default 6. Less dashed lines in oceans.
NDefines.NGraphics.GRADIENT_BORDERS_REFRESH_FREQ = 1 -- Default 0.12. Borders repaint less often to reduce stutter.

for k,v in pairs( NDefines_Graphics ) do NDefines[k] = v end
