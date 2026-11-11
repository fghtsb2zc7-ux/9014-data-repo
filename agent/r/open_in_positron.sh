#!/bin/bash
# Open the job folder and a script in Positron (for the user to see and for screenshots).
# Usage: bash agent/r/open_in_positron.sh <job folder> [file relative to job]
JOB="$(cd "$1" && pwd)"; FILE="$2"
APP="$(ls -d /Applications/Positron.app "$HOME/Applications/Positron.app" 2>/dev/null | head -1)"
[ -z "$APP" ] && { echo "Positron not found" >&2; exit 1; }
CLI="$APP/Contents/Resources/app/bin/positron"
if [ -x "$CLI" ]; then
  if [ -n "$FILE" ]; then "$CLI" "$JOB" "$JOB/$FILE"; else "$CLI" "$JOB"; fi
else
  open -a "$APP" "$JOB"; [ -n "$FILE" ] && sleep 3 && open -a "$APP" "$JOB/$FILE"
fi
sleep 4
