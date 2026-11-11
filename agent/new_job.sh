#!/bin/bash
# Create a numbered job folder in results/ and copy the user's files into it.
# Usage: bash agent/new_job.sh "<question name>" file1 [file2 …]
set -e
REPO="$(cd "$(dirname "$0")/.." && pwd)"
NAME="$1"; shift || true
[ -z "$NAME" ] && { echo "usage: new_job.sh \"<question name>\" files…" >&2; exit 1; }
SLUG="$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')"
mkdir -p "$REPO/results"
# Reuse an existing folder with the same slug, otherwise take the next number.
EXISTING="$(ls -d "$REPO"/results/[0-9][0-9]-"$SLUG" 2>/dev/null | head -1)"
if [ -n "$EXISTING" ]; then JOB="$EXISTING"; else
  N=$(ls -d "$REPO"/results/[0-9][0-9]-* 2>/dev/null | wc -l | tr -d ' ')
  JOB="$REPO/results/$(printf '%02d' $((N + 1)))-$SLUG"
fi
mkdir -p "$JOB"/{inputs,work,screenshots,final}
for f in "$@"; do
  if [ -e "$f" ]; then cp -R "$f" "$JOB/inputs/"; else echo "warning: not found: $f" >&2; fi
done
# Name the target image target.<ext> as well (first image file whose name is not already 'target').
if ! ls "$JOB"/inputs/target.* >/dev/null 2>&1; then
  IMG="$(ls "$JOB"/inputs/*.{png,PNG,jpg,JPG,jpeg,JPEG,heic,HEIC} 2>/dev/null | head -1 || true)"
  [ -n "$IMG" ] && cp "$IMG" "$JOB/inputs/target.${IMG##*.}"
fi
if [ ! -f "$JOB/REPORT.md" ]; then
  sed -e "s|{{NAME}}|$NAME|g" -e "s|{{DATE}}|$(date +%Y-%m-%d)|g" "$REPO/agent/REPORT_TEMPLATE.md" > "$JOB/REPORT.md"
fi
echo "$JOB"
