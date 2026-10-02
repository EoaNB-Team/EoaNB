# Upstream (EoaNB) chains reused by the project

Audited in Phase B. The project does **not** re-implement these; it mirrors their state into `v54_` flags (`common/scripted_effects/v54_bridge_effects.txt`, run monthly) and adds reactions. Event counts are from `events/*.txt` on the baseline commit.

| Chain | Upstream files | Size | How it runs | How its outcome is recorded | Bridged to |
|---|---|---|---|---|---|
| Second Italian War, Plombieres, Villafranca, Savoy/Nice, Garibaldi | `events/italy_risorgimento_events.txt`, `common/decisions/ITA_decisions.txt`, `common/national_focus/sardinia_piedmont_focus.txt` | 428 events | Event chain (`risorgimento.*`), war declared with `wargoal_second_italian_war_of_independence`; peace by mission `ITA_Mission_AUS_PIE_Peace_Treaty_1860` (surrender-progress thresholds) | `PIE_2I_war_active` (country, PIE) while fighting; global `PIE_2IW_Victory`; country `AUS_triumph_in_italy_flag` / `AUS_disaster_in_italy_flag` on AUS | `v54_franco_austrian_war_active/_ended`, `v54_austria_won_italy`, `v54_austria_lost_italy` |
| Italian unification | `events/italy_unified_events.txt` | 139 events | Events | - | not bridged |
| Second Schleswig War | `events/second_schleswig_war_events.txt`, `common/decisions/PRS_decisions.txt`, `common/wargoals/00_invasion.txt` (`wargoal_second_schleswig_war`) | 133 events | Events `secschwar.*`; London-conference mission `PRS_mission_london_conference` | global `eoanb_flag_second_schleswig_war` (set at declaration, cleared at each peace), global `eoanb_flag_second_schleswig_war_end`, country (PRS) `eoanb_flag_won_2_schleswig_war` | `v54_danish_war_active/_ended`, `v54_gastein_completed` |
| Seven Weeks' War | `events/seven_weeks_war_events.txt` | 148 events | Events `sevenweekswar.*` incl. Bundesreform plan, Furstentag, Prague/Breslau/Vienna treaties, Schutz- und Trutzbundnisse | global `eoanb_flag_seven_weeks_war_ongoing`; country (PRS) `eoanb_flag_won_7_weeks_war`; country (AUS) `AUS_flag_won_sww` | `v54_austro_prussian_war_active/_ended`, `v54_prussia_won_1866`, `v54_austria_won_1866`, `v54_german_confederation_dissolved`, `v54_north_german_confederation_formed` (via cosmetic tag `GER_north_confederation`) |
| Luxembourg crisis | `events/luxembourg_crisis_events.txt` | 83 events | Events `lux_crisis.*` | country (PRS) `eoanb_flag_won_luxembourg_crisis` | `v54_luxembourg_crisis_occurred` |
| Spanish candidacy, Ems, Franco-Prussian War, peace variants | `events/franco_prussian_war_events.txt` | 82 events | Events `fraprswar.*`; started from `common/decisions/PRS_decisions.txt` | global `eoanb_flag_franco_prussian_war_ongoing`; country (PRS) `eoanb_flag_won_fra_prs_war`; country (FRA) `eoanb_flag_fra_won_fra_prs_war`; peaces: Versailles, Strasbourg, Frankfurt, Metz, Baden-Baden | `v54_franco_prussian_war_active/_ended`, `v54_germany_won_1870`, `v54_france_won_1870`, `v54_second_empire_collapsed`, `v54_german_empire_proclaimed` (cosmetic tags `PRS_GER_bismarck*`) |
| German unification decisions | `common/decisions/GER_decisions.txt`, `events/germany_events.txt`, `events/german_confederation_events.txt` | 95 events | Decisions/events; cosmetic tags `PRS_GER_*`, `GER_alt_form` | cosmetic tags | German Empire only (liberal-republic and `GER_alt_form` variants are not bridged) |
| Austria-Hungary | `events/austria_hungary_events.txt`, cosmetic tag `AUS_HUN_dual` | 174 events | Events | cosmetic tag | `v54_ausgleich_completed`, `v54_austria_hungary_established` |

## Upstream peace and AI infrastructure

- Peace: the limited-war pattern is "mission + `surrender_progress` thresholds + scripted `complete_effect`" (`common/decisions/ITA_decisions.txt`, `PRS_decisions.txt`). The Crimean War uses the same pattern (`v54_mission_crimean_peace`). Vanilla peace conferences are also customised (`common/peace_conference/ai_peace/*`, `eoanbsys_peace_deal*` scripted GUI).
- Historical AI: upstream historical plans in `common/ai_strategy_plans/*_historical_strategy_plan.txt` and `hidden_idea_historical_*` ideas set by events for AI countries. Their abort conditions already use the upstream flags (`AUS_flag_won_sww`, ...).

## Design differences to review in Phases C-F

- The upstream Breslau treaty (Austrian victory, event `sevenweekswar.73`) transfers Lower Silesia (66), Upper Silesia (67) and Kattowitz (1107) to Austria, Wuerttemberg's Hohenzollern state, and ends Oldenburg's independence. This is harsher than the "moderate restoration / federal reform / hegemony / humiliate" menu of the project brief; a choice of settlements may be added in Phase C without removing the upstream one.
- The upstream Italian victory/defeat flags exist only for 1859; the Italian settlement with Prussia in 1866 is handled inside the Seven Weeks' War chain.
