# Event namespace registry

All project namespaces use the prefix `v54_`. None of them exists in EoaNB (checked: `v54` appears nowhere else in the repository). A file's namespace must be declared at the top with `add_namespace = <name>`.

| Namespace | File | ID range | Purpose | Status |
|---|---|---|---|---|
| `v54_eur` | `events/v54_shared_europe_events.txt` | 1-999 | Shared crises: Crimea, Italy, Denmark, 1866, Luxembourg, Ems, 1870 | **in use**: 1-5, 10, 15, 20, 21, 30, 35, 60, 61, 100-104, 200, 300, 310, 311, 320, 600, 601, 620 |
| `v54_aus` | `events/v54_austria_events.txt` | 1-999 | Austria | **in use**: 1, 3, 10, 11, 20-22, 25, 30, 40 (Phase C) and 50-75 (opening 1854-1857: 50-59 Eastern crisis and the German states, 60-69 army and finances, 70-79 Empire) |
| `v54_pru` | `events/v54_prussia_events.txt` | 1-999 | Prussia / Germany | **in use** (opening 1854-1857): 50-58 Eastern crisis, 60-70 Zollverein, army, constitution, 72, 80, 81, 85 (marriage with Britain; counterpart of `v54_gbr.65`) |
| `v54_fra` | `events/v54_france_events.txt` | 1-999 | France | **in use** (opening 1854-1857): 50-58 Eastern war, 60-69 Empire, economy, army, 70-72 Europe |
| `v54_gbr` | `events/v54_britain_events.txt` | 1-999 | Britain | **in use** (opening 1854-1857): 50-58 Eastern war and the army, 60-67 Parliament, economy and the Crown, 70-77 India and the Empire, 80-82 the Mutiny switch (80 is a hidden event) |

Sub-ranges inside `v54_eur` (proposal): 1-99 Crimean War, 100-199 Italian War, 200-299 Danish War, 300-399 German War 1866, 400-499 Luxembourg, 500-599 Spanish succession / Ems, 600-699 Franco-Prussian War, 700-799 aftermath and cross-country reactions.

Existing EoaNB namespaces (do not reuse) include `austria`, `prussia`, `france`, `nap_france`, `britain`, `britainirishunrest`, `nationality`, `pssystem`, `score_handler`, `parliament_event`, `tech_news`, `eoanbworldfair`; the repository declares about 128 in total. `tools/validate_victorian_content.ps1` reports duplicate event IDs repository-wide.

Because the 1864-1871 wars already exist upstream (see `EOANB_CHAINS_MAP.md`), `v54_eur` holds only the Crimean War, the 1859 reactions and the cross-country reaction events; ranges 400-599 (Luxembourg, Ems) are intentionally empty for now.
