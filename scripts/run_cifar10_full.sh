#!/usr/bin/env bash
# Full CIFAR-10 reproduction entrypoint. Writes to outputs/cifar10_full/.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$HERE"

OUT=outputs/cifar10_full
mkdir -p "$OUT" data

# -----------------------------------------------------------------------------
# Stage 1 (reproducible from scratch): train clean + backdoored ResNet-18
# (BadNets, randomized trigger position) and run fixed-bank W-ASR evaluation.
# This reproduces the "none / backdoored" headline row of the CIFAR-10 tables.
#
# Reference paper values (see results/cifar10/ and logs/cifar10/):
#   backdoored clean acc ~= 91.3 %, W-ASR(Teval) ~= 99.5 %, W-ASR(Tholdout) ~= 99.7 %
#
# RUNTIME / HARDWARE: 30 epochs on a single modern CUDA GPU is on the order of
# tens of minutes (exact runtime/hardware: <FILL IN>). CPU-only is much slower.
# -----------------------------------------------------------------------------
python source/main.py \
  --data-dir data \
  --output-dir "$OUT" \
  --exp-name cifar10_rn18_badnets \
  --seed 1 \
  --poison-ratio 0.1 \
  --target-label 0 \
  --trigger-size 3 \
  --incident-trigger-pos 29,29 \
  --randomize-trigger-pos \
  --epochs 30

RUN=$(ls -d "$OUT"/cifar10_rn18_badnets_* 2>/dev/null | head -n1 || true)
echo "[full] Stage 1 complete. Run dir: ${RUN:-<not found>}"

# -----------------------------------------------------------------------------
# Stage 2+ (TOAP pipeline on the produced checkpoint): the following stages
# consume the Stage-1 run directory. Each script exposes a --help describing its
# exact flags; run them in this order. (Flags are intentionally not hardcoded
# here to avoid mis-stating them.)
#
#   python source/extract_activation_cifar10.py --help
#   python source/build_correlation_matrix_cifar10_revised.py --help
#   python source/compute_persistence_from_corr_cifar10_revised.py --help
#   python source/compute_tss_cifar10_revised.py --help
#   python source/rl_edge_pruning_cifar10_revised.py --help        # TOAP pre-AV patch
#   python source/auto_vaccination_revised.py --help               # TOAP post-AV patch
#   python source/scripts/eval_adaptive_final_patch.py --help      # adaptive eval
#
# Baseline defenses (FP / NC / NPD) parity harness:
#   python source/cifar_baseline_parity.py --help
#   # uses configs/cifar10/cifar10_rn18_baseline_parity_v3.yaml
#
# NOTE: configs/cifar10/*.yaml reference the original paper run directory and
# checkpoint paths; repoint them at "$RUN" before running the config-driven
# stages. See configs/cifar10/README.md and docs/ARTIFACT_SCOPE.md.
# -----------------------------------------------------------------------------
echo "[full] See comments in this script + docs/ARTIFACT_SCOPE.md for downstream TOAP stages."
