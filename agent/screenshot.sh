#!/bin/bash
# Save a progress screenshot into <job>/screenshots/NN-label.png.
# Usage: bash agent/screenshot.sh <job folder> "<label>" [Excel|QGIS|Positron]
JOB="$1"; LABEL="$2"; APP="$3"
[ -d "$JOB" ] || { echo "usage: screenshot.sh <job folder> <label> [app]" >&2; exit 1; }
mkdir -p "$JOB/screenshots"
N=$(ls "$JOB"/screenshots/*.png 2>/dev/null | wc -l | tr -d ' ')
SLUG="$(echo "$LABEL" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')"
OUT="$JOB/screenshots/$(printf '%02d' $((N + 1)))-$SLUG.png"
if [ -n "$APP" ]; then
  case "$APP" in
    Excel) NAMEAPP="Microsoft Excel" ;;
    QGIS)  NAMEAPP="$(basename "$(ls -d /Applications/QGIS*.app | head -1)" .app)" ;;
    *)     NAMEAPP="$APP" ;;
  esac
  # Activate (the first call may wait on the Automation permission prompt), then check the app really is in
  # front and capture only its front window, so no other app ends up in the screenshot.
  FRONT=""
  for try in 1 2 3; do
    osascript -e "tell application \"$NAMEAPP\" to activate" >/dev/null 2>&1
    sleep 2
    FRONT="$(osascript -e 'tell application "System Events" to get name of first process whose frontmost is true' 2>/dev/null)"
    case "$FRONT" in "$NAMEAPP"|"$APP"|*"$APP"*) break ;; esac
  done
  case "$FRONT" in "$NAMEAPP"|"$APP"|*"$APP"*) ;; *)
    echo "Could not bring $NAMEAPP to the front (front app: $FRONT). Allow Automation for Claude in System Settings > Privacy & Security > Automation, or click the $NAMEAPP window, then retry." >&2
    exit 3 ;;
  esac
  RECT="$(osascript -e "tell application \"System Events\" to tell (first process whose frontmost is true) to tell front window
    set {x, y} to position
    set {w, h} to size
    return (x as text) & \",\" & (y as text) & \",\" & (w as text) & \",\" & (h as text)
  end tell" 2>/dev/null)"
fi
if screencapture -x ${RECT:+-R"$RECT"} "$OUT" 2>/dev/null && [ -s "$OUT" ]; then
  echo "$OUT"
else
  rm -f "$OUT"
  echo "SCREEN CAPTURE NOT PERMITTED: enable Screen Recording for Claude in System Settings > Privacy & Security. Save a rendered image of the result instead." >&2
  exit 2
fi
