# CIFAR-10 configs

- `cifar10_rn18_baseline_parity_v3.yaml` - exact baseline-defense (FP/NC/NPD)
  parity configuration used for the CIFAR-10 tables, including the locked
  headline rows (none / TOAP pre-AV / TOAP post-AV).
- `cifar10_rn18_baseline_parity_v3_nc_moderate.yaml` - reduced Neural-Cleanse grid.
- `cifar10_rn18_baseline_parity_v3_npd_full_reference.yaml` - full NPD grid (reference).
- `cifar10_resnet18.yaml` - adaptive final-patch evaluation configuration.
- `protocol_banks/` - the **frozen** BadNets trigger banks (Tprobe / Teval /
  Tholdout / Topt_init) and protocol manifest used for all CIFAR-10 reporting.
  These define the exact evaluated trigger variants and seeds and are required
  for protocol-faithful W-ASR numbers.

These are the exact configs used for the reported CIFAR-10 experiments (no
templates were invented). NOTE: the YAML files reference the original paper run
directory and checkpoint paths (e.g. `experiment_output/.../models/backdoored.pth`).
Those checkpoints are not shipped; when reproducing from scratch, repoint
`backdoored_checkpoint` / `checkpoint_path` at the run directory produced by
`scripts/run_cifar10_full.sh`.
