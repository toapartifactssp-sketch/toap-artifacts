#!/usr/bin/env bash
# Remove generated outputs ONLY. Never deletes source/, configs/, results/,
# logs/, checkpoints/, docs/, or env/.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$HERE"

echo "[clean] Removing generated outputs under outputs/ ..."
rm -rf outputs/cifar10_smoke outputs/cifar10_full
# Remove outputs/ entirely only if now empty of tracked content.
rmdir outputs 2>/dev/null || true

echo "[clean] Kept: source/ configs/ results/ logs/ checkpoints/ docs/ env/ MANIFEST.txt README.md"
echo "[clean] NOTE: the downloaded dataset under data/ is left intact (remove manually if desired)."
