# OpenManus 私有化本地端部署（超詳細步驟）

## -1) 先釐清：這些檔案在哪裡？

這些是 **GitHub 專案裡的檔案**，你一定要先 `git clone` 到本機，才看得到：

- `scripts/setup_private_local.sh`
- `scripts/run_private_local.sh`
- `docs_private_deploy_zh.md`
- `docker-compose.private.yml`
- `.env.private.example`

如果你本機還沒有下載專案，先跑：

```bash
cd /opt
git clone https://github.com/FoundationAgents/OpenManus.git openmanus
cd /opt/openmanus
git fetch --all --prune
```

如果變更在 PR 分支，請切到對應分支或 PR：

```bash
# git checkout <branch-name>
# 或
# git fetch origin pull/<PR_NUMBER>/head:pr-<PR_NUMBER>
# git checkout pr-<PR_NUMBER>
```

---

這份文件是給「第一次部署」的人。

目標：把 OpenManus 跑在你自己的機器（本機或內網伺服器），並用本地模型（Ollama），不依賴外部 OpenAI/Anthropic。

---

## -0.1) 先自我檢查：你是不是下載錯專案/錯資料夾

先在你目前的終端機貼：

```bash
pwd
ls
[ -f main.py ] && echo "OK: 有 main.py" || echo "錯誤: 沒有 main.py"
[ -f requirements.txt ] && echo "OK: 有 requirements.txt" || echo "錯誤: 沒有 requirements.txt"
[ -d app ] && echo "OK: 有 app/" || echo "錯誤: 沒有 app/"
[ -d config ] && echo "OK: 有 config/" || echo "錯誤: 沒有 config/"
```

任一項顯示錯誤，就先重抓正確版本：

```bash
cd ~/Downloads
rm -rf openmanus OpenManus-main
git clone https://github.com/FoundationAgents/OpenManus.git openmanus
cd openmanus
git remote -v
```

你應該看到 `FoundationAgents/OpenManus`。

---

## -0.2) 你截圖這個報錯的真正原因（先修這個）

### 不重抓專案也能救（直接修你本機檔案）

如果你現在已經在 `~/Downloads/OpenManus-main`，不想重抓 GitHub，直接貼這段：

```bash
cd ~/Downloads/OpenManus-main

# 把 pillow 改成和 crawl4ai 相容的版本
python3 - <<'PY'
from pathlib import Path
p = Path('requirements.txt')
s = p.read_text()
s = s.replace('pillow~=11.1.0', 'pillow~=10.4.0')
p.write_text(s)
print('requirements patched: pillow~=10.4.0')
PY

# 用 Python 3.12 重建環境
rm -rf .venv
python3.12 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
python main.py
```


> 補充：已修正 `pillow` 與 `crawl4ai` 的版本衝突。請先 `git pull`（或重新下載最新版 ZIP）再安裝依賴。


你畫面裡關鍵錯誤是：
- `Unsupported Python version 3.14.3, please use 3.11-3.13`
- `Cannot install ... because these package versions have conflicting dependencies`
- `ModuleNotFoundError: No module named 'pydantic'`

這不是你操作問題，是 Python 版本不相容。先改成 Python 3.12 再裝依賴。

請直接照貼（macOS）：

```bash
cd ~/Downloads/openmanus
brew install python@3.12
rm -rf .venv
python3.12 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
cp config/config.example-model-ollama.toml config/config.toml
python main.py
```

---

## -0.3) 你現在這種情況：`scripts/` 目錄不存在，怎麼辦？

你截圖裡已經證明：
- `bash scripts/run_private_local.sh` 報錯
- `ls scripts` 也報 `No such file or directory`

這代表你本機這份程式碼沒有包含輔助腳本。先不要卡在這裡，直接用「無 scripts 版本」啟動：

```bash
cd ~/Downloads/openmanus
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp config/config.example-model-ollama.toml config/config.toml
python main.py
```

> 另外你有一次打成 `[bash scripts/run_private_local.sh]`，中括號不要輸入。

---

## -0.4) 你截圖那個錯誤怎麼解（`scripts/run_private_local.sh` 不存在）

你畫面顯示：
`bash: scripts/run_private_local.sh: No such file or directory`

這通常是因為你下載到舊版 ZIP（檔案還沒進去那個版本）。

先在你目前目錄檢查：

```bash
cd ~/Downloads/OpenManus-main
ls scripts
```

- 有 `run_private_local.sh` → 直接跑：

```bash
bash scripts/run_private_local.sh
```

- 沒有 `run_private_local.sh` → 重新抓最新版：

```bash
cd ~/Downloads
rm -rf openmanus
git clone https://github.com/FoundationAgents/OpenManus.git openmanus
cd openmanus
bash scripts/run_private_local.sh
```

---

## -0.5) 不會 GitHub 指令？用網頁下載就好（最簡單）

你不用會 `git`，只要照著點：

1. 用瀏覽器開：`https://github.com/FoundationAgents/OpenManus`
2. 按綠色 **Code**
3. 按 **Download ZIP**
4. 下載完解壓縮
5. 打開終端機，切到解壓後資料夾（通常在 Downloads）

```bash
cd ~/Downloads/openmanus
bash scripts/run_private_local.sh
```

> 你只要確認這個資料夾裡看得到 `main.py`、`scripts/`、`config/` 就是正確路徑。

如果你要抓「某個 PR 的版本」：
1. 打開那個 PR 頁面
2. 點分支名稱（例如 `user:branch`）進入該分支
3. 在該分支頁面按 **Code → Download ZIP**

---

## 0. 先回答你最在意的三件事

1. **要複製去哪裡？**
   - 複製到你要跑服務的那台 Linux/macOS 主機的任意資料夾，例如：`/opt/openmanus`。

2. **在哪裡啟動？**
   - 一律在專案根目錄啟動（就是有 `main.py` 的那層目錄）。

3. **要跑在哪台機器？**
   - 可以跑在你的個人電腦（測試用），也可以跑在公司內網伺服器（正式用）。

---

## 0.4) 直接可複製的終端機指令（照貼）

> 打開終端機，整段複製貼上：

```bash
cd /opt
if [ ! -d /opt/openmanus ]; then
  git clone https://github.com/FoundationAgents/OpenManus.git openmanus
fi
cd /opt/openmanus
bash scripts/run_private_local.sh
```

如果你不是放在 `/opt/openmanus`，請改成你的實際路徑（例如 `~/openmanus`）。

---

## 0.5) 你如果想「我先幫你做好能做的」

已經提供一鍵初始化腳本，你只要在**專案根目錄**執行（同層要看得到 `main.py`、`config/`、`scripts/`）：

```bash
cd /opt/openmanus
bash scripts/setup_private_local.sh
```

它會自動幫你做：
- 建立 `config/config.toml`（若不存在）
- 建立 `.env.private`（若不存在）
- 建立 `.venv` 並安裝 `requirements.txt`

你只需要手動做「本機才做得到」的部分：安裝/啟動 Ollama、拉模型。

---

## 0.6) 先確認你現在「站的位置」對不對

先執行：

```bash
pwd
ls
```

你應該看到目前路徑像 `/opt/openmanus`，而且清單內有 `main.py`、`config`、`scripts`。  
如果不是，先切到專案根目錄：

```bash
cd /opt/openmanus
```

---

## 1) 機器需求（建議）

- OS: Ubuntu 22.04+（或其他 Linux/macOS）
- Python: 3.12
- RAM: 至少 8GB（16GB 更穩）
- 若要跑大模型，建議有 GPU；若無 GPU 也可先用小模型測試

---

## 2) 在哪裡操作（範例）

以下示範在 **Linux 伺服器** 操作。

```bash
# 你可以先進到你想放專案的路徑
cd /opt

# 下載專案
git clone https://github.com/FoundationAgents/OpenManus.git openmanus

# 進入專案根目錄（後面所有命令都在這裡跑）
cd /opt/openmanus
```

---

## 3) 安裝 Python 環境

```bash
# 建立虛擬環境
python3.12 -m venv .venv

# 啟用虛擬環境
source .venv/bin/activate

# 安裝依賴
pip install -r requirements.txt
```

---

## 4) 安裝並啟動本地模型（Ollama）

> 這一步在同一台機器執行即可。

```bash
# 安裝 Ollama（官方腳本）
curl -fsSL https://ollama.com/install.sh | sh

# 拉模型（先用小模型測試）
ollama pull llama3.2
ollama pull llama3.2-vision

# 啟動 ollama（通常安裝後已是 service）
# 可用以下檢查是否啟動成功：
curl http://127.0.0.1:11434/api/tags
```

---

## 5) 設定 OpenManus 連本地模型

在專案根目錄：

```bash
cp config/config.example-model-ollama.toml config/config.toml
```

這樣就完成基本設定。預設會連：`http://localhost:11434/v1`。

---

## 6) 啟動 OpenManus（重點）

仍在專案根目錄 `/opt/openmanus`：

```bash
source .venv/bin/activate
python main.py
```

看到可互動提示就代表成功。

---

## 7) 你如果要「內網私有化」再加這兩件事

1. **防火牆**
   - 只允許公司內網 IP 存取
   - 不要把 `11434` 對公網打開

2. **程式碼倉庫私有化**
   - 把此 repo mirror 到公司 GitLab/Gitea 私有倉庫

---

## 8) 一鍵 Docker 方式（可選）

若你不想自己裝 Python，可用 Docker：

```bash
# 在專案根目錄建 image
docker build -t openmanus:local .

# 啟動容器（先進 bash）
docker run --rm -it --name openmanus \
  -v $(pwd)/config:/app/OpenManus/config \
  --network host \
  openmanus:local

# 容器內再跑
python main.py
```

> 注意：`--network host` 是讓容器可直接連主機上的 `127.0.0.1:11434`。

---

## 9) 常見錯誤排查

1. `Connection refused 11434`
   - Ollama 沒啟動，先測：`curl http://127.0.0.1:11434/api/tags`

2. `ModuleNotFoundError`
   - 你沒在 `.venv` 裡，重跑：`source .venv/bin/activate`

3. `config.toml not found`
   - 你不在專案根目錄，先 `cd /opt/openmanus`

---

## 10) 最短版本（只要 6 行）

```bash
cd /opt
git clone https://github.com/FoundationAgents/OpenManus.git openmanus
cd /opt/openmanus
python3.12 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt
cp config/config.example-model-ollama.toml config/config.toml
python main.py
```



補充：專案已新增 `docker-compose.private.yml` 和 `.env.private.example`，可以直接拿來跑私有化容器模式。
