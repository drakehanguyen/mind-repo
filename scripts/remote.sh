#!/usr/bin/env bash
# MindRepo Remote — start a Claude Remote Control session so you can use
# MindRepo from your phone or any browser via claude.ai/code or the Claude app.
#
# Requirements:
#   - Claude Code v2.1.51+  (check: claude --version)
#   - Pro, Max, Team, or Enterprise subscription
#
# Usage:
#   bash scripts/remote.sh
#
# Then scan the QR code with the Claude iOS/Android app, or open the session URL
# in any browser. The session runs locally — no files leave your machine.

set -e

VAULT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$VAULT_DIR"

# Check Claude Code is installed
if ! command -v claude &>/dev/null; then
  echo ""
  echo "  Claude Code is not installed or not in PATH."
  echo "  Install it from: https://claude.ai/claude-code"
  echo ""
  exit 1
fi

echo ""
echo "  Starting MindRepo Remote Control session..."
echo "  Press spacebar to show/hide the QR code."
echo "  Connect from the Claude app (iOS/Android) or any browser at claude.ai/code."
echo ""

exec claude remote-control --name "MindRepo"
