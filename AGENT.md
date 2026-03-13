# MindRepo AI Agent Instructions

## Overview

MindRepo is a conversational AI-powered "Second Brain" system designed for knowledge workers (originally for Data Engineer Consultants). The system captures logs, thoughts, journals, learning, work, and planning throughout the day, then processes and categorizes entries at end of day. It also supports deep conversations for study, planning, and brainstorming with automatic note generation.

**Core Principle**: The AI agent acts as an intelligent assistant that helps organize information into a structured knowledge repository using Obsidian-compatible Markdown with Wikilinks.

**Command Prefix**: All commands use the `!` prefix to avoid conflicts with AI agent internal commands.

**Knowledge Management Approach**: Hybrid PARA + Zettelkasten:
- **PARA** for action management (Projects, Areas, Archives)
- **Zettelkasten** for knowledge base (`/30-Resources/`) - atomic notes with rich linking

---

## Architecture

### Folder Structure

```
/00-Inbox/
  └─ Landing zone for raw thoughts, unparsed PDFs, brain dumps

/10-Projects/
  ├─ 11-Consulting/
  │   └─ [Client_Name]/
  │       ├─ README.md (auto-created)
  │       ├─ Meetings/ (auto-created)
  │       └─ TODO.md or Action_Items.md (auto-created)
  ├─ 12-PersonalProject/
  │   └─ [Project_Name]/ (same structure)
  └─ 13-Life/
      └─ [Project_Name]/ (same structure)

/20-Areas/
  ├─ Career/
  │   └─ Career.md
  ├─ Health/
  │   └─ Health.md
  ├─ Hobbies/
  │   └─ Hobbies.md
  └─ Languages/
      └─ Languages.md
  (Additional areas as needed: Finance/, Home/, etc.)

/30-Resources/
  ├─ Python/
  ├─ PySpark/
  ├─ AWS/
  ├─ Troubleshooting/
  └─ Consulting/
      └─ [Topic].md
          └─ code/ (subfolder for separate code files >50 lines)

/40-Journal/
  ├─ Work/
  │   └─ YYYY/
  │       └─ YYYY-MM-DD.md
  │           ├─ ## ⏱️ Work Log
  │           ├─ ## 📝 Notes
  │           ├─ ## 🔗 Links
  │           └─ ## ✅ Completed
  └─ Personal/
      └─ YYYY/
          └─ YYYY-MM-DD.md
              ├─ ## 📝 Notes
              ├─ ## 🔗 Links
              ├─ ## 💭 Reflections
              └─ ## ✅ Completed

/80-MOCs/
  └─ [Category]_MOC.md or [Category]_Index.md

/90-Archive/
  └─ YYYY/
      └─ [Archived_Items]/

/.metadata/
  └─ Templates/ (note templates for AI agents)
      ├─ Daily-Journal.md
      ├─ Meeting.md
      ├─ Study-Note.md
      ├─ Atomic-Note.md
      ├─ Project-README.md
      ├─ Error-Debug.md
      ├─ Review.md
      ├─ MOC.md
      └─ Area.md
```

---

## Obsidian Syntax Requirements

### 1. Links (Zettelkasten-Enhanced)
- **ALWAYS** use Wikilinks: `[[Note Name]]`
- **NEVER** use standard Markdown links: `[text](path)`
- **Bidirectional linking**: When linking Note A → Note B, also add link in Note B → Note A (in "## Related" section)
- **Link clusters**: Create connections between related concepts
- **Link suggestions**: When creating notes, suggest 3-5 related existing notes to link
- Link to existing notes when mentioned
- Create new notes when appropriate (use proper naming)
- **Link context**: Add brief context about why notes are linked (optional but recommended)

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
- `permanent`: Permanent/evergreen notes (Zettelkasten)
- `atomic`: Atomic notes - single concept (Zettelkasten)
- `moc`: Map of Content - index/linking hub
- `brainstorm`: Brainstorming session notes
- `qa`: Q&A session notes
- `question`: Question/answer notes
- `journal-entry`: Raw journal entry in inbox (before categorization)

### 3. Callouts
Use Obsidian callouts for emphasis:

- `> [!INFO]` - Information
- `> [!WARNING]` - Warnings
- `> [!TODO]` - Tasks
- `> [!bug]` - Errors
- `> [!success]` - Solutions/Fixes
- `> [!NOTE]` - Notes
- `> [!TIP]` - Tips

### 4. Templates
When creating notes, use templates from `/.metadata/Templates/`:

- **Daily-Journal.md** - For daily journal entries
- **Meeting.md** - For meeting notes
- **Study-Note.md** - For comprehensive study notes
- **Atomic-Note.md** - For atomic permanent notes (Zettelkasten)
- **Project-README.md** - For project documentation
- **Error-Debug.md** - For error troubleshooting
- **Review.md** - For reviews/retrospectives
- **MOC.md** - For Maps of Content
- **Area.md** - For area maintenance files

**Template Variables**:
- `{{date:YYYY-MM-DD}}` - Current date
- `{{title}}` - Note title/topic

**Usage**: Copy template, replace variables, customize content, add proper frontmatter and links.

---

## Commands Specification

### Core Commands

#### `!journal [text]`

**Purpose**: Add journal entry to inbox for end-of-day processing

**Action**:
1. Create entry in `/00-Inbox/` with timestamp
2. Format: `[YYYY-MM-DD HH:MM] [text]`
3. File naming: `Journal_YYYY-MM-DD_HHMM.md` or append to existing inbox file
4. Auto-link: Detect mentioned clients/projects and wrap in Wikilinks `[[Client Name]]` or `[[Project Name]]`
5. **Do NOT categorize yet** - leave in inbox for end-of-day processing
6. Add frontmatter with `type: journal-entry` and `tags: [journal, inbox]`

**Auto-linking Rules**:
- Maintain master list from existing folders in `/10-Projects/`
- Infer from existing project/client names
- Use both master list and inference for detection
- Only link if confident match exists

**Example**:
```
!journal Fixed data pipeline issue for Acme Corp. Need to follow up tomorrow.
```
Creates in inbox:
```markdown
[2024-01-15 14:30] Fixed data pipeline issue for [[Acme Corp]]. Need to follow up tomorrow.
```

**Note**: Entries are processed at end of day and categorized into Work or Personal journals.

---

---

#### `!meeting [Client] [Topic]`

**Purpose**: Create meeting note for a client

**Action**:
1. Create file: `/10-Projects/11-Consulting/[Client]/Meetings/YYYY-MM-DD_[Topic].md`
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

**Purpose**: Create deep-dive study note on a topic (with Zettelkasten linking)

**Action**:
1. Determine category: Python, PySpark, AWS, Troubleshooting, or Consulting
2. Create file: `/30-Resources/[Category]/[Topic].md`
3. Structure:
   - Quick Reference section at top
   - Typical sections: Overview, Core Concepts, Advanced Patterns, Code Examples, Common Pitfalls, Related Topics
   - `## Related` section with 5-7 linked notes (enhanced from 2-3)
4. **Enhanced Linking**:
   - Search existing notes for related concepts (keywords, tags, similar topics)
   - Suggest atomic notes that could be created from this topic
   - Create bidirectional links (add this note to related notes' "## Related" sections)
   - Link to MOC (Map of Content) for the category if it exists
5. Code examples:
   - Inline if <50 lines (use code blocks)
   - Separate files in `code/` subfolder if >50 lines
   - Include file path reference in note
6. Engineer-to-Engineer level depth
7. Include Python/PySpark code blocks with explanations
8. **Suggest atomic breakdown**: If topic is complex, suggest breaking into atomic notes

**Code File Naming**: `[Topic]_example_[number].py` or descriptive name

**Example**:
```
!study PySpark Window Functions
```

---

#### `!plan [Project Name]`

**Purpose**: Scaffold a new project

**Action**:
1. Determine category: 11-Consulting, 12-PersonalProject, or 13-Life
2. Create folder: `/10-Projects/[Category]/[Project_Name]/`
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
3. Create file: `/30-Resources/Troubleshooting/YYYY-MM-DD_[Error_Name].md`
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
1. Scan `/40-Journal/Work/` and `/40-Journal/Personal/` for specified timeframe
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

**Purpose**: Process items in inbox (manual trigger for end-of-day processing)

**Action**:
1. List all items in `/00-Inbox/`
2. For each item, auto-suggest category based on content:
   - **Work Journal** - Work-related activities
   - **Personal Journal** - Personal thoughts and activities
   - **Project** (which category and name)
   - **Resource** (which category and topic)
   - **Area** (which area file)
   - **Idea** - Standalone ideas
   - **Link** - Web links and bookmarks
3. User confirms categorization
4. Move item to appropriate location:
   - Journal entries → `/40-Journal/Work/` or `/40-Journal/Personal/`
   - Other items → Appropriate folders
5. Create proper structure (frontmatter, links, etc.)
6. Update daily journal files with categorized entries

**Frequency**: Daily processing (can be triggered manually or automated at end of day)

**Note**: This is the same process that happens automatically at end of day, but can be run on-demand.

---

#### `!eod`

**Purpose**: Run the full end-of-day workflow (5-step process)

**Action**:
1. **Process Inbox** — scan all items in `/00-Inbox/`, categorize each (Work Journal / Personal Journal / Resource / Project / Area / Idea / Link), ask user to confirm ambiguous items
2. **Update Work Journal** — `/40-Journal/Work/YYYY/YYYY-MM-DD.md` — organize work entries into: Work Log, Notes, Links, Completed; extract action items to project TODOs; link to mentioned clients/projects
3. **Update Personal Journal** — `/40-Journal/Personal/YYYY/YYYY-MM-DD.md` — organize personal entries into: Notes, Links, Reflections, Completed; link to areas if relevant
4. **Zettelkasten Linking** — for any new `/30-Resources/` notes: suggest connections to existing notes, identify orphaned notes, update relevant MOCs
5. **Cleanup** — clear processed inbox items; report a summary of all files created/updated

**Difference from `!inbox-process`**: `!eod` runs all 5 steps automatically. `!inbox-process` is interactive and covers only Step 1.

**Example**:
```
!eod
```

---

### Capture Commands

#### `!link [URL] [Description]`

**Purpose**: Save interesting links/articles (categorized at end of day)

**Action**:
1. Create entry in `/00-Inbox/` with timestamp (will be categorized at end of day)
2. Format entry as link: `- [Description](URL) - [[related-topic]]`
3. Auto-detect topic/category and suggest related notes to link
4. At end of day, AI will:
   - Add to Work or Personal journal Links section
   - Or create resource note if it's a significant learning resource
   - Link to related notes appropriately

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
   - Resource topic (add to `/30-Resources/[Category]/`)
   - Standalone snippet (create in `/30-Resources/[Category]/code/`)
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
1. Create entry in `/00-Inbox/` with timestamp (will be categorized at end of day)
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
   - If technical → `/30-Resources/[Category]/`
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
   - Create in `/00-Inbox/` for end-of-day processing
   - Will be added to appropriate journal (Work or Personal) at end of day
3. Format: `- [ ] [Description] (due: YYYY-MM-DD)`
4. Include due date if provided

**Example**:
```
!task Review PR for data pipeline Acme Corp 2024-01-15
```

---

### Management Commands

#### `!today`

**Purpose**: Quick view/summary of today's journals

**Action**:
1. Check for both journals:
   - Work Journal: `/40-Journal/Work/YYYY/YYYY-MM-DD.md`
   - Personal Journal: `/40-Journal/Personal/YYYY/YYYY-MM-DD.md`
2. Display summary for each:
   - Work Journal: Work log entries, notes, links, completed items
   - Personal Journal: Notes, links, reflections, completed items
3. Show quick stats and highlights
4. Show inbox items pending processing
5. Optionally suggest next actions

**Example**:
```
!today
```

---

#### `!status [Project Name]`

**Purpose**: Check project status

**Action**:
1. Locate project in `/10-Projects/`
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
1. Create `/90-Archive/` folder if it doesn't exist
2. Move project/note to archive
3. Update any links pointing to archived item
4. Add archive tag and date to frontmatter
5. Create archive index entry

**Archive Structure**:
```
/90-Archive/
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
2. If timeframe specified: Create in `/40-Journal/` or appropriate location
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

**Purpose**: Link related notes together (enhanced with bidirectional linking)

**Action**:
1. Locate both notes
2. Add Wikilink in each note's "## Related" section (or create section)
3. **Ensure bidirectional linking** - add link in both directions
4. Add brief context about why they're linked (optional but recommended)
5. Update if "## Related" section already exists
6. Check for link clusters - suggest other related notes that might benefit from linking

**Example**:
```
!link-notes PySpark_Window_Functions PySpark_DataFrames
```

---

#### `!atomic [Topic] [Content]`

**Purpose**: Create atomic permanent note (Zettelkasten principle)

**Action**:
1. Determine category: Python, PySpark, AWS, Troubleshooting, or Consulting
2. Create file: `/30-Resources/[Category]/[Topic].md`
3. **Atomic principle**: One concept per note - if topic is complex, suggest breaking down
4. Structure:
   - Single focused concept/idea
   - Brief explanation (2-3 paragraphs max)
   - `## Related` section with 5-10 linked notes (more than study notes)
   - `## See Also` for related concepts
5. Frontmatter: `type: atomic` or `type: permanent`
6. **Enhanced linking**:
   - Search for existing notes with similar concepts
   - Suggest connections to related atomic notes
   - Link to parent study notes if applicable
   - Link to MOC for category
7. Add unique identifier: `YYYYMMDD-HHMM-[Topic]` format in frontmatter (optional)

**Example**:
```
!atomic PySpark ROW_NUMBER Window Function
```

---

#### `!moc [Category/Topic]`

**Purpose**: Create or update Map of Content (MOC) - linking hub for a category

**Action**:
1. Determine if creating new MOC or updating existing
2. For category MOC: `/80-MOCs/[Category]_MOC.md` or `/80-MOCs/[Category]_Index.md`
3. Structure:
   - Overview of the category
   - `## Atomic Notes` - List all atomic/permanent notes
   - `## Study Notes` - List comprehensive study notes
   - `## Concepts` - Grouped by concept clusters
   - `## Related Categories` - Links to other category MOCs
4. Scan category folder and auto-populate with links to all notes
5. Organize by themes/concepts
6. Update MOC when new notes are added to category
7. Frontmatter: `type: moc`

**Example**:
```
!moc PySpark
!moc AWS
```

---

#### `!link-suggest [Note Name]`

**Purpose**: Suggest connections for a note (find related notes to link)

**Action**:
1. Locate the note
2. Analyze content for:
   - Keywords and concepts
   - Tags
   - Similar topics
3. Search vault for:
   - Notes with similar tags
   - Notes mentioning similar concepts
   - Notes in same category
   - Notes with related keywords
4. Display suggestions with:
   - Note name and path
   - Relevance score/reason
   - Suggested link context
5. User confirms which links to add
6. Create bidirectional links for confirmed suggestions

**Example**:
```
!link-suggest PySpark_Window_Functions
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

#### `!brainstorm [Topic]`

**Purpose**: Start an interactive brainstorming session with AI

**Action**:
1. Initiate conversational brainstorming session on the topic
2. Engage in back-and-forth discussion:
   - Generate ideas
   - Explore possibilities
   - Refine concepts
   - Ask follow-up questions
3. **Session End**: When user indicates completion (e.g., "done", "that's enough", or explicit end)
4. **Create Summary Note**:
   - Determine appropriate location:
     - If project-related → `/10-Projects/[Category]/[Project]/Brainstorm_[Topic].md`
     - If knowledge-related → `/30-Resources/[Category]/Brainstorm_[Topic].md`
     - If general → `/00-Inbox/Brainstorm_[Topic].md` for later processing
   - Structure:
     - **Topic**: The brainstorming topic
     - **Date**: Session date
     - **Key Ideas**: Summary of main ideas generated
     - **Explored Concepts**: Concepts discussed
     - **Next Steps**: Actionable items or follow-ups
     - **Session Notes**: Condensed conversation summary
   - Include YAML frontmatter: `type: brainstorm`
   - Link to:
     - Related projects (if applicable)
     - Related resources/concepts
     - Related ideas from journal
5. **Bidirectional Linking**: Add link to this brainstorm in related notes

**Example**:
```
!brainstorm New feature for Personal Project
[AI engages in brainstorming...]
User: That's enough, thanks
[AI creates summary note and links appropriately]
```

---

#### `!ask [Question/Topic]`

**Purpose**: Ask AI a question and have an interactive Q&A session

**Action**:
1. Initiate conversational Q&A session
2. Engage in discussion:
   - Answer the question
   - Provide follow-up information
   - Ask clarifying questions if needed
   - Explore related topics
3. **Session End**: When user indicates completion or question is fully answered
4. **Create Summary Note**:
   - Determine appropriate location:
     - If technical/knowledge → `/30-Resources/[Category]/Q&A_[Topic].md`
     - If project-related → `/10-Projects/[Category]/[Project]/Q&A_[Topic].md`
     - If general → `/00-Inbox/Q&A_[Topic].md` for later processing
   - Structure:
     - **Question**: The original question
     - **Date**: Session date
     - **Answer Summary**: Key points from the answer
     - **Key Insights**: Important insights or learnings
     - **Related Topics**: Topics discussed
     - **Follow-up Questions**: Potential follow-ups
     - **Session Notes**: Condensed Q&A summary
   - Include YAML frontmatter: `type: qa` or `type: question`
   - Link to:
     - Related study notes
     - Related concepts
     - Related resources
     - MOCs if applicable
5. **Bidirectional Linking**: Add link to this Q&A in related notes
6. **Knowledge Extraction**: If answer contains new knowledge, suggest creating atomic or study notes

**Example**:
```
!ask How do I optimize PySpark joins?
[AI provides answer and discusses...]
User: Got it, thanks
[AI creates summary note, links to PySpark resources, suggests creating study note if needed]
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
   - Core Commands (journal, meeting, study, plan, debug, report, refactor, inbox-process, eod)
   - Capture Commands (link, code, idea, note, task)
   - Management Commands (today, status, archive, review)
   - Discovery Commands (search, tag, link-notes, summary, link-suggest)
   - Zettelkasten Commands (atomic, moc)
   - AI Interaction Commands (brainstorm, ask)

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

**Step 1: Process Inbox**
1. Scan all items in `/00-Inbox/`
2. For each item, determine category:
   - **Work Journal**: Work-related activities, client mentions, project work, technical tasks
   - **Personal Journal**: Personal thoughts, life events, non-work activities, reflections
   - **Resources**: Knowledge, concepts, study materials
   - **Projects**: Project-specific items
   - **Areas**: Area-related maintenance items
   - **Ideas**: Standalone ideas (can become projects or resources)
   - **Links**: Web links and bookmarks
3. **Categorization Logic**:
   - Work indicators: Client names, project names, technical terms, work tasks
   - Personal indicators: Personal pronouns, life events, non-work activities, emotions
   - If ambiguous, ask user or default to Personal

**Step 2: Create/Update Daily Journals**
1. **Work Journal**: `/40-Journal/Work/YYYY/YYYY-MM-DD.md`
   - Process work-related entries from inbox
   - Organize into: Work Log, Notes, Links, Completed
   - Link to projects/clients mentioned
   - Extract actionable items to project TODOs
2. **Personal Journal**: `/40-Journal/Personal/YYYY/YYYY-MM-DD.md`
   - Process personal entries from inbox
   - Organize into: Notes, Links, Reflections, Completed
   - Link to areas if relevant
   - Extract goals or area updates

**Step 3: Process Other Inbox Items**
1. **Resources**: Move to `/30-Resources/[Category]/` with proper structure
2. **Projects**: Add to project folders or create new projects
3. **Areas**: Update area files in `/20-Areas/[Area]/`
4. **Ideas**: Move to appropriate location or suggest creating project/study note
5. **Links**: Add to journal Links section or create resource note if significant

**Step 4: Zettelkasten Linking Enhancement**
1. For new notes in `/30-Resources/`, suggest connections to existing notes
2. Check for orphaned notes (notes with no links) and suggest connections
3. Update MOCs if new notes were added to categories
4. Ensure bidirectional linking is maintained

**Step 5: Final Cleanup**
1. Ensure proper:
   - Wikilinks to related notes (bidirectional when possible)
   - Frontmatter with correct tags
   - Organization in correct folders
2. Clean up inbox: Move processed items or archive
3. Create summary of processing actions taken

---

## Master List Management

### Client/Project Detection
1. **Source 1**: Scan `/10-Projects/` folders to build master list
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
- Location: `/40-Journal/Work/YYYY/YYYY-MM-DD.md` or `/40-Journal/Personal/YYYY/YYYY-MM-DD.md`

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

### `/20-Areas/` Structure
- **Career/Career.md**: Professional development, career goals, skill tracking
- **Health/Health.md**: Exercise routines, medical records, wellness goals
- **Hobbies/Hobbies.md**: Personal hobby projects and interests
- **Languages/Languages.md**: Language learning progress and resources

Each area has its own subfolder, allowing for expansion with additional related files if needed.

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

## Zettelkasten Principles & Linking Strategy

### Core Principles Applied to `/30-Resources/`

1. **Atomic Notes**
   - One concept per note
   - Each note should be independently understandable
   - Break down complex topics into atomic pieces
   - Use `!atomic` command for permanent knowledge

2. **Rich Linking**
   - Aim for 5-10 links per note (more than traditional 2-3)
   - Bidirectional linking: Always link both ways
   - Link clusters: Connect related concepts
   - Contextual links: Explain why notes are related

3. **Emergent Organization**
   - Knowledge emerges from connections, not folders
   - Categories are entry points, not strict boundaries
   - Cross-category linking is encouraged
   - MOCs (Maps of Content) help navigate but don't restrict

4. **Permanent Notes**
   - Evergreen knowledge that doesn't expire
   - Distinguish from temporary/project-specific notes
   - Focus on concepts, not events
   - Update and refine over time

### Linking Strategy

**When Creating Notes:**
1. Search for existing notes with similar concepts
2. Link to parent concepts (broader topics)
3. Link to child concepts (specific details)
4. Link to related concepts (sibling topics)
5. Link to MOC for category navigation

**Link Types:**
- **Parent Links**: Broader concepts (e.g., "PySpark Window Functions" → "PySpark")
- **Child Links**: Specific details (e.g., "PySpark" → "PySpark Window Functions")
- **Sibling Links**: Related concepts (e.g., "PySpark Window Functions" ↔ "PySpark Aggregations")
- **Cross-Category Links**: Concepts spanning categories (e.g., "PySpark" ↔ "AWS EMR")

**Link Context:**
When adding links, optionally add context:
```markdown
## Related
- [[PySpark Aggregations]] - Similar transformation operations
- [[SQL Window Functions]] - SQL equivalent concept
- [[PySpark Performance]] - Performance considerations for window functions
```

**Orphaned Notes:**
- Notes with no links are "orphaned"
- Use `!link-suggest` to find connections
- End-of-day processing should identify and suggest links for orphaned notes

### MOC (Map of Content) Strategy

**Purpose:**
- Navigation hub for a category
- Overview of knowledge in that domain
- Entry point for exploring related concepts

**Structure:**
- Group notes by themes/concepts
- Show relationships between notes
- Link to other category MOCs
- Auto-update when new notes added

**When to Create:**
- When category has 10+ notes
- When knowledge base grows complex
- When user requests overview of category

---

## Best Practices

1. **Always use Wikilinks** - Never standard Markdown links
2. **Include frontmatter** - Every new note needs YAML
3. **Use templates** - Reference `/.metadata/Templates/` for consistent structure
4. **Auto-link intelligently** - Only when confident match exists
5. **Maintain structure** - Follow folder hierarchy strictly (PARA for Projects/Areas)
6. **Update master list** - Keep client/project list current
7. **Process daily** - End-of-day categorization is critical
8. **Preserve context** - When moving content, maintain links and references
9. **Ask before creating** - Confirm new projects/clients before creation
10. **Use callouts** - Enhance readability with Obsidian callouts
11. **Code organization** - Separate files for >50 lines, inline for smaller

### Zettelkasten-Specific Best Practices

11. **Bidirectional linking** - Always link both ways when connecting notes
12. **Rich linking** - Aim for 5-10 links per knowledge note (not just 2-3)
13. **Link context** - Add brief explanations for why notes are related
14. **Atomic notes** - Break complex topics into single-concept notes
15. **Update MOCs** - Keep Maps of Content current when adding notes
16. **Find orphans** - Identify and link orphaned notes during processing
17. **Cross-category links** - Don't restrict linking to same category
18. **Link clusters** - Create networks of related concepts
19. **Suggest connections** - Proactively suggest links when creating notes
20. **Refine over time** - Update permanent notes as knowledge evolves

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
AI: [Scans inbox, categorizes entries into Work/Personal journals and other folders, creates/updates daily journals, links appropriately]
```

### Example 5: Brainstorming Session
```
User: !brainstorm New feature for analytics dashboard
AI: [Engages in brainstorming conversation...]
User: That's enough, thanks
AI: [Creates summary note in appropriate location, links to related projects/resources]
```

### Example 6: Q&A Session
```
User: !ask How do I optimize PySpark joins?
AI: [Provides answer and discusses...]
User: Got it, thanks
AI: [Creates Q&A summary note, links to PySpark resources, suggests creating study note if needed]
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

### AI Interaction Sessions (`!brainstorm`, `!ask`)

**Session Management**:
- Engage naturally in conversation
- Ask clarifying questions when needed
- Provide thoughtful, detailed responses
- Continue until user indicates completion

**Session End Detection**:
- User says "done", "that's enough", "thanks", "got it", etc.
- User asks a new question (ends previous session)
- User uses a different command (ends previous session)
- Explicit "end session" or similar

**Post-Session Actions**:
1. **Summarize**: Create concise summary of key points
2. **Create Note**: Use appropriate template (Brainstorm.md or Q&A.md)
3. **Determine Location**:
   - Project-related → Project folder
   - Knowledge-related → Resources category
   - General → Inbox for processing
4. **Link Appropriately**:
   - Link to related notes (projects, resources, concepts)
   - Create bidirectional links
   - Link to MOCs if applicable
5. **Extract Knowledge**: If session revealed new knowledge, suggest creating study/atomic notes
6. **Action Items**: Extract any actionable items and link to projects/todos

**Best Practices for Sessions**:
- Be thorough but concise in summaries
- Focus on actionable insights
- Preserve important context
- Link to existing knowledge base
- Suggest follow-ups if appropriate

---

## Version

**Last Updated**: 2026-03-12
**Version**: 1.1

## Related

- [[CLAUDE.md]] — Compact agent instructions auto-loaded by Claude Code (authoritative for AI sessions)
- [[COMMANDS_QUICK_REFERENCE.md]] — Command lookup table
- [[README.md]] — Project overview

