# Dynatrace AI Tech Tools

## Quick Start Steps
In short: pick your AI stack, install the Dynatrace tools and skills, then set up GitHub CLI access.

A curated setup guide for Sales Engineers combining Dynatrace observability with AI tooling.

Dynatrace + AI Platform + Command Line Tool + Dynatrace Skills and Optional GitHub is a GREAT starting point getting the most of the Dynatrace Data / Grail.  

The goal is to proivde simplified access to ALL the Dynatrace Data. 

---

## Step 1 — Choose Your AI Platform

Select an AI provider. You'll need API access or a subscription to use AI command-line tools.

| Provider | Free Tier | Notes |
|---|---|---|
| [Anthropic Claude](https://claude.ai) | ❌ (Pro required) | Best integration with Claude Code |

---

## Step 2 — Choose Your AI Command-Line Tool

Pick the tool that fits your AI platform and workflow.

### ⭐ Claude Code (Recommended)

Anthropic's agentic coding tool. Reads files, runs commands, writes code, and manages git workflows autonomously.

```bash
npm install -g @anthropic-ai/claude-code
claude
```

```bash
brew install claude-code 
claude
```



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

## Step 4 Install the dtctl Skill

```
dtctl skills  install --for claude 
```


## Step 5 — Log In to Dynatrace via dtctl

```bash
# Configure your Dynatrace tenant
dtctl config set-tenant <your-tenant-id>.apps.dynatrace.com

# Authenticate (opens browser for SSO)
dtctl auth login

# Verify connection
dtctl get problems
```
More info: [skills.sh/dynatrace](https://skills.sh/dynatrace/dynatrace-for-ai)

---

## Step 6 — Install Dynatrace AI Skills

Dynatrace skills provide structured domain knowledge for AI agents (DQL, problems, logs, tracing, Kubernetes, AWS, etc.).



```bash
npx skills add dynatrace/dynatrace-for-ai
```
Or use a pre-configured workspace that includes skills, prompts, and MCP config:

```bash
# With MCP server support
git clone https://github.com/virtualrussel/dynatrace-se-ai-workspace.git

# dtctl-focused variant
git clone https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace.git
```

## Step 7 

- Install Claude
- Install dtctl
- Install dtctl Skill
- Install Dynatrace Skills
- Run Claude
- /login
- /init 


---

## Related Resources

- [virtualrussel/dynatrace-se-ai-workspace](https://github.com/virtualrussel/dynatrace-se-ai-workspace) — SE demo workspace with MCP + skills + prompts
- [virtualrussel/dynatrace-ai-dtctl-workspace](https://github.com/virtualrussel/dynatrace-ai-dtctl-workspace) — dtctl-focused AI workspace
- [Dynatrace/dynatrace-for-ai](https://github.com/Dynatrace/dynatrace-for-ai) — Official Dynatrace skills and prompts
- [dynatrace-oss/dtctl](https://github.com/dynatrace-oss/dtctl) — Dynatrace CLI for humans and AI agents
- [Dynatrace MCP Server docs](https://docs.dynatrace.com/docs/shortlink/dynatrace-mcp-server) — Official MCP server documentation
- [Agent Skills specification](https://agentskills.io) — Open standard for AI skill files
