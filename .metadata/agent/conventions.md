# Conventions & Syntax Reference

## Wikilinks (Required)

- **ALWAYS** use: `[[Note Name]]`
- **NEVER** use: `[text](path)`
- Bidirectional: A→B also add B→A in `## Related`
- Link context: add brief note why they're related (optional but recommended)
- Only auto-link when confident match exists in `_index.md`

---

## Frontmatter (Every Note)

```yaml
---
created: YYYY-MM-DD
type: [see types below]
tags: [kebab-case, multiple-tags]
---
```

**Type values**: `daily` · `meeting` · `project` · `study` · `atomic` · `moc` · `error` · `plan` · `review` · `idea` · `brainstorm` · `qa` · `area` · `journal-entry` · `permanent` · `code` · `link`

---

## File Naming

| Note type | Pattern | Example |
|-----------|---------|---------|
| Resource | `Topic_Name.md` | `PySpark_Window_Functions.md` |
| Meeting | `YYYY-MM-DD_Topic.md` | `2026-03-14_Pipeline_Review.md` |
| Error | `YYYY-MM-DD_Error_Name.md` | `2026-03-14_AnalysisException.md` |
| Journal | `YYYY-MM-DD.md` | `2026-03-14.md` |
| Project | Descriptive folder name | `Client_Dashboard_Redesign/` |

---

## Obsidian Callouts

- `> [!INFO]` — Information
- `> [!WARNING]` — Warnings / gotchas
- `> [!TIP]` — Best practices
- `> [!bug]` — Errors
- `> [!success]` — Solutions / fixes
- `> [!TODO]` — Action items
- `> [!NOTE]` — Notes

---

## Code Organization

- **Inline** (< 50 lines): code block with language specified in the note
- **Separate file** (≥ 50 lines): `code/` subfolder; reference in note as `See [[code/filename.py]]`
- File naming: `topic_example_1.py` or descriptive name

---

## Linking Strategy

**Per note**: aim for 5-10 links in `## Related`. Always add brief link context.

**Link types**:
- Parent: broader topic (`PySpark Window Functions` → `PySpark`)
- Sibling: related concepts (`PySpark Window Functions` ↔ `PySpark Aggregations`)
- Cross-category: spanning domains (`PySpark` ↔ `AWS EMR`)

**Auto-linking rules**:
- Master list source: `/10-Projects/_index.md` — read this, never scan folders
- Only link if confident exact/very close match
- Ask user before creating new project/client entry
- Use proper capitalization from `_index.md`

---

## Areas Structure (`/20-Areas/`)

- `Career/Career.md` — professional development, goals, skill tracking
- `Health/Health.md` — exercise, wellness goals
- `Hobbies/Hobbies.md` — personal hobby projects
- `Languages/Languages.md` — language learning progress

Each area: long-term maintenance items · goals/standards · progress tracking · periodic updates (not daily).

---

## Templates

Full templates in `.metadata/Templates/` — use for reference or when detailed structure is needed.

For quick creation, use the micro-templates table in `CLAUDE.md` (inline skeletons).

**Template variables**: `{{date:YYYY-MM-DD}}` · `{{title}}`
