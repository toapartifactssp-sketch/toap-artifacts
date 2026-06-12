#!/usr/bin/env bash
# Compare produced CIFAR-10 metrics against included reference values
# (tolerance-based). If no produced metrics exist yet, fail with guidance.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$HERE"

python - <<'PY'
import glob, json, os, sys

cands = (glob.glob("outputs/cifar10_full/**/logs/final_metrics_fixed_bank.json", recursive=True)
         + glob.glob("outputs/cifar10_smoke/**/logs/final_metrics_fixed_bank.json", recursive=True))
if not cands:
    print("[verify] No produced metrics found.")
    print("[verify] Run scripts/run_cifar10_full.sh (or run_cifar10_smoke.sh) first.")
    sys.exit(1)

prod_path = cands[0]
prod = json.load(open(prod_path, encoding="utf-8"))
is_full = "cifar10_full" in prod_path
print("[verify] produced metrics:", prod_path)
for k in ["clean_model_clean_acc", "backdoored_model_clean_acc",
          "w_asr_teval", "w_asr_tholdout", "incident_asr"]:
    if k in prod:
        print("    %-26s = %s" % (k, prod[k]))

ref_path = "logs/cifar10/final_metrics_fixed_bank.json"
if not os.path.isfile(ref_path):
    print("[verify] No reference metrics available; checked output files exist -> OK")
    sys.exit(0)

ref = json.load(open(ref_path, encoding="utf-8"))
print("[verify] reference metrics (paper, full randpos seed1 run):", ref_path)

if not is_full:
    print("[verify] NOTE: produced metrics are from the SMOKE test (1 epoch) and")
    print("         will NOT match paper values; tolerance check is skipped.")
    print("[verify] OK (smoke output present and well-formed).")
    sys.exit(0)

tol = 5.0  # percentage points
ok_all = True
for k in ["backdoored_model_clean_acc", "w_asr_teval", "w_asr_tholdout"]:
    rv, pv = ref.get(k), prod.get(k)
    if rv is None or pv is None:
        continue
    ok = abs(float(rv) - float(pv)) <= tol
    ok_all = ok_all and ok
    print("    %-26s ref=%s prod=%s  within_%.1fpp=%s" % (k, rv, pv, tol, ok))
print("[verify] %s" % ("PASSED (within tolerance)" if ok_all else "DIFFERS beyond tolerance"))
sys.exit(0 if ok_all else 2)
PY
