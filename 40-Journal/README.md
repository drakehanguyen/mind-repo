---
created: 2024-01-01
type: concept
tags: [journal, daily, system]
---

# Journal

Separate daily journals for work and personal activities.

## Structure

Journal entries are organized by type and year:

```
/40-Journal/
  ├─ Work/
  │   └─ YYYY/
  │       └─ YYYY-MM-DD.md
  └─ Personal/
      └─ YYYY/
          └─ YYYY-MM-DD.md
```

## Work Journal

**Location**: `/40-Journal/Work/YYYY/YYYY-MM-DD.md`

**Sections**:
- **## ⏱️ Work Log** - Work activities and tasks
- **## 📝 Notes** - Work-related notes and observations
- **## 🔗 Links** - Work-related articles and resources
- **## ✅ Completed** - Completed work tasks

## Personal Journal

**Location**: `/40-Journal/Personal/YYYY/YYYY-MM-DD.md`

**Sections**:
- **## 📝 Notes** - Personal thoughts and observations
- **## 🔗 Links** - Personal interests and bookmarks
- **## 💭 Reflections** - Personal reflections and insights
- **## ✅ Completed** - Personal accomplishments

## Creating Entries

- **`!journal [text]`** - Add entry to inbox (categorized at end of day into Work or Personal)
- **`!log [text]`** - Add entry directly to today's work journal (legacy command)
- **`!link [URL] [Description]`** - Save link (categorized at end of day)
- **`!idea [Text]`** - Capture idea (categorized at end of day)

## End of Day Processing

At the end of each day, the AI processes the inbox and creates/updates journals:

1. **Categorizes inbox items**:
   - Work-related → Work Journal
   - Personal-related → Personal Journal
   - Other items → Appropriate folders (Resources, Projects, Areas)

2. **Creates/updates daily journals**:
   - Work Journal with work activities
   - Personal Journal with personal activities

3. **Organizes entries**:
   - Extracts tasks and links them to projects/clients
   - Categorizes notes into Resources, Areas, or Projects
   - Moves detailed content to appropriate permanent notes
   - Maintains links and references

## Purpose

The journals serve as:
- **Capture tool**: Quick capture throughout the day via `!journal`
- **Chronological record**: Timeline of work and personal activities
- **Processing source**: Raw material from inbox organized into journals
- **Reference**: Historical record of work and personal life

---

**Tip**: Use `!journal` throughout the day - don't worry about categorization. AI processes everything at end of day and puts entries in the correct Work or Personal journal.

