# Dynatrace AI Tech Tools 

## Bring Your Own AI or Bring Your Keys 

Dynatrace AI Resource for Operations — a curated guide covering the key Dynatrace + AI GitHub projects

## Getting Started
You will need a few core tools to get the most out of AI-assisted development and observability workflows with Dynatrace:

* AI Command Line Tool (e.g. Claude Code, GitHub Copilot CLI, opencode) for terminal-based AI interactions and code generation.
* AI Platform or Local LLM (e.g. OpenAI API, Anthropic Claude, local Ollama instance) 
* Dynatrace DTCTL https://github.com/dynatrace-oss/dtctl
* AI Skills  - https://skills.sh/dynatrace/dynatrace-for-ai / https://github.com/Dynatrace/dynatrace-for-ai
* Dynatace MCP Server  https://github.com/dynatrace-oss/dynatrace-mcp
* Github git and gh 

What is core set of tools needed for making the most out of AI 

### Choice of AI Command Line Tool and LLM
The following are the tools i use on a daily basis for AI-assisted development and observability workflows with Dynatrace. 
You can choose the ones that best fit your needs and preferences:

Dynatrace MCP and DTCL 
- [`dtctl`](https://github.com/dynatrace-oss/dtctl)

AI Command Line Tool 
- claude

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




**Best for:** Iterative code changes with automatic git commits, working with local or private LLMs.

### Summary Comparison

| Tool | Primary LLM | Open Source | Local LLM support | Free tier |
|---|---|---|---|---|
| [Claude Code](https://claude.ai/code) | Claude (Anthropic) | ❌ | ❌ | ❌ (Pro required) |
| [GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli) | GPT / Claude | ❌ | ❌ | ❌ (subscription) |
| [opencode](https://opencode.ai) | Any (pluggable) | ✅ | ✅ (Ollama) | ✅ (with free providers) |
| [aider](https://aider.chat) | Any (pluggable) | ✅ | ✅ (Ollama) | ✅ (with free providers) |
| [Gemini CLI](https://github.com/google-gemini/gemini-cli) | Gemini (Google) | ✅ | ❌ | ✅ (free tier) |

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

## Related Resources

- [virtualrussel/dynatrace-se-ai-workspace](https://github.com/virtualrussel/dynatrace-se-ai-workspace) — SE demo workspace with MCP + skills + prompts
- [virtualrussel/dynatrace-ai-dtctl-workspace](https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace) — dtctl-focused AI workspace
- [Dynatrace/dynatrace-for-ai](https://github.com/Dynatrace/dynatrace-for-ai) — Official Dynatrace skills and prompts source
- [dynatrace-oss/dtctl](https://github.com/dynatrace-oss/dtctl) — Dynatrace CLI for humans and AI agents
- [Dynatrace MCP Server docs](https://docs.dynatrace.com/docs/shortlink/dynatrace-mcp-server) — Official MCP server documentation
- [Agent Skills specification](https://agentskills.io) — Open standard for AI skill files
