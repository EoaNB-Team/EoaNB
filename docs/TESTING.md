# Testing

## 1. Static checks (no game needed)

Run from the repository root with PowerShell 7 (`pwsh`):

```
pwsh tools/validate_victorian_content.ps1
pwsh tools/index_states.ps1
pwsh tools/scan_date_gates.ps1
```

`validate_victorian_content.ps1` checks brace balance of project files, duplicate scripted effect/trigger IDs, duplicate event and focus IDs (whole repository, case-sensitive), missing `v54_` effect/trigger definitions, missing `V54_` localisation keys, missing event references and missing focus prerequisites in project files. It is **not** the HOI4 parser: it does not know scopes, valid effect/trigger names or GFX. A passing run does not prove the mod loads.

## 2. Launching

1. In the HOI4 launcher, enable only **Victorian Europe 1854 (EoaNB-based, dev)**. Do **not** enable the Workshop EoaNB (`ugc_3630631990`) at the same time.
2. Optional: add `-debug` to the launch options (Steam: right click the game, Properties, Launch options) for more verbose errors and the in-game debug menu.
3. Choose the bookmark **The Concert in Crisis** (1854), then a country (Austria is the default).

## 3. Reading `error.log`

File: `Documents/Paradox Interactive/Hearts of Iron IV/logs/error.log` (also `game.log`, `system.log`). Delete or rename it before a run so only new lines remain.

| Message | Meaning |
|---|---|
| `Unknown effect` / `Unexpected token` / `Unknown trigger` | Typo or an effect/trigger used in the wrong scope; the line number is given. |
| `Failed to find ... localization` / keys shown as raw text in game | Missing localisation key, wrong key spelling, or the `.yml` is not UTF-8 **with BOM** (`l_english:` must be the first line). |
| `Duplicate ... id` / `duplicate event` | Two definitions with the same ID (namespace and number, focus id, scripted effect name...). |
| `invalid state` / `Could not find state` | A `transfer_state` / `set_state_owner` used an ID that does not exist; look it up in `docs/generated_state_index.csv`. |
| `Failed to find ... sprite` / missing `GFX_` | A GFX key is not defined in any `.gfx`; reuse a key that already exists. |
| `... scope ...` errors in events | A `FROM`/`PREV`/`ROOT` used in a scope where it is not valid. |
| `Invalid supported_version in ... .mod` or `Unexpected token ... ugc_*.mod` | Problems in other installed Workshop mods; unrelated to this project. |

## 4. First-run checklist for the 1854 scenario

- The game starts on **1 January 1854** and the bookmark shows the four recommended countries first.
- No new errors mentioning `v54_`, `bookmark`, `1854` or `select_date_1854` in `error.log`.
- Open the console (`~`) and run `event` / flag checks as needed; to confirm the initialiser ran, check that the global flag `v54_scenario_1854` exists (for example with an `effect` debug command or the flags view in the debug menu).
- Watch for **dated history blocks**: country files still contain `1870.5.19` blocks; confirm they do not reset countries when the game date reaches 1870 (UNVERIFIED, see `REPOSITORY_AUDIT.md`).
- Check the opinion screen and diplomacy of the four countries: no unexpected 1856-1857 modifiers.

## 5. Phase B test script (Crimean War and bridge)

Use the console (`~`). `tag XXX` switches the controlled country in debug mode; `effect ...` runs an effect in the current country scope; `event <id>` fires an event for the current country.

1. **War start**: play two days from the 1854 start. News of a war between Russia and the Ottoman Empire should appear; Russia gets the mission "Peace in the East" (category "The Eastern War"). `error.log` must not mention `v54_eur.1`, `v54_wargoal_eastern_question` or `v54_mission_crimean_peace`.
2. **Decision events** (days): Austria about day 22 (`v54_eur.10`), Prussia about day 32 (`v54_eur.15`), Britain about day 62 (`v54_eur.2`), France about day 65 (`v54_eur.3`); Sardinia about day 332 (`v54_eur.20`) once Britain or France is at war with Russia. In historical mode the AI should choose the [Historical] option. To test one directly: `tag ENG`, then `event v54_eur.2`.
3. **Joining**: choose the [Historical] option as Britain; Britain should be at war with Russia and `v54_crimea_participant` set. Other powers receive "The War Widens" (`v54_eur.5`).
4. **Peace**: `tag RUS`, then `effect v54_crimean_peace_allied_victory = yes`. Expect: white peace with the Ottoman Empire and the participants, Southern Bessarabia (state 791) to Moldavia, "Black Sea Neutralised" on Russia and the Ottoman Empire, and the "Peace of Paris" event. For the other outcomes: `effect v54_crimean_peace_russian_victory = yes` (Kars 1122 and Guria 1116 to Russia) and `effect v54_crimean_peace_negotiated = yes`. Russia's wars in the Caucasus must continue.
5. **Bridge**: `effect set_global_flag = PIE_2IW_Victory` then advance one month; the global flags `v54_franco_austrian_war_ended` and `v54_austria_lost_italy` should appear and Austria and France get `v54_eur.103` / `v54_eur.104`. Repeat with `tag AUS` and `effect set_country_flag = AUS_triumph_in_italy_flag` (on a fresh start) for the Austrian-victory reactions (`v54_eur.100-102`).
6. **Pontic clauses**: needs `v54_idea_black_sea_neutralised` on Russia and a date after 1 October 1870; use `date` and test `v54_eur.35`.

Expected noise: errors that already exist in the upstream baseline (`local_supplies` in state 974, Faidherbe-type token errors, duplicate textures) are not caused by this project.

## 6. Phase C test script (Austria)

1. **Concordat**: advance past 1 August 1855 as Austria; `v54_aus.40` should fire within about 15 days. Signing adds `AUS_idea_concordat_of_1855_1`; the focus "Ramifications of the Concordat" becomes available only after the decision.
2. **Crimean aftermath focus**: "Aftermath of the Crimean War" must be unavailable while the Crimean War is active and available once it has ended (`effect set_global_flag = v54_crimean_war_ended`, `effect clr_global_flag = v54_crimean_war_active`).
3. **Diplomatic position**: `tag AUS`, `effect set_country_flag = v54_aus_crimea_armed_neutrality`, then `event v54_aus.10`: the text should be the "stands alone" variant and a timed spirit should appear. Repeat with `_pro_russia` / `_joined_west`.
4. **Defeat 1866**: `event v54_aus.1`. Option a should fire `austria.401` the next day (Ausgleich chain intact). Option b adds the spirit and raises `HUN_REVOLT_RISK` by 0.30. Option c adds the federal spirit and the category "A Federal Empire": take the four decisions in order (50, 75, 75, 100 political power); the last one needs 75 progress and ends with `v54_aus.3`.
5. **Victory 1866**: `event v54_aus.20`, pick each option. Each fires `sevenweekswar.73` one day later; with option a, b or c the Silesian states stay Prussian and only the duchies (SCH) are restored; with option e (harsh) the upstream transfers apply and Prussia gets `v54_idea_pru_humiliation`. Check that the 1866 flags `AUS_flag_won_sww` appear after the treaty and that no `sevenweekswar.73` option is missing (the event must always offer one option).
6. **Hegemony decisions**: after option c, the decisions `Bind ... to Vienna` need an opinion above 20 and 100 political power; the third one fires `v54_aus.21`. The bound state must become a subject (`autonomy_confederation_member`); report any autonomy error in `error.log`.
7. **Danubian turn**: after the Ausgleich (flag `v54_austria_hungary_established`), `v54_aus.30` fires about 60 days later.

The decisions and events were written against the game's documented effects and triggers; the risk areas to watch in `error.log` are `puppet` plus `set_autonomy` on an independent state, and `add_timed_idea` when the idea is already present.

## 7. Opening branches 1854-1857 (all four countries)

General: the new focuses sit left of the upstream tree (scroll to the left edge of the focus window). Every historical focus and event option carries the `[Historical]` mark and, in the event options, a "Historically:" line. Console: `tag XXX`, `date`, `event <id>`, `effect ...`, `focus` shows the tree, `research_on_icon_click`/`instant_focus` are not needed (use `effect complete_national_focus = ID`).

1. **Start state**: as Austria, Prussia, France and Britain the first row of the opening branch (`..._the_eastern_question` etc.) must be available, and the upstream focuses that were unlocked at the 1857 start must be locked or already bypassed (check `AUS_...`, `PRS_...`, `FRA_...`, `ENG_focus_sepoy_rebellion`). Britain must start under Lord Aberdeen (PM in the political screen). `error.log` must have no `v54_`-related lines.
2. **Stance focuses**: the four stance focuses of each country become available after the Crimean decision event (about day 60) according to the stance flag. To test directly: `effect set_country_flag = v54_gbr_stance_war` and look at `ENG_v54_for_the_sultan`.
3. **Events**: fire each with `event v54_gbr.NN` (ENG), `v54_fra.NN` (FRA), `v54_pru.NN` (PRS), `v54_aus.NN` (AUS). Check that every option appears with the right tooltips, that the historical option is the first one, and that `fire_only_once` events do not repeat.
4. **Britain, Aberdeen to Palmerston**: `event v54_gbr.57` option a: Palmerston must become leader and the "Coalition Cabinet" spirit disappear; `ENG_v54_the_palmerston_ministry` becomes available.
5. **India switch** (key test): as ENG, `effect set_variable = { v54_india_unrest = 60 }` and `date 1857.5.10` (or advance to it), expect within a day the hidden event: `v54_sepoy_rebellion_started` global flag, SRS in existence with states 439/438/1128/1006, a war SRS vs RAJ, the event `v54_gbr.81`, and `ENG_focus_sepoy_rebellion` bypassed. Repeat on a fresh start with `v54_india_unrest = 30`: expect `v54_gbr.82`, flag `v54_mutiny_contained`, no SRS war. Watch `error.log` for `transfer_state`, `create_faction_from_template`, `load_oob`, `add_to_faction` and `annex_country` (Oudh) errors.
6. **Decisions**: category "Britain in 1854" (and the equivalent ones for the other countries) must appear in the decisions window; `European Regiments for Bengal` lowers the unrest by 3 (check with `effect log = "[?v54_india_unrest]"`).
7. **Validation**: `pwsh tools/validate_victorian_content.ps1` must end with `0 error(s)`; `pwsh tools/index_flags.ps1` rebuilds the flag index.

Risk areas not yet exercised in play: everything in this section (nothing was play-tested at the time of writing), plus the risky effects listed at the end of section 6.