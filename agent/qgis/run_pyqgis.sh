#!/bin/bash
# Run a PyQGIS script headless with QGIS's own Python. Falls back to running it inside the QGIS GUI (--code).
# Usage: bash agent/qgis/run_pyqgis.sh <job folder> <script.py relative to job>
#        bash agent/qgis/run_pyqgis.sh --selftest
REPO="$(cd "$(dirname "$0")/../.." && pwd)"
QGIS_APP="$(ls -d /Applications/QGIS*.app "$HOME"/Applications/QGIS*.app 2>/dev/null | head -1)"
[ -z "$QGIS_APP" ] && { echo "QGIS not found" >&2; exit 1; }
C="$QGIS_APP/Contents"
PY=""
for p in "$C/MacOS/python3" "$C/MacOS/bin/python3" "$C/Frameworks/Python.framework/Versions/Current/bin/python3"; do
  [ -x "$p" ] && { PY="$p"; break; }
done
[ -z "$PY" ] && PY="$(find "$C" -maxdepth 6 -type f -name 'python3*' -perm -u+x 2>/dev/null | grep -v config | head -1)"
export QGIS_PREFIX_PATH="$C/MacOS"
# QGIS 3.44 (vcpkg build): the stdlib + site-packages (incl. qgis) sit in Resources/python3.x, and the
# QGIS data (python plugins, proj, gdal) in Resources/qgis. Older bundles used Resources/python etc.
QRES="$C/Resources"; [ -d "$C/Resources/qgis/proj" ] && QRES="$C/Resources/qgis"
PP=""
for d in "$C"/Resources/python3*; do
  [ -d "$d/encodings" ] && PP="$PP:$d:$d/lib-dynload:$d/site-packages"
done
PP="$PP:$QRES/python:$QRES/python/plugins"
export PYTHONPATH="${PP#:}${PYTHONPATH:+:$PYTHONPATH}"
export QT_QPA_PLATFORM=offscreen
export PROJ_LIB="$QRES/proj"; export PROJ_DATA="$QRES/proj"; export GDAL_DATA="$QRES/gdal"

if [ "$1" = "--selftest" ]; then
  "$PY" -c "
from qgis.core import QgsApplication, Qgis; a=QgsApplication([], False); a.initQgis()
import processing; from processing.core.Processing import Processing; Processing.initialize()
n=len(QgsApplication.processingRegistry().algorithms()); print('PyQGIS', Qgis.version(), '-', n, 'Processing algorithms')
a.exitQgis(); raise SystemExit(0 if n > 0 else 1)" 2>&1 | grep -v -e 'Could not find platform' -e 'proj_get_authorities'
  exit "${PIPESTATUS[0]}"
fi

JOB="$(cd "$1" && pwd)"; SCRIPT="$2"
cd "$JOB" || exit 1
mkdir -p work
echo "===== $(date '+%F %T') $SCRIPT" >> work/qgis.log
export AGENT_JOB="$JOB" AGENT_REPO="$REPO"
if [ -n "$PY" ] && "$PY" -c "import qgis.core" >/dev/null 2>&1; then
  "$PY" "$SCRIPT" 2>&1 | tee -a work/qgis.log
  exit "${PIPESTATUS[0]}"
fi
echo "Headless PyQGIS not available; running inside the QGIS GUI with --code" | tee -a work/qgis.log
unset QT_QPA_PLATFORM
AGENT_QUIT_WHEN_DONE=1 "$C/MacOS/QGIS" --nologo --code "$JOB/$SCRIPT" >> work/qgis.log 2>&1
tail -20 work/qgis.log
