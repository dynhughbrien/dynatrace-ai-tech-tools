#!/usr/bin/env bash
#
# Initializes a Dynatrace-based Claude Code environment:
#   Claude Code -> dtctl -> dtctl Claude Skill -> Dynatrace AI Skills -> auth
#
# Usage:
#   ./create_enviroment.sh --environment https://<tenant>.apps.dynatrace.com [--context <name>]
#   ./create_enviroment.sh                     # prompts for the tenant URL interactively
#
set -euo pipefail

DT_CONTEXT="default"
DT_ENVIRONMENT=""

while [ $# -gt 0 ]; do
  case "$1" in
    --environment)
      DT_ENVIRONMENT="$2"
      shift 2
      ;;
    --context)
      DT_CONTEXT="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: $0 [--environment https://<tenant>.apps.dynatrace.com] [--context <name>]"
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

log() { printf '\n==> %s\n' "$1"; }

require_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required but was not found. Install it from https://brew.sh and re-run this script." >&2
    exit 1
  fi
}

# --- Step 1: Claude Code -----------------------------------------------
log "Checking for Claude Code"
if command -v claude >/dev/null 2>&1; then
  echo "claude is already installed ($(command -v claude))"
else
  require_brew
  brew install claude-code
fi

# --- Step 2: dtctl -------------------------------------------------------
log "Checking for dtctl"
if command -v dtctl >/dev/null 2>&1; then
  echo "dtctl is already installed ($(command -v dtctl))"
else
  require_brew
  brew install dynatrace-oss/tap/dtctl
fi

# --- Step 3: dtctl Claude skill -------------------------------------------
log "Installing the dtctl Agent Skill for Claude"
dtctl skills install --for claude

# --- Step 4: Dynatrace domain skills --------------------------------------
log "Installing Dynatrace AI skills (dynatrace/dynatrace-for-ai)"
if command -v npx >/dev/null 2>&1; then
  npx --yes skills add dynatrace/dynatrace-for-ai
else
  echo "npx not found (Node.js required) — skipping Dynatrace AI skills install." >&2
  echo "Install Node.js, then run: npx skills add dynatrace/dynatrace-for-ai" >&2
fi

# --- Step 5: Authenticate --------------------------------------------------
if [ -z "$DT_ENVIRONMENT" ]; then
  read -r -p "Dynatrace environment URL (e.g. https://abc12345.apps.dynatrace.com): " DT_ENVIRONMENT
fi

if [ -z "$DT_ENVIRONMENT" ]; then
  echo "No environment URL provided — skipping 'dtctl auth login'." >&2
  echo "Run it manually later: dtctl auth login --context $DT_CONTEXT --environment <url>" >&2
else
  log "Authenticating dtctl against $DT_ENVIRONMENT (context: $DT_CONTEXT)"
  dtctl auth login --context "$DT_CONTEXT" --environment "$DT_ENVIRONMENT"
fi

# --- Step 6: Verify --------------------------------------------------------
log "Running dtctl doctor"
dtctl doctor || echo "dtctl doctor reported issues — review the output above." >&2

if [ -n "$DT_ENVIRONMENT" ]; then
  log "Sanity check: dtctl get problems"
  dtctl get problems || echo "Could not fetch problems — check auth/context." >&2
fi

log "Environment setup complete"
cat <<'EOF'
Next steps:
  claude          # start Claude Code
  /login          # authenticate Claude Code, if not already
  /init           # generate/refresh CLAUDE.md for this repo

Try asking Claude things like:
  "What open problems are in Dynatrace right now?"
  "Show me error logs from the last hour."
EOF
