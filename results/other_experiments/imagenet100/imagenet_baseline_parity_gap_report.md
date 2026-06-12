# ImageNet-100 / ResNet-50 Baseline Parity Gap Report

**Generated:** inspect-only audit of workspace ``  
**Purpose:** Evidence extraction for reviewer comment on ImageNet FP/NC/NPD baseline parity and repeated-run stability.  
**Machine-readable companions:**
- `outputs/audit/imagenet_baseline_parity_inventory.csv`
- `outputs/audit/imagenet_baseline_parity_gap_summary.json`

---

## SECTION 1 — Executive status table

| Run label | Expected grid | Completed rows | Failed/skipped | selected_config.json | final_fixedbank.csv | Table 8 traceable? | Status | Evidence path(s) |
|-----------|--------------:|---------------:|---------------:|:--------------------:|:-------------------:|:------------------:|--------|-------------------|
| FP full ImageNet parity grid | 324 | **3** | 0 | **No** | **No** | CANNOT VERIFY | **PARTIAL** | `outputs/imagenet100_rn50/baselines/fp/all_runs.csv` |
| NC full ImageNet parity grid | 1458 | **0** | 0 | **No** | **No** | CANNOT VERIFY | **MISSING** | (no `all_runs.csv`) |
| NPD full ImageNet parity grid | 3888 (YAML) / **256 (Table 8)** | **0** | 0 | **No** | **No** | CANNOT VERIFY | **INCONSISTENT** | (no `all_runs.csv`; grid count mismatch) |
| FP smoke | 1 | **1** | 0 | **Yes** | **Yes** | DOES NOT MATCH (smoke) | COMPLETE (smoke) | `outputs/imagenet100_rn50/baselines_smoke/fp/` |
| NC smoke | 1 | **1** | 0 | **Yes** | **Yes** | DOES NOT MATCH (smoke) | COMPLETE (smoke) | `outputs/imagenet100_rn50/baselines_smoke/nc/` |
| NPD smoke | 1 | **0** | 0 | **No** | **No** | CANNOT VERIFY | **MISSING (smoke)** | (no `npd/` dir) |
| Baseline repeated-run stability FP | 3 seeds | 0 | 0 | — | — | N/A | **MISSING** | none |
| Baseline repeated-run stability NC | 3 seeds | 0 | 0 | — | — | N/A | **MISSING** | none |
| Baseline repeated-run stability NPD | 3 seeds | 0 | 0 | — | — | N/A | **MISSING** | none |

**Headline:** Table 8 ImageNet FP/NC/NPD headline numbers are **not auditable** from completed full-grid artifacts in this workspace.

---

## SECTION 2 — Shared ImageNet-100/RN-50 protocol extraction

### Declared in YAML (`configs/baselines/imagenet100_rn50_baseline_parity_v3.yaml`)

| Field | Value | Source |
|-------|-------|--------|
| Benchmark | `imagenet100_rn50` | YAML L1 |
| Model | ResNet-50, `num_classes: 100` | YAML L5–6; `baseline_parity_imagenet100_common.py` L68–70 |
| `small_conv` | **False** (ImageNet path) | `load_model_for_ckpt(..., small_conv=False)` |
| Backdoored checkpoint | `experiment_output/paper_in100_rn50_v2/.../models/backdoored_final.pth` | YAML L12 |
| Backdoored checkpoint SHA-256 | `b26dbf4e0533f8b4db8ef54e28e025efc97d87b285aa5989227302e49167800d` | measured (file exists) |
| Data root | `./data/imagenet100` | YAML L7 |
| Clean reporting split | **`val`** | YAML L25 |
| Clean reporting size (logged) | **4999** | smoke `all_runs.csv` / `none_backdoored_fixedbank.csv` |
| Clean repair split (YAML) | **`train`** | YAML L26 |
| `clean_repair_size` (YAML) | **130000** | YAML L28 |
| **Actual repair data in code** | **Full clean `train` loader** via `load_clean_train_loader()` | `fine_pruning_imagenet100.py` L100; no subsampling |
| **`clean_repair_size` enforced?** | **NO** — key appears only in YAML; **zero matches in `*.py`** | grep `clean_repair` → none |
| Trigger family | `imagenet100_badnets_square_patch` | `protocol_manifest.json` |
| Trigger size / color | 12 px, `[1.0,1.0,1.0]` | YAML L8–9 |
| Image size | 224×224 | protocol manifest |
| Target label | **0** | YAML L3 |
| Incident / excluded position | **(212, 212)** | protocol manifest |
| ASR denominator | **`non_target`** | YAML L4; `evaluate_asr_non_target_loader` |
| T_probe path | `.../banks_imagenet100_badnets/tprobe.json` | YAML L16 |
| T_eval path | `.../teval.json` | YAML L17 |
| T_holdout path | `.../tholdout.json` | YAML L18 |
| Bank sizes | 8 / 16 / 16 | YAML L20–23 |
| Bank SHA-256 (smoke run) | T_probe `5eabf3a335369b5158886947764e72bd377a940f13df5d6bb79dd9784568ff46`; T_eval `6bb9692c78dc2e360133a244155059b1ae63a1c6a6652c3c9a6c179a6de020cb`; T_holdout `efd3fbb88c71c63d7394eade21ed5d9c06a594d4460b96adc838145cd1794dff` | `bank_disjointness_report.json` |
| Protocol manifest | `experiment_output/paper_in100_rn50_v2/.../protocol_manifest.json` | on disk |
| Protocol version | `imagenet100_badnets_fixed_protocol_v1_frozen` | manifest |
| Orchestrator seed | **1** | YAML L2 |
| Hardware (smoke only) | <GPU>, PyTorch 2.5.1+cu121, Python 3.12.7 | `baselines_smoke/run_manifest.json` |

### Allowed bank access (code-verified)

| Phase | T_probe | T_eval | T_holdout | T_init / T_expanded |
|-------|---------|--------|-----------|---------------------|
| Grid training + selection | **Yes** (`eval_tprobe=True`) | **No** | **No** | **Not loaded** |
| Final reporting | **No** | **Yes** | **Yes** | **Not loaded** |

**Sources:**

| Claim | File | Lines |
|-------|------|------:|
| Banks loaded: tprobe, teval, tholdout only | `imagenet100_baseline_parity.py` | 118–122 |
| FP grid: T_probe only | `fine_pruning_imagenet100.py` | 142, 170 |
| NC grid: T_probe only | `neural_cleanse_imagenet100.py` | 161, 188 |
| NPD grid: T_probe only | `npd_imagenet100.py` | 173, 200 |
| Non-target ASR | `baseline_parity_imagenet100_common.py` | 143–156, 177–181 |
| Selection rule | `baseline_parity_common.py` | 337–350 |

**T_init / T_expanded:** Not referenced in any `*imagenet100*baseline*` script. `texpanded` appears only in `auto_vaccination_imagenet100_revised.py` (TOAP), not baselines.

**NC restart seeds:** Separate grid dimension (`restart_seeds: [1,2,3]`); each inversion arm calls `set_deterministic(rseed)` (`neural_cleanse_imagenet100.py` L116–117). This is **not** the same as baseline repeated-run stability (Section 8).

---

## SECTION 3 — Full hyperparameter grid extraction and Table 8 count check

Config: `configs/baselines/imagenet100_rn50_baseline_parity_v3.yaml`

### FP — **324 configs** ✓ matches Table 8

| Dimension | Values | Count |
|-----------|--------|------:|
| `prune_scope` | last_block, layer4, layer3_layer4 | 3 |
| `prune_ratio` | 0.05, 0.10, 0.15, 0.20, 0.30, 0.40 | 6 |
| `fine_tune_epochs` | 3, 5, 10 | 3 |
| `lr` | 1e-4, 3e-4, 1e-3 | 3 |
| `weight_decay` | 0.0, 1e-4 | 2 |
| Fixed | AdamW, cosine scheduler, batch 64 | — |

**Product:** 3×6×3×3×2 = **324**

### NC — **1458 configs** ✓ matches Table 8

| Dimension | Values | Count |
|-----------|--------|------:|
| `inversion_steps` | 1000, 2000, 4000 | 3 |
| `inversion_lr` | 0.1, 0.3, 0.8 | 3 |
| `mask_reg` | 1e-4, 1e-3, 1e-2 | 3 |
| `restart_seeds` | 1, 2, 3 | 3 |
| `mitigation_epochs` | 3, 5, 10 | 3 |
| `mitigation_lr` | 1e-4, 3e-4, 1e-3 | 3 |
| `mitigation_weight_decay` | 0.0, 1e-4 | 2 |
| Fixed | image 224×3, inv/mit batch 64, AdamW, `candidate_targets: [0]` | — |

**Inversion arms:** 3×3×3×3 = 81  
**Mitigation per arm:** 3×3×2 = 18  
**Product:** 81×18 = **1458**

**Mitigation loss:** `CE(clean) + CE(triggered_with_inverted_patch)` on clean train loader (`neural_cleanse_imagenet100.py` L63–76).

### NPD — **INCONSISTENT: YAML 3888 vs Table 8 claim 256**

| Dimension | Values in v3 YAML | Count |
|-----------|-------------------|------:|
| `insert_layers` | layer4, layer3_layer4 | 2 |
| `train_scope` | polarizer_only, last_stage_unfreeze | 2 |
| `epochs` | 5, 10, 15 | 3 |
| `lr` | 1e-5, 5e-5, 1e-4 | 3 |
| `weight_decay` | 0.0, 1e-4 | 2 |
| `lambda_pol` | 0.5, 0.8, 1.0 | 3 |
| `lambda_sup` | 0.1, 0.5, 1.0 | 3 |
| `lambda_distill` | 0.0, 0.1, 0.5 | 3 |
| `margin` | 0.5, 1.0 | 2 |
| Fixed | τ=4.0, batch 64, AdamW | — |

**YAML product:** 2×2×3×3×2×3×3×3×2 = **3888**

**Table 8 claims:** **256** configs

**Reduced 256-grid config found?** **NO** — searched `configs/baselines/`; only:
- `imagenet100_rn50_baseline_parity_v3.yaml`
- `imagenet100_rn50_baseline_parity_v3_smoke.yaml`
- (CIFAR configs only otherwise; no `*npd*moderate*` for ImageNet)

**Status:** INCONSISTENT — resolve before claiming completed NPD parity or running NPD full grid.

---

## SECTION 4 — Grid-completion accounting

### FP full (`outputs/imagenet100_rn50/baselines/fp/all_runs.csv`)

| Metric | Value |
|--------|------:|
| Rows | **3** / 324 expected |
| Failed | 0 |
| Unique config hashes | 3 |
| Checkpoints | 3 under `fp/checkpoints/` |
| Per-config T_probe logs | 3 under `fp/runs/<hash>/per_trigger_tprobe.csv` |
| `selected_config.json` | **Missing** |
| `final_fixedbank.csv` | **Missing** |
| Resume/in-progress | Yes — 321 configs remain; no failure rows |

**Completed partial rows (all `last_block`, ratio 0.05, 3 epochs):**

| config_hash (prefix) | lr | wd | clean ACC % | W-ASR T_probe % | checkpoint |
|----------------------|----|----|------------:|------------------:|------------|
| `0779e67f…` | 1e-4 | 0.0 | 88.86 | 1.15 | `fp_0779e67f….pth` |
| `840dd277…` | 1e-4 | 1e-4 | 88.40 | 3.15 | `fp_840dd277….pth` |
| `9dcb13ae…` | 3e-4 | 0.0 | 87.72 | **0.020** | `fp_9dcb13ae….pth` |

Best of partial 3 (by selection rule): `9dcb13ae…` — **not a valid paper selection** (grid incomplete).

### NC full

- `outputs/imagenet100_rn50/baselines/nc/` — **directory absent**
- `all_runs.csv` — **missing**

### NPD full

- `outputs/imagenet100_rn50/baselines/npd/` — **directory absent**
- `all_runs.csv` — **missing**

### Timestamps

- No timestamp columns in `all_runs.csv` schema.
- `runtime_seconds` per T_probe eval only (~437–452 s for FP partial rows).

---

## SECTION 5 — Selection-rule verification

**Implementation:** `baseline_parity_common.select_best_run` (L337–350)

1. Minimize `w_asr_tprobe_pct`
2. Tie → maximize `clean_acc_pct`
3. Tie → minimize `complexity_score`
   - FP: `prune_ratio + 0.01×epochs` (`fine_pruning_imagenet100.py` L158)
   - NC: `inversion_steps + mitigation_epochs` (L177)
   - NPD: `epochs + (10 if last_stage_unfreeze else 0)` (`npd_imagenet100.py` L189)

### Smoke validation (complete 1-config grids)

| Method | Recomputed hash | `selected_config.json` hash | Match? |
|--------|-----------------|----------------------------|:------:|
| FP smoke | `03b1e3058186b8593b3bf1f4033ff8da4b22e22888c3fd78f885bb4314e54368` | same | **Yes** |
| NC smoke | `2a35b05adab512040ed989b4fab79e04ee3ffc9ace3f2e5d71b521fad4d3633d` | same | **Yes** |

### Full grid

**Selection cannot be validated because full grid is incomplete** (FP 3/324; NC/NPD 0).

---

## SECTION 6 — Final fixed-bank evaluation trace

### Table 8 claimed ImageNet metrics (paper reference values)

| Method | Clean ACC % | W-ASR T_eval % | W-ASR T_holdout % |
|--------|------------:|---------------:|------------------:|
| FP | 78.30 | 14.02 | 21.50 |
| NC | 87.00 | 13.10 | 18.70 |
| NPD | 87.50 | 17.90 | 25.40 |

### Full-grid final artifacts

| Method | `final_fixedbank.csv` | Verdict |
|--------|----------------------|---------|
| FP | **Missing** | **CANNOT VERIFY** |
| NC | **Missing** | **CANNOT VERIFY** |
| NPD | **Missing** | **CANNOT VERIFY** |

### Smoke measured finals (pipeline validation only)

| Method | Clean ACC | W-ASR T_eval | W-ASR T_holdout | vs Table 8 |
|--------|----------:|-------------:|----------------:|------------|
| FP smoke | 87.88 | 0.08 | 0.06 | **DOES NOT MATCH** |
| NC smoke | 63.93 | 0.46 | 0.40 | **DOES NOT MATCH** |

**Backdoored re-eval (smoke):** clean 88.54%, T_eval 99.90%, T_holdout 99.96% (`none_backdoored_fixedbank.csv`) — close to YAML locked row (88.68 / 99.90 / 99.90) but locked rows are **not** substitutes for measured full-grid finals.

**YAML `locked_rows`:** Reference placeholders in config; **not** tied to completed FP/NC/NPD full-grid `final_fixedbank.csv`.

### Final eval protocol (when complete)

- Script: `imagenet100_baseline_parity.py` → `run_fp` / `run_nc` / `run_npd`
- After `select_best_run`, selected checkpoint evaluated **once** with `eval_tprobe=False, eval_teval=True, eval_tholdout=True`
- Outputs: `{method}/final/per_trigger_teval.csv`, `per_trigger_tholdout.csv`, appended `final_fixedbank.csv`

---

## SECTION 7 — Smoke-result separation

| Method | Config count | selected_config | final_fixedbank | Notes |
|--------|-------------:|:---------------:|:---------------:|-------|
| FP smoke | 1 | Yes | Yes | layer4, ratio 0.10, 3 ep, lr 3e-4 |
| NC smoke | 1 | Yes | Yes | inv 500 steps; clean ACC collapse to 63.93% |
| NPD smoke | 1 | **No** | **No** | Run not completed / no artifacts |

**Smoke results validate the pipeline only; they do not establish the completed ImageNet parity grid or support Table 8 headline numbers.**

Smoke config: `configs/baselines/imagenet100_rn50_baseline_parity_v3_smoke.yaml`  
Smoke outputs: `outputs/imagenet100_rn50/baselines_smoke/`

---

## SECTION 8 — Baseline repeated-run stability search

**Search scope:** `outputs/imagenet100_rn50/`, `configs/baselines/`, baseline scripts — no stability CSVs, no seed-specific FP/NC/NPD rerun directories, no `*stability*` files under `outputs/`.

**Classification: D. MISSING** — no repeated-run baseline stability exists.

| Type | FP | NC | NPD |
|------|:--:|:--:|:---:|
| A. Full-selection stability (rerun entire grid+select per seed) | No | No | No |
| B. Selected-config stability (Table 8 config × seeds 1/2/3) | No | No | No |
| C. Partial/smoke only | Smoke FP/NC only | — | — |

**Table 12** reports TOAP post-AV repair seed stability only — **does not** address FP/NC/NPD.

### Minimal missing experiment (recommended)

For each **Table 8 selected** FP/NC/NPD hyperparameter vector (once full selection exists):

1. Rerun training with seeds `{1, 2, 3}` (selected-config stability).
2. Evaluate each final checkpoint **once** on T_eval and T_holdout.
3. Report mean±std of clean ACC, W-ASR(T_eval), W-ASR(T_holdout).

**No wrapper script exists** for selected-config seed stability (Section 10).

---

## SECTION 9 — Concrete missing-artifact checklist

| Method | Missing artifact | Why needed | Expected path | How to generate | Blocking dep | Priority |
|--------|------------------|------------|---------------|-----------------|--------------|----------|
| FP | Full `all_runs.csv` (324 rows) | Prove grid completed | `outputs/.../baselines/fp/all_runs.csv` | Resume full parity run | — | **MUST** |
| NC | Full `all_runs.csv` (1458 rows) | Same | `outputs/.../baselines/nc/all_runs.csv` | Run NC method | FP optional | **MUST** |
| NPD | Grid count resolution (256 vs 3888) | Table 8 consistency | YAML + paper text | Add reduced YAML or fix Table 8 | — | **MUST** |
| NPD | Full `all_runs.csv` | Prove grid completed | `outputs/.../baselines/npd/all_runs.csv` | After grid resolved | NPD YAML fix | **MUST** |
| FP | `selected_config.json` (full grid) | Selection audit | `baselines/fp/selected_config.json` | Complete 324 configs | Full grid | **MUST** |
| NC | `selected_config.json` | Selection audit | `baselines/nc/selected_config.json` | Complete NC grid | Full grid | **MUST** |
| NPD | `selected_config.json` | Selection audit | `baselines/npd/selected_config.json` | Complete NPD grid | Full grid | **MUST** |
| FP | `final_fixedbank.csv` | Table 8 traceability | `baselines/fp/final_fixedbank.csv` | Auto after selection | selected_config | **MUST** |
| NC | `final_fixedbank.csv` | Table 8 traceability | `baselines/nc/final_fixedbank.csv` | Auto after selection | selected_config | **MUST** |
| NPD | `final_fixedbank.csv` | Table 8 traceability | `baselines/npd/final_fixedbank.csv` | Auto after selection | selected_config | **MUST** |
| All | Per-trigger T_probe logs (full grid) | Appendix Table 16 | `{method}/runs/<hash>/per_trigger_tprobe.csv` | Part of grid run | Full grid | **SHOULD** |
| All | Teval/Tholdout final per-trigger logs | Final eval audit | `{method}/final/per_trigger_*.csv` | Final eval step | selected_config | **SHOULD** |
| All | `run_manifest.json` (full run) | Hardware/runtime audit | `outputs/.../baselines/run_manifest.json` | End of orchestrator | — | **SHOULD** |
| FP/NC/NPD | Selected-config stability (3 seeds) | Reviewer fairness | `outputs/.../baselines_stability/` (proposed) | New wrapper (Section 10) | Table 8 selected configs | **SHOULD** |
| — | `clean_repair_size` enforcement or doc | Audit accuracy | code or appendix text | Implement subsample or document "full train" | — | **OPTIONAL** |

**Prior audit note:** `results/imagenet_baseline_audit_table.csv` (older protocol sz5 / trigger 5) predates v2 artifacts and marks all methods `MISSING_BASELINE_ARTIFACTS`.

---

## SECTION 10 — Commands needed next

**Do not run unless explicitly instructed.** Listed for reproducibility.

### Resume / complete full FP grid (324 configs)

```powershell
cd 
python imagenet100_baseline_parity.py `
  --config configs/baselines/imagenet100_rn50_baseline_parity_v3.yaml `
  --method fp `
  --resume `
  --device cuda
```

### Complete NC full grid (1458 configs)

```powershell
python imagenet100_baseline_parity.py `
  --config configs/baselines/imagenet100_rn50_baseline_parity_v3.yaml `
  --method nc `
  --resume `
  --device cuda
```

### NPD — resolve grid first, then run

**Option A:** Fix Table 8 to 3888 and run current YAML.  
**Option B:** Add `configs/baselines/imagenet100_rn50_baseline_parity_v3_npd_moderate.yaml` with 256-count grid (2-level sweep, `lambda_distill: [0.0]` only), then:

```powershell
python imagenet100_baseline_parity.py `
  --config configs/baselines/imagenet100_rn50_baseline_parity_v3_npd_moderate.yaml `
  --method npd `
  --resume `
  --device cuda
```

### Export Table-16-style audit rows (after full runs)

```powershell
python tools/generate_imagenet_baseline_gap_report.py
```

(Extend this script to emit LaTeX/CSV appendix rows from completed `all_runs.csv` + `final_fixedbank.csv`.)

### Selected-config seed stability — **script does not exist**

**Smallest wrapper needed:** For each method, copy `selected_config.json` hyperparameters into a single-config YAML with `seed: {1,2,3}`, run one training job per seed, evaluate once on Teval/Tholdout. Proposed output root: `outputs/imagenet100_rn50/baselines_stability/{fp,nc,npd}/seed_{s}/`.

---

## SECTION 11 — Final answer summary

### What is currently supported

- ImageNet baseline parity **code path** exists: `imagenet100_baseline_parity.py`, `fine_pruning_imagenet100.py`, `neural_cleanse_imagenet100.py`, `npd_imagenet100.py`, `baseline_parity_imagenet100_common.py`.
- Full-grid **specifications** for FP (324) and NC (1458) in YAML match Table 8 counts.
- **Protocol guards** in code: selection on T_probe only; final eval on T_eval + T_holdout once; T_init/T_expanded not loaded by baselines; non-target ASR.
- **Smoke FP/NC** completed with valid selection-rule match and `final_fixedbank.csv`.
- **Partial FP full grid:** 3/324 configs with checkpoints and T_probe logs.
- **Bank hashes** and v2 protocol manifest documented and consistent across smoke outputs.

### What is not yet supported

- **Completed full-grid** FP (321 configs short), NC (0), NPD (0).
- **Any full-grid** `selected_config.json` or `final_fixedbank.csv` traceable to Table 8.
- **NPD grid count consistency** between YAML (3888) and Table 8 (256).
- **Baseline repeated-run stability** for FP/NC/NPD (Table 12 is TOAP-only).
- **`clean_repair_size`** documentation vs implementation alignment.
- **NPD smoke** completion.

### Minimum required before claiming completed ImageNet parity

1. Complete FP 324 + NC 1458 + NPD (resolved grid count) `all_runs.csv` rows.
2. Produce `selected_config.json` + `final_fixedbank.csv` per method from **full** grids.
3. Verify final metrics match Table 8 or update Table 8 to match measured finals.
4. Resolve NPD 256 vs 3888 inconsistency in paper + config.
5. Add appendix Table-16-style audit populated from artifacts (not locked YAML rows).

### Minimum required before answering repeated-run stability

1. Rerun **selected** Table 8 configs for FP/NC/NPD with seeds {1,2,3}.
2. One-shot Teval/Tholdout eval per seed.
3. New appendix stability table with mean±std — **or** explicit limitation that baseline stability was not measured.

### Conservative conclusion

**Table 8 ImageNet FP/NC/NPD parity numbers are not yet fully auditable from current workspace artifacts.** Only partial FP grid progress and smoke FP/NC pipeline validation exist. **Baseline repeated-run stability is missing; Table 12 does not address it.**
