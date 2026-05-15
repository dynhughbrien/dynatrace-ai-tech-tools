# 🤖 Dynatrace AI Sales Resources
> Curated for Sales & SE Teams — GitHub Repos · Demos · Docs · Blogs
> Last Updated: 2026-05-15

---

## 🤖 AI Agents & MCP

### 1. dynatrace-for-ai — Skills, Prompts & Agent Instructions
- **Org:** Dynatrace
- **URL:** https://github.com/Dynatrace/dynatrace-for-ai
- **Tags:** `AI Agents` `Davis AI` `Claude Code` `GitHub Copilot` `DQL` `Hot`
- **Description:** Portable AI agent skills and reusable prompt templates for common Dynatrace workflows (incident triage, deployment validation, standup reports). Works with Claude Code, GitHub Copilot, Cursor, and 30+ other agents. Key sales angle: shows how Dynatrace becomes the AI backbone for any dev tool.

---

### 2. dynatrace-mcp — MCP Server for Dynatrace Observability
- **Org:** dynatrace-oss
- **URL:** https://github.com/dynatrace-oss/dynatrace-mcp
- **Stars:** ⭐ 115
- **Tags:** `MCP` `AI Agents` `Davis AI` `DQL` `Hot`
- **Description:** Official MCP (Model Context Protocol) server that exposes Dynatrace observability data — logs, metrics, problems, vulnerabilities, Davis AI — to any MCP-compatible AI assistant (Claude, VS Code Copilot, Cursor, ChatGPT, Amazon Q, Windsurf, Gemini CLI). One command to connect: `npx -y @dynatrace-oss/dynatrace-mcp-server`.

---

### 3. dynatrace-managed-mcp — MCP Server for Dynatrace Managed (Self-Hosted)
- **Org:** dynatrace-oss
- **URL:** https://github.com/dynatrace-oss/dynatrace-managed-mcp
- **Tags:** `MCP` `AI Agents` `Managed` `On-Prem` `Enterprise`
- **Description:** MCP server variant specifically for Dynatrace Managed (on-prem/self-hosted) deployments. Supports multi-environment queries, real-time observability, security insights, and natural language queries via REST APIs. Key angle for legacy or regulated enterprise accounts.

---

### 4. dt-mcp-playground — MCP Playground (Perform 2026 DevHub)
- **Org:** dynatrace-oss
- **URL:** https://github.com/dynatrace-oss/dt-mcp-playground
- **Tags:** `MCP` `Demo` `Perform 2026` `GitHub Copilot`
- **Description:** Hands-on sandbox used at Dynatrace Perform 2026 DevHub sessions. Fork and launch in a GitHub Codespace to immediately demo the Dynatrace MCP server with VS Code + GitHub Copilot. Excellent for quick prospect demos — zero local setup required.

---

### 5. dtctl — CLI for Dynatrace Platform (Humans & AI Agents)
- **Org:** dynatrace-oss
- **URL:** https://github.com/dynatrace-oss/dtctl
- **Stars:** ⭐ 134
- **Tags:** `CLI` `AI Agents` `DevOps` `DQL` `Davis AI` `Hot`
- **Description:** kubectl-style CLI for Dynatrace (`dtctl get workflows`, `dtctl query "fetch logs"`). Built for both humans and AI agents — ships with an Agent Skill so coding assistants can operate it autonomously. Supports DQL queries, workflows, dashboards, SLOs, notebooks, and Davis AI. Strong DevOps/platform engineering story.

---

## 🔬 Demos & Observability Labs

### 6. obslab-llm-observability — LLM / AI Observability Demo
- **Org:** Dynatrace
- **URL:** https://github.com/Dynatrace/obslab-llm-observability
- **Tags:** `LLM Observability` `AI` `OpenTelemetry` `Demo` `Bedrock` `OpenAI`
- **Description:** Demo app showing AI/LLM observability with Dynatrace + OpenTelemetry. Uses Amazon Bedrock (or OpenAI + RAG with Ollama/Pinecone) to generate travel advice, fully instrumented with OpenLLMetry. Perfect for demoing the AI & LLM Observability tile to prospects building GenAI applications.

---

### 7. obslab-predictive-kubernetes-scaling — Predictive K8s Auto-Scaling Demo
- **Org:** Dynatrace
- **URL:** https://github.com/Dynatrace/obslab-predictive-kubernetes-scaling
- **Tags:** `Davis AI` `Kubernetes` `Demo` `Automation` `Predictive AI` `GitHub Codespace`
- **Description:** Showcases Dynatrace Automations + Davis AI predicting Kubernetes resource bottlenecks and automatically opening GitHub PRs to scale workloads. Uses Davis CoPilot generative AI to modify K8s manifests. Runs in a GitHub Codespace — great live demo for Platform Eng / DevOps audiences.

---

### 8. obslab-release-validation — Automated Release Validation Demo
- **Org:** Dynatrace
- **URL:** https://github.com/Dynatrace/obslab-release-validation
- **Tags:** `Demo` `Release Validation` `SRG` `Automation` `SRE`
- **Description:** Uses Grafana k6, Dynatrace Business Events, Workflows, and Site Reliability Guardian to validate software releases. Auto-baselines thresholds using Dynatrace AI. Great for CI/CD pipeline and software delivery conversations.

---

## 🔧 Platform & Integrations

### 9. dt-app-templates — Dynatrace App Bundle Templates
- **Org:** Dynatrace
- **URL:** https://github.com/Dynatrace/dt-app-templates
- **Stars:** ⭐ 11
- **Tags:** `App Platform` `Templates` `Developer` `Extensibility`
- **Description:** Official App Toolkit templates for building custom Dynatrace apps. Demonstrates the extensibility of the Dynatrace Platform — prospects and customers can build tailored UIs and workflows on top of Grail data. Key story for Platform Engineering and ISV discussions.

---

### 10. dynatrace-operator — Kubernetes Operator
- **Org:** Dynatrace
- **URL:** https://github.com/Dynatrace/dynatrace-operator
- **Tags:** `Kubernetes` `Operator` `OpenShift` `OneAgent`
- **Description:** Automates rollout and lifecycle management of Dynatrace OneAgent, ActiveGate, and other components in Kubernetes and OpenShift. Officially supported by Dynatrace. Essential reference for K8s-native deployment conversations.

---

### 11. dynatrace-configuration-as-code (Monaco) — Config as Code
- **Org:** Dynatrace
- **URL:** https://github.com/Dynatrace/dynatrace-configuration-as-code
- **Tags:** `Config as Code` `Automation` `GitOps` `Enterprise`
- **Description:** Monaco CLI automates Dynatrace configuration across one or many environments — Observability as Code and Security as Code. Officially supported. Strong story for large enterprise accounts managing many tenants.

---

## 🧠 Blogs & Articles — AI & Davis

### 12. From Code to Cloud: Dynatrace GitHub Custom Agent (Nov 2025)
- **Source:** Dynatrace Blog
- **URL:** https://www.dynatrace.com/news/blog/from-code-to-cloud-dynatrace-launches-first-github-custom-agent-consolidating-observability-for-developers/
- **Tags:** `GitHub Copilot` `Davis AI` `Announcement` `Developer`
- **Description:** Announces the first Dynatrace GitHub Copilot custom agent, enabling developers to investigate production failures, validate deployments, and triage errors directly in GitHub without leaving their workflow. Published Nov 2025, updated Jan 2026. Strong developer-facing sales narrative.

---

### 13. Hypermodal AI: Dynatrace Expands Davis AI with Davis CoPilot
- **Source:** Dynatrace Blog
- **URL:** https://www.dynatrace.com/news/blog/hypermodal-ai-dynatrace-expands-davis-ai-with-davis-copilot/
- **Tags:** `Davis AI` `Davis CoPilot` `Positioning` `Must-Read`
- **Description:** Core positioning piece explaining Dynatrace's hypermodal AI approach — combining predictive, causal, and generative AI. Essential reading for sales teams building the Davis AI narrative. Explains why LLMs alone aren't enough and how Dynatrace is differentiated.

---

### 14. General Availability of Davis CoPilot (Oct 2024)
- **Source:** Dynatrace Blog
- **URL:** https://www.dynatrace.com/news/blog/announcing-general-availability-of-davis-copilot-your-new-ai-assistant/
- **Tags:** `Davis CoPilot` `GenAI` `DQL` `GA Announcement`
- **Description:** GA announcement for Davis CoPilot — covers natural language to DQL, environment-aware queries, security/privacy model, and productivity use cases. Good leave-behind for prospects asking about GenAI in Dynatrace. Updated Jan 2026.

---

## 📄 Documentation

### 15. Davis AI — Official Dynatrace Docs
- **Source:** Dynatrace Docs
- **URL:** https://docs.dynatrace.com/docs/semantic-dictionary/model/davis
- **Tags:** `Davis AI` `Documentation` `Technical`
- **Description:** Official documentation for Davis AI, including the semantic dictionary models, event types, causal AI topology, and predictive AI signals. Reference for technical deep-dives and SE support.

---

## ⚡ Demos & Sandbox — AI & Platform

### 16. Generative AI for Workflows — Dynatrace Hub
- **Source:** Dynatrace Hub
- **URL:** https://www.dynatrace.com/hub/detail/davis-copilot-for-workflows/
- **Tags:** `Davis CoPilot` `Agentic` `Workflows` `Preview`
- **Description:** Hub page for Davis CoPilot in Workflows — enables agentic AI workflows (Dynatrace Intelligence). Shows auto-scaling via generative reasoning, security threat monitoring, and Slack-integrated risk assessments. Preview feature — good conversation starter for agentic operations.

---

### 17. dtctl — Dynatrace Hub Listing
- **Source:** Dynatrace Hub
- **URL:** https://www.dynatrace.com/hub/detail/dtctl/
- **Tags:** `CLI` `AI Agents` `Hub` `Community`
- **Description:** Hub entry for dtctl with community tips, a DevHub session video (Christoph & Andi demo), and quick-start guide. Useful for sharing with prospects post-demo as a low-friction entry point.

---

*This document is maintained by the Sales & SE team. To contribute, add resources directly in the tracker app.*
