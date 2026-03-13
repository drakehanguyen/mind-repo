# MindRepo — Setup Guide

This guide covers everything you need to go from download to a fully working, private, multi-device Second Brain.

---

## 1. Getting Started

### Download

**Option A — Git clone** (allows future updates via `scripts/update.sh`):
```bash
git clone https://github.com/drakehanguyen/mind-repo my-mind-repo
cd my-mind-repo
```

**Option B — Download ZIP** from GitHub (simpler, no git required):
1. Go to the repo on GitHub → Code → Download ZIP
2. Unzip to your desired location (e.g. `~/Documents/my-mind-repo`)

---

### First-Time Setup

Run the setup script once to disconnect from the template repo and make your vault private:

```bash
bash scripts/setup.sh
```

This removes the `.git` folder so your notes never accidentally push anywhere. Your vault is now a plain local folder — nothing is tracked or shared.

---

### Open in Obsidian

1. Open Obsidian
2. Click **Open folder as vault**
3. Select the `my-mind-repo` folder
4. The vault opens with all settings pre-configured

---

## 2. Multi-Device Sync

Your notes live on your machine. To access them from other devices (phone, another laptop), set up sync:

```bash
bash scripts/sync-setup.sh
```

This gives you an interactive menu:

```
  1) iCloud Drive    — Apple ecosystem, free
  2) Google Drive    — Cross-platform
  3) Obsidian Sync   — Built-in, paid ($8/mo)
  4) Skip
```

The script moves your vault into the chosen cloud folder and creates a symlink back, so all commands and scripts keep working from the original path.

---

### Option 1 — iCloud Drive (Apple ecosystem)

**Best for**: Mac + iPhone/iPad users. Free.

The script moves your vault to:
```
~/Library/Mobile Documents/com~apple~CloudDocs/my-mind-repo/
```

**On your iPhone or iPad:**
1. Install Obsidian from the App Store
2. Open Obsidian → **Open vault from folder**
3. Navigate to **iCloud Drive** → `my-mind-repo`

Notes sync automatically via iCloud.

---

### Option 2 — Google Drive

**Best for**: Cross-platform (Mac + Android). Free.

Requires **Google Drive for Desktop** installed on your Mac (available at drive.google.com/drive/download).

The script moves your vault to your Google Drive "My Drive" folder.

**On Android:**
1. Install Obsidian + Google Drive app
2. Open Obsidian → **Open vault from folder**
3. Browse to Google Drive → `my-mind-repo`

> [!WARNING]
> Google Drive has limited folder-level access on iOS. If you use an iPhone, consider Obsidian Sync instead.

---

### Option 3 — Obsidian Sync

**Best for**: All platforms (Mac, Windows, iPhone, Android). Seamless.
**Cost**: $8/month or $96/year. End-to-end encrypted.

Configured inside Obsidian — the script will print step-by-step instructions.

**On your computer:**
1. Obsidian → Settings (⚙) → Sync → Sign in
2. Create a new remote vault
3. Click Connect

**On your phone:**
1. Install Obsidian
2. Sign in with the same account
3. Connect to your remote vault

More info: [obsidian.md/sync](https://obsidian.md/sync)

---

## 3. Receiving Framework Updates

The template repo may receive improvements to CLAUDE.md, AGENT.md, templates, and scripts over time. To check for and apply updates:

```bash
bash scripts/update.sh
```

The script:
1. Downloads the latest framework files from GitHub
2. Shows you what changed
3. Asks for confirmation before overwriting anything
4. **Never touches** your notes, journals, projects, or personal content

You can also trigger this from Claude Code with: `!update`

---

## 4. Using MindRepo from Your Phone

Claude Code supports **Remote Control** — your phone becomes a window into the Claude Code session running on your laptop.

### Requirements
- Claude Code v2.1.51 or later (`claude --version` to check)
- Pro, Max, Team, or Enterprise subscription
- Claude app installed on your phone ([iOS](https://apps.apple.com/us/app/claude-by-anthropic/id6473753684) · [Android](https://play.google.com/store/apps/details?id=com.anthropic.claude))

### Start a Remote Session

```bash
bash scripts/remote.sh
```

Or from inside a Claude Code session:
```
/remote-control
```

A QR code appears in your terminal. Scan it with the Claude app, or open the session URL in any browser at [claude.ai/code](https://claude.ai/code).

**What this gives you on your phone:**
- Full access to all `!` commands (`!journal`, `!idea`, `!note`, `!meeting`, etc.)
- Files are read/written directly on your laptop
- Session stays alive even if your phone disconnects and reconnects
- Nothing leaves your machine — Anthropic only routes messages

### Auto-enable for Every Session

If you want Remote Control to start automatically every time you open Claude Code:
1. Inside Claude Code, type `/config`
2. Set **Enable Remote Control for all sessions** to `true`

### Typical Phone Workflow

Throughout the day on your phone, use quick-capture commands:
```
!journal Just had an idea about the data pipeline
!idea Build a monitoring dashboard
!note Topic Some important thing I just learned
!link https://... Useful article
```

At the end of the day on your laptop, run `!eod` to process and organize everything.

---

## 5. Optional: Git Version Control

If you want version history and/or cloud backup (beyond sync), you can optionally set up your own private git repo:

```bash
# Initialize git in your vault
git init
git add -A
git commit -m "Initial vault"

# Connect to your private repo on GitHub/GitLab
git remote add origin git@github.com:yourname/my-mind-repo.git
git push -u origin main
```

From then on, commit and push whenever you want a snapshot:
```bash
git add -A && git commit -m "$(date '+%Y-%m-%d') notes" && git push
```

> [!TIP]
> This is completely optional. iCloud/Google Drive/Obsidian Sync handle the day-to-day multi-device access. Git is only useful if you want version history or a backup separate from your sync provider.

---

## 6. Start Using MindRepo

Open Claude Code in your vault folder:
```bash
claude
```

Then start with a quick command:
```
!help
!journal Your first entry
!study Topic you want to learn
```

See [[COMMANDS_QUICK_REFERENCE.md]] for all available commands.
