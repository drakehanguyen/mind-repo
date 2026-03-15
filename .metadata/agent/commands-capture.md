# Capture Commands Specification

## `!link [URL] [Description]`

**Purpose**: Save link to inbox (categorized at EOD)

1. Create entry in `/00-Inbox/` with timestamp
2. Format: `- [Description](URL) - [[related-topic]]`
3. Auto-detect topic/category, suggest related notes from `_vault-index.md`
4. At EOD: add to journal Links section, or create resource note if significant

---

## `!code [Description] [Code Block]`

**Purpose**: Save code snippet with context

1. Determine destination:
   - Existing project → project folder
   - Resource topic → `/30-Resources/[Category]/`
   - Standalone → `/30-Resources/[Category]/code/`
2. If >50 lines: create separate file in `code/` subfolder
3. Include explanation, code block with language, related links

---

## `!idea [Text]`

**Purpose**: Quick idea capture

1. Create entry in `/00-Inbox/` with timestamp: `[HH:MM] 💡 [idea text]`
2. Suggest: related projects, whether to `!plan` or `!study` it
3. Link to related concepts from `_vault-index.md` if detected

---

## `!note [Topic] [Content]`

**Purpose**: Quick note capture

1. Determine destination:
   - Technical → `/30-Resources/[Category]/`
   - Project-related → project folder
   - General → today's work journal `## 📝 Notes`
2. Create note with frontmatter; auto-link from `_vault-index.md`

---

## `!task [Description] [Project/Client] [Due Date]`

**Purpose**: Create standalone task

1. If project/client specified: add to `TODO.md` or `Action_Items.md` with `- [ ] [Description] (due: YYYY-MM-DD)`
2. If no project: create in `/00-Inbox/` for EOD processing
3. Include due date if provided
