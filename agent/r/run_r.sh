#!/bin/bash
# Run an R script with the job folder as working directory (relative paths like inputs/… work).
# Usage: bash agent/r/run_r.sh <job folder> <script.R relative to job>
JOB="$(cd "$1" && pwd)"; SCRIPT="$2"
RSCRIPT="$(command -v Rscript || ls /Library/Frameworks/R.framework/Resources/bin/Rscript /opt/homebrew/bin/Rscript /usr/local/bin/Rscript 2>/dev/null | head -1)"
[ -z "$RSCRIPT" ] && { echo "Rscript not found" >&2; exit 1; }
cd "$JOB" || exit 1
mkdir -p work
{ echo "===== $(date '+%F %T') $SCRIPT"; } >> work/r.log
# Plots printed outside ggsave() would land in Rplots.pdf in the job folder; send them to work/ instead.
[ -e Rplots.pdf ] && HAD_RPLOTS=1
"$RSCRIPT" --no-save --no-restore "$SCRIPT" 2>&1 | tee -a work/r.log
STATUS="${PIPESTATUS[0]}"
[ -z "$HAD_RPLOTS" ] && [ -e Rplots.pdf ] && mv Rplots.pdf work/Rplots.pdf
exit "$STATUS"
