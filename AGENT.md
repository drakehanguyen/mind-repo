# MindRepo AI Agent Instructions

## Overview

MindRepo is a conversational AI-powered "Second Brain" system designed for knowledge workers (originally for Data Engineer Consultants). The system captures logs, thoughts, journals, learning, work, and planning throughout the day, then processes and categorizes entries at end of day. It also supports deep conversations for study, planning, and brainstorming with automatic note generation.

**Core Principle**: The AI agent acts as an intelligent assistant that helps organize information into a structured knowledge repository using Obsidian-compatible Markdown with Wikilinks.

**Command Prefix**: All commands use the `!` prefix to avoid conflicts with AI agent internal commands.

---

## Architecture

### Folder Structure

```
/00_Inbox/
  └─ Landing zone for raw thoughts, unparsed PDFs, brain dumps

/10_Projects/
  ├─ 11_Consulting/
  │   └─ [Client_Name]/
  │       ├─ README.md (auto-created)
  │       ├─ Meetings/ (auto-created)
  │       └─ TODO.md or Action_Items.md (auto-created)
  ├─ 12_PersonalProject/
  │   └─ [Project_Name]/ (same structure)
  └─ 13_Life/
      └─ [Project_Name]/ (same structure)

/20_Areas/
  ├─ Career.md
  ├─ Health.md
  ├─ Hobbies.md
  └─ Languages.md
  (Additional areas as needed: Finance.md, Home.md, etc.)

/30_Resources/
  ├─ Python/
  ├─ PySpark/
  ├─ AWS/
  ├─ Troubleshooting/
  └─ Consulting/
      └─ [Topic].md
          └─ code/ (subfolder for separate code files >50 lines)

/90_Journal/
  └─ YYYY/
      └─ YYYY-MM-DD.md
          ├─ ## ⏱️ Work Log
          ├─ ## 📝 Notes
          ├─ ## 🔗 Links
          └─ ## ✅ Completed

/90_Archive/
  └─ YYYY/
      └─ [Archived_Items]/

/00_Meta/
  └─ Templates/ (templates to be created)
```

---

## Obsidian Syntax Requirements

### 1. Links
- **ALWAYS** use Wikilinks: `[[Note Name]]`
- **NEVER** use standard Markdown links: `[text](path)`
- Link to existing notes when mentioned
- Create new notes when appropriate (use proper naming)

### 2. Frontmatter
Every new note MUST have YAML frontmatter:

```yaml
---
created: YYYY-MM-DD
type: [daily, concept, project, meeting, error, study, plan, review, task, idea, code, link, area]
tags: [kebab-case, multiple-tags]
---
```

**Type values:**
- `daily`: Daily journal entries
- `concept`: Knowledge base concepts
- `project`: Project documentation
- `meeting`: Meeting notes
- `error`: Error logs and troubleshooting
- `study`: Study/learning notes
- `plan`: Project plans
- `review`: Review/retrospective notes
- `task`: Task items
- `idea`: Ideas and brainstorming
- `code`: Code snippets and examples
- `link`: Saved links and bookmarks
- `area`: Area maintenance files

### 3. Callouts
Use Obsidian callouts for emphasis:

- `> [!INFO]` - Information
- `> [!WARNING]` - Warnings
- `> [!TODO]` - Tasks
- `> [!bug]` - Errors
- `> [!success]` - Solutions/Fixes
- `> [!NOTE]` - Notes
- `> [!TIP]` - Tips

---

## Commands Specification

### Core Commands

#### `!log [text]`

**Purpose**: Append work log entry to today's journal

**Action**:
1. Locate today's note: `/90_Journal/YYYY/YYYY-MM-DD.md` (create if missing)
2. Append entry under `## ⏱️ Work Log` section
3. Format: `[HH:MM] [text]`
4. Auto-link: Detect mentioned clients/projects and wrap in Wikilinks `[[Client Name]]` or `[[Project Name]]`

**Auto-linking Rules**:
- Maintain master list from existing folders in `/10_Projects/`
- Infer from existing project/client names
- Use both master list and inference for detection
- Only link if confident match exists

**Example**:
```
!log Fixed data pipeline issue for Acme Corp. Need to follow up tomorrow.
```
Creates:
```markdown
[14:30] Fixed data pipeline issue for [[Acme Corp]]. Need to follow up tomorrow.
```

---

#### `!meeting [Client] [Topic]`

**Purpose**: Create meeting note for a client

**Action**:
1. Create file: `/10_Projects/11_Consulting/[Client]/Meetings/YYYY-MM-DD_[Topic].md`
2. Create `Meetings/` folder if it doesn't exist
3. Include YAML frontmatter with `type: meeting`
4. Structure:
   - `## Agenda`
   - `## Discussion`
   - `## Action Items` (with checkboxes `- [ ]`)
5. Auto-link to client's project folder in README
6. Action items with due dates: Auto-add to project's README.md under appropriate section

**Action Items Format**:
```markdown
- [ ] Task description (due: YYYY-MM-DD)
- [ ] Another task
```

**Example**:
```
!meeting Acme Corp Data Pipeline Review
```

---

#### `!study [Topic]`

**Purpose**: Create deep-dive study note on a topic

**Action**:
1. Determine category: Python, PySpark, AWS, Troubleshooting, or Consulting
2. Create file: `/30_Resources/[Category]/[Topic].md`
3. Structure:
   - Quick Reference section at top
   - Typical sections: Overview, Core Concepts, Advanced Patterns, Code Examples, Common Pitfalls, Related Topics
   - `## Related` section linking 2-3 existing relevant notes
4. Code examples:
   - Inline if <50 lines (use code blocks)
   - Separate files in `code/` subfolder if >50 lines
   - Include file path reference in note
5. Engineer-to-Engineer level depth
6. Include Python/PySpark code blocks with explanations

**Code File Naming**: `[Topic]_example_[number].py` or descriptive name

**Example**:
```
!study PySpark Window Functions
```

---

#### `!plan [Project Name]`

**Purpose**: Scaffold a new project

**Action**:
1. Determine category: 11_Consulting, 12_PersonalProject, or 13_Life
2. Create folder: `/10_Projects/[Category]/[Project_Name]/`
3. Auto-create:
   - `README.md` with:
     - **Objective:** One-sentence goal
     - **Stack:** Tech used
     - **Roadmap:** 3-5 high-level milestones with checkboxes
   - `Meetings/` folder
   - `TODO.md` or `Action_Items.md`
4. Include YAML frontmatter in README with `type: project`

**Example**:
```
!plan Client Dashboard Redesign
```

---

#### `!debug [Error Trace]`

**Purpose**: Create error troubleshooting note

**Action**:
1. Analyze error trace for root cause
2. Extract error name/keywords for filename
3. Create file: `/30_Resources/Troubleshooting/YYYY-MM-DD_[Error_Name].md`
4. Structure:
   - `> [!bug] Error` callout with error trace
   - Root cause analysis
   - `> [!success] Fix` callout with solution code
5. Match similar past errors using:
   - Error message keywords
   - Stack trace patterns
   - Tags from existing error notes
6. Suggest similar errors in a "## Similar Errors" section with links

**Example**:
```
!debug PySpark AnalysisException: cannot resolve 'column_name' given input columns
```

---

#### `!report [Client] [Timeframe]`

**Purpose**: Generate status report for a client

**Action**:
1. Scan `/90_Journal/` for specified timeframe
2. Filter entries containing client tag `#client-name` or Wikilink `[[Client Name]]`
3. Categorize into: **Shipped**, **In Progress**, **Blockers**
4. Output: Chat output (mixed format with activity descriptions)
5. Only save to markdown file if explicitly requested

**Timeframe formats**: "last week", "this month", "2024-01", "2024-01-01 to 2024-01-31"

**Example**:
```
!report Acme Corp last week
```

---

#### `!refactor [selected text]`

**Purpose**: Clean up and restructure selected text

**Action**:
1. Replace text in-place (no atomic note requirement)
2. Improvements:
   - Add clear headers
   - Convert paragraphs to bullet points where appropriate
   - Insert relevant Wikilinks to other concepts
   - Improve structure and readability
3. Maintain original meaning and content

**Example**: User selects messy text, AI refactors it in-place.

---

#### `!inbox-process`

**Purpose**: Process items in inbox

**Action**:
1. List all items in `/00_Inbox/`
2. For each item, auto-suggest category based on content:
   - Project (which category and name)
   - Resource (which category and topic)
   - Journal entry (which section)
   - Area (which area file)
3. User confirms categorization
4. Move item to appropriate location
5. Create proper structure (frontmatter, links, etc.)

**Frequency**: Daily processing

---

### Capture Commands

#### `!link [URL] [Description]`

**Purpose**: Save interesting links/articles to journal

**Action**:
1. Locate today's note: `/90_Journal/YYYY/YYYY-MM-DD.md` (create if missing)
2. Append entry under `## 🔗 Links` section
3. Format: `- [Description](URL) - [[related-topic]]` or just URL with description
4. Auto-detect topic/category and suggest related notes to link
5. Optionally create a resource note if it's a significant learning resource

**Example**:
```
!link https://spark.apache.org/docs/latest/sql-pyspark-pandas-with-arrow.html PySpark Pandas UDF optimization
```

---

#### `!code [Description] [Code Block]`

**Purpose**: Save code snippets with context

**Action**:
1. Determine if code belongs to:
   - Existing project (add to project folder)
   - Resource topic (add to `/30_Resources/[Category]/`)
   - Standalone snippet (create in `/30_Resources/[Category]/code/`)
2. Create or append to appropriate note
3. Include:
   - Context/explanation
   - Code block with language specified
   - Related notes linked
4. If >50 lines, create separate file in `code/` subfolder

**Example**:
```
!code PySpark DataFrame optimization example [paste code]
```

---

#### `!idea [Text]`

**Purpose**: Quick idea capture

**Action**:
1. Append to today's journal under `## 📝 Notes` section
2. Format: `[HH:MM] 💡 [idea text]`
3. Auto-suggest:
   - Related projects it might belong to
   - Whether it should become a project (`!plan`)
   - Whether it's a study topic (`!study`)
4. Link to related concepts if detected

**Example**:
```
!idea Build a PySpark performance monitoring tool
```

---

#### `!note [Topic] [Content]`

**Purpose**: Quick note capture without specific structure

**Action**:
1. Determine category:
   - If technical → `/30_Resources/[Category]/`
   - If project-related → Project folder
   - If general → Today's journal `## 📝 Notes`
2. Create note with frontmatter
3. Add content with basic structure
4. Auto-link to related notes

**Example**:
```
!note AWS S3 pricing changes Important update about S3 pricing structure...
```

---

#### `!task [Description] [Project/Client] [Due Date]`

**Purpose**: Create standalone task

**Action**:
1. If project/client specified:
   - Add to project's `TODO.md` or `Action_Items.md`
   - Link to project
2. If no project specified:
   - Add to today's journal under `## ⏱️ Work Log`
   - Or create in `/00_Inbox/` for later processing
3. Format: `- [ ] [Description] (due: YYYY-MM-DD)`
4. Include due date if provided

**Example**:
```
!task Review PR for data pipeline Acme Corp 2024-01-15
```

---

### Management Commands

#### `!today`

**Purpose**: Quick view/summary of today's journal

**Action**:
1. Open today's journal: `/90_Journal/YYYY/YYYY-MM-DD.md`
2. Display summary:
   - Work log entries count
   - Notes count
   - Links count
   - Completed items
3. Show quick stats and highlights
4. Optionally suggest next actions

**Example**:
```
!today
```

---

#### `!status [Project Name]`

**Purpose**: Check project status

**Action**:
1. Locate project in `/10_Projects/`
2. Read project `README.md`
3. Check:
   - Roadmap progress (checked items)
   - Recent meetings
   - Action items from `TODO.md`
   - Recent journal entries mentioning project
4. Display status summary with:
   - Current phase
   - Blockers (if any)
   - Next steps
   - Recent activity

**Example**:
```
!status Acme Corp Dashboard
```

---

#### `!archive [Project/Note Name]`

**Purpose**: Archive completed projects or notes

**Action**:
1. Create `/90_Archive/` folder if it doesn't exist
2. Move project/note to archive
3. Update any links pointing to archived item
4. Add archive tag and date to frontmatter
5. Create archive index entry

**Archive Structure**:
```
/90_Archive/
  └─ YYYY/
      └─ [Project_Name]/
```

**Example**:
```
!archive Completed Client Project
```

---

#### `!review [Project/Timeframe]`

**Purpose**: Create review/retrospective note

**Action**:
1. If project specified: Create in project folder
2. If timeframe specified: Create in `/90_Journal/` or appropriate location
3. Structure:
   - `## What Went Well`
   - `## What Could Improve`
   - `## Lessons Learned`
   - `## Action Items`
4. Link to related meetings, logs, and resources
5. Include YAML frontmatter with `type: review`

**Example**:
```
!review Acme Corp Project
!review last month
```

---

### Discovery Commands

#### `!search [Query]`

**Purpose**: Search across the vault

**Action**:
1. Search in:
   - Note titles
   - Note content
   - Tags
   - Frontmatter fields
2. Display results with:
   - Note name and path
   - Relevant snippet
   - Match type (title, content, tag)
3. Allow filtering by:
   - Folder
   - Type
   - Tags
   - Date range

**Example**:
```
!search PySpark optimization
!search #aws tag:meeting
```

---

#### `!tag [Note Name] [Tags]`

**Purpose**: Add tags to existing notes

**Action**:
1. Locate note
2. Read existing frontmatter
3. Add new tags (kebab-case)
4. Update frontmatter
5. Preserve existing tags

**Example**:
```
!tag PySpark_Window_Functions pyspark advanced optimization
```

---

#### `!link-notes [Note1] [Note2]`

**Purpose**: Link related notes together

**Action**:
1. Locate both notes
2. Add Wikilink in each note's "## Related" section (or create section)
3. Ensure bidirectional linking
4. Update if "## Related" section already exists

**Example**:
```
!link-notes PySpark_Window_Functions PySpark_DataFrames
```

---

#### `!summary [Note/Project Name]`

**Purpose**: Generate summary of a note or project

**Action**:
1. Read note/project content
2. Generate concise summary:
   - Key points
   - Main concepts
   - Important dates/deadlines
   - Related items
3. Display in chat
4. Optionally append summary section to note

**Example**:
```
!summary Acme Corp Project
!summary PySpark_Window_Functions
```

---

#### `!help [Command Name]`

**Purpose**: Display all available commands or help for specific command

**Action**:
1. If no argument: Display formatted list of all commands organized by category
2. If command name provided: Show detailed help for that specific command
3. Format output with:
   - Command name and brief description
   - Usage syntax
   - Quick example
4. Organize by categories:
   - Core Commands (log, meeting, study, plan, debug, report, refactor, inbox-process)
   - Capture Commands (link, code, idea, note, task)
   - Management Commands (today, status, archive, review)
   - Discovery Commands (search, tag, link-notes, summary)

**Output Format**:
- Chat output (formatted markdown)
- Easy to scan with clear sections
- Includes quick reference table

**Example**:
```
!help
!help log
!help study
```

---

## Daily Workflow

### Real-Time (Throughout Day)
- User inputs via commands (using `!` prefix)
- Entries captured immediately in appropriate locations
- Auto-linking happens on-the-fly
- Master list updated as new projects/clients are created

### End of Day Processing
1. Open today's journal: `/90_Journal/YYYY/YYYY-MM-DD.md`
2. Process each section:
   - **Work Log**: Extract tasks, link to projects/clients, move actionable items
   - **Notes**: Categorize into Resources, Areas, or Projects
   - **Links**: Create resource notes or add to existing topics
   - **Completed**: Archive or link to completed projects
3. Ensure proper:
   - Wikilinks to related notes
   - Frontmatter with correct tags
   - Organization in correct folders
4. Clean up journal: Keep summary, move detailed content to proper notes

---

## Master List Management

### Client/Project Detection
1. **Source 1**: Scan `/10_Projects/` folders to build master list
2. **Source 2**: Infer from existing notes and links
3. **Update**: When new projects/clients created, add to master list
4. **Storage**: Maintain in memory or reference from folder structure

### Auto-Linking Rules
- Only link if confident match (exact or very close)
- Use proper capitalization from folder names
- Create new project/client if mentioned but doesn't exist (with user confirmation)

---

## File Naming Conventions

### Projects
- Use descriptive names: `Client Dashboard Redesign`
- No special characters except spaces and hyphens

### Resources
- Use topic names: `PySpark_Window_Functions.md`
- Kebab-case or snake_case acceptable

### Meetings
- Format: `YYYY-MM-DD_[Topic].md`
- Example: `2024-01-15_Data_Pipeline_Review.md`

### Errors
- Format: `YYYY-MM-DD_[Error_Name].md`
- Example: `2024-01-15_PySpark_AnalysisException.md`

### Journal
- Format: `YYYY-MM-DD.md`
- Location: `/90_Journal/YYYY/YYYY-MM-DD.md`

---

## Code Organization

### Inline Code
- Use for code <50 lines
- Format: Markdown code blocks with language specified
- Include explanations before/after

### Separate Files
- Use for code >50 lines
- Location: `code/` subfolder in resource topic folder
- Naming: Descriptive names like `window_functions_example.py`
- Reference in note: `See [[code/window_functions_example.py]]`

---

## Areas Management

### `/20_Areas/` Files
- **Career.md**: Professional development, career goals, skill tracking
- **Health.md**: Exercise routines, medical records, wellness goals
- **Hobbies.md**: Personal hobby projects and interests
- **Languages.md**: Language learning progress and resources

### Area File Structure
- Long-term maintenance items
- Goals and standards
- Progress tracking
- Regular updates (not daily, but periodic)

---

## Dashboards (On-Demand)

### "Recently Added"
- Query: Files created in last N days (default: 7)
- Sort by: Creation date (newest first)
- Show: Title, category, creation date

### "Most Referenced"
- Query: Files with most incoming Wikilinks
- Sort by: Link count (highest first)
- Show: Title, link count, category

**Implementation**: Use Dataview queries (when available) or manual scanning

---

## Error Handling

### Missing Files/Folders
- Create missing folders automatically
- Create missing files when needed
- Never fail silently - inform user of actions taken

### Ambiguous Commands
- Ask for clarification if command is unclear
- Suggest alternatives if needed
- Confirm before creating new projects/clients

### Duplicate Detection
- Check if note already exists before creating
- Suggest linking to existing note if duplicate detected
- Merge content if appropriate (with user confirmation)

---

## Best Practices

1. **Always use Wikilinks** - Never standard Markdown links
2. **Include frontmatter** - Every new note needs YAML
3. **Auto-link intelligently** - Only when confident match exists
4. **Maintain structure** - Follow folder hierarchy strictly
5. **Update master list** - Keep client/project list current
6. **Process daily** - End-of-day categorization is critical
7. **Preserve context** - When moving content, maintain links and references
8. **Ask before creating** - Confirm new projects/clients before creation
9. **Use callouts** - Enhance readability with Obsidian callouts
10. **Code organization** - Separate files for >50 lines, inline for smaller

---

## Examples

### Example 1: Daily Log Entry
```
User: !log Fixed bug in data pipeline for Acme Corp. Need to deploy tomorrow.
AI: [Appends to journal with auto-linking]
```

### Example 2: Meeting Note
```
User: !meeting Acme Corp Q1 Planning
AI: [Creates meeting note, links to project, structures with sections]
```

### Example 3: Study Note
```
User: !study AWS S3 Best Practices
AI: [Creates deep-dive note in Resources/AWS/, includes code examples, links to related notes]
```

### Example 4: End of Day Processing
```
AI: [Scans today's journal, categorizes entries, moves to appropriate notes, updates links]
```

---

## Notes for AI Agents

- This system is designed to be conversational and helpful
- Always confirm before creating new major structures (projects, clients)
- Maintain consistency in naming and structure
- Prioritize user's workflow and preferences
- Learn from existing notes to improve auto-linking and categorization
- Be proactive in suggesting improvements to organization
- Use the `!` prefix for all commands to avoid conflicts
- When in doubt, ask the user for clarification rather than making assumptions

---

## Version

**Last Updated**: 2024-01-XX
**Version**: 1.0

