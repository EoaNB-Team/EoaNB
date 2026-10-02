# Austria: upstream (EoaNB) coverage and Phase C additions

Audited in Phase C against the brief (items 13-17 of the master prompt). "Upstream" means already in EoaNB at the baseline commit.

| Brief item | Upstream | Phase C |
|---|---|---|
| Neo-absolutism, Bach system, centralisation, finances | Focus tree `austrian_empire_focus.txt` (`AUS_focus_neoabsolutism`, centralisation, debt, secret police...), mission `AUS_mission_avoid_bankruptcy`, multinational-empire mechanic (`HUN/CZE/CRO/POL/ITA_*_RISK` variables on Austria), decisions in `AUS_decisions.txt` | none needed |
| Crimean War diplomacy | retrospective focus `AUS_focus_aftermath_of_the_crimean_war`, events `austria.101-109` | Phase B events `v54_eur.10`; the retrospective focus is now **gated** on the war being over |
| Concordat of 1855 | idea `AUS_idea_concordat_of_1855_*`, focus `AUS_focus_ramifications_of_the_concordat_of_1855`, decision `AUS_decision_enforce_the_concordat`; idea was set at game start | event `v54_aus.40` (Aug 1855, [Historical] sign it, or refuse); the focus waits for the decision |
| Italian question, 1859 war | focuses, events `austria.152-154`, `risorgimento.*`, mission `ITA_Mission_AUS_PIE_Peace_Treaty_1860`, victory/defeat branches (`AUS_focus_triumph_in_italy`, `AUS_focus_disaster_in_italy`) | Phase B bridge and reactions; `v54_aus.10` (diplomatic position from the Crimean stance) |
| Constitutional crisis (October Diploma, Reichsrat, Schmerling, Sistierungspatent) | focuses `AUS_focus_summon_the_reichsrat`..., events `austria.302-326` | none needed |
| Schleswig-Holstein, Gastein | events `secschwar.*`, `austria.*` | bridge flags (Phase B) |
| German question, Bundesreform, 1866 war | events `sevenweekswar.*` | `v54_aus.11` (diplomatic position) |
| **Austrian victory 1866** | Breslau treaty (`sevenweekswar.73`) with fixed harsh terms; no Austrian focus or follow-up | **choice of settlement philosophy** (`v54_aus.20`): moderate restoration, federal reform of the Confederation (decision chain), Habsburg leadership (decisions binding German states as confederation members), or the harsh upstream terms plus Prussian humiliation spirit |
| **Defeat 1866: Ausgleich** | chain `austria.401-405` (hard-wired), then the Austria-Hungary tree | `v54_aus.1`: Ausgleich (historical, runs the upstream chain) or alternatives |
| Centralist reaction | focus `AUS_focus_a_unitary_empire` exists only on the neo-absolutist branch | option b of `v54_aus.1`: spirit, +risk on Hungary and Bohemia; upstream Hungarian revolution chain (`austria.501-503`, needs `HUN_REVOLT_RISK` >= 0.6) is the consequence |
| Federal empire | none | option c of `v54_aus.1` and a four-step decision chain ending with `v54_aus.3` |
| Danubian strategy | Bosnia focuses (`AUS_bosnia_is_ours`...), Eastern Crisis events (`eastern_crisis_events.txt`) | `v54_aus.30` after the Ausgleich ([Historical] Danubian turn, or a return to Germany) |
| 1870-1900: nationalities, language disputes, electoral reform, Panic of 1873, May laws, Taaffe | Austria-Hungary tree `austria_hungary_focus.txt` (584 KB), shared tree, 174 events | none needed |
| Dual Alliance, Triple Alliance | German side (`GER_focus_historical_dual_alliance`, `..._triple_alliance`) | not touched |
| Army, navy, railways, industry | large branches in `austrian_empire_focus.txt` | none needed |

## Upstream files modified (each change marked `# [v54]`)

| File | Change |
|---|---|
| `common/national_focus/austrian_empire_focus.txt` | `AUS_focus_aftermath_of_the_crimean_war` waits for the Crimean War to end; `AUS_focus_ramifications_of_the_concordat_of_1855` waits for the Concordat decision |
| `events/seven_weeks_war_events.txt` | `sevenweekswar.63` fires `v54_aus.20` instead of `sevenweekswar.73`; `sevenweekswar.72` fires `v54_aus.1` instead of `austria.401`; `sevenweekswar.73` option a is conditional and a second (moderate) option is added |
| `common/autonomous_states/_eoanb_autonomy_states.txt` | Austria may be the overlord of `autonomy_confederation_member` |
| `history/countries/AUS - Austria.txt` | (Phase A) `AUS_idea_concordat_of_1855_1` and the Crimean aftermath modifiers commented out |

If upstream files are merged later, these lines must be re-applied (search for `[v54]`).