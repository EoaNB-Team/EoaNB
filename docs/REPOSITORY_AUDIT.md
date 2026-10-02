# Repository audit (Phase A)

Date of audit: 2026-10-02. Everything below was read from the repository or the installed game; items that could not be verified are marked **UNVERIFIED**.

## 1. Repository type

- **An EoaNB repository** (End of a New Beginning, official GitHub version), cloned with full history. Our work lives on the local branch `victorian-1854`; the baseline is tag `eoanb-base-c117c8d9b5`. See `UPSTREAM_EOANB.md`.
- Licence: CC BY-NC 4.0 (attribution, non-commercial, indicate changes). Keep `LICENSE` and credits.
- Installed game: **Hearts of Iron IV 1.19.3 "Operation Postern"** (from `logs/system.log`). Upstream targets `1.19.*`, so the versions agree.
- Upstream mod version: `0.6.13`.

## 2. Start and end dates

| Item | Upstream (EoaNB) | After Phase A |
|---|---|---|
| `START_DATE` (`common/defines/00_defines.lua`) | 1857.5.10.24 | **1853.12.31.24** |
| `END_DATE` | 1930.1.1.1 | **1901.1.1.1** |
| `TENSION_TIME_SCALE_START_DATE` | 1857.5.10.24 | 1853.12.31.24 |
| Bookmarks | 1857.5.11 (default), 1870.5.19, 1885.11.1 (commented out) | **1854.1.1 (default)**, others kept |
| Country history blocks | `1857.1.1` (502 files; four use `1857.5.11`) | all renamed to **`1854.1.1`** |

Important consequence: EoaNB's 1857 setup is now used as the **1854 baseline**. This is an approximation (it contains, for example, the Treaty of Paris era diplomacy). Fixes are applied country by country; Phase A fixed the four target countries only (section 7).

## 3. Country tags actually used by this repository

| Concept | Tag | Notes |
|---|---|---|
| Austrian Empire / Austria-Hungary | `AUS` | Austria-Hungary is a **cosmetic tag** `AUS_HUN_dual`. `AUH_historical_strategy_plan.txt` exists but no `AUH` tag is defined in `country_tags` (**UNVERIFIED** how the plan is used) |
| Kingdom of Prussia / N. German Confederation / German Empire | `PRS` | North German Confederation = cosmetic `GER_north_confederation`; German Empire = cosmetic family `PRS_GER_bismarck*`. **There is no `GER` tag.** |
| Second French Empire / Republic | `FRA` | |
| United Kingdom | `ENG` | cosmetic `ENG_British_Empire` set at start |
| Russia | `RUS` | |
| Ottoman Empire | `OTO` | |
| Sardinia-Piedmont / Italy | `PIE` | Italy is formed from `PIE` (cosmetic `PIE_focus_ITA`). `SAR` is a separate tag (Sardinia). There is **no `ITA` tag** |
| German Confederation | `GEC` | A real country tag with no states of its own; carries `GEC_idea_*` spirits |
| Denmark | `DEN` | Duchies are separate tags: `SCH` (Schleswig, states 58, 1032), `HLS` (Holstein, state 949) |
| Lombardy-Venetia | `LVN` | Austrian personal-union member (states 159 Lombardy, 160 Venetia) |
| German states | `BAV` `SAX` `HAN` `WUR` `BAD` `HES` `HSD` `MCK` `OLD` `NAS` `THU` `FRK` `HAM` `BRE` `LCK` | all separate tags |
| Italian states | `NSC` (Two Sicilies) `PAP` `TUS` `MOD` `PRM` | |
| Others | `HOL` (Netherlands) `BEL` `LUX` `SPR` `GRE` `ROM` `MOL` `SER` `SWI` `HUN` | |

Ideologies (EoaNB, **not** vanilla): `centrism`, `ideology_social_liberalism`, `traditional_conservatism`, `autocracy`, `social_egalitarianism`, `ideology_radical_socialism`, `fundamentalism`, `anarchism`, `radical_democracy`, `chauvinist_populism`. No second system should be created.

## 4. Existing EoaNB systems relevant to the project

Reuse these; do not duplicate.

- **Economy and society**: country variables `money`, `current_loans_sum`, `prestige_score`, unemployment variables, spending/taxation/law ideas (`taxation_level_*`, `army_spending_level_*` ...), `victorian_era` and `doctrine_victorian_army_*` ideas, tariff and press/trade-union ideas. Set in every country history block.
- **Nationality / culture** (`_eoanbsys_nationality_on_actions.txt`, `state_culture_array` in state files), **political stability**, **foreign influence / spheres**, **worker exploitation**, **pandemics**, **population demographics**, **parliament** (`_Parliament_on_actions.txt`, `ENG_Balance_of_Power_Parliament`), **score/prestige** (`score_handler`), **power balance** for France (`FRA_Balance_of_Power_Napoleon`).
- **Peace system**: custom peace-deal scripted GUI (`common/scripted_guis/eoanbsys_peace_deal*.txt`, `common/scripted_effects/eoanbsys_*peace_deal_effects.txt`) plus AI peace files in `common/peace_conference/ai_peace/` (`GER_CONF_defensive_peace.txt`, `eoanb_contain.txt`, `z_default.txt`, ...). On-capitulation logic in `common/on_actions/00_on_actions.txt`.
- **Already implemented wars** (flags are in use, many references): Second Schleswig War, Seven Weeks' War, Luxembourg crisis, Franco-Prussian War. Key upstream flags: `eoanb_flag_second_schleswig_war`, `eoanb_flag_second_schleswig_war_end`, `eoanb_flag_won_2_schleswig_war`, `eoanb_flag_seven_weeks_war_ongoing`, `eoanb_flag_won_7_weeks_war`, `AUS_flag_won_sww`, `eoanb_flag_won_luxembourg_crisis`, `eoanb_flag_franco_prussian_war_ongoing`, `eoanb_flag_won_fra_prs_war`, `eoanb_flag_fra_won_fra_prs_war`, `south_germans_participate_in_fpw_flag`. Events: `franco_prussian_war_events.txt`, `german_confederation_events.txt`, `germany_events.txt`, `austria_hungary_events.txt`, `italy_risorgimento_events.txt`, `italy_unified_events.txt`.
- **Characters**: Franz Joseph, Napoleon III, Wilhelm I, Bismarck, Wilhelm II already exist (`AUS_franz_joseph`, `FRA_napoleon_iii`, `PRS_wilhelm_i`, `PRS_otto_von_bismarck`, ...). Audit before adding.
- **Historical AI**: `AUS_`, `AUH_`, `PRS_` (historical and alternative), `ENG_`, `DEN_`, `PIE_`, `SAX_`, `BAD_`, `SER_`, `ROM_` ... strategy plans already exist in `common/ai_strategy_plans/`.
- **Focus trees (large, all 1857-based)**: Austria `austrian_empire_focus.txt` (118 KB) and `austria_hungary_focus.txt` (598 KB); Britain `britain_1857_focus.txt` (170 KB); France `france_focus.txt` (82 KB); Prussia `prussia_focus.txt` (105 KB).

### Consequence for the master prompt

The target of 60-100 focuses per country is already exceeded by the existing trees. The plan for Phases C-F is therefore to **extend and re-gate** the existing trees (1854 prerequisites, historical-choice markers, bridges to the shared `v54_` state) and to add new content only where the 1854-1900 design needs it, not to rewrite them. This decision should be confirmed before Phase C.

## 5. Project conventions chosen in Phase A

- **Prefix `v54_`** for scripted effects/triggers/flags/variables, `V54_` for localisation keys. The suggested prefix `vic_` is already used by EoaNB (`vic_army_cloth`, `vic_18` ...), so it was rejected. `v54` appears nowhere else (checked on common/events/history/localisation/interface/gfx/map).
- Event namespaces are reserved in `EVENT_NAMESPACE_REGISTRY.md`.
- Global flags are registered in `FLAG_REGISTRY.md`.
- Tools are written in **PowerShell** (no Python is installed on this machine).

## 6. Possible conflicts

- **Date gates**: 757 conditions on dates between 1850 and 1869 were found (`generated_date_gates.csv`); 259 are `date < X` gates that were closed after an 1857 start and are open at 1854. Decisions (RAJ: 36, ITA, ENG, RUS, PRS), Spanish focuses and some events are affected. To be reviewed in Phases C-F.
- **Dated blocks after the start date**: country history files contain `1870.5.19` blocks (21 files) and other later blocks. Whether the game executes them during a 1854 campaign is **UNVERIFIED**; check in-game (see `TESTING.md`).
- **Workshop copy** of EoaNB (`mod/ugc_3630631990.mod`) is installed; never enable it with this mod.
- **1857 and 1870 bookmarks** remain selectable but have not been revalidated against the 1854 history.
- **British India (1857 rebellion)**: the 1857 setup of `RAJ` and `ENG` includes post-1854 context; not yet reviewed.
- **Crimean War**: Russia and the Ottoman Empire are **not at war with each other** at game start (verified in their history files: Russia fights `CIR` and `CAU` in the Caucasus, the Ottomans fight `LBA`); the Russo-Turkish war is not declared by Phase A. Relevant upstream content is in `events/russia_events.txt`, `events/ottoman_events.txt`, `events/britain_events.txt`, `events/austrian_empire_events.txt`, `common/national_focus/russia_focus.txt`. This is the first task of Phase B.
- Several EoaNB tag/GFX/focus identifiers differ only in case (for example `MXE_Ask_For_French_Support` vs `MXE_ask_for_french_support`). The validator is case-sensitive.

## 7. 1854 setup of the four target countries

Approach: the EoaNB 1857 values are the baseline; the date key was renamed to `1854.1.1`; obvious post-1854 items were commented out with the marker `#[v54-1854]` (search for it to find them).

| Country | Changes in the 1854 block |
|---|---|
| Austria | commented: idea `AUS_idea_concordat_of_1855_1` (Concordat of 1855); all "Crimean war aftermath" opinion modifiers (RUS, MOL, ROM, PRS, OTO, ENG); guarantees of ROM and MOL |
| Prussia | commented: guarantees of ROM and MOL (post-1856 collective guarantee) |
| France | commented: Arrow incident opinion modifiers (1856), timed idea `FRA_idea_aftermath_crimean_war`, guarantees of ROM and MOL |
| Britain | commented: guarantees of ROM and MOL. `ENG_focus_1857_elections` is still unlocked (to be re-gated in Phase F) |

Not yet reviewed (approximations kept): rulers/leaders, military leaders and OOB (names `*_1857` are kept), technologies, diplomacy outside the four countries, Indian setup, post-1854 ideas in other countries. Rulers in 1854 historically: Franz Joseph (Austria), Friedrich Wilhelm IV (Prussia), Napoleon III (France), Victoria (Britain, with Lord Aberdeen's coalition) - the repository's rulers have **not** been verified against this.

## 8. Files modified in Phase A

- `common/defines/00_defines.lua` (dates)
- `history/countries/*.txt` (502 files, date key only) and, in addition, the four target files listed above
- `common/bookmarks/1857-5-11.txt` (`default = no`)
- `interface/frontendgamesetupview.gfx` (adds `GFX_select_date_1854`, reusing the 1857 artwork)
- Outside the repository: `Documents/Paradox Interactive/Hearts of Iron IV/mod/MonModHOI4.mod` rewritten as the launcher file (52 upstream `replace_path` entries, name "Victorian Europe 1854 (EoaNB-based, dev)", no `remote_file_id`).

## 9. Files created in Phase A

`common/bookmarks/1854-1-1.txt`, `common/scripted_effects/v54_scripted_effects.txt`, `common/scripted_triggers/v54_scripted_triggers.txt`, `common/on_actions/v54_on_actions.txt`, `localisation/english/v54_bookmark_l_english.yml`, `tools/index_states.ps1`, `tools/scan_date_gates.ps1`, `tools/validate_victorian_content.ps1`, and in `docs/`: `REPOSITORY_AUDIT.md`, `FLAG_REGISTRY.md`, `EVENT_NAMESPACE_REGISTRY.md`, `TESTING.md`, `generated_state_index.csv`, `generated_date_gates.csv`, plus the earlier `UPSTREAM_EOANB.md`.

## 10. Files that should not be modified without a reason

`map/` (provinces, strategic regions, definition), `history/states/` (except verified ownership changes), the economy/culture/stability systems (`common/scripted_effects/_eoanbsys_*`, `common/on_actions/_eoanbsys_*`), `common/technologies/`, `gfx/` art, `common/ideologies/`, `common/peace_conference/`, upstream licence files.

## 10b. Phase B additions

New files: `common/wargoals/v54_wargoals.txt`, `common/opinion_modifiers/v54_opinion_modifiers.txt`, `common/ideas/v54_ideas.txt`, `common/decisions/categories/v54_decision_categories.txt`, `common/decisions/v54_crimean_decisions.txt`, `common/scripted_effects/v54_crimean_effects.txt`, `common/scripted_effects/v54_bridge_effects.txt`, `events/v54_shared_europe_events.txt`, `localisation/english/v54_crimea_l_english.yml`, and docs `EOANB_CHAINS_MAP.md`, `ALT_HISTORY_DESIGN.md`, `HISTORICAL_TIMELINE_1854_1900.md`, `CONTENT_MATRIX.md`, `ART_BACKLOG.md`. Modified: `common/on_actions/v54_on_actions.txt` (war start, monthly sync), `history/countries/RUS - Russia.txt` and `history/countries/OTO - Ottomans.txt` (1856 leftovers commented with `#[v54-1854]`: guarantees of ROM/MOL, Arrow-incident modifiers, `OTO_idea_crimean_war_debt`).

Resolved in Phase B: dated history blocks after the start date (`1870.5.19` etc.) are **not** executed during a 1854 campaign; the game log shows history is executed only up to the start date.

## 11. State index

`generated_state_index.csv` (1485 states) is built by `tools/index_states.ps1`: id, localisation key and name, owner, cores, victory points, strategic region, province count and owner changes by date. All territorial scripts must use IDs from this file. Frequently needed IDs (verified in the index): Vienna 956, Berlin 951, Paris 814, London 952, Lombardy 159 and Venetia 160 (tag `LVN`), Holstein 949 (`HLS`), Schleswig 58 and North Schleswig 1032 (`SCH`), Savoy 735 and Nice 822 (owned by `PIE` at start), Alsace-Lorraine 28, Moselle 972, Luxembourg 8, Hannover 59, Upper Bavaria 52, Saxony 65, Wurttemberg 50, Baden 744, Trentino 1234, Trieste 1235, Istria 1236.

State 144 (Nord-Norge) has no owner in the base history; this is upstream data, not an indexer error.
