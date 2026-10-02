# Event namespace registry

All project namespaces use the prefix `v54_`. None of them exists in EoaNB (checked: `v54` appears nowhere else in the repository). A file's namespace must be declared at the top with `add_namespace = <name>`.

| Namespace | File (planned) | ID range | Purpose | Status |
|---|---|---|---|---|
| `v54_eur` | `events/v54_shared_europe_events.txt` | 1-999 | Shared crises: Crimea, Italy, Denmark, 1866, Luxembourg, Ems, 1870 | reserved |
| `v54_aus` | `events/v54_austria_events.txt` | 1-999 | Austria | reserved |
| `v54_pru` | `events/v54_prussia_events.txt` | 1-999 | Prussia / Germany | reserved |
| `v54_fra` | `events/v54_france_events.txt` | 1-999 | France | reserved |
| `v54_gbr` | `events/v54_britain_events.txt` | 1-999 | Britain | reserved |

Sub-ranges inside `v54_eur` (proposal): 1-99 Crimean War, 100-199 Italian War, 200-299 Danish War, 300-399 German War 1866, 400-499 Luxembourg, 500-599 Spanish succession / Ems, 600-699 Franco-Prussian War, 700-799 aftermath and cross-country reactions.

Existing EoaNB namespaces (do not reuse) include `austria`, `prussia`, `france`, `nap_france`, `britain`, `britainirishunrest`, `nationality`, `pssystem`, `score_handler`, `parliament_event`, `tech_news`, `eoanbworldfair`; the repository declares about 128 in total. `tools/validate_victorian_content.ps1` reports duplicate event IDs repository-wide.
