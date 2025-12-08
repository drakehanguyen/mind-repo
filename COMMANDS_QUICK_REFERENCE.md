# MindRepo Commands - Quick Reference

All available commands at a glance (use `!` prefix).

## Core Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!log [text]` | Log work activity | `!log Fixed pipeline issue` |
| `!meeting [Client] [Topic]` | Create meeting note | `!meeting Acme Corp Review` |
| `!study [Topic]` | Create study note | `!study PySpark Windows` |
| `!plan [Project]` | Scaffold project | `!plan New Dashboard` |
| `!debug [Error]` | Document error | `!debug [error trace]` |
| `!report [Client] [Time]` | Generate report | `!report Acme Corp last week` |
| `!refactor [text]` | Clean up text | Select text + `!refactor` |
| `!inbox-process` | Process inbox | `!inbox-process` |

## Capture Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!link [URL] [Desc]` | Save link | `!link https://... Article` |
| `!code [Desc] [Code]` | Save code | `!code Example [code]` |
| `!idea [Text]` | Capture idea | `!idea Build tool` |
| `!note [Topic] [Content]` | Quick note | `!note Topic Content` |
| `!task [Desc] [Project] [Due]` | Create task | `!task Review PR Acme 2024-01-15` |

## Management Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `!today` | Today's summary | `!today` |
| `!status [Project]` | Project status | `!status Acme Project` |
| `!archive [Item]` | Archive item | `!archive Old Project` |
| `!review [Project/Time]` | Create review | `!review last month` |
| `!search [Query]` | Search vault | `!search PySpark` |
| `!tag [Note] [Tags]` | Add tags | `!tag Note tag1 tag2` |
| `!link-notes [N1] [N2]` | Link notes | `!link-notes Note1 Note2` |
| `!summary [Note]` | Generate summary | `!summary Project Name` |

## Help Command

| Command | Purpose | Example |
|---------|---------|---------|
| `!help` | Show all commands | `!help` |
| `!help [Command]` | Help for specific command | `!help log` |

---

## Command Categories

### 📝 **Logging & Capture**
- `!log` - Work log entries
- `!link` - Save links
- `!idea` - Quick ideas
- `!note` - General notes
- `!code` - Code snippets

### 📋 **Project Management**
- `!plan` - Create project
- `!meeting` - Meeting notes
- `!task` - Standalone tasks
- `!status` - Check status
- `!review` - Reviews/retros
- `!archive` - Archive items

### 📚 **Knowledge Base**
- `!study` - Deep study notes
- `!debug` - Error troubleshooting
- `!link-notes` - Connect concepts
- `!summary` - Summarize content

### 🔍 **Discovery & Organization**
- `!search` - Search vault
- `!report` - Generate reports
- `!today` - Today's summary
- `!tag` - Add tags
- `!refactor` - Clean up text
- `!inbox-process` - Organize inbox

---

## Getting Help

- `!help` - Show all commands
- `!help [command]` - Detailed help for specific command

**Full Documentation**: See [[AGENT.md]] for complete AI agent instructions (replaces COMMANDS.md and SYSTEM_INSTRUCTIONS.md).

