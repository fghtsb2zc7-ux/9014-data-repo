#!/bin/bash
# Find the tools this agent drives on macOS and write their paths to agent/env.json.
# Usage: bash agent/env_check.sh
REPO="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$REPO/agent/env.json"

first_existing() { for p in "$@"; do [ -e "$p" ] && { echo "$p"; return; }; done; echo ""; }

# --- R / Positron
RSCRIPT="$(command -v Rscript || true)"
[ -z "$RSCRIPT" ] && RSCRIPT="$(first_existing /usr/local/bin/Rscript /opt/homebrew/bin/Rscript /Library/Frameworks/R.framework/Resources/bin/Rscript)"
POSITRON_APP="$(first_existing /Applications/Positron.app "$HOME/Applications/Positron.app")"
R_VERSION=""; R_PKGS=""
if [ -n "$RSCRIPT" ]; then
  R_VERSION="$("$RSCRIPT" -e 'cat(R.version$major, R.version$minor, sep=".")' 2>/dev/null)"
  R_PKGS="$("$RSCRIPT" -e 'p <- c("tidyverse","janitor"); cat(paste0(p, "=", p %in% rownames(installed.packages())), sep=",")' 2>/dev/null)"
fi

# --- QGIS
QGIS_APP="$(ls -d /Applications/QGIS*.app "$HOME"/Applications/QGIS*.app 2>/dev/null | head -1)"
QGIS_PROCESS=""; QGIS_PYTHON=""; QGIS_VERSION=""
if [ -n "$QGIS_APP" ]; then
  QGIS_PROCESS="$(first_existing "$QGIS_APP/Contents/MacOS/qgis_process" "$QGIS_APP/Contents/MacOS/bin/qgis_process")"
  QGIS_PYTHON="$(first_existing "$QGIS_APP/Contents/MacOS/python3" "$QGIS_APP/Contents/MacOS/bin/python3" "$QGIS_APP/Contents/Frameworks/Python.framework/Versions/Current/bin/python3")"
  [ -z "$QGIS_PYTHON" ] && QGIS_PYTHON="$(find "$QGIS_APP/Contents" -maxdepth 6 -type f -name 'python3*' -perm -u+x 2>/dev/null | grep -v config | head -1)"
  QGIS_VERSION="$(defaults read "$QGIS_APP/Contents/Info" CFBundleShortVersionString 2>/dev/null)"
fi
PYQGIS_OK=false
if [ -n "$QGIS_PYTHON" ]; then
  if bash "$REPO/agent/qgis/run_pyqgis.sh" --selftest >/dev/null 2>&1; then PYQGIS_OK=true; fi
fi

# --- Excel
EXCEL_APP="$(first_existing "/Applications/Microsoft Excel.app" "$HOME/Applications/Microsoft Excel.app")"

# --- Python for helper scripts (system python3 with a local venv holding openpyxl + pillow)
SYS_PY="$(command -v python3 || true)"
VENV="$REPO/agent/.venv"
HELPER_PY=""
if [ -n "$SYS_PY" ] && "$SYS_PY" -c 'import sys; sys.exit(0)' 2>/dev/null; then
  if [ ! -x "$VENV/bin/python3" ]; then "$SYS_PY" -m venv "$VENV" >/dev/null 2>&1; fi
  if [ -x "$VENV/bin/python3" ]; then
    "$VENV/bin/python3" -c 'import openpyxl, PIL' 2>/dev/null || "$VENV/bin/python3" -m pip install -q openpyxl pillow >/dev/null 2>&1
    "$VENV/bin/python3" -c 'import openpyxl, PIL' 2>/dev/null && HELPER_PY="$VENV/bin/python3"
  fi
fi

# --- Screen capture permission (a tiny test capture)
SCREEN_OK=false
TMPPNG="$(mktemp -t envcheck).png"
if screencapture -x "$TMPPNG" 2>/dev/null && [ -s "$TMPPNG" ]; then SCREEN_OK=true; fi
rm -f "$TMPPNG"

cat > "$OUT" <<JSON
{
  "checked_at": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "rscript": "$RSCRIPT",
  "r_version": "$R_VERSION",
  "r_packages": "$R_PKGS",
  "positron_app": "$POSITRON_APP",
  "qgis_app": "$QGIS_APP",
  "qgis_version": "$QGIS_VERSION",
  "qgis_process": "$QGIS_PROCESS",
  "qgis_python": "$QGIS_PYTHON",
  "pyqgis_ok": $PYQGIS_OK,
  "excel_app": "$EXCEL_APP",
  "helper_python": "$HELPER_PY",
  "screen_capture_ok": $SCREEN_OK
}
JSON
cat "$OUT"
echo
[ -z "$RSCRIPT" ] && echo "MISSING: Rscript (install R from CRAN)"
echo "$R_PKGS" | grep -q "=FALSE" && echo "MISSING R packages: run install.packages(c('tidyverse','janitor'))"
[ -z "$QGIS_APP" ] && echo "MISSING: QGIS app in /Applications"
[ "$PYQGIS_OK" = false ] && [ -n "$QGIS_APP" ] && echo "WARNING: PyQGIS self-test failed; scripted QGIS runs will fall back to the GUI (--code)"
[ -z "$EXCEL_APP" ] && echo "MISSING: Microsoft Excel"
[ -z "$HELPER_PY" ] && echo "WARNING: no helper python (install Xcode command line tools: xcode-select --install)"
[ "$SCREEN_OK" = false ] && echo "WARNING: screen capture not permitted. System Settings > Privacy & Security > Screen Recording > enable Claude (and your terminal)"
exit 0
