#!/bin/bash
# Run a helper script with the agent's python (agent/.venv with openpyxl + pillow, made by env_check.sh).
REPO="$(cd "$(dirname "$0")/.." && pwd)"
PY="$REPO/agent/.venv/bin/python3"; [ -x "$PY" ] || PY="$(command -v python3)"
exec "$PY" "$@"
