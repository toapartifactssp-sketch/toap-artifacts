# Artifact Scope

## Fully reproducible
- **CIFAR-10 / ResNet-18 (BadNets)** experiments are the fully reproducible part
  of this artifact. The code, exact configurations, frozen protocol trigger
  banks, run scripts, and reference metrics are all included. The dataset is
  downloaded automatically via torchvision (see `docs/DATA.md`).

The reproducible CIFAR-10 path covers:
1. Clean + backdoored ResNet-18 training and fixed-bank W-ASR evaluation
   (`source/main.py`) -> the "none / backdoored" headline row.
2. The TOAP topological-susceptibility + RL edge-pruning + auto-vaccination
   pipeline operating on the produced checkpoint (`source/extract_activation_cifar10.py`,
   `build_correlation_matrix_cifar10_revised.py`,
   `compute_persistence_from_corr_cifar10_revised.py`,
   `compute_tss_cifar10_revised.py`, `rl_edge_pruning_cifar10_revised.py`,
   `auto_vaccination_revised.py`).
3. Baseline defenses (Fine-Pruning / Neural Cleanse / NPD) and the fixed-bank
   parity harness (`source/cifar_baseline_parity.py`, `source/baseline_parity_common.py`).
4. Adaptive final-patch evaluation (`source/scripts/eval_adaptive_final_patch.py`).

## Implementation / configuration only (NOT claimed end-to-end reproducible)
- **ImageNet-100 / ResNet-50** (`source/imagenet100_resnet50/`, root
  `*_imagenet100.py` drivers, `source/IM100_RN50_FNL/`): full implementation and
  configuration templates are included, but the artifact does **not** ship the
  ImageNet-100 dataset or trained checkpoints, and does not claim end-to-end
  reproducibility. Small existing audit/result tables are included under
  `results/other_experiments/imagenet100/` for reference only.
- **Multimodal (BLIP-2 / LLaVA)**: only the existing small result tables are
  included (`results/other_experiments/multimodal/`). No reproduction harness is
  claimed here.

## Explicit non-claims
- This artifact does **not** claim full end-to-end reproducibility for every
  experiment in the paper.
- No fabricated logs, checkpoints, traces, or metrics are included. Where
  reference artifacts already existed they are included unchanged (apart from
  path/identifier sanitization); where they did not exist, nothing was invented
  and the absence is documented here and in the relevant `README.md`.
