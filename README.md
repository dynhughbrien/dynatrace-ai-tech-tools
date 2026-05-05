# dynatrace-ai-se-project

Dynatrace AI Resource for Sales Engineers — a curated guide covering the key Dynatrace + AI GitHub projects, `dtctl` setup, LLM API configuration, GitHub CLI workflows, and recommended AI command-line tools.

---

## Table of Contents

- [Related GitHub Projects (virtualrussel)](#related-github-projects-virtualrussel)
- [Dynatrace dtctl Installation](#dynatrace-dtctl-installation)
- [AI / LLM API Configuration](#ai--llm-api-configuration)
- [GitHub CLI Commands](#github-cli-commands)
- [Recommended AI Command-Line Tools](#recommended-ai-command-line-tools)

---

## Related GitHub Projects (virtualrussel)

The following public GitHub projects from [@virtualrussel](https://github.com/virtualrussel) combine Dynatrace observability with AI/LLM tooling:

### 1. [dynatrace-se-ai-workspace](https://github.com/virtualrussel/dynatrace-se-ai-workspace)

> Dynatrace AI workspace — Skills, prompts, MCP config, and Copilot instructions for observability investigations

An AI-powered observability workspace for Dynatrace that combines GitHub Copilot or Claude AI, the Dynatrace MCP server, `dtctl`, and the [dynatrace-for-ai](https://github.com/Dynatrace/dynatrace-for-ai) skills framework. Pre-configured for the shared Dynatrace demo environment (`guu84124.apps.dynatrace.com`).

**Key features:**
- 13 Dynatrace domain skills (DQL, problems, logs, tracing, services, Kubernetes, AWS, etc.)
- 7 pre-built investigation prompt workflows (health-check, daily-standup, incident-response, etc.)
- Dual MCP server support (production + sprint tenants)
- Works with both GitHub Copilot and Claude Code

```bash
git clone https://github.com/virtualrussel/dynatrace-se-ai-workspace.git
cd dynatrace-se-ai-workspace
```

### 2. [dynatrace-ai-dtctl-workspace](https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace)

> Dynatrace AI workspace — Skills, prompts, MCP config, and Copilot instructions for observability investigations (dtctl-focused variant)

A workspace variant that emphasises `dtctl` integration — the kubectl-style Dynatrace CLI — alongside GitHub Copilot or Claude AI for terminal-level observability workflows.

**Key features:**
- Same 13 Dynatrace domain skills and 7 investigation prompts
- dtctl skill for managing Dynatrace resources directly from the terminal
- Structured for use with a single configurable tenant ID

```bash
git clone https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace.git
cd dynatrace-ai-dtctl-workspace
```

---

## Dynatrace dtctl Installation

[`dtctl`](https://github.com/dynatrace-oss/dtctl) is a kubectl-style CLI for Dynatrace that gives terminal-level access to DQL queries, workflows, notebooks, and more. It is required by both workspaces above. Use v0.27.0 or newer.

### Install

```bash
# macOS / Linux — direct install (no package manager required)
curl -fsSL https://raw.githubusercontent.com/dynatrace-oss/dtctl/main/install.sh | bash
```

Verify the installation:

```bash
dtctl version
```

### Authenticate

**Option A — OAuth login (local desktop with keyring: macOS / Windows / Linux)**

```bash
dtctl auth login --context production \
  --environment "https://YOUR_TENANT_ID.apps.dynatrace.com"
```

**Option B — Token-based auth (GitHub Codespaces / CI / headless environments)**

```bash
dtctl config set-context production \
  --environment "https://YOUR_TENANT_ID.apps.dynatrace.com" \
  --token-ref production-token

dtctl config set-credentials production-token --token <YOUR_PLATFORM_TOKEN>
```

Create a platform token in Dynatrace: **Identity & Access Management → Access Tokens → Generate new token → Platform token**.

If OAuth fails with a `keyring probe failed` or `dbus-launch` error, use Option B.

### Verify

```bash
dtctl doctor
```

### Common Commands

```bash
# Run a DQL query
dtctl query 'fetch dt.davis.problems | filter event.status == "ACTIVE" | limit 5'

# Run with named client context (appears in Dynatrace audit logs)
dtctl query --client-context "incident-response" \
  'fetch dt.davis.problems | filter event.status == "ACTIVE" | limit 5'

# Verify a query (dry-run)
dtctl verify query 'fetch dt.davis.problems | limit 5'

# List resources
dtctl get workflows
dtctl get notebooks
dtctl get documents --add-fields "originExtensionId,labels,shareInfo.isShared"

# Switch between configured contexts
dtctl config use-context production
dtctl config use-context sprint

# Configure a second (sprint) environment
dtctl auth login --context sprint \
  --environment "https://YOUR_TENANT_ID.sprint.apps.dynatracelabs.com"
```

### Update Skills

After installing the workspace, keep skills current with:

```bash
npx skills add dynatrace/dynatrace-for-ai
npx skills add dynatrace-oss/dtctl
```

---

## AI / LLM API Configuration

### When API credentials are required

| Scenario | API_URL required | API_KEY required |
|---|---|---|
| Running a local LLM (e.g. Ollama, LM Studio) | Optional (defaults to `localhost`) | ❌ Not required |
| Using a public/free-tier model endpoint | Varies by provider | Varies by provider |
| GitHub Copilot (VS Code / CLI) | ❌ Managed by GitHub auth | ❌ Managed by GitHub auth |
| Claude Code (Anthropic) | ❌ Managed by Anthropic auth | ❌ Managed by Anthropic auth |
| OpenAI API (GPT-4o, o3, etc.) | ✅ `https://api.openai.com/v1` | ✅ Required |
| Azure OpenAI | ✅ `https://<resource>.openai.azure.com/` | ✅ Required |
| Anthropic API (direct) | ✅ `https://api.anthropic.com` | ✅ Required |
| AWS Bedrock | ✅ Regional endpoint | ✅ AWS credentials |
| Google Vertex AI / Gemini API | ✅ Regional endpoint | ✅ Service account / API key |
| Other OpenAI-compatible providers | ✅ Provider-specific URL | ✅ Required |

### Setting environment variables

Export these in your shell profile (`.bashrc`, `.zshrc`, etc.) or use a `.env` file (never commit secrets):

```bash
# Generic OpenAI-compatible endpoint
export API_URL="https://api.openai.com/v1"
export API_KEY="sk-..."

# Anthropic
export ANTHROPIC_API_KEY="sk-ant-..."

# Azure OpenAI
export AZURE_OPENAI_API_KEY="..."
export AZURE_OPENAI_ENDPOINT="https://<resource>.openai.azure.com/"
export AZURE_OPENAI_API_VERSION="2024-12-01-preview"

# AWS Bedrock (uses standard AWS credential chain)
export AWS_DEFAULT_REGION="us-east-1"

# Google Gemini
export GEMINI_API_KEY="..."

# Local Ollama (no token needed)
export OLLAMA_HOST="http://localhost:11434"
```

Store secrets in a password manager or use a secrets manager (AWS Secrets Manager, HashiCorp Vault, GitHub Codespaces secrets) — never hard-code tokens in source files.

---

## GitHub CLI Commands

### Setup

```bash
# Install gh CLI (macOS)
brew install gh

# Install gh CLI (Linux / Codespaces)
# https://github.com/cli/cli#installation
sudo apt install gh

# Authenticate
gh auth login

# Verify
gh auth status
```

### Repository Operations

```bash
# Clone a repo
gh repo clone virtualrussel/dynatrace-se-ai-workspace

# Fork a repo
gh repo fork virtualrussel/dynatrace-se-ai-workspace --clone

# Create a new repo
gh repo create my-repo --public --clone

# View repo info
gh repo view virtualrussel/dynatrace-se-ai-workspace

# List your repos
gh repo list
```

### Issues

```bash
# List open issues
gh issue list

# Create an issue
gh issue create --title "Bug: something broken" --body "Steps to reproduce..."

# View an issue
gh issue view 42

# Close an issue
gh issue close 42
```

### Pull Requests

```bash
# List open PRs
gh pr list

# Create a PR from current branch
gh pr create --title "feat: add new workflow" --body "Description of changes"

# View a PR
gh pr view 7

# Check out a PR locally
gh pr checkout 7

# Merge a PR
gh pr merge 7 --squash

# Review a PR
gh pr review 7 --approve
gh pr review 7 --request-changes --body "Please address the comments"
```

### GitHub Copilot CLI

```bash
# Install the Copilot CLI extension
gh extension install github/gh-copilot

# Ask a question about a CLI command
gh copilot suggest "how do I undo my last git commit"

# Explain a command
gh copilot explain "git rebase -i HEAD~3"
```

### Git Essentials

```bash
# Clone
git clone https://github.com/virtualrussel/dynatrace-se-ai-workspace.git

# Create and switch to a new branch
git checkout -b feat/my-feature

# Stage and commit
git add .
git commit -m "feat: add my feature"

# Push branch and set upstream
git push -u origin feat/my-feature

# Pull latest changes
git pull --rebase origin main

# View status and log
git status
git log --oneline -10

# Stash uncommitted changes
git stash
git stash pop
```

---

## Recommended AI Command-Line Tools

The following tools are well-suited for AI-assisted development directly from the terminal or editor. All work well alongside Dynatrace observability workflows.

### ⭐ Claude Code (Recommended)

**[Claude Code](https://claude.ai/code)** — Anthropic's agentic AI coding tool. Runs in the terminal and operates autonomously across your codebase: reads files, runs commands, writes and edits code, and manages git workflows.

```bash
# Install
npm install -g @anthropic-ai/claude-code

# Launch in current directory
claude

# Run with a task
claude "investigate why the checkout service error rate increased after the last deploy"
```

**Best for:** Deep codebase investigation, multi-file refactors, incident triage with Dynatrace MCP integration.
Requires a Claude Pro or Team subscription (or direct API key via `ANTHROPIC_API_KEY`).

---

### ⭐ GitHub Copilot CLI

**[GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli)** — AI assistance for shell commands and Git operations, integrated with the `gh` CLI.

```bash
# Install
gh extension install github/gh-copilot

# Suggest a shell command
gh copilot suggest "compress all png files in a directory"

# Explain an existing command
gh copilot explain "awk '{print $2}' access.log | sort | uniq -c | sort -rn | head"
```

**Best for:** Shell command discovery, quick Git explanations, inline help while working in the terminal.
Requires a GitHub Copilot subscription.

---

### opencode

**[opencode](https://opencode.ai)** — An open-source, terminal-based AI coding assistant that supports multiple LLM providers (OpenAI, Anthropic, Google, AWS Bedrock, Ollama, and more).

```bash
# Install
npm install -g opencode-ai

# Launch interactive session
opencode

# Specify a model
opencode --model anthropic/claude-sonnet-4-5
```

**Best for:** Teams wanting provider flexibility, local LLM support, or an open-source alternative to proprietary tools.
Supports `API_URL` / `API_KEY` for any OpenAI-compatible endpoint.

---

### aider

**[aider](https://aider.chat)** — AI pair programming in the terminal. Edits code across multiple files and automatically commits changes to git.

```bash
# Install
pip install aider-install
aider-install

# Start with OpenAI GPT-4o
aider --model gpt-4o

# Start with Claude Sonnet
aider --model anthropic/claude-sonnet-4-5

# Start with a local Ollama model
aider --model ollama/codellama

# Add specific files to the context
aider src/app.py tests/test_app.py
```

**Best for:** Iterative code changes with automatic git commits, working with local or private LLMs.

---

### Gemini CLI

**[Gemini CLI](https://github.com/google-gemini/gemini-cli)** — Google's open-source AI agent for the terminal, powered by Gemini models. Includes a generous free tier.

```bash
# Install
npm install -g @google/gemini-cli

# Launch interactive session
gemini

# Run a one-shot prompt
gemini -p "summarise the changes in the last 5 git commits"
```

**Best for:** Users on Google Cloud / Vertex AI, or anyone wanting a free-tier LLM agent in the terminal.
Set `GEMINI_API_KEY` or authenticate via `gcloud auth`.

---

### Summary Comparison

| Tool | Primary LLM | Open Source | Local LLM support | Free tier |
|---|---|---|---|---|
| [Claude Code](https://claude.ai/code) | Claude (Anthropic) | ❌ | ❌ | ❌ (Pro required) |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli) | GPT / Claude | ❌ | ❌ | ❌ (subscription) |
| [opencode](https://opencode.ai) | Any (pluggable) | ✅ | ✅ (Ollama) | ✅ (with free providers) |
| [aider](https://aider.chat) | Any (pluggable) | ✅ | ✅ (Ollama) | ✅ (with free providers) |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | Gemini (Google) | ✅ | ❌ | ✅ (free tier) |

---

## Related Resources

- [virtualrussel/dynatrace-se-ai-workspace](https://github.com/virtualrussel/dynatrace-se-ai-workspace) — SE demo workspace with MCP + skills + prompts
- [virtualrussel/dynatrace-ai-dtctl-workspace](https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace) — dtctl-focused AI workspace
- [Dynatrace/dynatrace-for-ai](https://github.com/Dynatrace/dynatrace-for-ai) — Official Dynatrace skills and prompts source
- [dynatrace-oss/dtctl](https://github.com/dynatrace-oss/dtctl) — Dynatrace CLI for humans and AI agents
- [Dynatrace MCP Server docs](https://docs.dynatrace.com/docs/shortlink/dynatrace-mcp-server) — Official MCP server documentation
- [Agent Skills specification](https://agentskills.io) — Open standard for AI skill files
