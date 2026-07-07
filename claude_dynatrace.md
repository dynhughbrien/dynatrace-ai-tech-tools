# dtctl — Dynatrace CLI Reference

> CLI for managing Dynatrace platform resources — built for humans and AI agents alike.

**Repo:** [github.com/dynatrace-oss/dtctl](https://github.com/dynatrace-oss/dtctl) · 140 stars · 44 forks · v0.27.1 · Apache 2.0

---

## What is dtctl?

`dtctl` is a command-line tool for the Dynatrace platform. It uses a familiar `kubectl`-style verb-noun syntax (`get`, `describe`, `apply`, `delete`) that is predictable for both human operators and AI agents. It supports workflows, dashboards, DQL queries, SLOs, settings, and much more — all from the terminal.

---

## Install

### Homebrew (macOS / Linux)

```sh
brew install dynatrace-oss/tap/dtctl
```

### Shell script (macOS / Linux)

```sh
curl -fsSL https://raw.githubusercontent.com/dynatrace-oss/dtctl/main/install.sh | sh
```

### PowerShell (Windows)

```powershell
irm https://raw.githubusercontent.com/dynatrace-oss/dtctl/main/install.ps1 | iex
```

### GitHub CLI (`gh`)

```sh
# Clone the repo
gh repo clone dynatrace-oss/dtctl

# View latest releases
gh release list --repo dynatrace-oss/dtctl

# Download the latest release binary
gh release download --repo dynatrace-oss/dtctl --pattern "dtctl_*_linux_amd64.tar.gz"

# Browse open issues
gh issue list --repo dynatrace-oss/dtctl

# Open the repo in browser
gh repo view dynatrace-oss/dtctl --web
```

---

## Authenticate

```sh
# OAuth login (recommended — no token management needed)
dtctl auth login --context my-env --environment "https://abc12345.apps.dynatrace.com"

# Verify everything works
dtctl doctor
```

Token-based authentication and multi-environment configuration are covered in the [Quick Start guide](https://dynatrace-oss.github.io/dtctl/docs/quick-start/).

---

## Core Syntax

```sh
dtctl get workflows                              # List all workflows
dtctl query "fetch logs | limit 10"              # Run DQL queries
dtctl apply -f workflow.yaml --set env=prod      # Declarative configuration
dtctl get dashboards -o json                     # Structured output for automation
dtctl exec copilot nl2dql "error logs from last hour"  # NL-to-DQL via Davis AI
dtctl commands --brief -o json                   # Machine-readable command catalog
```

---

## Supported Resources

| Resource | Operations |
|---|---|
| Workflows | get, describe, create, edit, delete, apply, execute, logs, history, restore, diff, watch |
| Dashboards & Notebooks | get, describe, create, edit, delete, apply, share, history, restore, diff, watch |
| Documents & Trash | get, describe, create, edit, delete, share, history, restore |
| DQL Queries | execute, verify, template variables, live mode, filter segments, wait conditions |
| SLOs | get, describe, create, edit, delete, apply, evaluate, watch |
| Settings | get schemas, get/create/update/delete objects |
| Buckets | get, describe, create, delete, apply, watch |
| Segments | get, describe, create, edit, delete, apply, watch |
| Lookup Tables | get, describe, create, delete, apply (CSV auto-detection) |
| Anomaly Detectors | get, describe, create, edit, delete, apply |
| Extensions 2.0 | get, describe, apply monitoring configs |
| Hub Extensions | get, describe, list releases, filter by keyword |
| App Functions & Intents | get, describe, execute, find, open (deep linking) |
| Davis AI | analyzers, CoPilot chat, NL-to-DQL, document search |
| Cloud Integrations | AWS, Azure & GCP connections (get, describe, create, delete, apply, enable) |
| EdgeConnect | get, describe, create, delete |
| Notifications | get, describe, delete, watch |
| Users & Groups | get, describe |
| Live Debugger | breakpoints, workspace filters, snapshot decoding |

---

## Why dtctl?

- **Familiar CLI conventions** — `get`, `describe`, `edit`, `apply`, `delete`. If you know `kubectl`, you already know dtctl.
- **Built for AI agents** — structured output (`--agent`), machine-readable command catalog (`dtctl commands`), and a bundled Agent Skill that teaches AI assistants how to operate Dynatrace.
- **Multi-environment** — switch between dev/staging/prod with a single command; safety levels prevent accidental changes.
- **Watch mode** — real-time monitoring with `--watch` for all resources.
- **DQL passthrough** — execute queries directly, with template variables and file-based input.
- **NO_COLOR support** — respects `NO_COLOR`, `FORCE_COLOR=1`, and auto-detects TTY.

---

## AI Agent Skills

### dtctl Skill — Install for Claude

`dtctl` ships with an [Agent Skill](https://agentskills.io) that teaches AI coding assistants how to use it. Agents can also bootstrap at runtime with `dtctl commands --brief -o json`.

```sh
# Install via skills.sh
npx skills add dynatrace-oss/dtctl

# Install with dtctl itself
dtctl skills install              # Auto-detects your AI agent
dtctl skills install --for claude # Specify Claude Code explicitly
dtctl skills install --global     # User-wide installation

# Copy manually (cross-client)
cp -r skills/dtctl ~/.agents/skills/
```

Compatible with: **Claude Code**, GitHub Copilot, Cursor, Kiro, Junie, OpenCode, OpenClaw, and other [Agent Skills](https://agentskills.io)-compatible tools.

---

## Dynatrace Domain Skills

For deeper Dynatrace domain knowledge — DQL syntax, observability patterns, dashboards, logs, Kubernetes, and more — install the skills from [dynatrace/dynatrace-for-ai](https://github.com/Dynatrace/dynatrace-for-ai).

**Source:** [skills.sh/dynatrace/dynatrace-for-ai](https://www.skills.sh/dynatrace/dynatrace-for-ai) · 23 skills · 16.1K total installs

```sh
npx skills add dynatrace/dynatrace-for-ai
```

### Available Skills

| Skill | Description |
|---|---|
| `dt-dql-essentials` | DQL syntax and query fundamentals |
| `dt-app-dashboards` | Dashboard creation and management |
| `dt-app-notebooks` | Notebook authoring |
| `dt-obs-logs` | Log monitoring and analysis |
| `dt-obs-problems` | Problem detection and root cause |
| `dt-obs-services` | Service observability |
| `dt-obs-tracing` | Distributed tracing |
| `dt-obs-hosts` | Host monitoring |
| `dt-obs-kubernetes` | Kubernetes observability |
| `dt-obs-frontends` | Frontend / RUM monitoring |
| `dt-obs-aws` | AWS cloud monitoring |
| `dt-obs-azure` | Azure cloud monitoring |
| `dt-obs-gcp` | GCP cloud monitoring |
| `dt-alerting` | Alerting configuration |
| `dt-migration` | Migration guidance |
| `dt-js-runtime` | JavaScript runtime extensions |
| `dt-platform-costs` | Platform cost management |
| `dt-sec-insights` | Security insights |
| `dt-obs-react-native` | React Native monitoring |
| `dt-obs-android` | Android monitoring |
| `dt-obs-flutter` | Flutter monitoring |
| `dt-obs-ios-sdk` | iOS SDK monitoring |
| `dt-obs-predictive-analytics` | Predictive analytics |

> **Two-layer setup:** `dtctl` provides the operational tool to act on Dynatrace; `dynatrace-for-ai` skills provide the domain context. Together they give AI agents everything needed to work with Dynatrace effectively.

---

## Documentation

Full documentation: [dynatrace-oss.github.io/dtctl](https://dynatrace-oss.github.io/dtctl/)

- [Installation](https://dynatrace-oss.github.io/dtctl/docs/installation/) — Homebrew, shell script, binary download, build from source, shell completion
- [Quick Start](https://dynatrace-oss.github.io/dtctl/docs/quick-start/) — Authentication, first commands, common patterns
- [Configuration](https://dynatrace-oss.github.io/dtctl/docs/configuration/) — Contexts, credentials, safety levels, aliases
- [Command Reference](https://dynatrace-oss.github.io/dtctl/docs/command-reference/) — All verbs, flags, resource types, and examples
- [Output Formats](https://dynatrace-oss.github.io/dtctl/docs/output-formats/) — Table, JSON, YAML, CSV, charts
- [AI Agent Mode](https://dynatrace-oss.github.io/dtctl/docs/ai-agent-mode/) — Structured envelope, auto-detection, agent skill
- [Token Scopes](https://dynatrace-oss.github.io/dtctl/docs/token-scopes/) — Required API token scopes per safety level
- [DQL Queries](https://dynatrace-oss.github.io/dtctl/docs/dql-queries/) · [Workflows](https://dynatrace-oss.github.io/dtctl/docs/workflows/) · [Dashboards](https://dynatrace-oss.github.io/dtctl/docs/dashboards/) · [SLOs](https://dynatrace-oss.github.io/dtctl/docs/slos/) · [Davis AI](https://dynatrace-oss.github.io/dtctl/docs/davis-ai/)

---

*Generated from [github.com/dynatrace-oss/dtctl](https://github.com/dynatrace-oss/dtctl) and [skills.sh/dynatrace/dynatrace-for-ai](https://www.skills.sh/dynatrace/dynatrace-for-ai) — July 2026*
