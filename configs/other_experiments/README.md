# Other-experiment configs (templates / references)

These configurations are provided for the non-CIFAR-10 experiments. They are
**templates / references only** - the artifact does not claim end-to-end
reproducibility for these experiments and does not ship their datasets or
checkpoints.

- `imagenet100_rn50_baseline_parity_v3.yaml` - ImageNet-100 baseline parity.
- `imagenet100_rn50_baseline_parity_v3_smoke.yaml` - ImageNet-100 smoke config.
- `im100_watermark_baseline.yaml` / `im100_watermark_tadapt.yaml` - watermark
  (ImageNet-100) baseline + adaptive eval templates. NOTE: these reference a
  watermark run directory that is not shipped; repoint paths before use.
- `imagenet_baseline_audit_manifest.yaml` - manifest for the ImageNet baseline
  audit table included under `results/other_experiments/imagenet100/`.
