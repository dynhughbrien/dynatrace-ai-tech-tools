# Dynatrace AI Tech Tools

A curated setup guide for Sales Engineers combining Dynatrace observability with AI tooling.

Dynatrace + AI Platform + Command Line Tool + Dynatrace Skills and Optional GitHub is a GREAT starting point getting the most of the Dynatrace Data / Grail.  

The goal is to proivde simplified access to ALL the Dynatrace Data. 

---

## Step 1 — Choose Your AI Platform

Select an AI provider. You'll need API access or a subscription to use AI command-line tools.

| Provider | Free Tier | Notes |
|---|---|---|
| [Anthropic Claude](https://claude.ai) | ❌ (Pro required) | Best integration with Claude Code |
| [OpenAI](https://platform.openai.com) | Limited | Works with opencode, aider |
| [Google Gemini](https://aistudio.google.com) | ✅ | Works with Gemini CLI |
| [Ollama (local)](https://ollama.com) | ✅ | Fully local, no API key needed |

---

## Step 2 — Choose Your AI Command-Line Tool

Pick the tool that fits your AI platform and workflow.

### ⭐ Claude Code (Recommended)

Anthropic's agentic coding tool. Reads files, runs commands, writes code, and manages git workflows autonomously.

```bash
npm install -g @anthropic-ai/claude-code
claude
```

Requires a Claude Pro/Team subscription or `ANTHROPIC_API_KEY`.

### GitHub Copilot CLI

AI assistance for shell commands and Git operations via the `gh` CLI.

```bash
gh extension install github/gh-copilot
gh copilot suggest "compress all png files in a directory"
```

Requires a GitHub Copilot subscription.

### opencode

Open-source terminal AI assistant supporting multiple LLM providers (OpenAI, Anthropic, Google, AWS Bedrock, Ollama).

```bash
npm install -g opencode-ai
opencode
```

### Gemini CLI

Google's open-source CLI with a generous free tier.

```bash
npm install -g @google/gemini-cli
gemini
```

### Summary

| Tool | Primary LLM | Open Source | Local LLM | Free Tier |
|---|---|---|---|---|
| [Claude Code](https://claude.ai/code) | Claude | ❌ | ❌ | ❌ |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli) | GPT / Claude | ❌ | ❌ | ❌ |
| [opencode](https://opencode.ai) | Any (pluggable) | ✅ | ✅ | ✅ |
| [aider](https://aider.chat) | Any (pluggable) | ✅ | ✅ | ✅ |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | Gemini | ✅ | ❌ | ✅ |

---

## Step 3 — Install Dynatrace dtctl

`dtctl` is the kubectl-style CLI for Dynatrace — manages resources from the terminal and integrates with AI agents.

```bash
# macOS (Homebrew)
brew install dynatrace-oss/tap/dtctl

# Or download directly
curl -fsSL https://github.com/dynatrace-oss/dtctl/releases/latest/download/install.sh | sh
```

More info: [github.com/dynatrace-oss/dtctl](https://github.com/dynatrace-oss/dtctl)

---

## Step 4 — Log In to Dynatrace via dtctl

```bash
# Configure your Dynatrace tenant
dtctl config set-tenant <your-tenant-id>.apps.dynatrace.com

# Authenticate (opens browser for SSO)
dtctl auth login

# Verify connection
dtctl get problems
```

---

## Step 5 — Install Dynatrace AI Skills

Dynatrace skills provide structured domain knowledge for AI agents (DQL, problems, logs, tracing, Kubernetes, AWS, etc.).

```bash
git clone https://github.com/Dynatrace/dynatrace-for-ai.git
```

Or use a pre-configured workspace that includes skills, prompts, and MCP config:

```bash
# With MCP server support
git clone https://github.com/virtualrussel/dynatrace-se-ai-workspace.git

# dtctl-focused variant
git clone https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace.git
```

More info: [skills.sh/dynatrace](https://skills.sh/dynatrace/dynatrace-for-ai)

---

## Step 6 — Create a GitHub Account

If you don't already have one, create a free GitHub account at [github.com/signup](https://github.com/signup).

---

## Step 7 — Install GitHub CLI (gh)

The `gh` CLI is required for GitHub Copilot CLI and useful for AI-assisted git workflows.

```bash
# macOS (Homebrew)
brew install gh

# Windows (winget)
winget install GitHub.cli
```

More info: [cli.github.com](https://cli.github.com)

---

## Step 8 — Authenticate with gh

```bash
# Interactive login (opens browser)
gh auth login

# Verify
gh auth status
```

---

## Related Resources

- [virtualrussel/dynatrace-se-ai-workspace](https://github.com/virtualrussel/dynatrace-se-ai-workspace) — SE demo workspace with MCP + skills + prompts
- [virtualrussel/dynatrace-ai-dtctl-workspace](https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace) — dtctl-focused AI workspace
- [Dynatrace/dynatrace-for-ai](https://github.com/Dynatrace/dynatrace-for-ai) — Official Dynatrace skills and prompts
- [dynatrace-oss/dtctl](https://github.com/dynatrace-oss/dtctl) — Dynatrace CLI for humans and AI agents
- [Dynatrace MCP Server docs](https://docs.dynatrace.com/docs/shortlink/dynatrace-mcp-server) — Official MCP server documentation
- [Agent Skills specification](https://agentskills.io) — Open standard for AI skill files
