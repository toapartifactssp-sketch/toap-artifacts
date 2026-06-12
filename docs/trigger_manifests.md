# Extracted CIFAR-10 and ImageNet-100 Trigger Manifests

## 1. Executive summary

The CIFAR-10 / ResNet-18 / BadNets experiment has materialized fixed-bank, auto-vaccination, and adaptive-evaluation artifacts in this checkout. The declared trigger space is a 3x3 white square overwrite patch over all integer top-left positions on 32x32 CIFAR tensors; the fixed banks, `Texpanded`, and final 16 `Tadapt` variants are available with exact locations and hashes.

The ImageNet-100 / ResNet-50 watermark experiment has authoritative code/config definitions for the declared watermark space, fixed-bank generator, auto-vaccination generator, and `Tadapt` generator. However, the referenced generated watermark artifact tree `experiment_output/im100_wm32` is not present in this checkout. Therefore exact ImageNet watermark bank memberships, accepted AV variants, and final `Tadapt` variants are `NOT FOUND`.

## 2. Evidence index

| Item | Benchmark | Value | Source file | Line number / config key | Confidence |
|---|---|---:|---|---|---|
| Trigger family | CIFAR-10 / ResNet-18 / BadNets | `cifar10_badnets_square_patch` | `protocol_banks.py` | lines 31-45, 91-102 | High |
| Patch size | CIFAR-10 / ResNet-18 / BadNets | 3 | `protocol_banks.py`; `configs/adaptive_eval/cifar10_resnet18.yaml` | lines 43-45; key `trigger_size`, line 13 | High |
| Patch color | CIFAR-10 / ResNet-18 / BadNets | `[1.0, 1.0, 1.0]` | `protocol_banks.py`; `configs/adaptive_eval/cifar10_resnet18.yaml` | lines 43-45, 115-119; key `trigger_color`, line 14 | High |
| Patch insertion | CIFAR-10 / ResNet-18 / BadNets | overwrite in `[0,1]` tensor before normalization | `data.py`; `scripts/eval_adaptive_final_patch.py` | lines 223-232, 248-260; lines 271-277 | High |
| Fixed-bank counts | CIFAR-10 / ResNet-18 / BadNets | Tprobe=8, Teval=16, Tholdout=16, Tinit/topt_init=16 | `experiment_output/paper_fixedbank_v3/cifar10_rn18_badnets_protocol/banks_cifar10_badnets/protocol_manifest.json` | keys `frozen_counts`, lines 7-12 | High |
| Bank seed | CIFAR-10 / ResNet-18 / BadNets | 1337 | `protocol_manifest.json` | key `bank_seed`, line 19 | High |
| Holdout distance | CIFAR-10 / ResNet-18 / BadNets | requested 6.0, used 3.0 center Chebyshev | `protocol_manifest.json`; `protocol_banks.py` | lines 13-14; lines 321-362, 485-500 | High |
| Hash rules | CIFAR-10 / ResNet-18 / BadNets | `sha256_params`, `sha256_mask` | `protocol_banks.py` | lines 83-102, 289-318 | High |
| AV rounds | CIFAR-10 / ResNet-18 / BadNets | final adaptive-eval AV artifact requested 4 rounds, executed/logged 1 accepted round | `auto_vaccination_revised_rerun_anti08/args.json`; `autovac_rounds.csv` | keys `max_rounds`, `round_simple_variants`, `searched_variants`, lines 44-56; lines 2-3 | High |
| Final `Texpanded` size | CIFAR-10 / ResNet-18 / BadNets | 21 in the artifact referenced by `configs/adaptive_eval/cifar10_resnet18.yaml` | `configs/adaptive_eval/cifar10_resnet18.yaml`; `auto_vaccination_revised_rerun_anti08/texpanded_provenance.json`; `paper_autovac_results_row.json` | key `expanded_bank_json`, line 8; key `total`, line 2; key `texpanded_size`, line 25 | High |
| `epsilon_AV` | CIFAR-10 / ResNet-18 / BadNets | NOT FOUND | `auto_vaccination_revised.py`; `args.json` | checked AV args/code, no key | High |
| `Tadapt` pool | CIFAR-10 / ResNet-18 / BadNets | enumerated all 900 valid 3x3 top-left locations, then rejected collisions | `scripts/eval_adaptive_final_patch.py`; `adaptive_summary.json` | lines 510-543; lines 14, 54-60 | High |
| `Tadapt` final bank | CIFAR-10 / ResNet-18 / BadNets | 16 variants | `results/adaptive_final_patch/cifar10_resnet18/adaptive_bank.jsonl` | lines 1-16 | High |
| `Tadapt` W-ASR and clean accuracy | CIFAR-10 / ResNet-18 / BadNets | W-ASR_adapt=2.8444444444%, clean accuracy=90.25% | `adaptive_summary.json` | lines 17-18 | High |
| Trigger family | ImageNet-100 / ResNet-50 / watermark | `imagenet100_watermark_alpha_blend` | `IM100_RN50_FNL/trigger.py` | lines 12-20 | High |
| Watermark pattern | ImageNet-100 / ResNet-50 / watermark | deterministic pseudo-logo P, generated in code | `IM100_RN50_FNL/trigger.py` | lines 27-60 | High |
| Pattern hash value | ImageNet-100 / ResNet-50 / watermark | NOT FOUND as materialized value; definition exists | `IM100_RN50_FNL/trigger.py` | lines 63-65, 192 | High |
| Alpha / opacity | ImageNet-100 / ResNet-50 / watermark | 0.5 | `IM100_RN50_FNL/trigger.py`; `IM100_RN50_FNL/configs/tadapt.yaml` | line 14; key `alpha`, line 6 | High |
| Coordinate grid | ImageNet-100 / ResNet-50 / watermark | stride-4 top-left grid, `u,v in {0,4,...,192}` | `IM100_RN50_FNL/trigger.py`; `IM100_RN50_FNL/banks.py` | lines 68-80; lines 267-269, 449 | High |
| d_min | ImageNet-100 / ResNet-50 / watermark | 8 px, top-left Chebyshev | `IM100_RN50_FNL/trigger.py`; `IM100_RN50_FNL/configs/tadapt.yaml` | lines 17, 83-85; key `d_min`, line 8 | High |
| Fixed-bank intended counts | ImageNet-100 / ResNet-50 / watermark | Tprobe=8, Teval=16, Tholdout=16, Tinit/topt_init=16 | `IM100_RN50_FNL/banks.py` | lines 22-26, 472-478 | High |
| Fixed-bank exact rows | ImageNet-100 / ResNet-50 / watermark | NOT FOUND | generated path referenced by `IM100_RN50_FNL/configs/tadapt.yaml` | `protocol_banks_dir`, line 14; path absent | High |
| `Texpanded` exact rows | ImageNet-100 / ResNet-50 / watermark | NOT FOUND | generated path referenced by `IM100_RN50_FNL/configs/tadapt.yaml` | `expanded_bank_json`, line 15; path absent | High |
| `Tadapt` intended proposals | ImageNet-100 / ResNet-50 / watermark | up to 2401 stride-4 positions | `IM100_RN50_FNL/banks.py`; `IM100_RN50_FNL/eval_tadapt.py` | lines 490-494; lines 388-390, 441-447 | High |
| `Tadapt` generated output | ImageNet-100 / ResNet-50 / watermark | NOT FOUND | generated path referenced by `IM100_RN50_FNL/configs/tadapt.yaml` | `output_dir`, line 16; path absent | High |

## 3. CIFAR-10 / ResNet-18 / BadNets

### 3.1 Declared trigger space S

The declared trigger family is `cifar10_badnets_square_patch`: fixed square RGB patch variants whose only free parameter is top-left location. The generator stores `trigger_size`, `trigger_color`, `image_size`, `u`, and `v` in the canonical parameter hash (`protocol_banks.py` lines 31-45, 91-102).

- Trigger type: square BadNets overwrite patch (`protocol_banks.py` lines 31-45; `data.py` lines 223-232).
- Patch size: 3 (`protocol_banks.py` lines 43-45; `configs/adaptive_eval/cifar10_resnet18.yaml` line 13).
- Patch pattern: solid RGB square. No pattern file found; the patch is represented by `trigger_color_tensor` and written into the image tensor (`data.py` lines 127-128, 223-232).
- Patch RGB values: `[1.0, 1.0, 1.0]` (`protocol_banks.py` lines 43-45, 115-119; `configs/adaptive_eval/cifar10_resnet18.yaml` line 14).
- Opacity / alpha: no alpha/opacity parameter found for CIFAR BadNets; insertion overwrites pixels (`data.py` lines 223-232; `scripts/eval_adaptive_final_patch.py` lines 271-277).
- Coordinate convention: integer top-left `(u, v)` (`protocol_banks.py` lines 47-50; `data.py` lines 195-221).
- Valid coordinate range: all integer `u,v` with `0 <= u <= 29`, `0 <= v <= 29` for 32x32 image and 3x3 trigger (`protocol_banks.py` lines 47-50; `scripts/eval_adaptive_final_patch.py` lines 527-529).
- Insertion order: base transform produces a tensor in `[0,1]`, trigger is applied, then CIFAR normalization is applied (`data.py` lines 99-115, 248-260).
- Clipping: dataset insertion by overwrite does not explicitly clip (`data.py` lines 223-232); adaptive-eval batch insertion clamps to `[0,1]` (`scripts/eval_adaptive_final_patch.py` lines 271-277).
- Target label ID: 0 (`configs/adaptive_eval/cifar10_resnet18.yaml` line 12; `logs/final_metrics_fixed_bank.json` line 8).
- Target label name: NOT FOUND.

### 3.2 Fixed trigger banks

| Bank | Size | Exact variants / locations | Sampling rule | Seed | Hash rule | Disjointness rule | Source |
|---|---:|---|---|---:|---|---|---|
| Tprobe | 8 | `u12_v9`, `u6_v10`, `u23_v10`, `u29_v7`, `u3_v24`, `u1_v18`, `u22_v16`, `u18_v26` | quadrant-stratified uniform within bins | 1337 (`bank_seed`); sub-seed `bank_seed+11` | `sha256_params` and `sha256_mask` | reserved-bank disjointness by position + `sha256_params` + `sha256_mask` | `tprobe.json` lines 18-31, 33-194; `protocol_banks.py` lines 432-447, 289-318 |
| Tinit / `topt_init` | 16 | `u3_v7`, `u0_v12`, `u4_v11`, `u7_v14`, `u27_v5`, `u18_v3`, `u15_v2`, `u27_v11`, `u10_v16`, `u13_v22`, `u7_v26`, `u11_v23`, `u16_v23`, `u24_v19`, `u28_v19`, `u18_v17` | quadrant-stratified uniform within bins | 1337; sub-seed `bank_seed+31` | `sha256_params` and `sha256_mask` | same reserved-bank rule | `topt_init.json` lines 18-31, 33-355; `protocol_banks.py` lines 432-436, 462-472 |
| Teval | 16 | `u10_v6`, `u4_v6`, `u5_v11`, `u4_v12`, `u20_v11`, `u18_v2`, `u26_v1`, `u21_v4`, `u4_v29`, `u9_v19`, `u4_v22`, `u14_v27`, `u18_v15`, `u21_v15`, `u19_v26`, `u19_v24` | quadrant-stratified uniform within bins | 1337; sub-seed `bank_seed+23` | `sha256_params` and `sha256_mask` | same reserved-bank rule | `teval.json` lines 18-31, 33-354; `protocol_banks.py` lines 432-436, 450-460 |
| Tholdout | 16 | `u7_v5`, `u10_v12`, `u2_v0`, `u8_v2`, `u24_v13`, `u15_v5`, `u18_v6`, `u15_v11`, `u4_v19`, `u13_v17`, `u0_v22`, `u10_v27`, `u22_v24`, `u25_v16`, `u26_v24`, `u19_v29` | quadrant-stratified uniform within bins + center-distance from incident/Tprobe/Teval/Tinit and internal spacing | 1337; sub-seed `bank_seed+37` | `sha256_params` and `sha256_mask` | same reserved-bank rule; holdout center-distance requested 6.0, used 3.0 | `tholdout.json` lines 18-31, 33-355; `protocol_manifest.json` lines 13-14; `protocol_banks.py` lines 474-500 |

### 3.3 Auto-vaccination and Texpanded

The final CIFAR adaptive-evaluation config points to `auto_vaccination_revised_rerun_anti08/expanded_bank.json`, not the separate `rl_ablation/probe_only_auto_vaccination` artifact (`configs/adaptive_eval/cifar10_resnet18.yaml` line 8). This referenced AV run requested `max_rounds=4`, uses `init_simple_variants=11`, `init_bank_mode=incident_jitter`, `simple_jitter=2`, `round_simple_variants=12`, `round_simple_mode=mixed`, `searched_variants=12`, `search_probe_n=1024`, `tau_stop=0.02`, `min_center_dist=0`, `anti_w=0.8`, and seed 1 (`auto_vaccination_revised_rerun_anti08/args.json` lines 40-72). It logged one accepted AV round and final `|Texpanded|=21` (`paper_autovac_results_row.json` lines 24-30; `texpanded_provenance.json` lines 1-29). The AV implementation starts with the incident trigger, adds jittered/random simple variants, then per round ranks remaining positions by probe ASR and adds top searched variants (`auto_vaccination_revised.py` lines 913-918, 963-991).

| Round | Candidate generation rule | Acceptance threshold | Accepted variants | Final Texpanded size | Source |
|---|---|---|---|---:|---|
| 0 / start | Incident `(29,29)` plus `incident_jitter` positions around incident; duplicate/protected positions skipped | NOT FOUND as `epsilon_AV`; exact-position duplicate skip only; `min_center_dist=0` | `u29_v29`, `u29_v28`, `u28_v29`, `u28_v27`, `u29_v27`, `u27_v29`, `u28_v28`, `u27_v28`, `u27_v27` | 9 at start | `start_bank.json` lines 20-93; `auto_vaccination_revised.py` lines 606-621, 913-918 |
| 1 | `round_simple_mode=mixed` plus `searched_hard` top 12 by probe ASR over remaining valid positions | NOT FOUND as `epsilon_AV`; ranked top `searched_variants=12` | `u21_v18`, `u23_v17`, `u21_v17`, `u13_v24`, `u21_v12`, `u23_v16`, `u22_v17`, `u23_v18`, `u13_v25`, `u14_v25`, `u15_v25`, `u15_v26` | 21 final | `auto_vaccination_revised_rerun_anti08/round_1_added_variants.json` lines 1-134; `expanded_bank_manifest.csv` lines 11-22; `autovac_rounds.csv` lines 2-3 |

Rejected AV variants: NOT FOUND as an explicit rejected-variant log. The implementation silently skips exact duplicate positions in `LocationBank.add` (`auto_vaccination_revised.py` lines 606-610) and filters protected banks before candidate generation (`auto_vaccination_revised.py` lines 901-911).

### 3.4 Tadapt generator

| Proposal rule | Total proposals | Collision rejections | Near-duplicate rejections | Valid candidates scored | Selection rule | Final Tadapt variants | Adaptive clean subset | Final W-ASR_adapt | Source |
|---|---:|---:|---:|---:|---|---|---|---:|---|
| Enumerate `trigger.all_positions()` for all valid 3x3 top-left locations on CIFAR, then reject collisions with Tprobe/Tinit/Teval/Tholdout/Texpanded by canonical or rendered/mask hash | 900 total valid positions by code (`30 x 30`); 823 valid scored after 77 duplicate/collision rejections | 77 (`duplicate_existing_bank`) | 0 (`duplicate_tadapt=0`; no `near_duplicate_d_min` rule in CIFAR Tadapt) | 823 | Sort by descending search-split ASR, descending target logit mean, ascending target CE mean, then ascending `v`, ascending `u`; select top 16 | `tadapt_0_u17_v25` (2.8%), `tadapt_1_u18_v25` (2.2333%), `tadapt_2_u18_v23` (2.1111%), `tadapt_3_u17_v23` (1.8778%), `tadapt_4_u18_v22` (1.9444%), `tadapt_5_u18_v24` (2.0%), `tadapt_6_u19_v25` (1.6333%), `tadapt_7_u17_v22` (1.5667%), `tadapt_8_u16_v25` (2.8444%), `tadapt_9_u21_v25` (1.5444%), `tadapt_10_u17_v24` (2.0889%), `tadapt_11_u16_v26` (2.0111%), `tadapt_12_u17_v26` (1.9%), `tadapt_13_u20_v25` (1.4%), `tadapt_14_u15_v24` (1.8556%), `tadapt_15_u15_v23` (1.7889%) | Search split=`train`, `num_clean_samples=512`, `non_target_only=true`, seed=1001; final clean eval uses full test clean loader, 10000 clean samples, 9000 non-target samples for ASR | 2.8444444444%; clean accuracy 90.25% | `scripts/eval_adaptive_final_patch.py` lines 510-579; `configs/adaptive_eval/cifar10_resnet18.yaml` lines 24-33; `adaptive_summary.json` lines 14-20, 54-60; `adaptive_bank.jsonl` lines 1-16 |

Scoring objective details: the candidate score computes target-class success rate on non-target search samples as `search_split_asr_percent`, plus target logit mean and target cross-entropy. The `search_objective_value` stored in CIFAR is negative target CE, but the selection sort first uses `search_split_asr_percent` (`scripts/eval_adaptive_final_patch.py` lines 370-406, 545-552). Final per-variant ASR values are in `adaptive_bank.jsonl` lines 1-16.

### 3.5 Missing CIFAR information

- Target label name for label ID 0: NOT FOUND.
- Numeric `epsilon_AV`: NOT FOUND. AV code exposes `tau_stop`, `anti_w`, and ranking counts, but no `epsilon_AV` key or parameter was found (`auto_vaccination_revised.py` lines 794-827; AV `args.json` lines 40-72).
- Explicit AV rejected-variant file: NOT FOUND. Round accepted variants are logged, but rejected simple/search proposals are not written separately.
- CIFAR `d_min` for AV/Tadapt: NOT FOUND as a named `d_min`; fixed-bank holdout uses `min_center_distance`, and AV run uses `min_center_dist=0`.
- CIFAR `Texpanded=60`: NOT FOUND. Checked generated CIFAR AV provenance files; materialized totals found were 17, 21, and 33, with the final adaptive-eval config referencing the 21-variant artifact.

## 4. ImageNet-100 / ResNet-50 / watermark

### 4.1 Declared trigger space S

The declared watermark trigger family is `imagenet100_watermark_alpha_blend` with protocol version `imagenet100_watermark_fixed_protocol_v1_frozen` (`IM100_RN50_FNL/trigger.py` lines 12-20).

- Trigger type: fixed 32x32 alpha-blended watermark (`IM100_RN50_FNL/trigger.py` line 1, lines 12-20).
- Watermark size: 32 (`IM100_RN50_FNL/trigger.py` line 13; `IM100_RN50_FNL/configs/tadapt.yaml` line 5).
- Pattern P: deterministic pseudo-logo in RGB `[0,1]`, shape `(3, 32, 32)`, generated in code: dark blue base, white ring, gold cross, cyan corners, deterministic speckle (`IM100_RN50_FNL/trigger.py` lines 27-60).
- Pattern source file path: no external pattern source file found; pattern is generated by `make_fixed_pattern` (`IM100_RN50_FNL/trigger.py` lines 27-60).
- Pattern hash: materialized value NOT FOUND; definition is SHA256 over `make_fixed_pattern(seed).tobytes()` (`IM100_RN50_FNL/trigger.py` lines 63-65), and variants store `pattern_hash` when generated (`IM100_RN50_FNL/trigger.py` line 192).
- Alpha / opacity: 0.5 (`IM100_RN50_FNL/trigger.py` line 14; `IM100_RN50_FNL/configs/tadapt.yaml` line 6).
- Blending formula: `tau_u(x) = (1-M_u)*x + M_u*((1-alpha)*x + alpha*P)` (`IM100_RN50_FNL/trigger.py` lines 213-228; `IM100_RN50_FNL/banks.py` line 450).
- Coordinate convention: integer top-left `(u, v)` (`IM100_RN50_FNL/trigger.py` lines 68-80, 179-197).
- Valid coordinate range: stride-4 grid `u,v in {0,4,8,...,192}` on 224x224 for 32x32 watermark (`IM100_RN50_FNL/trigger.py` lines 68-80; `IM100_RN50_FNL/banks.py` lines 267-269, 449).
- Incident bottom-right position: `(192,192)` (`IM100_RN50_FNL/trigger.py` lines 88-97).
- Insertion order: resize/crop/augmentation creates a tensor, watermark is inserted, then ImageNet normalization is applied (`IM100_RN50_FNL/data.py` lines 149-183, 294-332).
- Insertion-time value domain: tensor in `[0,1]` (`IM100_RN50_FNL/trigger.py` lines 213-228; `IM100_RN50_FNL/data.py` lines 149-183, 294-302).
- Clipping: output is clamped to `[0,1]` after blending (`IM100_RN50_FNL/trigger.py` line 228).
- Target label ID: 0 (`IM100_RN50_FNL/configs/tadapt.yaml` line 3; `IM100_RN50_FNL/main.py` lines 71-72).
- Target label name: NOT FOUND.

### 4.2 Fixed trigger banks

Generated watermark bank JSONs are NOT FOUND in this checkout. The code/config define the intended construction below.

| Bank | Size | Exact variants / locations | Sampling rule | Seed | Hash rule | Disjointness rule | Source |
|---|---:|---|---|---:|---|---|---|
| Tprobe | 8 intended | NOT FOUND; generated `banks_im100_wm32/tprobe.json` absent | quadrant-stratified uniform on stride-4 grid; `d_min` enforced internally | `bank_seed=1337` in run script; sub-seed `bank_seed+11` | canonical `sha256_params`; rendered `sha256_rendered`; mask `sha256_mask` | reserved-bank disjointness by position + `sha256_params` + `sha256_rendered` | `IM100_RN50_FNL/banks.py` lines 22-26, 289-302, 362-374; `IM100_RN50_FNL/run_all.ps1` lines 27-49 |
| Tinit / `topt_init` | 16 intended | NOT FOUND; generated `banks_im100_wm32/topt_init.json` absent | quadrant-stratified uniform on stride-4 grid; `d_min` enforced against prior banks | `bank_seed=1337`; sub-seed `bank_seed+31` | same hash rules | same disjointness rule | `IM100_RN50_FNL/banks.py` lines 289-292, 316-324, 404-416 |
| Teval | 16 intended | NOT FOUND; generated `banks_im100_wm32/teval.json` absent | quadrant-stratified uniform on stride-4 grid; `d_min` enforced against prior positions | `bank_seed=1337`; sub-seed `bank_seed+23` | same hash rules | same disjointness rule | `IM100_RN50_FNL/banks.py` lines 289-313, 376-388 |
| Tholdout | 16 intended | NOT FOUND; generated `banks_im100_wm32/tholdout.json` absent | quadrant-stratified on stride-4 grid; min `d_U` from prior banks and internal spacing; relaxes downward if infeasible | `bank_seed=1337`; sub-seed `bank_seed+37` | same hash rules | same disjointness rule; holdout distance validator | `IM100_RN50_FNL/banks.py` lines 327-353, 390-402, 498-500 |

Bank construction details:

- Intended candidate universe: 2401 positions, because `u,v in {0,4,...,192}` (`IM100_RN50_FNL/banks.py` lines 449, 469; line 492 says scan all stride-4 positions in S up to 2401 candidates).
- Distance function `d_b(u,u')`: `max(|i-i'|, |j-j'|)` on top-left coordinates (`IM100_RN50_FNL/trigger.py` lines 83-85; `IM100_RN50_FNL/banks.py` line 451).
- `d_min`: 8 (`IM100_RN50_FNL/trigger.py` line 17; `IM100_RN50_FNL/banks.py` lines 26, 452, 470).
- Canonical trigger hash: SHA256 of sorted JSON containing family, pattern hash, patch size, alpha, stride, image size, `u`, `v` (`IM100_RN50_FNL/trigger.py` lines 164-177).
- Rendered-trigger hash: SHA256 of full-image rendered blend on a reference gray background (`IM100_RN50_FNL/trigger.py` lines 146-162).
- Collision rejection: duplicate position, `sha256_params`, or rendered hash across reserved banks raises an error (`IM100_RN50_FNL/banks.py` lines 176-199).
- Near-duplicate rejection: bank sampling enforces `d_min` via `_far_enough_from_refs` and `_sample_stratified_positions` (`IM100_RN50_FNL/banks.py` lines 75-85, 88-137, 294-324, 327-353).
- Reuse across repair seeds: manifest policy says same `bank_seed` and same `protocol_dir` must be reused across model seeds/runs (`IM100_RN50_FNL/banks.py` lines 483-488).
- Exceptions to disjointness: NOT FOUND for generated watermark banks. Code enforces reserved-bank disjointness and search-space non-overlap (`IM100_RN50_FNL/banks.py` lines 176-199, 234-248, 498-500).

### 4.3 Auto-vaccination and Texpanded

No generated ImageNet watermark AV outputs were found. The referenced config points to `./experiment_output/im100_wm32/.../auto_vaccination_revised/expanded_bank.json`, but `experiment_output/im100_wm32` is absent (`IM100_RN50_FNL/configs/tadapt.yaml` lines 12-16).

| Round | Candidate generation rule | Acceptance threshold | Accepted variants | Final Texpanded size | Source |
|---|---|---|---|---:|---|
| Initial `Texpanded` / `Tstart` | Code starts with incident trigger, then adds `init_simple_variants=11` using `incident_jitter` by default; start RNG is `seed+17` | `epsilon_AV` NOT FOUND; duplicate positions skipped; optional `min_center_dist` default 0 | NOT FOUND for ImageNet watermark generated run | NOT FOUND | `IM100_RN50_FNL/auto_vacc.py` lines 814-823, 917-942 |
| AV rounds | Code default `max_rounds=3`; each round adds simple variants and `searched_variants=8` hard positions ranked by probe ASR | `epsilon_AV` NOT FOUND; `tau_stop=0.02` is early-stop threshold, not an acceptance epsilon | NOT FOUND for ImageNet watermark generated run | NOT FOUND | `IM100_RN50_FNL/auto_vacc.py` lines 823-850, 987-1045 |
| Final `Texpanded` | Code writes `expanded_bank.json`, `expanded_bank_manifest.csv`, `texpanded_provenance.json`, and round accepted-variant JSONs | NOT FOUND | NOT FOUND | NOT FOUND | `IM100_RN50_FNL/auto_vacc.py` lines 914-942, 1017-1065 |

Search space used for ImageNet watermark AV candidates: `all_valid_positions(trigger_size)` returns every integer top-left location from `0` to `IMAGE_HW-trigger_size` in each axis, not the stride-4 watermark protocol grid (`IM100_RN50_FNL/auto_vacc.py` lines 646-660, 933-940, 1000-1010). This differs from the fixed-bank watermark grid. Whether this was intended for the final paper run cannot be verified from generated logs because the ImageNet watermark AV outputs are missing.

Whether AV uses same `d_min` and hash rules as bank construction: NOT FOUND for generated outputs. Code default uses exact-position uniqueness in `LocationBank.add`, optional `min_center_dist` default 0, and a separate AV `bank_hash` over variant list and trigger config (`IM100_RN50_FNL/auto_vacc.py` lines 223-237, 629-644, 655-660, 818). It does not use the watermark `sha256_params` / `sha256_rendered` collision checks for AV candidate acceptance in the same way as `banks.py`.

Files/logs recording accepted and rejected variants: code would record accepted variants in `round_{r}_added_variants.json`, `expanded_bank.json`, and `expanded_bank_manifest.csv` (`IM100_RN50_FNL/auto_vacc.py` lines 1017-1018, 1063-1065). Rejected variants are NOT FOUND; code does not appear to write a rejected-candidate log for AV.

### 4.4 Tadapt generator

| Proposal rule | Total proposals | Collision rejections | Near-duplicate rejections | Valid candidates scored | Selection rule | Final Tadapt variants | Adaptive clean subset | Final W-ASR_adapt | Source |
|---|---:|---:|---:|---:|---|---|---|---:|---|
| Enumerate `trigger.all_positions()` on the watermark stride-4 grid. Each candidate stores params `{u,v,patch_size,alpha}`, canonical hash, and rendered hash. | Intended 2401 proposals (`49 x 49` grid, `u,v in {0,4,...,192}`); code summary would write `num_candidates_in_S=len(trigger.all_positions())`. No generated log present. | NOT FOUND as generated count; code rejects `hp in existing_params` or `pos in existing_positions`. | NOT FOUND as generated count; code rejects positions within `d_min=8` of existing or already accepted Tadapt positions. | NOT FOUND as generated count; code would write `num_candidates_scored`. | Sort scored candidates by descending `search_split_asr_percent`, then ascending `v`, ascending `u`; select first `k_adapt=16`. | NOT FOUND; `tadapt_bank.jsonl` absent. | Config: split=`val`, `num_clean_samples=512`, `non_target_only=true`, seed=1. Objective: non-target target-class success / ASR on search split. | NOT FOUND; `tadapt_results.csv` and `tadapt_summary.json` absent. | `IM100_RN50_FNL/configs/tadapt.yaml` lines 1-27; `IM100_RN50_FNL/eval_tadapt.py` lines 382-468; `IM100_RN50_FNL/trigger.py` lines 68-80 |

Additional `Tadapt` details:

- Adaptive pool is enumerated, not sampled: the loop iterates `for pos in trigger.all_positions()` (`IM100_RN50_FNL/eval_tadapt.py` line 388).
- Exact grid rule: `range(0, h - s + 1, stride)` for both axes, with `h=w=224`, `s=32`, `stride=4` (`IM100_RN50_FNL/trigger.py` lines 68-80).
- Coordinate range: `0,4,8,...,192` in both axes (`IM100_RN50_FNL/banks.py` lines 267-269, 449).
- Candidate scoring: `score_candidate` applies watermark to non-target subset, normalizes, predicts, and returns `search_split_asr_percent` and `search_objective_value=asr` (`IM100_RN50_FNL/eval_tadapt.py` lines 287-312).
- Final evaluation: each selected candidate is evaluated on a triggered eval loader, and clean accuracy is computed on a clean eval loader (`IM100_RN50_FNL/eval_tadapt.py` lines 422-449).

### 4.5 Missing ImageNet watermark information

- Generated watermark fixed-bank files (`tprobe.json`, `teval.json`, `tholdout.json`, `topt_init.json`) under `experiment_output/im100_wm32/.../banks_im100_wm32`: NOT FOUND.
- Exact ImageNet watermark bank variants/locations: NOT FOUND.
- Generated ImageNet watermark `search_space_av.json` and `master_universe.json`: NOT FOUND.
- Materialized watermark pattern hash value: NOT FOUND. Hash definition is present in code.
- ImageNet watermark AV outputs (`expanded_bank.json`, `expanded_bank_manifest.csv`, `round_{r}_added_variants.json`, `texpanded_provenance.json`): NOT FOUND.
- ImageNet watermark `Texpanded=84`: NOT FOUND because the generated watermark AV outputs are absent.
- `epsilon_AV`: NOT FOUND.
- ImageNet watermark `Tadapt` outputs (`tadapt_results.csv`, `tadapt_summary.json`, `tadapt_bank.jsonl`, `tadapt_candidates.jsonl`): NOT FOUND.
- ImageNet watermark candidate rejection counts, valid scored count, final 16 `Tadapt` variants, per-variant ASR, final W-ASR_adapt, and clean accuracy: NOT FOUND because generated `Tadapt` output directory is absent.
- Target label name for label ID 0: NOT FOUND.

Files/searches checked for missing ImageNet watermark outputs: `IM100_RN50_FNL/trigger.py`, `IM100_RN50_FNL/banks.py`, `IM100_RN50_FNL/data.py`, `IM100_RN50_FNL/auto_vacc.py`, `IM100_RN50_FNL/eval_tadapt.py`, `IM100_RN50_FNL/configs/tadapt.yaml`, `IM100_RN50_FNL/configs/baseline.yaml`, `IM100_RN50_FNL/run_all.ps1`; filename searches for `**/*watermark*`, `**/*wm32*`, `**/im100_wm32*`, `**/tadapt_results.csv`, `**/tadapt_*.jsonl`, and direct check of `experiment_output/im100_wm32`.

## 5. Ready-to-paste paper table rows

| Benchmark | Declared S and trigger parameterization | Bank split and disjointness | Tadapt generator |
|---|---|---|---|
| CIFAR-10 / ResNet-18 / BadNets | `S = {3x3 white RGB overwrite patch at integer top-left (u,v): u,v in [0,29]}` on 32x32 CIFAR tensors; patch color `[1.0,1.0,1.0]`; inserted after `ToTensor()` in `[0,1]` and before normalization; target label ID 0. Sources: `protocol_banks.py` lines 31-50, 91-102; `data.py` lines 99-115, 223-232, 248-260. | Fixed protocol banks with `bank_seed=1337`: `|Tprobe|=8`, `|Tinit/topt_init|=16`, `|Teval|=16`, `|Tholdout|=16`; quadrant-stratified uniform sampling; disjointness by exact position + `sha256_params` + `sha256_mask`; Tholdout center-distance requested 6.0, used 3.0. Sources: `protocol_manifest.json` lines 7-21; `protocol_banks.py` lines 289-318, 432-500. | Enumerates all 900 valid 3x3 locations, rejects 77 duplicate/collision candidates against fixed banks/`Texpanded`, scores 823 valid non-target candidates on 512 clean train samples with seed 1001, selects top 16 by search-split ASR with tie-breaks target logit, target CE, `v`, `u`; final W-ASR_adapt 2.8444%, clean accuracy 90.25%. Sources: `configs/adaptive_eval/cifar10_resnet18.yaml` lines 24-33; `scripts/eval_adaptive_final_patch.py` lines 510-579; `adaptive_summary.json` lines 14-20, 54-60. |
| ImageNet-100 / ResNet-50 / watermark | `S = {32x32 deterministic pseudo-logo watermark P alpha-blended at stride-4 top-left (u,v): u,v in {0,4,...,192}}` on 224x224 tensors; `alpha=0.5`, `pattern_seed=20250607`, `d_min=8`; inserted after resize/crop/ToTensor in `[0,1]`, before normalization; target label ID 0. Pattern hash value [MISSING: materialized pattern hash]. Sources: `IM100_RN50_FNL/trigger.py` lines 12-20, 27-80, 204-228; `IM100_RN50_FNL/data.py` lines 149-183, 294-332. | Intended fixed protocol banks with `bank_seed=1337`: `|Tprobe|=8`, `|Tinit/topt_init|=16`, `|Teval|=16`, `|Tholdout|=16`; quadrant-stratified stride-4 sampling with `d_min=8`; disjointness by exact position + `sha256_params` + `sha256_rendered`; exact bank rows [MISSING: generated banks_im100_wm32 JSONs]. Sources: `IM100_RN50_FNL/banks.py` lines 22-26, 176-199, 251-500; `IM100_RN50_FNL/run_all.ps1` lines 27-49. | Intended generator enumerates all 2401 stride-4 positions, rejects collisions and near-duplicates with `d_min=8`, scores non-target ASR on 512 clean val samples with seed 1, sorts by search-split ASR then `v,u`, and selects `k_adapt=16`; final variants and metrics [MISSING: `tadapt_bank.jsonl`, `tadapt_summary.json`]. Sources: `IM100_RN50_FNL/configs/tadapt.yaml` lines 21-27; `IM100_RN50_FNL/eval_tadapt.py` lines 382-468; `IM100_RN50_FNL/banks.py` lines 490-494. |
