# Global flag registry (`v54_`)

Global state shared by all content. Always set and clear flags through the `v54_set_*` scripted effects in `common/scripted_effects/v54_scripted_effects.txt` so that mutually exclusive outcomes stay consistent. Test them through the triggers in `common/scripted_triggers/v54_scripted_triggers.txt`.

Status: **DEFINED** = flag is set/cleared by a scripted effect today; nothing in the game fires these effects yet except `v54_initialise` (Phase B wires them to wars and events).

| Flag | Set by | Meaning |
|---|---|---|
| `v54_scenario_1854` | `v54_initialise` (on_startup) | 1854 scenario is active |
| `v54_crimean_crisis_pending` | `v54_initialise` | Eastern crisis exists but the Western powers are not at war yet |
| `v54_crimean_war_active` | `v54_set_crimean_war_started` | Crimean War is being fought |
| `v54_crimean_war_ended` | `v54_set_crimean_war_ended` | Crimean War is over |
| `v54_treaty_of_paris` | `v54_set_crimean_war_ended` | Paris settlement completed |
| `v54_italian_crisis_escalating` | (Phase B) | Plombieres / 1859 crisis is escalating |
| `v54_franco_austrian_war_active` / `_ended` | `v54_set_italian_war_started`, `v54_set_italian_war_*_victory` | War of 1859 |
| `v54_austria_won_italy` / `v54_austria_lost_italy` | `v54_set_italian_war_austrian_victory` / `_franco_sardinian_victory` | 1859 outcome (mutually exclusive) |
| `v54_schleswig_crisis_active` | (Phase B) | Schleswig-Holstein crisis |
| `v54_danish_war_active` / `_ended` | `v54_set_danish_war_started` / `_ended` | Second Schleswig War |
| `v54_gastein_completed` | `v54_set_gastein_completed` | Gastein-style settlement; also sets `v54_german_crisis_active` |
| `v54_german_crisis_active` | `v54_set_gastein_completed` | Austro-Prussian tension phase |
| `v54_austro_prussian_war_active` / `_ended` | (Phase B) / `v54_set_1866_*` | War of 1866 |
| `v54_prussia_won_1866` / `v54_austria_won_1866` | `v54_set_1866_prussian_victory` / `_austrian_victory` | 1866 outcome (mutually exclusive) |
| `v54_german_confederation_dissolved` | `v54_set_1866_prussian_victory` | Historical outcome only |
| `v54_north_german_confederation_formed` | `v54_set_north_german_confederation_formed` | Cleared by an Austrian 1866 victory |
| `v54_luxembourg_crisis_occurred` | (Phase B) | |
| `v54_spanish_succession_active` | (Phase B) | Cleared when the war starts |
| `v54_ems_crisis_occurred` | (Phase B) | |
| `v54_franco_prussian_war_active` / `_ended` | `v54_set_franco_prussian_war_started`, `v54_set_1870_*` | War of 1870 |
| `v54_germany_won_1870` / `v54_france_won_1870` | `v54_set_1870_german_victory` / `_french_victory` | 1870 outcome (mutually exclusive) |
| `v54_second_empire_collapsed` | `v54_set_1870_german_victory` | Cleared by a French victory |
| `v54_third_republic_established` | `v54_set_third_republic_established` | |
| `v54_german_empire_proclaimed` | `v54_set_german_empire_proclaimed` | |
| `v54_ausgleich_completed` / `v54_austria_hungary_established` | `v54_set_ausgleich_completed` | |

## Mapping to existing EoaNB flags (to be wired in Phase B)

EoaNB already runs its own chains. Do not duplicate them; derive `v54_` state from them (or set both).

| EoaNB flag (scope) | Equivalent `v54_` state |
|---|---|
| `eoanb_flag_second_schleswig_war` / `_end` / `eoanb_flag_won_2_schleswig_war` | `v54_danish_war_active` / `_ended` |
| `eoanb_flag_seven_weeks_war_ongoing` | `v54_austro_prussian_war_active` |
| `eoanb_flag_won_7_weeks_war` (set on PRS) | `v54_prussia_won_1866` |
| `AUS_flag_won_sww` (set on AUS) | `v54_austria_won_1866` |
| `eoanb_flag_won_luxembourg_crisis` | `v54_luxembourg_crisis_occurred` |
| `eoanb_flag_franco_prussian_war_ongoing` | `v54_franco_prussian_war_active` |
| `eoanb_flag_won_fra_prs_war` | `v54_germany_won_1870` |
| `eoanb_flag_fra_won_fra_prs_war` | `v54_france_won_1870` |
| `south_germans_participate_in_fpw_flag` | informs `v54_southern_german_states_aligned` |

(Scopes of the EoaNB flags were not verified; check before wiring.)

## Crimean War flags and country flags (Phase B)

| Flag | Scope | Set by | Meaning |
|---|---|---|---|
| `v54_crimean_outcome_allied_victory` | global | `v54_crimean_peace_allied_victory` | Russia was defeated (historical Peace of Paris) |
| `v54_crimean_outcome_russian_victory` | global | `v54_crimean_peace_russian_victory` | Ottoman Empire was defeated |
| `v54_crimean_outcome_negotiated` | global | `v54_crimean_peace_negotiated` | Status quo settlement after the mission timed out |
| `v54_italian_question_raised` | global | event `v54_eur.21` option a | Piedmont raised Italy at the Paris Congress |
| `v54_crimea_decided` | country (ENG, FRA) | events `v54_eur.2`, `.3`, `.4` | The country has taken its decision |
| `v54_crimea_mediation` | country (ENG, FRA) | events `v54_eur.2`, `.3` | The country attempted mediation first |
| `v54_crimea_participant` | country | `v54_crimean_join_war` | The country fought on the Ottoman side |
| `v54_aus_crimea_decided` / `_armed_neutrality` / `_pro_russia` / `_joined_west` / `_mediation` | country (AUS) | event `v54_eur.10` | Austrian attitude; `_armed_neutrality` is the historical one |
| `v54_pru_crimea_decided` / `_neutral` / `_pro_russia` / `_pro_west` | country (PRS) | event `v54_eur.15` | Prussian attitude; `_neutral` is the historical one |
| `v54_crimean_crisis_pending` | global | `v54_initialise` | Cleared when the war starts |

## Reaction flags (Phase B; consumed by Phases C-F)

All are **country flags** set by the events in `events/v54_shared_europe_events.txt`. They record a decision and are meant to gate or weight later content; nothing reads them yet except the AI-chance hooks noted in `ALT_HISTORY_DESIGN.md`.

| Flag | Country | Event | Meaning |
|---|---|---|---|
| `v54_fra_authoritarian_reaction` / `v54_fra_liberal_opening` | FRA | 100, 104 | Domestic course chosen after the 1859 outcome |
| `v54_aus_italy_repression` / `v54_aus_italy_reform` | AUS | 101 | Austrian victory in Italy: how to rule the provinces |
| `v54_pie_rebuild` / `v54_pie_nationalist_agitation` | PIE | 102 | After an Austrian victory |
| `v54_aus_reform_pressure_accepted` / `v54_aus_neoabsolutism_persists` | AUS | 103 | After the defeat of 1859 (`reform_pressure_accepted` is historical) |
| `v54_gbr_london_conference` / `_pressure_german_powers` / `_schleswig_neutral` | ENG | 200 | Britain in the Danish war (`london_conference` is historical) |
| `v54_fra_german_policy_contain` / `_accommodate` / `_support_austria` / `_balance` / `_decisive_war` | FRA | 300, 311 | French answer to the 1866 outcome (`_balance` is historical) |
| `v54_pru_after_defeat_reform` / `_revanche` / `_abandon_hegemony` / `_reconcile` | PRS | 310 | After an Austrian victory in 1866 |
| `v54_gbr_german_war_neutral` / `_mediation` | ENG | 320 | Britain in the 1866 war |
| `v54_pru_after_1870_revanche` / `_consolidate` / `_liberal_germany` | PRS | 600 | After a French victory in 1870 |
| `v54_fra_imperial_triumph_dynasty` / `_liberal` / `_containment` | FRA | 601 | After a French victory in 1870 |
| `v54_gbr_belgium_guarantee` / `v54_gbr_franco_prussian_mediation` / `_pressure` | ENG | 620 | Britain in the 1870 war |

## Austria (Phase C)

Country flags on **AUS** unless stated. Variables are on AUS.

| Flag / variable | Set by | Meaning |
|---|---|---|
| `v54_aus_concordat_decided`, `v54_aus_no_concordat` | event `v54_aus.40` | Concordat of 1855 decided / refused |
| `v54_aus_ausgleich_path` | `v54_aus.1` a | Historical Ausgleich (upstream chain started) |
| `v54_aus_centralist_reaction` | `v54_aus.1` b | Hungarian demands rejected |
| `v54_aus_federal_reform`, `v54_aus_fed_step1`..`step3`, `v54_aus_federal_done`; variable `v54_aus_federal_progress` | `v54_aus.1` c and the decisions `v54_aus_fed_1..4` | Federal reform of the Empire |
| global `v54_aus_federal_empire_established` | `v54_aus.3` | Federal constitution proclaimed |
| `v54_aus_1866_choice_made`, `v54_aus_1866_moderate`, `v54_aus_1866_german_federal_reform`, `v54_aus_1866_hegemony`, `v54_aus_1866_harsh_terms` | `v54_aus.20` | Settlement philosophy after an Austrian victory (read by `sevenweekswar.73`) |
| variable `v54_gc_reform_progress`, flags `v54_aus_gc_step1/2` | decisions `v54_aus_gc_1..3` | Federal reform of the Confederation |
| global `v54_german_federal_reform_done` | `v54_aus.22` | Federal Act adopted |
| variable `v54_aus_bound_count`, flags `v54_aus_bound_BAV/WUR/SAX/HAN/BAD/HSD/HES`, `v54_aus_hegemony_done` | decisions `v54_aus_bind_*` | German states bound to Vienna (as `autonomy_confederation_member` puppets) |
| global `v54_aus_german_hegemony_established` | `v54_aus.21` | Three or more states bound |
| `v54_aus_danubian_decided`, `v54_aus_danubian_strategy`, `v54_aus_german_revanche` | `v54_aus.30` | Eastern turn after the Ausgleich |

## Opening 1854-1857 (Phase C-bis)

The complete, machine-generated list of every `v54_` country flag, global flag and variable (with the files that set and read it) is `docs/generated_flag_index.csv`; rebuild it with `pwsh tools/index_flags.ps1` (the tool also lists flags that are read but never set; at the moment only `v54_ems_crisis_occurred`, which is the documented FUTURE bridge flag). The tables above cover the Crimean and reaction chains; the opening branches add the flags below.

| Flag / variable | Scope | Set by | Meaning |
|---|---|---|---|
| `v54_gbr_stance_war` / `_mediation` / `_neutral` / `_russia` | ENG | events `v54_eur.2` and `.4` | British attitude to the Eastern crisis; they unlock the matching stance focus (`ENG_v54_for_the_sultan` etc.). The French (`v54_fra_stance_*`) flags work the same way |
| `v54_gbr_pm_palmerston` / `_russell` / `_aberdeen` | ENG | `v54_gbr.57` | Who governs after the Roebuck motion; `_palmerston` is historical and unlocks `ENG_v54_the_palmerston_ministry` |
| `v54_gbr_aims_sevastopol` / `_limited` / `_maximal` | ENG | `v54_gbr.51` | British war aims |
| `v54_gbr_crimea_army_full` / `_small`, `v54_gbr_inquiry`, `v54_gbr_cover_up` | ENG | `v54_gbr.54`, `.56` | Expedition size, answer to the winter of 1854-55 |
| variable `v54_india_unrest` (0-100, starts at 20) | ENG | `v54_initialise`; events `v54_gbr.70-77`, `.82`; focuses; decisions | Unrest in the Bengal army. Historical choices add up to 58 (20 + 6 + 10 + 5 + 12 + 5), so the mutiny of 10 May 1857 becomes a rebellion; a couple of conciliatory choices bring it under 50 |
| `v54_gbr_lapse_applied` / `_adoptions_recognised`, `v54_gbr_oudh_annexed` / `_oudh_residency`, `v54_gbr_gse_act` / `_gse_exempt`, `v54_gbr_cartridge_*`, `v54_gbr_rumours_*`, `v54_gbr_pandey_*` | ENG | `v54_gbr.70-77` | Record of the choices in the India chain |
| global `v54_oudh_annexed` | global | `v54_gbr.71` | Oudh was annexed in 1856; its state 756 joins the rebellion |
| global `v54_sepoy_rebellion_started` | global | `v54_start_sepoy_rebellion` | The Bengal army has risen (unlocks `ENG_focus_sepoy_rebellion`) |
| global `v54_mutiny_contained` | global | `v54_gbr.80` | Unrest was below 50; the upstream rebellion never starts |
| `v54_gbr_prussian_marriage` / `_marriage_deferred`; `v54_pru_english_marriage` | ENG / PRS | `v54_gbr.65`, `v54_pru.85` | Engagement of the Princess Royal and Prince Friedrich Wilhelm of Prussia |
| `v54_gbr_reform_withdrawn` / `_reform_1854_passed`, `v54_gbr_income_tax_doubled` / `_war_borrowing`, `v54_gbr_civil_service_reformed` / `_patronage_kept`, `v54_gbr_sanitary_reform` / `_snow_dismissed`, `v54_gbr_victoria_cross` / `_old_orders`, `v54_gbr_bessemer` / `_puddling_lobby` | ENG | `v54_gbr.60-67` | Home-front choices |
| `v54_fra_*`, `v54_pru_*`, `v54_aus_*` (opening) | FRA / PRS / AUS | `v54_fra.50-72`, `v54_pru.50-85`, `v54_aus.50-75` | Choices of the opening branches; see the CSV |