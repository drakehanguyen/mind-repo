---
created: 2024-01-01
type: concept
tags: [templates, system]
---

# Templates

Note templates for AI agents to use when creating new notes.

## Available Templates

### Core Templates

- **Daily-Journal.md** - Daily journal entry template (legacy)
- **Work-Journal.md** - Work daily journal template
- **Personal-Journal.md** - Personal daily journal template
- **Meeting.md** - Meeting note template
- **Study-Note.md** - Comprehensive study note template
- **Atomic-Note.md** - Atomic permanent note template (Zettelkasten)
- **Project-README.md** - Project documentation template
- **Error-Debug.md** - Error troubleshooting template
- **Review.md** - Review/retrospective template
- **MOC.md** - Map of Content template
- **Area.md** - Area maintenance template
- **Brainstorm.md** - Brainstorming session template
- **Q&A.md** - Q&A session template

## Usage for AI Agents

When creating notes, AI agents should:

1. **Select appropriate template** based on note type
2. **Fill in template variables**:
   - `{{date:YYYY-MM-DD}}` - Current date
   - `{{title}}` - Note title/topic
3. **Customize sections** based on content
4. **Add proper frontmatter** with correct type and tags
5. **Create bidirectional links** in Related sections
6. **Follow Zettelkasten principles** for knowledge notes (5-10 links)

## Template Variables

- `{{date:YYYY-MM-DD}}` - Date in YYYY-MM-DD format
- `{{date:YYYY-MM-DD HH:MM}}` - Date with time
- `{{title}}` - Note title or topic name

## Notes

- Templates use Obsidian-compatible syntax
- All templates include proper YAML frontmatter
- Wikilinks `[[Note Name]]` are used throughout
- Templates follow system conventions and best practices

---

**For AI Agents**: Use these templates as starting points, but customize based on the specific content and context of each note.

