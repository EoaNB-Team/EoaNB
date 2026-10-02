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
