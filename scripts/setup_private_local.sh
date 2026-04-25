#!/usr/bin/env bash
set -euo pipefail

# OpenManus private/local bootstrap script
# What it does:
# 1) Create config/config.toml from ollama example (if missing)
# 2) Create .venv and install requirements (optional)
# 3) Create .env.private from template (if missing)
# 4) Print remaining manual steps

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CURRENT_DIR="$(pwd)"

if [[ "$CURRENT_DIR" != "$ROOT_DIR" ]]; then
  echo "[info] 你現在在: $CURRENT_DIR"
  echo "[info] 腳本會自動切到專案根目錄: $ROOT_DIR"
fi

cd "$ROOT_DIR"
echo "[info] Current working directory: $(pwd)"

for required in main.py config scripts; do
  if [[ ! -e "$required" ]]; then
    echo "[error] 缺少 $required，請在 OpenManus 專案根目錄執行此腳本。"
    exit 1
  fi
done

SKIP_VENV="${SKIP_VENV:-0}"

find_compatible_python() {
  for candidate in python3.12 python3.11 python3.13 python3; do
    if command -v "$candidate" >/dev/null 2>&1; then
      if "$candidate" - <<'PY' >/dev/null 2>&1
import sys
ok = (3, 11) <= sys.version_info[:2] <= (3, 13)
raise SystemExit(0 if ok else 1)
PY
      then
        echo "$candidate"
        return 0
      fi
    fi
  done
  return 1
}

if [[ -n "${PYTHON_BIN:-}" ]]; then
  SELECTED_PYTHON="$PYTHON_BIN"
else
  if ! SELECTED_PYTHON="$(find_compatible_python)"; then
    cat <<'MSG'
[error] 找不到相容的 Python 版本。OpenManus 需要 Python 3.11 ~ 3.13。
你目前可能是 Python 3.14，所以會出現依賴衝突（像你截圖的 pillow / pydantic 問題）。

macOS 可先安裝 Python 3.12：
  brew install python@3.12

然後重跑（指定 Python）：
  PYTHON_BIN=python3.12 bash scripts/setup_private_local.sh
MSG
    exit 1
  fi
fi

echo "[info] Python binary: $SELECTED_PYTHON"
if ! "$SELECTED_PYTHON" - <<'PY' >/dev/null 2>&1
import sys
ok = (3, 11) <= sys.version_info[:2] <= (3, 13)
raise SystemExit(0 if ok else 1)
PY
then
  echo "[error] $SELECTED_PYTHON 不是相容版本，請改用 Python 3.11~3.13。"
  echo "[hint] 例如：PYTHON_BIN=python3.12 bash scripts/setup_private_local.sh"
  exit 1
fi

echo "[1/4] Preparing config/config.toml ..."
if [[ ! -f config/config.toml ]]; then
  cp config/config.example-model-ollama.toml config/config.toml
  echo "  created config/config.toml"
else
  echo "  skip (already exists)"
fi

echo "[2/4] Preparing .env.private ..."
if [[ ! -f .env.private ]]; then
  cp .env.private.example .env.private
  echo "  created .env.private"
else
  echo "  skip (already exists)"
fi

echo "[3/4] Preparing python venv ..."
if [[ "$SKIP_VENV" == "1" ]]; then
  echo "  skipped by SKIP_VENV=1"
else
  if [[ ! -d .venv ]]; then
    "$SELECTED_PYTHON" -m venv .venv
    echo "  created .venv"
  else
    echo "  .venv already exists"
  fi

  # shellcheck disable=SC1091
  source .venv/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
  echo "  dependencies installed"
fi

echo "[4/4] Bootstrap complete."

echo
cat <<'MSG'
Next manual steps (you run locally):

A) Ensure Ollama is installed and running:
   curl http://127.0.0.1:11434/api/tags

B) Pull local models (at least one):
   ollama pull llama3.2
   ollama pull llama3.2-vision

C) Run OpenManus directly:
   source .venv/bin/activate
   python main.py

D) Or run with Docker Compose (private profile):
   docker compose -f docker-compose.private.yml --env-file .env.private up -d
MSG
