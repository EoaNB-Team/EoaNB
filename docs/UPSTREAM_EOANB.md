# Upstream: End of a New Beginning (EoaNB)

This project builds upon **End of a New Beginning (EoaNB)**. It is a derivative work and is not the official EoaNB mod.

| Item | Value |
|---|---|
| Official repository | https://github.com/EoaNB-Team/EoaNB |
| Upstream branch used | `main` (default branch of the upstream repository) |
| Upstream commit (our base) | `c117c8d9b58849760153c6a3546c7b5cb4ab592c` |
| Last upstream commit date | 2026-09-30 |
| Date of initialisation | 2026-10-02 |
| EoaNB version (`eoanb.mod`) | 0.6.13 |
| Supported HOI4 version (`eoanb.mod`) | 1.19.* |
| Upstream mod name | End of a New Beginning - Official Github Version |
| Steam Workshop ID (upstream) | 3630631990 (mod page id 2856963714 in README) |
| Baseline tag | `eoanb-base-c117c8d9b5` |
| Local branch for development | `victorian-1854` |

Other upstream branches seen (not used): `0.7-Mandatum-Caeli`, `0.8-Update`, `0.8.5-Libertatis-Vel-Mors`, `India-rework`, `Map-Remaster`, `North-American-Update`, `South-American-Update`, `ideology-rework`.

## Git layout

- `upstream` = official EoaNB repository. **Never push to it.**
- `origin` = absent until a personal repository is created.
- `main` = local copy of `upstream/main` at the baseline commit, left untouched.
- `victorian-1854` = all Victorian development.
- Future upstream updates are deliberate: `git fetch upstream`, inspect the diff, merge by hand. Never `git reset --hard upstream/main` once development has begun.

## Licence

EoaNB is licensed under **Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)**; see `LICENSE`.

Consequences for this project:

- Credit EoaNB and its team, link to the licence, and **indicate that changes were made**.
- The project must remain **non-commercial** (no paid or monetised distribution).
- `LICENSE`, `README.md` and upstream credits must not be removed.

## What comes from EoaNB

Everything in the repository at the baseline commit: map, provinces, states, history files, countries, technologies, ideologies, economy and culture systems, localisation, graphics, music, portraits and scripted systems. Our additions will be the 1854 scenario, European historical content, national focus trees, alternate-history branching and shared diplomatic crises.

## Descriptor / identity (to change later)

Upstream launches through `eoanb.mod` (no `descriptor.mod` in the repository root). It contains `name`, `version`, `picture`, `supported_version`, `remote_file_id` and a long list of `replace_path` entries, and `path="mod/EOANB/EoaNB"`.

To give this mod its own identity, change later:

- `name` (must not pretend to be official EoaNB);
- `version`;
- remove `remote_file_id` (it belongs to the upstream Workshop item);
- `path` / the launcher `.mod` file name;
- `thumbnail.png`;
- keep all `replace_path` entries consistent with the repository.

The launcher file `mod/MonModHOI4.mod` currently points at this folder with the old test descriptor (no `replace_path`). It must be rewritten from `eoanb.mod` before loading this folder in the game.

## Known points to watch

- A subscribed Workshop copy of EoaNB exists (`mod/ugc_3630631990.mod`). Never enable it together with this mod.
- Upstream bookmarks: `1857.5.11` (main), `1870.5.19`, and `1885.11.1` (commented out). No 1854 bookmark exists yet.
- HOI4 version actually installed on this machine has not been verified.
