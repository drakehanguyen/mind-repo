# Management & Discovery Commands Specification

## `!today`

**Purpose**: Quick summary of today's journals + inbox

1. Read Work Journal: `/40-Journal/Work/YYYY/YYYY-MM-DD.md`
2. Read Personal Journal: `/40-Journal/Personal/YYYY/YYYY-MM-DD.md`
3. Show inbox items pending processing
4. Display highlights, quick stats, optional next actions

---

## `!status [Project Name]`

**Purpose**: Check project status

1. Read project `README.md` and `TODO.md`
2. Check roadmap progress (checked items), recent meetings, action items
3. Display: current phase · blockers · next steps · recent activity

---

## `!archive [Item]`

**Purpose**: Archive completed project or note

1. Move to `/90-Archive/YYYY/[Item_Name]/`
2. Update any incoming Wikilinks pointing to archived item
3. Add `archived: YYYY-MM-DD` to frontmatter

---

## `!review [Project/Timeframe]`

**Purpose**: Create retrospective note

1. If project: create in project folder; if timeframe: create in `/40-Journal/`
2. Sections: What Went Well · What Could Improve · Lessons Learned · Action Items
3. Link to related meetings, logs, resources
4. Frontmatter: `type: review`

---

## `!update`

Run `bash scripts/update.sh` from vault root. Report changed files; show confirmation prompt.

---

## `!remote`

Run `bash scripts/remote.sh`. Inform user a QR code will appear; scan with Claude app or open session URL at claude.ai/code.

---

## `!search [Query]`

**Purpose**: Search across the vault

1. Read `80-MOCs/_vault-index.md` — filter lines by keyword/tag (fast path)
2. For deeper search: scan note content in relevant folders
3. Display results: note name, path, relevant snippet, match type
4. Allow filtering by folder, type, tags, date range

---

## `!tag [Note Name] [Tags]`

Add tags to existing note: locate note → read frontmatter → append new kebab-case tags → write back.

---

## `!summary [Note/Project Name]`

Read note/project; display key points, main concepts, important dates/deadlines. Optionally append `## Summary` section to note.

---

## `!brainstorm [Topic]`

**Purpose**: Interactive brainstorming session

1. Engage in back-and-forth discussion: generate ideas, explore possibilities, ask follow-ups
2. **Session end**: when user says "done", "thanks", "got it", "that's enough", or starts new command
3. **Post-session**: create summary note:
   - Location: project-related → project folder; knowledge-related → `30-Resources/`; general → inbox
   - Sections: Topic · Date · Key Ideas · Explored Concepts · Next Steps · Session Notes
   - Frontmatter: `type: brainstorm`
   - Bidirectional links to related notes; extract action items

---

## `!ask [Question]`

**Purpose**: Interactive Q&A session

1. Answer and discuss; ask clarifying questions; explore related topics
2. **Session end**: same triggers as `!brainstorm`
3. **Post-session**: create summary note:
   - Location: technical → `30-Resources/`; project-related → project folder; general → inbox
   - Sections: Question · Date · Answer Summary · Key Insights · Related Topics · Follow-up Questions
   - Frontmatter: `type: qa`
   - Links to related study notes, resources, MOCs; suggest atomic/study notes if new knowledge emerged

---

## `!help [Command Name]`

- No argument: display all commands by category (read from CLAUDE.md command table)
- With command name: show detailed spec from the relevant `.metadata/agent/commands-*.md` file
