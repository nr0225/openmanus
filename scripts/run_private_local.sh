#!/usr/bin/env bash
set -euo pipefail

# One-command entrypoint for local/private startup.
# Must be run from anywhere; script will move into repo root.
# Env:
#   SKIP_VENV=1            skip creating/installing venv in setup step
#   PYTHON_BIN=python3.12  override python binary
#   DRY_RUN=1              only print checks, do not execute python main.py

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[info] Repo root: $ROOT_DIR"

bash scripts/setup_private_local.sh

if [[ "${DRY_RUN:-0}" == "1" ]]; then
  echo "[info] DRY_RUN=1, skip Ollama check and python main.py"
  exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "[error] curl not found. Please install curl first."
  exit 1
fi

if ! curl -sf http://127.0.0.1:11434/api/tags >/dev/null; then
  cat <<'MSG'
[error] Ollama API not reachable at http://127.0.0.1:11434.
Please run these on your machine first:
  curl -fsSL https://ollama.com/install.sh | sh
  ollama pull llama3.2
Then re-run:
  bash scripts/run_private_local.sh
MSG
  exit 1
fi


# shellcheck disable=SC1091
source .venv/bin/activate
exec python main.py
