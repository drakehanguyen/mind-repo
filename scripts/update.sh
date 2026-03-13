#!/usr/bin/env bash
# MindRepo Update — downloads the latest framework files from the template repo.
# Never touches your notes (40-Journal, 10-Projects, 20-Areas, 30-Resources, etc.)

set -e

VAULT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
REPO="drakehanguyen/mind-repo"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/$REPO/$BRANCH"
TMP_DIR="$(mktemp -d)"

# Framework files that can be updated (never touches user content folders)
FRAMEWORK_FILES=(
  "CLAUDE.md"
  "AGENT.md"
  "COMMANDS_QUICK_REFERENCE.md"
  "scripts/setup.sh"
  "scripts/update.sh"
  "scripts/remote.sh"
  "scripts/sync-setup.sh"
  ".metadata/README.md"
  ".metadata/Templates/Work-Journal.md"
  ".metadata/Templates/Personal-Journal.md"
  ".metadata/Templates/Meeting.md"
  ".metadata/Templates/Study-Note.md"
  ".metadata/Templates/Atomic-Note.md"
  ".metadata/Templates/Project-README.md"
  ".metadata/Templates/Error-Debug.md"
  ".metadata/Templates/Review.md"
  ".metadata/Templates/MOC.md"
  ".metadata/Templates/Area.md"
  ".metadata/Templates/Brainstorm.md"
  ".metadata/Templates/Q&A.md"
)

cleanup() {
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

echo ""
echo "  MindRepo Update"
echo "  ==============="
echo "  Checking for framework updates from github.com/$REPO..."
echo ""

CHANGED=()
FAILED=()

for file in "${FRAMEWORK_FILES[@]}"; do
  dest="$VAULT_DIR/$file"
  tmp="$TMP_DIR/$file"

  # Create parent dir in tmp
  mkdir -p "$(dirname "$tmp")"

  # Download file
  if ! curl -sf "$BASE_URL/$file" -o "$tmp" 2>/dev/null; then
    FAILED+=("$file")
    continue
  fi

  # Compare with current version (if file exists)
  if [ -f "$dest" ]; then
    if ! diff -q "$dest" "$tmp" > /dev/null 2>&1; then
      CHANGED+=("$file")
    fi
  else
    CHANGED+=("$file")
  fi
done

if [ ${#FAILED[@]} -gt 0 ]; then
  echo "  Could not reach GitHub for:"
  for f in "${FAILED[@]}"; do echo "    - $f"; done
  echo "  Check your internet connection and try again."
  echo ""
fi

if [ ${#CHANGED[@]} -eq 0 ]; then
  echo "  ✓ Everything is up to date. No changes to apply."
  echo ""
  exit 0
fi

echo "  ${#CHANGED[@]} file(s) have updates:"
echo ""
for f in "${CHANGED[@]}"; do
  echo "    ~ $f"
done
echo ""

# Show diffs if diff is available
if command -v diff &>/dev/null; then
  read -rp "  Show detailed diff before applying? [y/N] " show_diff
  if [[ "$show_diff" =~ ^[Yy]$ ]]; then
    echo ""
    for f in "${CHANGED[@]}"; do
      dest="$VAULT_DIR/$f"
      tmp="$TMP_DIR/$f"
      echo "  --- $f ---"
      if [ -f "$dest" ]; then
        diff --unified=2 "$dest" "$tmp" || true
      else
        echo "  (new file)"
        head -5 "$tmp"
      fi
      echo ""
    done
  fi
fi

read -rp "  Apply these updates? [y/N] " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "  Cancelled. No files were changed."
  echo ""
  exit 0
fi

echo ""
for f in "${CHANGED[@]}"; do
  dest="$VAULT_DIR/$f"
  tmp="$TMP_DIR/$f"
  mkdir -p "$(dirname "$dest")"
  cp "$tmp" "$dest"
  echo "  ✓ Updated: $f"
done

echo ""
echo "  Framework updated successfully."
echo "  Your notes and content were not touched."
echo ""
