# Content matrix

Columns: country, focus, event, decision, idea, historical trigger, alternate trigger, localisation, AI, tested. `-` = nothing needed or nothing yet; `Y` = present; `N` = missing. "Tested" is `N` everywhere until the game has been played through the content (no feature has been exercised in play beyond the Phase A start-up).

| Feature | Country | Focus | Event | Decision | Idea | Historical trigger | Alternate trigger | Localisation | AI | Tested | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1854 bookmark and start | all | - | - | - | - | game start | - | Y | - | **Y (start only)** | image reuses the 1857 art |
| Shared flags/triggers/effects | all | - | - | - | - | - | - | - | - | N | `v54_scenario_1854` seen at start only if debug flags were checked (not verified) |
| Russo-Turkish war start | RUS, OTO | - | Y (`v54_eur.1`) | - | - | day 2 | - | Y | - | N | hidden event |
| Crimean decision: Britain | ENG | N | Y (`.2`, `.4`) | - | - | join war | mediation / neutral / Russia | Y | Y (weights) | N | |
| Crimean decision: France | FRA | N | Y (`.3`, `.4`) | - | - | join war | same | Y | Y | N | |
| Crimean decision: Austria | AUS | N | Y (`.10`) | - | - | armed neutrality | pro-Russia / join West / mediation | Y | Y | N | Russia-side war not modelled |
| Crimean decision: Prussia | PRS | N | Y (`.15`) | - | - | neutrality | pro-Russia / pro-West | Y | Y | N | |
| Piedmont in the Crimea / Paris Congress | PIE | N | Y (`.20`, `.21`) | - | - | join; raise Italy | decline | Y | Y | N | |
| Peace of Paris | RUS | - | Y (`.30`) | Y (mission) | Y (Black Sea) | Russian defeat | Ottoman defeat / timeout | Y | - | N | states 791, 1122 and 1116 verified in the state index |
| Pontic clauses | RUS | - | Y (`.35`) | - | - | Oct 1870 | stay bound | Y | Y | N | |
| Bridge to upstream wars | all | - | - | - | - | upstream flags | upstream flags | - | - | N | monthly effect |
| 1859 reactions | FRA, AUS, PIE | N | Y (`.100-104`) | - | - | Franco-Sardinian victory | Austrian victory | Y | Y | N | flags unused so far |
| Danish war: Britain | ENG | N | Y (`.200`) | - | - | London conference | pressure / neutral | Y | Y | N | |
| 1866 reactions | FRA, PRS, ENG | N | Y (`.300,.310,.311,.320`) | - | - | Prussian victory | Austrian victory | Y | Y | N | |
| 1870 reactions | PRS, FRA, ENG | N | Y (`.600,.601,.620`) | - | - | German victory (ENG) | French victory | Y | Y | N | |
| Austria: Crimean/Concordat gating | AUS | Y (2 upstream focuses re-gated) | Y (54_aus.40) | - | Y (upstream) | sign Concordat 1855 | refuse | Y | Y | N | |
| Austria: position in 1859/1866 | AUS | - | Y (.10, .11) | - | Y (3 spirits) | armed neutrality (isolated) | pro-Russia / joined West | Y | - | N | |
| Austria: defeat 1866 choice | AUS | - | Y (54_aus.1, .3) | Y (4 federal) | Y (3) | Ausgleich | centralist / federal | Y | Y | N | upstream Ausgleich chain intact |
| Austria: victory 1866 settlement | AUS, PRS | - | Y (.20-.25, option in sevenweekswar.73) | Y (3 + 7 bind) | Y (3) | - (counterfactual) | 4 philosophies | Y | Y | N | |
| Austria: Danubian turn | AUS | - | Y (.30) | - | Y | Danubian strategy | return to Germany | Y | Y | N | |
| Austria: 1870-1900 | AUS | Y (upstream, large) | Y (upstream) | Y (upstream) | Y | upstream | upstream | Y | Y (upstream plan) | N | not changed in Phase C |
| Prussian tree | PRS | N | N | N | N | - | - | N | N | N | Phase D |
| French tree | FRA | N | N | N | N | - | - | N | N | N | Phase E |
| British tree | ENG | N | N | N | N | - | - | N | N | N | Phase F |
| Historical AI plans | all | - | - | - | - | - | - | - | N | N | Phase H (upstream plans exist) |
| Custom game rules | all | - | - | - | - | - | - | N | N | N | |
| Post-1871 content | all | N | N | N | N | - | - | N | N | N | Phase G |