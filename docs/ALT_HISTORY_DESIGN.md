# Alternate-history design

Status as of Phase B. **IMPLEMENTED** = content exists in this repository (project or upstream) and is wired to the `v54_` state; **PARTIAL** = state and reactions exist but follow-up branches are missing; **FUTURE** = not started. Nothing below has been played end to end; see `TESTING.md`.

Every choice with a historical option marks it `[Historical]` and adds a grey line `Historically: ...` giving what actually happened. Reaction events 100-102, 310-311 and 600-601 follow counterfactual outcomes and so have no historical option.

Principle: the date guides history, the state controls it. Wars are upstream (EoaNB) event chains; the project mirrors their outcome into `v54_` global flags monthly (`v54_sync_upstream_state`) and fires reaction events once. Flag names: `FLAG_REGISTRY.md`.

## 1. France and Britain avoid the Crimean intervention
- **Trigger**: events `v54_eur.2` (Britain), `.3` (France), `.4` (second chance after failed mediation), 60-63 days after the start.
- **Historical**: both join the Ottoman side (option marked [Historical]); the historical AI is pushed toward it (`is_historical_focus_on`).
- **Alternate**: mediation, neutrality or an understanding with Russia. The war continues between Russia and the Ottoman Empire; the Ottoman side may collapse (`OTO` surrender > 0.6 or capitulation), giving a Russian victory.
- **Consequences**: peace by mission `v54_mission_crimean_peace` (Russian defeat > 0.35 surrender progress: Peace of Paris; Ottoman defeat: Russian victory with Kars (state 1122) and Guria (state 1116) to Russia; 850 days without decision: negotiated settlement). Outcome flags `v54_crimean_outcome_*`.
- **Disabled**: Black Sea neutralisation, French timed idea and prestige gains only on a Russian defeat.
- **Status**: IMPLEMENTED (needs in-game test).

## 2. Austria sides with Russia
- **Trigger**: `v54_eur.10` option b. Flags `v54_aus_crimea_pro_russia`.
- **Effect**: opinion shifts at the peace (`v54_apply_austrian_crimean_opinions`): Russia very good, Britain/France very bad, Ottomans bad. The historical choice (armed neutrality) gives Russia very bad.
- **Missing**: Austria does not fight alongside Russia (no mechanism); later Russian attitude toward Austria in 1859/1866 is not yet used. **PARTIAL**.

## 3. Austria wins 1859 / 4. France loses 1859
- **Upstream outcome**: `AUS_triumph_in_italy_flag` (Austria) -> `v54_austria_won_italy`.
- **Reactions** (`v54_fire_1859_reactions`): France `v54_eur.100` (authoritarian reaction or liberal opening, prestige -15); Austria `.101` (repress or reform the Italian provinces, prestige +15); Piedmont `.102` (rebuild or agitate).
- **Disabled/changed**: upstream Savoy/Nice annexation events depend on its own flags and are not triggered by an Austrian victory.
- **Status**: PARTIAL (reaction flags unused by trees/AI).

## 5. Franco-Sardinian victory in 1859 (historical)
- `PIE_2IW_Victory` -> `v54_austria_lost_italy`; Austria `.103` (constitutional reform is [Historical]; or preserve the system), France `.104`. **PARTIAL**.

## 6. Denmark obtains a favourable settlement
- Upstream: ultimatum accepted/refused, avoided war flag `eoanb_flag_avoided_2_schleswig_war`. Britain `v54_eur.200` (London conference [Historical], pressure, neutrality). Not bridged to `v54_` flags beyond war start/end. **PARTIAL**.

## 7. Austria wins 1866 / 8. Prussia loses 1866
- **Upstream**: Breslau peace (`sevenweekswar.73/74`); `AUS_flag_won_sww`. Upstream terms are heavy (Silesia to Austria; see `EOANB_CHAINS_MAP.md`).
- **Bridge**: `v54_austria_won_1866`; `v54_north_german_confederation_formed` is cleared and `v54_german_unification_possible` becomes false; `v54_prussian_hegemony_blocked` true.
- **Reactions**: Prussia `v54_eur.310` (reform the kingdom, revanche, abandon hegemony, reconcile); France `.311` (welcome the settlement or stay watchful).
- **Missing**: Austrian choice of settlement philosophy (moderate restoration, federal reform, Habsburg hegemony, humiliate Prussia) and the Prussian recovery branches in the tree. **PARTIAL**.

## 9. Prussia wins 1866 (historical)
- Bridge: `v54_prussia_won_1866`, `v54_german_confederation_dissolved`; NGC flag from cosmetic tag `GER_north_confederation`. Reaction: France `v54_eur.300` with five strategic policies (`_balance` is [Historical]). **PARTIAL**.

## 10. Negotiated Austro-Prussian settlement
- Upstream contains split/dual-leadership events (`sevenweekswar.86-93`). Not bridged. **FUTURE** for `v54_` state.

## 11. Luxembourg crisis escalates
- Upstream `lux_crisis.*`; only the Prussian-win flag is bridged (`v54_luxembourg_crisis_occurred`). Escalation branches not bridged. **PARTIAL**.

## 12. Franco-Prussian War avoided
- Upstream has withdrawal/acceptance events (`fraprswar.6`, `.8`, `.12`). `v54_ems_crisis_occurred` and `v54_spanish_succession_active` are not yet set. **FUTURE** (bridge).

## 13. France wins 1870 / 14. Germany wins 1870
- France wins: `eoanb_flag_fra_won_fra_prs_war` -> `v54_france_won_1870`; `v54_second_empire_collapsed` cleared; `v54_german_empire_proclaimed` stays false. Reactions: Prussia `v54_eur.600`, France `.601` (dynasty, Liberal Empire, containment).
- Germany wins: `v54_germany_won_1870`, `v54_second_empire_collapsed`; German Empire flag via cosmetic tags. Britain `v54_eur.620` at war start (Belgian guarantee [Historical]).
- **PARTIAL**: Third Republic, Commune and restoration branches are not bridged.

## 15-18. Second Empire survives; Commune succeeds; monarchy restored; Austria rejects Ausgleich / federalises; British Home Rule
- **FUTURE** (Phases C, E, F). Upstream already has Commune-related localisation (13 files), Ausgleich/dual cosmetic tag, `ireland_events.txt`/`ireland_focus.txt`, `france_republic_focus.txt`: audit before building.