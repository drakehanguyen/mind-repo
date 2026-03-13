#!/usr/bin/env bash
# MindRepo Sync Setup — configure multi-device sync for your vault.
# Moves the vault into your chosen cloud folder and creates a symlink back,
# so all scripts and Claude Code sessions continue to work from the original path.

set -e

VAULT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VAULT_NAME="$(basename "$VAULT_DIR")"

echo ""
echo "  MindRepo Sync Setup"
echo "  ==================="
echo "  Vault location: $VAULT_DIR"
echo ""
echo "  How would you like to sync MindRepo across devices?"
echo ""
echo "    1) iCloud Drive    — Apple ecosystem, free. Works on Mac, iPhone, iPad."
echo "    2) Google Drive    — Cross-platform. Requires Google Drive for Desktop."
echo "    3) Obsidian Sync   — Built-in to Obsidian, paid (\$8/mo). All platforms."
echo "    4) Skip            — I'll handle sync manually."
echo ""
read -rp "  Choice [1-4]: " choice

case "$choice" in

  # ── iCloud Drive ────────────────────────────────────────────────────────────
  1)
    ICLOUD_BASE="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

    if [ ! -d "$ICLOUD_BASE" ]; then
      echo ""
      echo "  iCloud Drive folder not found at:"
      echo "    $ICLOUD_BASE"
      echo ""
      echo "  Make sure iCloud Drive is enabled in System Settings → Apple ID → iCloud."
      exit 1
    fi

    TARGET="$ICLOUD_BASE/$VAULT_NAME"

    if [ -d "$TARGET" ]; then
      echo ""
      echo "  A folder already exists at:"
      echo "    $TARGET"
      echo ""
      read -rp "  Overwrite it? All contents will be replaced. [y/N] " confirm
      [[ "$confirm" =~ ^[Yy]$ ]] || { echo "  Cancelled."; exit 0; }
      rm -rf "$TARGET"
    fi

    echo ""
    echo "  Moving vault to iCloud Drive..."
    mv "$VAULT_DIR" "$TARGET"

    echo "  Creating symlink so existing paths still work..."
    ln -s "$TARGET" "$VAULT_DIR"

    echo ""
    echo "  ✓ Done! Your vault is now syncing via iCloud Drive."
    echo ""
    echo "  On your iPhone or iPad:"
    echo "    1. Install Obsidian from the App Store."
    echo "    2. Open Obsidian → Open vault from folder."
    echo "    3. Navigate to iCloud Drive → $VAULT_NAME."
    echo ""
    ;;

  # ── Google Drive ────────────────────────────────────────────────────────────
  2)
    # Try to detect the Google Drive local path
    GDRIVE_BASE=""

    # macOS with Google Drive for Desktop (new-style path)
    for d in "$HOME/Library/CloudStorage"/GoogleDrive-*/My\ Drive; do
      if [ -d "$d" ]; then
        GDRIVE_BASE="$d"
        break
      fi
    done

    # Fallback: legacy path
    if [ -z "$GDRIVE_BASE" ] && [ -d "$HOME/Google Drive/My Drive" ]; then
      GDRIVE_BASE="$HOME/Google Drive/My Drive"
    fi

    if [ -z "$GDRIVE_BASE" ]; then
      echo ""
      echo "  Google Drive folder not found."
      echo "  Install Google Drive for Desktop from drive.google.com/drive/download"
      echo "  then run this script again."
      exit 1
    fi

    TARGET="$GDRIVE_BASE/$VAULT_NAME"

    if [ -d "$TARGET" ]; then
      echo ""
      echo "  A folder already exists at:"
      echo "    $TARGET"
      echo ""
      read -rp "  Overwrite it? All contents will be replaced. [y/N] " confirm
      [[ "$confirm" =~ ^[Yy]$ ]] || { echo "  Cancelled."; exit 0; }
      rm -rf "$TARGET"
    fi

    echo ""
    echo "  Moving vault to Google Drive ($GDRIVE_BASE)..."
    mv "$VAULT_DIR" "$TARGET"

    echo "  Creating symlink so existing paths still work..."
    ln -s "$TARGET" "$VAULT_DIR"

    echo ""
    echo "  ✓ Done! Your vault is now syncing via Google Drive."
    echo ""
    echo "  On Android:"
    echo "    1. Install Obsidian + the Google Drive app."
    echo "    2. Open Obsidian → Open vault from folder → browse to Google Drive → $VAULT_NAME."
    echo ""
    echo "  On iPhone/iPad:"
    echo "    Google Drive has limited folder-level access on iOS."
    echo "    Consider using Obsidian Sync instead for full iOS support."
    echo ""
    ;;

  # ── Obsidian Sync ────────────────────────────────────────────────────────────
  3)
    echo ""
    echo "  Obsidian Sync is configured inside Obsidian, not via a script."
    echo "  Your vault stays in its current location:"
    echo "    $VAULT_DIR"
    echo ""
    echo "  Steps to enable Obsidian Sync:"
    echo ""
    echo "    On your computer:"
    echo "      1. Open Obsidian with this vault."
    echo "      2. Settings (⚙) → Sync."
    echo "      3. Sign in or create an Obsidian account."
    echo "      4. Choose 'Create new remote vault' and give it a name."
    echo "      5. Click 'Connect' — Obsidian will start syncing."
    echo ""
    echo "    On your phone (iOS or Android):"
    echo "      1. Install Obsidian from the App Store or Play Store."
    echo "      2. Open Obsidian → Sign in with the same account."
    echo "      3. Tap 'Connect' next to your remote vault."
    echo ""
    echo "  Cost: \$8/month or \$96/year."
    echo "  Encryption: end-to-end (Anthropic/Obsidian cannot read your notes)."
    echo "  More info: https://obsidian.md/sync"
    echo ""
    ;;

  # ── Skip ────────────────────────────────────────────────────────────────────
  4)
    echo ""
    echo "  Skipped. You can run this script again at any time."
    echo ""
    ;;

  *)
    echo ""
    echo "  Invalid choice. Run the script again and enter 1, 2, 3, or 4."
    echo ""
    exit 1
    ;;
esac
