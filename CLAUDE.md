# MindRepo — AI Agent Instructions

AI-powered Second Brain (PARA + Zettelkasten hybrid). Full specs: [[AGENT.md]]

---

## Critical Rules

1. Always use Wikilinks `[[Note Name]]` — never `[text](path)`
2. Every new note needs YAML frontmatter: `created`, `type`, `tags`
3. Bidirectional linking: A→B also add B→A in `## Related`
4. Auto-link: read `/10-Projects/_index.md` for master list — never guess
5. Confirm before creating new projects or clients
6. Never fail silently — inform user of all actions taken
7. Code inline if < 50 lines, `code/` subfolder if > 50 lines

---

## Folders

| Folder | Purpose |
|--------|---------|
| `00-Inbox/` | Raw captures — processed at EOD |
| `10-Projects/` | Active: 11-Consulting, 12-PersonalProject, 13-Life |
| `20-Areas/` | Long-term: Career, Health, Hobbies, Languages |
| `30-Resources/` | Knowledge base: Python, PySpark, AWS, Troubleshooting, Consulting |
| `40-Journal/` | `Work/YYYY/YYYY-MM-DD.md` · `Personal/YYYY/YYYY-MM-DD.md` |
| `80-MOCs/` | Maps of Content + `_vault-index.md` (search/link index) |
| `90-Archive/` | Archived projects |

---

## Commands

| Command | Action | Full spec |
|---------|--------|-----------|
| `!journal [text]` | Capture to inbox (categorized at EOD) | [[commands-core]] |
| `!meeting [Client] [Topic]` | Meeting note in `11-Consulting/[Client]/Meetings/` | [[commands-core]] |
| `!study [Topic]` | Deep-dive note in `30-Resources/[Category]/` | [[commands-core]] |
| `!plan [Name]` | Scaffold project: README + TODO + Meetings/ | [[commands-core]] |
| `!debug [Error]` | Error note in `30-Resources/Troubleshooting/` | [[commands-core]] |
| `!report [Client] [Timeframe]` | Status report from journal entries | [[commands-core]] |
| `!refactor [text]` | Clean up selected text in-place | [[commands-core]] |
| `!inbox-process` | Process inbox interactively | [[commands-core]] |
| `!eod` | Full 5-step end-of-day workflow | [[commands-core]] |
| `!link [URL] [Desc]` | Save link to inbox | [[commands-capture]] |
| `!code [Desc] [Code]` | Save code snippet | [[commands-capture]] |
| `!idea [Text]` | Capture idea to inbox | [[commands-capture]] |
| `!note [Topic] [Content]` | Quick note to right location | [[commands-capture]] |
| `!task [Desc] [Project] [Due]` | Task in project TODO or inbox | [[commands-capture]] |
| `!today` | Today's journals + inbox summary | [[commands-mgmt]] |
| `!status [Project]` | Project status from README + journals | [[commands-mgmt]] |
| `!archive [Item]` | Move to `90-Archive/YYYY/` | [[commands-mgmt]] |
| `!review [Project/Time]` | Retrospective note | [[commands-mgmt]] |
| `!update` | Pull framework updates | [[commands-mgmt]] |
| `!remote` | Start Remote Control session | [[commands-mgmt]] |
| `!search [Query]` | Search vault — use `_vault-index.md` first | [[commands-mgmt]] |
| `!tag [Note] [Tags]` | Add tags to frontmatter | [[commands-mgmt]] |
| `!summary [Note]` | Generate note summary | [[commands-mgmt]] |
| `!brainstorm [Topic]` | Brainstorm session → summary note on end | [[commands-mgmt]] |
| `!ask [Question]` | Q&A session → summary note on end | [[commands-mgmt]] |
| `!help [Command?]` | Show command list or command help | [[commands-mgmt]] |
| `!link-notes [N1] [N2]` | Bidirectional link two notes | [[commands-zettel]] |
| `!link-suggest [Note]` | Find related notes — use `_vault-index.md` | [[commands-zettel]] |
| `!atomic [Topic]` | Single-concept permanent note | [[commands-zettel]] |
| `!moc [Category]` | Create/update Map of Content | [[commands-zettel]] |

---

## EOD Workflow (`!eod`)

1. **Process Inbox** — categorize: Work Journal / Personal Journal / Resource / Project / Area / Idea / Link
2. **Update Work Journal** — `40-Journal/Work/YYYY/YYYY-MM-DD.md` — Work Log, Notes, Links, Completed; extract action items
3. **Update Personal Journal** — `40-Journal/Personal/YYYY/YYYY-MM-DD.md` — Notes, Links, Reflections, Completed
4. **Zettelkasten Linking** — suggest connections, check orphans, update MOCs; append new notes to `80-MOCs/_vault-index.md`
5. **Cleanup** — clear processed inbox items; report all actions taken

---

## Conventions

**Frontmatter** (every note): `created: YYYY-MM-DD` · `type: [see below]` · `tags: [kebab-case]`

**Types**: `daily` `meeting` `project` `study` `atomic` `moc` `error` `plan` `review` `idea` `brainstorm` `qa` `area` `journal-entry`

**File naming**: Resources → `Topic_Name.md` · Meetings → `YYYY-MM-DD_Topic.md` · Errors → `YYYY-MM-DD_Error.md` · Journals → `YYYY-MM-DD.md`

**Callouts**: `[!INFO]` `[!WARNING]` `[!TIP]` `[!bug]` `[!success]` `[!TODO]`

---

## Micro-Templates

Minimal note skeletons (full templates in `.metadata/Templates/`):

| Type | Skeleton |
|------|---------|
| study / atomic | `---\ncreated: DATE\ntype: TYPE\ntags: []\n---\n# TITLE\n## Summary\n## Key Concepts\n## Code\n## Related` |
| meeting | `---\ncreated: DATE\ntype: meeting\ntags: [client]\n---\n# TITLE\n## Agenda\n## Discussion\n## Action Items\n## Related` |
| work journal | `---\ncreated: DATE\ntype: daily\ntags: [work]\n---\n## ⏱️ Work Log\n## 📝 Notes\n## 🔗 Links\n## ✅ Completed` |
| personal journal | `---\ncreated: DATE\ntype: daily\ntags: [personal]\n---\n## 📝 Notes\n## 🔗 Links\n## 💭 Reflections\n## ✅ Completed` |
| error | `---\ncreated: DATE\ntype: error\ntags: []\n---\n> [!bug] Error\n\n## Root Cause\n> [!success] Fix\n\n## Related` |
| project (plan) | `---\ncreated: DATE\ntype: project\ntags: []\n---\n# PROJECT\n**Objective:**\n**Stack:**\n## Roadmap\n- [ ] Milestone 1` |

---

## Indexes

- **Project/client list**: Read `/10-Projects/_index.md` — update it when new projects are created (never scan folders from scratch)
- **Vault search**: Read `80-MOCs/_vault-index.md` for `!search`, `!link-suggest`, `!moc` — append new notes during EOD step 4
