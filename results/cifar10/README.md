# CIFAR-10 reference results

These are the metric tables/logs corresponding to the paper's CIFAR-10 numbers,
included **unchanged** except for sanitization of absolute paths. They serve as
reference values for `scripts/verify_cifar10_results.sh`.

- `rl_pre_av_paper_results.csv`, `rl_post_av_paper_results.csv` - TOAP RL
  edge-pruning headline rows (pre / post auto-vaccination).
- `auto_vaccination_paper_results.csv`, `auto_vaccination_final_metrics.json`,
  `auto_vaccination_rounds.csv` - auto-vaccination phase results.
- `adaptive_summary.json`, `adaptive_results.csv`, `adaptive_results_table.tex`,
  `adaptive_bank.jsonl`, `adaptive_candidates.jsonl` - adaptive final-patch eval.
- `combined_adaptive_results*.{csv,tex}` - combined adaptive table.
- `baseline_*_final_fixedbank.csv` - selected Fine-Pruning / Neural-Cleanse /
  NPD fixed-bank rows and the backdoored baseline row.

Bulk hyperparameter-sweep CSVs (thousands of per-run files) are intentionally
omitted; only the selected/final rows are included.
