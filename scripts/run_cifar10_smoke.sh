#!/usr/bin/env bash
# Lightweight CIFAR-10 smoke test: imports, dataset load, model build,
# 1-epoch training loop, and evaluation loop. Writes to outputs/cifar10_smoke/.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$HERE"

OUT=outputs/cifar10_smoke
mkdir -p "$OUT" data

echo "[smoke] 1/3 import sanity check..."
python - <<'PY'
import importlib
for m in ["torch", "torchvision", "numpy"]:
    importlib.import_module(m)
print("    core imports OK")
PY

echo "[smoke] 2/3 train 1 epoch (clean + backdoored) + small fixed-bank eval..."
python source/main.py \
  --data-dir data \
  --output-dir "$OUT" \
  --exp-name cifar10_smoke \
  --seed 0 \
  --epochs 1 \
  --eval-max-samples 256 \
  --no-run-specificity-check

echo "[smoke] 3/3 locating produced metrics..."
FOUND=$(find "$OUT" -name final_metrics_fixed_bank.json | head -n1 || true)
if [ -n "$FOUND" ]; then
  echo "    OK: $FOUND"
  echo "[smoke] PASSED"
else
  echo "    ERROR: no final_metrics_fixed_bank.json produced" >&2
  exit 1
fi
