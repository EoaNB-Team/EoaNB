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
