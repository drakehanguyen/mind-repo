---
created: 2024-01-01
type: concept
tags: [resources, knowledge-base, zettelkasten, system]
---

# Resources

Permanent knowledge base using Zettelkasten principles (PARA + Zettelkasten).

## Purpose

This is your permanent knowledge repository - information you want to reference indefinitely. Uses Zettelkasten principles for rich linking and knowledge discovery.

## Structure

Resources are organized by category:

```
/30-Resources/
  ├─ Python/          - Python programming knowledge
  ├─ PySpark/         - PySpark and Spark knowledge
  ├─ AWS/             - AWS cloud services knowledge
  ├─ Troubleshooting/ - Error logs and solutions
  └─ Consulting/      - Consulting methodologies and practices
```

## Zettelkasten Principles Applied

1. **Atomic Notes**: One concept per note (use `!atomic` command)
2. **Rich Linking**: 5-10 links per note for knowledge discovery
3. **Bidirectional Links**: Links go both ways
4. **Emergent Organization**: Knowledge emerges from connections, not just folders
5. **Permanent Notes**: Evergreen knowledge that doesn't expire

## Creating Resources

- **`!study [Topic]`** - Create comprehensive study note with enhanced linking
- **`!atomic [Topic]`** - Create atomic permanent note (single concept)
- **`!note [Topic]`** - Quick note capture

## Linking Strategy

- Link to related concepts (parent, child, sibling)
- Cross-category linking is encouraged
- Link to MOCs in `/80-MOCs/` for navigation
- Use `!link-suggest` to find connections

## Code Organization

- Inline code: <50 lines (in note)
- Separate files: >50 lines (in `code/` subfolder)

---

**Tip**: This is where knowledge lives forever. Focus on rich linking to discover connections between concepts.

