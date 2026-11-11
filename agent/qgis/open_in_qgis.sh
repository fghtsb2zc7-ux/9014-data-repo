#!/bin/bash
# Open a QGIS project (.qgz) in the QGIS GUI so it can be screenshotted.
# Usage: bash agent/qgis/open_in_qgis.sh <job folder> <project.qgz relative to job>
JOB="$(cd "$1" && pwd)"
QGIS_APP="$(ls -d /Applications/QGIS*.app "$HOME"/Applications/QGIS*.app 2>/dev/null | head -1)"
open -a "$QGIS_APP" "$JOB/$2"
sleep 12
