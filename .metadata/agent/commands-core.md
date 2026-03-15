# Core Commands Specification

## `!journal [text]`

**Purpose**: Add journal entry to inbox for end-of-day processing

1. Create entry in `/00-Inbox/` with timestamp
2. Format: `[YYYY-MM-DD HH:MM] [text]`
3. File naming: `Journal_YYYY-MM-DD_HHMM.md` or append to existing inbox file
4. Auto-link: read `/10-Projects/_index.md`, wrap confident matches in `[[Client Name]]`
5. Do NOT categorize yet — leave in inbox for EOD
6. Frontmatter: `type: journal-entry`, `tags: [journal, inbox]`

---

## `!meeting [Client] [Topic]`

**Purpose**: Create meeting note for a client

1. Create file: `/10-Projects/11-Consulting/[Client]/Meetings/YYYY-MM-DD_[Topic].md`
2. Create `Meetings/` folder if needed
3. Frontmatter: `type: meeting`
4. Sections: `## Agenda` · `## Discussion` · `## Action Items` (checkboxes `- [ ]`)
5. Auto-link to client's README; add action items with due dates there too

---

## `!study [Topic]`

**Purpose**: Create deep-dive study note (with Zettelkasten linking)

1. Determine category: Python, PySpark, AWS, Troubleshooting, or Consulting
2. Create file: `/30-Resources/[Category]/[Topic].md`
3. Sections: Quick Reference · Overview · Core Concepts · Advanced Patterns · Code Examples · Common Pitfalls · `## Related` (5-7 links)
4. Search `_vault-index.md` for related notes; create bidirectional links
5. Code: inline if <50 lines; separate `code/` subfolder if >50 lines
6. Suggest atomic breakdown if topic is complex
7. Append entry to `80-MOCs/_vault-index.md`

---

## `!plan [Project Name]`

**Purpose**: Scaffold a new project

1. Confirm category: 11-Consulting, 12-PersonalProject, or 13-Life
2. Create `/10-Projects/[Category]/[Project_Name]/` with:
   - `README.md` (Objective · Stack · Roadmap with checkboxes) · `Meetings/` · `TODO.md`
3. Frontmatter: `type: project`
4. Update `/10-Projects/_index.md` with new entry

---

## `!debug [Error Trace]`

**Purpose**: Create error troubleshooting note

1. Extract error name/keywords for filename
2. Create: `/30-Resources/Troubleshooting/YYYY-MM-DD_[Error_Name].md`
3. Structure: `> [!bug] Error` callout · Root cause · `> [!success] Fix` · `## Similar Errors`
4. Search `_vault-index.md` for similar past errors to link
5. Append entry to `80-MOCs/_vault-index.md`

---

## `!report [Client] [Timeframe]`

**Purpose**: Generate status report for a client

1. Scan `/40-Journal/Work/` for entries mentioning the client
2. Filter by timeframe (formats: "last week", "this month", "2024-01", date range)
3. Categorize into: Shipped · In Progress · Blockers
4. Output to chat; save to file only if explicitly requested

---

## `!refactor [selected text]`

**Purpose**: Clean up and restructure selected text in-place

1. Add clear headers, convert paragraphs to bullets where appropriate
2. Insert relevant Wikilinks to other concepts
3. Maintain original meaning — improve structure only

---

## `!inbox-process`

**Purpose**: Process inbox items interactively (same as EOD Step 1 only)

1. List all items in `/00-Inbox/`
2. For each, suggest category: Work Journal / Personal Journal / Resource / Project / Area / Idea / Link
3. User confirms, then move to correct location
4. Create proper structure (frontmatter, links)

---

## `!eod`

**Purpose**: Full 5-step end-of-day workflow

1. **Process Inbox** — categorize all `/00-Inbox/` items (Work Journal / Personal Journal / Resource / Project / Area / Idea / Link); confirm ambiguous items with user
2. **Update Work Journal** — `/40-Journal/Work/YYYY/YYYY-MM-DD.md` — Work Log, Notes, Links, Completed; extract action items to project TODOs
3. **Update Personal Journal** — `/40-Journal/Personal/YYYY/YYYY-MM-DD.md` — Notes, Links, Reflections, Completed
4. **Zettelkasten Linking** — for new `/30-Resources/` notes: suggest connections via `_vault-index.md`, identify orphaned notes, update relevant MOCs; append all new notes to `80-MOCs/_vault-index.md`
5. **Cleanup** — clear processed inbox items; report summary of all files created/updated

**Difference from `!inbox-process`**: `!eod` runs all 5 steps; `!inbox-process` covers only Step 1.

---

## Daily Workflow Reference

**Real-Time (Throughout Day)**
- Commands capture immediately; auto-linking uses `_index.md`
- Master list updated when new projects/clients created

**EOD Processing Logic**
- Work indicators: client names, project names, technical terms, work tasks
- Personal indicators: personal pronouns, life events, non-work activities, emotions
- If ambiguous: ask user or default to Personal
