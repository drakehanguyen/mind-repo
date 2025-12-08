# MindRepo Command Reference

Quick reference guide for all commands available in MindRepo (use `!` prefix).

---

## `!log [text]`

**Purpose**: Log work activity to today's journal

**Usage**: `!log Fixed data pipeline issue for Acme Corp`

**What it does**:
- Adds entry to today's journal under `## ⏱️ Work Log`
- Timestamps with `HH:MM` format
- Auto-links mentioned clients/projects

**Example**:
```
!log Reviewed PySpark optimization for Client X. Need to follow up on performance metrics.
```

---

## `!meeting [Client] [Topic]`

**Purpose**: Create a meeting note

**Usage**: `!meeting Acme Corp Data Pipeline Review`

**What it does**:
- Creates meeting note in client's `Meetings/` folder
- Structures with Agenda, Discussion, Action Items
- Auto-links to client project
- Action items with due dates → added to project README

**Example**:
```
!meeting Acme Corp Q1 Planning Session
```

---

## `!study [Topic]`

**Purpose**: Create a deep-dive study note

**Usage**: `!study PySpark Window Functions`

**What it does**:
- Creates comprehensive study note in `/30_Resources/[Category]/`
- Includes Quick Reference at top
- Deep technical content with code examples
- Links to related topics

**Example**:
```
!study AWS S3 Lifecycle Policies
```

---

## `!plan [Project Name]`

**Purpose**: Scaffold a new project

**Usage**: `!plan Client Dashboard Redesign`

**What it does**:
- Creates project folder with README
- Sets up structure: Meetings/, TODO.md
- Includes Objective, Stack, Roadmap

**Example**:
```
!plan PersonalProject Analytics Module
```

---

## `!debug [Error Trace]`

**Purpose**: Document and troubleshoot an error

**Usage**: `!debug [paste error trace]`

**What it does**:
- Creates error troubleshooting note
- Analyzes root cause
- Provides solution with code
- Suggests similar past errors

**Example**:
```
!debug PySpark AnalysisException: cannot resolve 'column_name'
```

---

## `!report [Client] [Timeframe]`

**Purpose**: Generate status report

**Usage**: `!report Acme Corp last week`

**What it does**:
- Scans journal for timeframe
- Categorizes: Shipped, In Progress, Blockers
- Outputs summary (chat or markdown)

**Timeframe examples**:
- `last week`
- `this month`
- `2024-01`
- `2024-01-01 to 2024-01-31`

**Example**:
```
!report Acme Corp this month
```

---

## `!refactor [selected text]`

**Purpose**: Clean up and restructure text

**Usage**: Select text, then `!refactor`

**What it does**:
- Improves structure and readability
- Adds headers and bullet points
- Inserts relevant Wikilinks
- Replaces in-place

**Example**: Select messy notes, AI refactors them.

---

## `!inbox-process`

**Purpose**: Process inbox items

**Usage**: `!inbox-process`

**What it does**:
- Lists all items in `/00_Inbox/`
- Auto-suggests categories
- You confirm, AI organizes

**Frequency**: Daily

**Example**:
```
!inbox-process
[AI suggests categories for each item]
[You confirm]
[AI moves and organizes]
```

---

## `!link [URL] [Description]`

**Purpose**: Save interesting links/articles

**Usage**: `!link https://example.com/article PySpark optimization guide`

**What it does**:
- Adds to today's journal under `## 🔗 Links`
- Auto-suggests related topics to link
- Can create resource note for significant learning resources

**Example**:
```
!link https://spark.apache.org/docs/latest/sql-pyspark-pandas-with-arrow.html PySpark Pandas UDF optimization
```

---

## `!code [Description] [Code Block]`

**Purpose**: Save code snippets with context

**Usage**: `!code PySpark DataFrame optimization [paste code]`

**What it does**:
- Saves to appropriate location (project or resources)
- Includes context and explanations
- Creates separate file if >50 lines

**Example**:
```
!code PySpark window function example [paste code here]
```

---

## `!idea [Text]`

**Purpose**: Quick idea capture

**Usage**: `!idea Build a PySpark performance monitoring tool`

**What it does**:
- Adds to today's journal under `## 📝 Notes`
- Suggests if it should become a project or study topic
- Auto-links to related concepts

**Example**:
```
!idea Create AWS cost optimization dashboard
```

---

## `!task [Description] [Project/Client] [Due Date]`

**Purpose**: Create standalone task

**Usage**: `!task Review PR for data pipeline Acme Corp 2024-01-15`

**What it does**:
- Adds to project's TODO.md if project specified
- Otherwise adds to today's journal
- Includes due date if provided

**Example**:
```
!task Deploy new pipeline to production PersonalProject 2024-01-20
```

---

## `!today`

**Purpose**: Quick view of today's journal

**Usage**: `!today`

**What it does**:
- Shows summary of today's activities
- Displays counts and highlights
- Suggests next actions

**Example**:
```
!today
```

---

## `!status [Project Name]`

**Purpose**: Check project status

**Usage**: `!status Acme Corp Dashboard`

**What it does**:
- Shows roadmap progress
- Lists recent meetings and action items
- Displays current phase and blockers
- Shows recent activity

**Example**:
```
!status PersonalProject Analytics Module
```

---

## `!archive [Project/Note Name]`

**Purpose**: Archive completed items

**Usage**: `!archive Completed Client Project`

**What it does**:
- Moves to `/90_Archive/` folder
- Updates links
- Adds archive tag and date

**Example**:
```
!archive Old Project Name
```

---

## `!note [Topic] [Content]`

**Purpose**: Quick note capture

**Usage**: `!note AWS S3 pricing Important update about pricing...`

**What it does**:
- Creates note in appropriate location
- Auto-links to related notes
- Adds proper frontmatter

**Example**:
```
!note PySpark best practices Always use broadcast joins for small tables...
```

---

## `!review [Project/Timeframe]`

**Purpose**: Create review/retrospective

**Usage**: `!review Acme Corp Project` or `!review last month`

**What it does**:
- Creates structured review note
- Includes: What Went Well, Improvements, Lessons Learned
- Links to related meetings and logs

**Example**:
```
!review Q1 2024
```

---

## `!search [Query]`

**Purpose**: Search across the vault

**Usage**: `!search PySpark optimization` or `!search #aws tag:meeting`

**What it does**:
- Searches titles, content, tags, frontmatter
- Shows results with snippets
- Allows filtering by folder, type, tags, date

**Example**:
```
!search data pipeline
!search tag:error
```

---

## `!tag [Note Name] [Tags]`

**Purpose**: Add tags to existing notes

**Usage**: `!tag PySpark_Window_Functions pyspark advanced optimization`

**What it does**:
- Updates note's frontmatter
- Adds new tags (preserves existing)
- Uses kebab-case format

**Example**:
```
!tag AWS_S3_Best_Practices aws storage best-practices
```

---

## `!link-notes [Note1] [Note2]`

**Purpose**: Link related notes together

**Usage**: `!link-notes PySpark_Window_Functions PySpark_DataFrames`

**What it does**:
- Adds bidirectional links in "## Related" sections
- Creates section if it doesn't exist

**Example**:
```
!link-notes AWS_S3 AWS_Glue
```

---

## `!summary [Note/Project Name]`

**Purpose**: Generate summary

**Usage**: `!summary Acme Corp Project`

**What it does**:
- Generates concise summary
- Shows key points and concepts
- Lists important dates and related items

**Example**:
```
!summary PySpark_Window_Functions
```

---

## `!help [Command Name]`

**Purpose**: Show all commands or help for specific command

**Usage**: `!help` or `!help [command]`

**What it does**:
- Lists all available commands organized by category
- Shows brief description and usage for each
- If command specified, shows detailed help for that command
- Includes quick examples

**Categories**:
- **Core**: log, meeting, study, plan, debug, report, refactor, inbox-process
- **Capture**: link, code, idea, note, task
- **Management**: today, status, archive, review
- **Discovery**: search, tag, link-notes, summary

**Example**:
```
!help
!help log
!help study
```

---

## Tips

- **Auto-linking**: Mention clients/projects by name, they'll be auto-linked
- **Daily Processing**: AI processes your journal at end of day automatically
- **Wikilinks**: All links use `[[Note Name]]` format (Obsidian-compatible)
- **Code**: Code >50 lines goes in separate files, smaller stays inline

---

## Need Help?

See `/00_Meta/SYSTEM_INSTRUCTIONS.md` for detailed technical specifications.

