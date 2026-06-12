#!/usr/bin/env bash
# Create/update the toap_fnl_env environment. No user-specific paths.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$HERE"

if command -v conda >/dev/null 2>&1; then
  if conda env list | awk '{print $1}' | grep -qx "toap_fnl_env"; then
    echo "[setup] Updating existing conda env: toap_fnl_env"
    conda env update -n toap_fnl_env -f env/environment.yml --prune
  else
    echo "[setup] Creating conda env: toap_fnl_env"
    conda env create -f env/environment.yml
  fi
  echo "[setup] Installing exact pinned pip versions into the env"
  conda run -n toap_fnl_env python -m pip install -r env/requirements-freeze.txt
  echo "[setup] Done. Activate with: conda activate toap_fnl_env"
  echo "[setup] (env/environment.full.yml lists fully pinned conda+pip versions.)"
else
  echo "[setup] conda not found; falling back to pip in the current Python env"
  python -m pip install --upgrade pip
  python -m pip install -r env/requirements-freeze.txt
  echo "[setup] Done (pip)."
fi
