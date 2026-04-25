<p align="center">
  <img src="assets/logo.jpg" width="200"/>
</p>

[English](README.md) | 中文 | [한국어](README_ko.md) | [日本語](README_ja.md)

[![GitHub stars](https://img.shields.io/github/stars/FoundationAgents/OpenManus?style=social)](https://github.com/FoundationAgents/OpenManus/stargazers)
&ensp;
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) &ensp;
[![Discord Follow](https://dcbadge.vercel.app/api/server/DYn29wFk9z?style=flat)](https://discord.gg/DYn29wFk9z)
[![Demo](https://img.shields.io/badge/Demo-Hugging%20Face-yellow)](https://huggingface.co/spaces/lyh-917/OpenManusDemo)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.15186407.svg)](https://doi.org/10.5281/zenodo.15186407)

# 👋 OpenManus

Manus 非常棒，但 OpenManus 无需邀请码即可实现任何创意 🛫！

我们的团队成员 [@Xinbin Liang](https://github.com/mannaandpoem) 和 [@Jinyu Xiang](https://github.com/XiangJinyu)（核心作者），以及 [@Zhaoyang Yu](https://github.com/MoshiQAQ)、[@Jiayi Zhang](https://github.com/didiforgithub) 和 [@Sirui Hong](https://github.com/stellaHSR)，来自 [@MetaGPT](https://github.com/geekan/MetaGPT)团队。我们在 3
小时内完成了开发并持续迭代中！

这是一个简洁的实现方案，欢迎任何建议、贡献和反馈！

用 OpenManus 开启你的智能体之旅吧！

我们也非常高兴地向大家介绍 [OpenManus-RL](https://github.com/OpenManus/OpenManus-RL)，这是一个专注于基于强化学习（RL，例如 GRPO）的方法来优化大语言模型（LLM）智能体的开源项目，由来自UIUC 和 OpenManus 的研究人员合作开发。

## 项目演示

<video src="https://private-user-images.githubusercontent.com/61239030/420168772-6dcfd0d2-9142-45d9-b74e-d10aa75073c6.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDEzMTgwNTksIm5iZiI6MTc0MTMxNzc1OSwicGF0aCI6Ii82MTIzOTAzMC80MjAxNjg3NzItNmRjZmQwZDItOTE0Mi00NWQ5LWI3NGUtZDEwYWE3NTA3M2M2Lm1wND9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAzMDclMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMzA3VDAzMjIzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTdiZjFkNjlmYWNjMmEzOTliM2Y3M2VlYjgyNDRlZDJmOWE3NWZhZjE1MzhiZWY4YmQ3NjdkNTYwYTU5ZDA2MzYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.UuHQCgWYkh0OQq9qsUWqGsUbhG3i9jcZDAMeHjLt5T4" data-canonical-src="https://private-user-images.githubusercontent.com/61239030/420168772-6dcfd0d2-9142-45d9-b74e-d10aa75073c6.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDEzMTgwNTksIm5iZiI6MTc0MTMxNzc1OSwicGF0aCI6Ii82MTIzOTAzMC80MjAxNjg3NzItNmRjZmQwZDItOTE0Mi00NWQ5LWI3NGUtZDEwYWE3NTA3M2M2Lm1wND9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTAzMDclMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwMzA3VDAzMjIzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTdiZjFkNjlmYWNjMmEzOTliM2Y3M2VlYjgyNDRlZDJmOWE3NWZhZjE1MzhiZWY4YmQ3NjdkNTYwYTU5ZDA2MzYmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.UuHQCgWYkh0OQq9qsUWqGsUbhG3i9jcZDAMeHjLt5T4" controls="controls" muted="muted" class="d-block rounded-bottom-2 border-top width-fit" style="max-height:640px; min-height: 200px"></video>

## 安装指南

我们提供两种安装方式。推荐使用方式二（uv），因为它能提供更快的安装速度和更好的依赖管理。

### 方式一：使用 conda

1. 创建新的 conda 环境：

```bash
conda create -n open_manus python=3.12
conda activate open_manus
```

2. 克隆仓库：

```bash
git clone https://github.com/FoundationAgents/OpenManus.git
cd OpenManus
```

3. 安装依赖：

```bash
pip install -r requirements.txt
```

### 方式二：使用 uv（推荐）

1. 安装 uv（一个快速的 Python 包管理器）：

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

2. 克隆仓库：

```bash
git clone https://github.com/FoundationAgents/OpenManus.git
cd OpenManus
```

3. 创建并激活虚拟环境：

```bash
uv venv --python 3.12
source .venv/bin/activate  # Unix/macOS 系统
# Windows 系统使用：
# .venv\Scripts\activate
```

4. 安装依赖：

```bash
uv pip install -r requirements.txt
```

### 浏览器自动化工具（可选）
```bash
playwright install
```

## 配置说明

OpenManus 需要配置使用的 LLM API，请按以下步骤设置：

1. 在 `config` 目录创建 `config.toml` 文件（可从示例复制）：

```bash
cp config/config.example.toml config/config.toml
```

2. 编辑 `config/config.toml` 添加 API 密钥和自定义设置：

```toml
# 全局 LLM 配置
[llm]
model = "gpt-4o"
base_url = "https://api.openai.com/v1"
api_key = "sk-..."  # 替换为真实 API 密钥
max_tokens = 4096
temperature = 0.0

# 可选特定 LLM 模型配置
[llm.vision]
model = "gpt-4o"
base_url = "https://api.openai.com/v1"
api_key = "sk-..."  # 替换为真实 API 密钥
```

## 我在哪裡改？你要怎麼抓到本機？

你看到的這些檔案，都是改在 **Git 倉庫裡**（不是你電腦自動出現）。

檔案路徑如下（都在專案根目錄下）：
- `scripts/setup_private_local.sh`
- `scripts/run_private_local.sh`
- `docs_private_deploy_zh.md`
- `docker-compose.private.yml`
- `.env.private.example`

### 你現在要做的（從 GitHub 下載到本機）

```bash
# 1) 先去你要放專案的資料夾
cd /opt

# 2) 從 GitHub 下載專案
git clone https://github.com/FoundationAgents/OpenManus.git openmanus

# 3) 進入專案
cd /opt/openmanus

# 4) 看目前分支
git branch

# 5) 把遠端最新資料抓下來
git fetch --all --prune
```

如果這些變更是在某個 PR 分支上，請再切那個分支：

```bash
# 範例：切到某個分支
# git checkout <branch-name>

# 或你知道 PR 號碼（例如 1234）
# git fetch origin pull/1234/head:pr-1234
# git checkout pr-1234
```

切好分支後，你可以直接檢查檔案是否存在：

```bash
ls scripts
ls -a | rg "\.env\.private\.example"
ls | rg "docs_private_deploy_zh.md|docker-compose.private.yml"
```

### 不會 GitHub 指令也可以（純網頁操作）

如果你看不懂 `git clone` 沒關係，照這個「點按鈕」版本：

1. 打開瀏覽器進到專案首頁：
   `https://github.com/FoundationAgents/OpenManus`
2. 按綠色按鈕 **Code**。
3. 按 **Download ZIP**。
4. 下載完後，解壓縮 ZIP（通常會在「下載」資料夾）。
5. 把解壓縮後資料夾重新命名成 `openmanus`（方便後面操作）。
6. 打開終端機，輸入（把路徑改成你的實際路徑）：

```bash
cd ~/Downloads/openmanus
bash scripts/run_private_local.sh
```

如果你是從某個 PR 網頁要抓版本：
1. 先打開那個 PR 頁面。
2. 在 PR 頁面找到 **Files changed**（可先確認有 `scripts/run_private_local.sh` 這些檔案）。
3. 回到 PR 頁面上方，按分支名稱（例如 `user:branch`），進入該分支。
4. 在該分支頁面按 **Code → Download ZIP**。

### 先確認你是不是下載錯專案（照貼這段）

先在你現在的資料夾直接貼上：

```bash
pwd
ls
[ -f main.py ] && echo "OK: 有 main.py" || echo "錯誤: 沒有 main.py"
[ -f requirements.txt ] && echo "OK: 有 requirements.txt" || echo "錯誤: 沒有 requirements.txt"
[ -d app ] && echo "OK: 有 app/" || echo "錯誤: 沒有 app/"
[ -d config ] && echo "OK: 有 config/" || echo "錯誤: 沒有 config/"
```

如果有任何一項顯示「錯誤」，代表你現在不在正確專案根目錄。

請直接重抓正確版本（macOS）：

```bash
cd ~/Downloads
rm -rf openmanus OpenManus-main
git clone https://github.com/FoundationAgents/OpenManus.git openmanus
cd openmanus
git remote -v
```

`git remote -v` 應該看到 `FoundationAgents/OpenManus`，看到就代表抓對了。

### 你現在畫面這種錯誤（`No such file or directory`）怎麼處理

你現在在 `OpenManus-main` 目錄，但那個版本裡可能還沒有 `scripts/run_private_local.sh`。  
先直接貼這段（macOS）：

```bash
cd ~/Downloads/OpenManus-main
ls scripts
```

- 如果看得到 `run_private_local.sh`：
```bash
bash scripts/run_private_local.sh
```

- 如果 **看不到** `run_private_local.sh`：代表你下載的是舊版 ZIP，請改用 Git 下載最新版本：

```bash
cd ~/Downloads
rm -rf openmanus
git clone https://github.com/FoundationAgents/OpenManus.git openmanus
cd openmanus
bash scripts/run_private_local.sh
```

如果你電腦沒有 git，先安裝 Xcode Command Line Tools：

```bash
xcode-select --install
```

### 如果你的版本沒有 `scripts/`（照你截圖這種）

你的畫面顯示 `ls scripts` 也不存在，代表你現在這份程式碼不包含我新增的輔助腳本。  
**沒關係，先用這組「不依賴 scripts」的指令直接跑：**

```bash
cd ~/Downloads/openmanus
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp config/config.example-model-ollama.toml config/config.toml
python main.py
```

> 注意：你先前輸入過 `[bash scripts/run_private_local.sh]`，中括號 `[]` 不要打；正確是 `bash scripts/run_private_local.sh`。

### 你這張圖現在這個錯誤（Python 3.14）有關係，而且是關鍵

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


有關係。你畫面裡有這行：`Unsupported Python version 3.14.3, please use 3.11-3.13`，
所以才會出現依賴衝突（`pillow` / `crawl4ai`）和 `ModuleNotFoundError: pydantic`。

請直接照貼（macOS）：

```bash
cd ~/Downloads/openmanus

# 1) 安裝相容 Python（3.12）
brew install python@3.12

# 2) 用 3.12 重建虛擬環境
rm -rf .venv
python3.12 -m venv .venv
source .venv/bin/activate

# 3) 重新安裝依賴
pip install --upgrade pip
pip install -r requirements.txt

# 4) 套用本地模型設定並啟動
cp config/config.example-model-ollama.toml config/config.toml
python main.py
```

如果你已經有 `scripts/setup_private_local.sh`，也可以改用：

```bash
cd ~/Downloads/openmanus
PYTHON_BIN=python3.12 bash scripts/setup_private_local.sh
```

## 私有化本地部署（一步一步）

如果你想把 OpenManus 變成「公司內網/本地機器可用」的私有部署，請直接看：[`docs_private_deploy_zh.md`](docs_private_deploy_zh.md)。

也可以直接執行一鍵初始化腳本（會先幫你建立 `config/config.toml`、`.env.private`、`.venv`）。

**執行位置一定要在專案根目錄**（同層要看得到 `main.py`、`config/`、`scripts/`）：

```bash
cd /opt/openmanus
bash scripts/setup_private_local.sh
```

### 你只要照貼這段到終端機（最簡單）

> 先打開你的終端機（Terminal），整段貼上後按 Enter：

```bash
cd /opt
if [ ! -d /opt/openmanus ]; then
  git clone https://github.com/FoundationAgents/OpenManus.git openmanus
fi
cd /opt/openmanus
bash scripts/run_private_local.sh
```

如果你不是裝在 `/opt/openmanus`，就把第 1~3 行改成你的路徑，例如：`cd ~/openmanus`。

## 快速启动

一行命令运行 OpenManus：

```bash
python main.py
```

然后通过终端输入你的创意！

如需使用 MCP 工具版本，可运行：
```bash
python run_mcp.py
```

如需体验不稳定的多智能体版本，可运行：

```bash
python run_flow.py
```

## 添加自定义多智能体

目前除了通用的 OpenManus Agent, 我们还内置了DataAnalysis Agent，适用于数据分析和数据可视化任务，你可以在`config.toml`中将这个智能体加入到`run_flow`中
```toml
# run-flow可选配置
[runflow]
use_data_analysis_agent = true     # 默认关闭，将其改为true则为激活
```
除此之外，你还需要安装相关的依赖来确保智能体正常运行：[具体安装指南](app/tool/chart_visualization/README_zh.md##安装)


## 贡献指南

我们欢迎任何友好的建议和有价值的贡献！可以直接创建 issue 或提交 pull request。

或通过 📧 邮件联系 @mannaandpoem：mannaandpoem@gmail.com

**注意**: 在提交 pull request 之前，请使用 pre-commit 工具检查您的更改。运行 `pre-commit run --all-files` 来执行检查。

## 交流群

加入我们的飞书交流群，与其他开发者分享经验！

<div align="center" style="display: flex; gap: 20px;">
    <img src="assets/community_group.jpg" alt="OpenManus 交流群" width="300" />
</div>

## Star 数量

[![Star History Chart](https://api.star-history.com/svg?repos=FoundationAgents/OpenManus&type=Date)](https://star-history.com/#FoundationAgents/OpenManus&Date)


## 赞助商
感谢[PPIO](https://ppinfra.com/user/register?invited_by=OCPKCN&utm_source=github_openmanus&utm_medium=github_readme&utm_campaign=link) 提供的算力支持。
> PPIO派欧云：一键调用高性价比的开源模型API和GPU容器

## 致谢

特别感谢 [anthropic-computer-use](https://github.com/anthropics/anthropic-quickstarts/tree/main/computer-use-demo)
和 [browser-use](https://github.com/browser-use/browser-use) 为本项目提供的基础支持！

此外，我们感谢 [AAAJ](https://github.com/metauto-ai/agent-as-a-judge)，[MetaGPT](https://github.com/geekan/MetaGPT)，[OpenHands](https://github.com/All-Hands-AI/OpenHands) 和 [SWE-agent](https://github.com/SWE-agent/SWE-agent).

我们也感谢阶跃星辰 (stepfun) 提供的 Hugging Face 演示空间支持。

OpenManus 由 MetaGPT 社区的贡献者共同构建，感谢这个充满活力的智能体开发者社区！

## 引用
```bibtex
@misc{openmanus2025,
  author = {Xinbin Liang and Jinyu Xiang and Zhaoyang Yu and Jiayi Zhang and Sirui Hong and Sheng Fan and Xiao Tang},
  title = {OpenManus: An open-source framework for building general AI agents},
  year = {2025},
  publisher = {Zenodo},
  doi = {10.5281/zenodo.15186407},
  url = {https://doi.org/10.5281/zenodo.15186407},
}
```
