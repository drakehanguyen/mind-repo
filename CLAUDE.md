# MindRepo — AI Agent Instructions

MindRepo is an AI-powered Second Brain for a Data Engineer Consultant. Uses **hybrid PARA + Zettelkasten**: PARA for project/area management, Zettelkasten for knowledge linking in `/30-Resources/`.

Full documentation: [[AGENT.md]]

---

## Critical Rules

1. **Always use Wikilinks** `[[Note Name]]` — never `[text](path)`
2. **Every new note needs YAML frontmatter** (see Conventions below)
3. **Bidirectional linking**: when linking A→B, also add B→A in `## Related`
4. **Only auto-link when confident** a match exists in `/10-Projects/`
5. **Confirm before creating** new projects or clients
6. **Never fail silently** — inform the user of all actions taken
7. **Code inline if < 50 lines**, separate `code/` subfolder if > 50 lines

---

## Folder Structure

| Folder | Purpose |
|--------|---------|
| `00-Inbox/` | Raw captures — processed at EOD |
| `10-Projects/` | Active projects (11-Consulting, 12-PersonalProject, 13-Life) |
| `20-Areas/` | Long-term maintenance (Career, Health, Hobbies, Languages) |
| `30-Resources/` | Permanent knowledge base (Python, PySpark, AWS, Troubleshooting, Consulting) |
| `40-Journal/` | Daily logs — `Work/YYYY/YYYY-MM-DD.md` and `Personal/YYYY/YYYY-MM-DD.md` |
| `80-MOCs/` | Maps of Content — category navigation hubs |
| `90-Archive/` | Archived projects |
| `.metadata/Templates/` | Note templates for all types |

---

## Commands (use `!` prefix)

### Core

| Command | Action |
|---------|--------|
| `!journal [text]` | Capture entry to inbox (categorized at EOD) |
| `!meeting [Client] [Topic]` | Create meeting note in `/10-Projects/11-Consulting/[Client]/Meetings/` |
| `!study [Topic]` | Create deep-dive note in `/30-Resources/[Category]/` |
| `!plan [Name]` | Scaffold project folder with README + TODO + Meetings/ |
| `!debug [Error]` | Create error note in `/30-Resources/Troubleshooting/` |
| `!report [Client] [Timeframe]` | Generate status report from journal entries |
| `!refactor [text]` | Clean up and restructure selected text in-place |
| `!inbox-process` | Process inbox items interactively |
| `!eod` | Run full end-of-day workflow (5 steps — see EOD Workflow) |

### Capture

| Command | Action |
|---------|--------|
| `!link [URL] [Desc]` | Save link to inbox |
| `!code [Desc] [Code]` | Save code snippet to appropriate resource or project |
| `!idea [Text]` | Capture idea to inbox |
| `!note [Topic] [Content]` | Quick note to appropriate location |
| `!task [Desc] [Project] [Due]` | Create task in project TODO or inbox |

### Management

| Command | Action |
|---------|--------|
| `!today` | Summary of today's journals + inbox |
| `!status [Project]` | Project status from README + recent journals |
| `!archive [Item]` | Move to `/90-Archive/YYYY/` |
| `!review [Project/Time]` | Create retrospective note |
| `!update` | Pull latest framework updates from the template repo |
| `!remote` | Start a Claude Remote Control session (connect from phone) |

### Discovery

| Command | Action |
|---------|--------|
| `!search [Query]` | Search titles, content, tags, frontmatter |
| `!tag [Note] [Tags]` | Add tags to existing note frontmatter |
| `!summary [Note]` | Generate summary of note or project |
| `!link-notes [N1] [N2]` | Create bidirectional link between two notes |
| `!link-suggest [Note]` | Find and suggest related notes to link |

### Zettelkasten

| Command | Action |
|---------|--------|
| `!atomic [Topic]` | Create single-concept permanent note |
| `!moc [Category]` | Create or update Map of Content |

### AI Sessions

| Command | Action |
|---------|--------|
| `!brainstorm [Topic]` | Interactive brainstorm → creates summary note when session ends |
| `!ask [Question]` | Interactive Q&A → creates Q&A note when session ends |
| `!help [Command?]` | Show all commands or detailed help for a specific command |

---

## EOD Workflow (`!eod`)

Run at end of day. Five steps:

1. **Process Inbox** — scan `/00-Inbox/`, categorize each item: Work Journal / Personal Journal / Resource / Project / Area / Idea / Link
2. **Update Work Journal** — `/40-Journal/Work/YYYY/YYYY-MM-DD.md` — organize into Work Log, Notes, Links, Completed; extract action items to project TODOs
3. **Update Personal Journal** — `/40-Journal/Personal/YYYY/YYYY-MM-DD.md` — organize into Notes, Links, Reflections, Completed
4. **Zettelkasten Linking** — for new `/30-Resources/` notes: suggest connections, check for orphaned notes, update MOCs
5. **Cleanup** — clear processed inbox items, report a summary of all actions taken

---

## Conventions

### Frontmatter (required on every note)

```yaml
---
created: YYYY-MM-DD
type: [type]
tags: [kebab-case, tags]
---
```

**Types**: `daily` | `meeting` | `project` | `study` | `atomic` | `moc` | `error` | `plan` | `review` | `idea` | `brainstorm` | `qa` | `area` | `journal-entry`

### File Naming

- Resources: `PySpark_Window_Functions.md`
- Meetings: `YYYY-MM-DD_Topic_Name.md`
- Errors: `YYYY-MM-DD_Error_Name.md`
- Journals: `YYYY-MM-DD.md`

### Templates

Use templates from `.metadata/Templates/` for all note types:
`Work-Journal.md`, `Personal-Journal.md`, `Meeting.md`, `Study-Note.md`, `Atomic-Note.md`, `Project-README.md`, `Error-Debug.md`, `Review.md`, `MOC.md`, `Area.md`, `Brainstorm.md`, `Q&A.md`

### Obsidian Callouts

- `> [!INFO]` — Information
- `> [!WARNING]` — Warnings / gotchas
- `> [!TIP]` — Best practices
- `> [!bug]` — Errors
- `> [!success]` — Solutions / fixes
- `> [!TODO]` — Action items

---

## Linking Strategy

Aim for **5-10 links per note** in `## Related`. Always add brief link context:

```markdown
## Related
- [[PySpark Aggregations]] - Similar transformation operations
- [[SQL Window Functions]] - SQL equivalent concept
```

**Link types:**
- **Parent**: broader topic — `PySpark Window Functions` → `PySpark`
- **Sibling**: related concepts — `PySpark Window Functions` ↔ `PySpark Aggregations`
- **Cross-category**: spanning domains — `PySpark` ↔ `AWS EMR`

**Orphaned notes** (no links) should be identified during EOD and linked via `!link-suggest`.

---

## Auto-Linking Rules

When journal entries mention clients or projects:
- Scan `/10-Projects/` folders to build master list
- Wrap confident matches in Wikilinks: `[[Client Name]]`
- Only link if confident — never guess
- Ask user before creating new project/client entries

---

## Remote Access

Use Claude Code from your phone or any browser via **Remote Control**.

**Start a session:**
```bash
bash scripts/remote.sh
# or inside Claude Code:
/remote-control
```

A QR code appears in the terminal. Scan it with the Claude app (iOS/Android) or open the session URL at claude.ai/code. Claude Code keeps running locally — files never leave your machine.

**To enable for every session automatically:**
Type `/config` inside Claude Code → set "Enable Remote Control for all sessions" to `true`.

**Requirements:** Claude Code v2.1.51+, Pro/Max/Team/Enterprise subscription.

---

## Session End Detection (`!brainstorm`, `!ask`)

End detected when user says: "done", "thanks", "got it", "that's enough", or starts a new command.

Post-session actions: create summary note → link to related notes → extract action items → suggest atomic/study notes if new knowledge emerged.
