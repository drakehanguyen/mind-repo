# MindRepo AI Agent — Full Specification

**Version**: 1.3 · **Last Updated**: 2026-03-14

MindRepo is a conversational AI-powered Second Brain for knowledge workers. It captures logs, thoughts, journals, learning, and planning throughout the day, then processes and categorizes entries at end of day.

**Core principle**: Hybrid PARA + Zettelkasten — PARA for action management (Projects, Areas, Archive), Zettelkasten for knowledge base (`/30-Resources/`) with atomic notes and rich linking.

**See CLAUDE.md** for the compact always-loaded instructions (commands table, EOD workflow, conventions, micro-templates, indexes).

---

## Architecture

```
/00-Inbox/            Landing zone for raw captures
/10-Projects/
  ├─ _index.md        Master project/client list (read for auto-linking)
  ├─ 11-Consulting/[Client]/  README · Meetings/ · TODO.md
  ├─ 12-PersonalProject/[Name]/
  └─ 13-Life/[Name]/
/20-Areas/
  ├─ Career/ · Health/ · Hobbies/ · Languages/
/30-Resources/
  ├─ Python/ · PySpark/ · AWS/ · Troubleshooting/ · Consulting/
  └─ [Topic].md + code/ subfolder (>50 lines)
/40-Journal/
  ├─ Work/YYYY/YYYY-MM-DD.md
  └─ Personal/YYYY/YYYY-MM-DD.md
/80-MOCs/
  ├─ _vault-index.md  Search/link index (read for !search, !link-suggest, !moc)
  └─ [Category]_MOC.md
/90-Archive/YYYY/
/.metadata/
  ├─ Templates/       Full note templates (13 files)
  └─ agent/           On-demand command specs (load only what's needed)
      ├─ commands-core.md      !journal !meeting !study !plan !debug !report !refactor !inbox-process !eod
      ├─ commands-capture.md   !link !code !idea !note !task
      ├─ commands-zettel.md    !atomic !moc !link-notes !link-suggest + Zettelkasten principles
      ├─ commands-mgmt.md      !today !status !archive !review !update !remote !search !tag !summary !brainstorm !ask !help
      └─ conventions.md        Syntax, frontmatter, file naming, linking rules, code org
```

---

## Spec Files (load on demand)

| File | Load when... |
|------|-------------|
| `.metadata/agent/commands-core.md` | Running `!journal`, `!meeting`, `!study`, `!plan`, `!debug`, `!report`, `!refactor`, `!inbox-process`, `!eod` |
| `.metadata/agent/commands-capture.md` | Running `!link`, `!code`, `!idea`, `!note`, `!task` |
| `.metadata/agent/commands-zettel.md` | Running `!atomic`, `!moc`, `!link-notes`, `!link-suggest` or performing Zettelkasten linking |
| `.metadata/agent/commands-mgmt.md` | Running `!today`, `!status`, `!archive`, `!review`, `!search`, `!tag`, `!summary`, `!brainstorm`, `!ask`, `!help`, `!update`, `!remote` |
| `.metadata/agent/conventions.md` | Creating any new note, or when needing linking/naming/frontmatter rules |

---

## Indexes (use these instead of folder scanning)

| Index | Path | Use for |
|-------|------|---------|
| Projects/clients | `/10-Projects/_index.md` | Auto-linking in journals, meetings |
| Vault search | `80-MOCs/_vault-index.md` | `!search`, `!link-suggest`, `!moc`, EOD Step 4 |

---

## Related

- [[CLAUDE.md]] — Compact agent instructions auto-loaded by Claude Code
- [[COMMANDS_QUICK_REFERENCE.md]] — Command lookup table
- [[README.md]] — Project overview
