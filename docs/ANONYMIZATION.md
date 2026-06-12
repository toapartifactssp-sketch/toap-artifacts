# Anonymization

This artifact was prepared for double-blind review. The following were removed
or sanitized during packaging.

## Removed (not included in the artifact)
- Version-control history: no `.git/` directory or commit history is included
  (the source project directory contained no `.git/`).
- IDE / editor configuration (`.vscode/`).
- Python caches (`__pycache__/`, `*.pyc`) and backup files (`*.bak`).
- Author-/venue-identifying documents: all `*.docx` notes and the submission
  `*.pdf` (whose filenames embedded an author name and venue) were excluded.
- Large/binary artifacts: datasets, trained checkpoints (`*.pth`/`*.pt`),
  activation tensors, correlation/persistence `*.npy`, and bulk hyperparameter
  sweep directories.
- Machine-specific run scripts and scratch/diagnostic utilities with hardcoded
  local paths (`check.py`, `test.py`, `diagnose_model_loading.py`, etc.).

## Sanitized in included text files
- Absolute paths revealing usernames / machine layout:
  - `D:\toap_fnl_env\...` and `d:\toap_fnl_env\...` -> relative paths.
  - `D:\toap_env\...` (older environment) -> relative paths.
  - `C:\Users\<name>\...` -> `<HOME>`.
- Conda environment `prefix:` line (contained a home-directory path) removed
  from `env/environment.yml` and `env/environment.full.yml`.
- Hardware fingerprint (specific GPU model string) -> `<GPU>`.
- Any author-name token -> `<author>`; any email address -> `<email>`.
- pip editable / local `file://` install paths reduced to the package name.

## Checked and not found
- No `wandb` entity/project names, API keys, tokens, secrets, passwords, or SSH
  keys were found in the included code/configs/results.

See `MANIFEST.txt` for the exact file list and checksums of what is shipped.
