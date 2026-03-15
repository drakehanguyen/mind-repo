# Zettelkasten Commands Specification

## `!atomic [Topic]`

**Purpose**: Create atomic permanent note (one concept only)

1. Determine category: Python, PySpark, AWS, Troubleshooting, or Consulting
2. Create: `/30-Resources/[Category]/[Topic].md`
3. One concept per note — if complex, suggest breaking down further
4. Structure: brief explanation (2-3 paragraphs max) · `## Related` (5-10 links) · `## See Also`
5. Frontmatter: `type: atomic`
6. Search `_vault-index.md` for related notes; create bidirectional links; link to category MOC
7. Append to `80-MOCs/_vault-index.md`

---

## `!moc [Category/Topic]`

**Purpose**: Create or update Map of Content (category navigation hub)

1. Check if MOC exists: `/80-MOCs/[Category]_MOC.md`
2. Structure:
   - Overview of category
   - `## Atomic Notes` — list all atomic/permanent notes
   - `## Study Notes` — list comprehensive study notes
   - `## Concepts` — grouped by concept clusters
   - `## Related Categories` — links to other MOCs
3. Populate by reading `80-MOCs/_vault-index.md` filtered by category — do not scan folder
4. Frontmatter: `type: moc`

---

## `!link-notes [Note1] [Note2]`

**Purpose**: Create bidirectional link between two notes

1. Locate both notes
2. Add `[[Note2]]` to Note1's `## Related` (with brief context)
3. Add `[[Note1]]` to Note2's `## Related` (with brief context)
4. Check `_vault-index.md` for other notes that might benefit from the same link

---

## `!link-suggest [Note Name]`

**Purpose**: Find and suggest related notes to link

1. Read `80-MOCs/_vault-index.md` — match by tags and keywords from the target note
2. Display suggestions with note name, path, and relevance reason
3. User confirms which links to add
4. Create bidirectional links for confirmed suggestions

---

## Zettelkasten Principles

**Core Principles (applied to `/30-Resources/`)**:
- **Atomic**: one concept per note — independently understandable
- **Rich linking**: 5-10 links per note; bidirectional; link clusters; add link context
- **Emergent organization**: knowledge emerges from connections, not folders; cross-category linking encouraged
- **Permanent notes**: evergreen knowledge; update and refine over time

**Link Types**:
- Parent: broader topic — `PySpark Window Functions` → `PySpark`
- Sibling: related concepts — `PySpark Window Functions` ↔ `PySpark Aggregations`
- Cross-category: spanning domains — `PySpark` ↔ `AWS EMR`

**Link Context** (add to `## Related`):
```markdown
- [[PySpark Aggregations]] - Similar transformation operations
- [[SQL Window Functions]] - SQL equivalent concept
```

**Orphaned notes**: use `!link-suggest` to connect; identify during EOD Step 4.

**MOC creation**: when category has 10+ notes, or when user requests overview.
