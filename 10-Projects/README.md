---
created: 2024-01-01
type: concept
tags: [projects, para, system]
---

# Projects

Active projects with deadlines and specific outcomes (PARA method).

## Structure

Projects are organized by category:

```
/10-Projects/
  ├─ 11-Consulting/     - Client consulting projects
  ├─ 12-PersonalProject/ - Personal side projects
  └─ 13-Life/           - Life projects (non-work)
```

## What Goes Here

Projects are:
- **Time-bound**: Have deadlines or completion dates
- **Actionable**: Require specific steps to complete
- **Outcome-focused**: Have a clear end goal

Each project folder contains:
- `README.md` - Project overview, objective, stack, roadmap
- `Meetings/` - Meeting notes related to the project
- `TODO.md` or `Action_Items.md` - Task tracking

## Creating Projects

Use the `!plan [Project Name]` command to scaffold a new project. The AI will:
- Determine the appropriate category
- Create the folder structure
- Set up initial README with objective, stack, and roadmap

## Project Lifecycle

1. **Active**: Project is in progress (lives here)
2. **Completed**: Move to `/90-Archive/` when done
3. **On Hold**: Can stay here or move to archive

---

**Tip**: Projects are different from Areas - projects have deadlines, areas are ongoing responsibilities.

