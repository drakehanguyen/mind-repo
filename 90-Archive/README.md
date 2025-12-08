---
created: 2024-01-01
type: area
tags: [archive, system]
---

# Archive

Storage for completed projects, archived documents, and inactive items.

## Purpose

The Archive folder stores:
- Completed projects (moved from `/10-Projects/`)
- Archived documents and notes
- Inactive items that may be referenced later

## Structure

```
/90-Archive/
  └─ YYYY/
      └─ [Project_Name]/
      └─ [Document_Name].md
```

## How to Use

1. **Archive items**: Use `!archive [Project/Note Name]` command
2. **Organization**: Items are organized by year
3. **Preservation**: Links and references are maintained when archiving
4. **Retrieval**: Archived items can still be searched and linked to

## Archive Process

When archiving:
- Items are moved to appropriate year folder
- Links pointing to archived items are updated
- Archive tag and date are added to frontmatter
- Archive index entry is created

---

**Note**: Archived items are preserved but not actively maintained. They remain searchable and linkable.

