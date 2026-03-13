# MindRepo Commands — Quick Reference

All available commands at a glance (use `!` prefix).

## Core Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!journal [text]` | Capture entry to inbox (categorized at EOD) | `!journal Fixed pipeline issue` |
| `!meeting [Client] [Topic]` | Create meeting note | `!meeting Acme Corp Review` |
| `!study [Topic]` | Create deep-dive study note | `!study PySpark Windows` |
| `!plan [Project]` | Scaffold new project | `!plan New Dashboard` |
| `!debug [Error]` | Document error and fix | `!debug [error trace]` |
| `!report [Client] [Time]` | Generate client status report | `!report Acme Corp last week` |
| `!refactor [text]` | Clean up selected text in-place | Select text + `!refactor` |
| `!inbox-process` | Process inbox interactively | `!inbox-process` |
| `!eod` | Run full end-of-day workflow | `!eod` |

## Capture Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!link [URL] [Desc]` | Save link to inbox | `!link https://... Article` |
| `!code [Desc] [Code]` | Save code snippet | `!code Example [code]` |
| `!idea [Text]` | Capture idea to inbox | `!idea Build tool` |
| `!note [Topic] [Content]` | Quick note | `!note Topic Content` |
| `!task [Desc] [Project] [Due]` | Create task | `!task Review PR Acme 2024-01-15` |

## Management Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!today` | Today's summary | `!today` |
| `!status [Project]` | Check project status | `!status Acme Project` |
| `!archive [Item]` | Archive item | `!archive Old Project` |
| `!review [Project/Time]` | Create review/retro | `!review last month` |

## Discovery Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!search [Query]` | Search vault | `!search PySpark` |
| `!tag [Note] [Tags]` | Add tags to note | `!tag Note tag1 tag2` |
| `!link-notes [N1] [N2]` | Link two notes | `!link-notes Note1 Note2` |
| `!link-suggest [Note]` | Suggest connections for note | `!link-suggest PySpark_Windows` |
| `!summary [Note]` | Generate summary | `!summary Project Name` |

## Zettelkasten Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!atomic [Topic]` | Create atomic permanent note | `!atomic PySpark ROW_NUMBER` |
| `!moc [Category]` | Create/update Map of Content | `!moc PySpark` |

## AI Interaction Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!brainstorm [Topic]` | Brainstorm with AI (creates summary note) | `!brainstorm New feature ideas` |
| `!ask [Question]` | Ask AI a question (creates Q&A note) | `!ask How to optimize PySpark?` |

## Help Command

| Command | Purpose | Example |
|---------|---------|---------|
| `!help` | Show all commands | `!help` |
| `!help [Command]` | Help for specific command | `!help study` |

---

## Command Categories

### 📝 Logging & Capture
- `!journal` — Inbox capture (categorized Work/Personal at EOD)
- `!link` — Save links (categorized at EOD)
- `!idea` — Quick ideas (categorized at EOD)
- `!note` — General notes
- `!code` — Code snippets

### 📋 Project Management
- `!plan` — Create project
- `!meeting` — Meeting notes
- `!task` — Standalone tasks
- `!status` — Check status
- `!review` — Reviews/retros
- `!archive` — Archive items

### 📚 Knowledge Base
- `!study` — Deep study notes
- `!debug` — Error troubleshooting
- `!link-notes` — Connect concepts
- `!summary` — Summarize content

### 🔍 Discovery & Organization
- `!search` — Search vault
- `!report` — Generate reports
- `!today` — Today's summary
- `!tag` — Add tags
- `!refactor` — Clean up text
- `!inbox-process` — Organize inbox (interactive)
- `!eod` — Full end-of-day workflow (5 steps)

### 🧠 Zettelkasten (Knowledge Linking)
- `!atomic` — Create atomic permanent notes
- `!moc` — Create Maps of Content
- `!link-suggest` — Find connections for notes

### 🤖 AI Interaction
- `!brainstorm` — Brainstorm with AI (creates summary note)
- `!ask` — Ask AI questions (creates Q&A note)

---

## EOD Workflow (`!eod`)

Runs 5 steps automatically:
1. Process inbox → categorize all items
2. Update Work Journal
3. Update Personal Journal
4. Zettelkasten linking for new resources
5. Cleanup and summary report

Use `!inbox-process` instead for interactive, step-by-step inbox review only.

---

**Full Documentation**: [[CLAUDE.md]] (AI instructions) · [[AGENT.md]] (detailed specs)
