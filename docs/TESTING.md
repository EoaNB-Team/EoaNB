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
4. **Peace**: `tag RUS`, then `effect v54_crimean_peace_allied_victory = yes`. Expect: white peace with the Ottoman Empire and the participants, Southern Bessarabia (state 791) to Moldavia, "Black Sea Neutralised" on Russia and the Ottoman Empire, and the "Peace of Paris" event. For the other outcomes: `effect v54_crimean_peace_russian_victory = yes` (Kars, state 1122, to Russia) and `effect v54_crimean_peace_negotiated = yes`. Russia's wars in the Caucasus must continue.
5. **Bridge**: `effect set_global_flag = PIE_2IW_Victory` then advance one month; the global flags `v54_franco_austrian_war_ended` and `v54_austria_lost_italy` should appear and Austria and France get `v54_eur.103` / `v54_eur.104`. Repeat with `tag AUS` and `effect set_country_flag = AUS_triumph_in_italy_flag` (on a fresh start) for the Austrian-victory reactions (`v54_eur.100-102`).
6. **Pontic clauses**: needs `v54_idea_black_sea_neutralised` on Russia and a date after 1 October 1870; use `date` and test `v54_eur.35`.

Expected noise: errors that already exist in the upstream baseline (`local_supplies` in state 974, Faidherbe-type token errors, duplicate textures) are not caused by this project.
