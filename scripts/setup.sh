#!/usr/bin/env bash
# MindRepo Setup — run once after downloading to disconnect from the template repo

set -e

VAULT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$VAULT_DIR"

echo ""
echo "  MindRepo Setup"
echo "  =============="
echo ""

# Remove .git to disconnect from the template repo
if [ -d ".git" ]; then
  echo "  Disconnecting from template repo..."
  rm -rf .git
  echo "  ✓ Your vault is now private. Notes stay on your machine only."
else
  echo "  ✓ No git connection found — vault is already private."
fi

echo ""
echo "  Next steps:"
echo ""
echo "  1. Open this folder in Obsidian as a vault."
echo "  2. Set up multi-device sync (optional):"
echo "       bash scripts/sync-setup.sh"
echo ""
echo "  3. Start Claude Code in this folder:"
echo "       claude"
echo ""
echo "  4. To receive future framework updates:"
echo "       bash scripts/update.sh"
echo ""
echo "  5. To use MindRepo from your phone:"
echo "       bash scripts/remote.sh"
echo "       (or type /remote-control inside a Claude Code session)"
echo ""
