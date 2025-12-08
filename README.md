# MindRepo

A conversational AI-powered "Second Brain" system for Data Engineer Consultants.

## Overview

MindRepo helps you capture, organize, and retrieve:
- **Consulting Log**: Billable work, client meetings, project status
- **Knowledge Base**: Engineering (Python, PySpark, AWS) and personal knowledge
- **Daily Journal**: Work logs, notes, links, and completed tasks

## Quick Start

### Commands

See [[AGENT.md]] for all available commands and complete AI agent instructions (use `!` prefix).

**Quick help**: `!help` - Show all commands

**Common commands**:
- `!log [text]` - Log work activity
- `!meeting [Client] [Topic]` - Create meeting note
- `!study [Topic]` - Create study note
- `!plan [Project]` - Scaffold new project
- `!report [Client] [Timeframe]` - Generate status report

### Folder Structure

- **`/00_Inbox`** - Raw thoughts and unprocessed items
- **`/10_Projects`** - Active projects (Consulting, PersonalProject, Life)
- **`/20_Areas`** - Long-term maintenance (Career, Health, Hobbies, Languages)
- **`/30_Resources`** - Permanent knowledge base (Python, PySpark, AWS, etc.)
- **`/90_Journal`** - Daily chronological entries
- **`/00_Meta`** - System documentation and templates

## Documentation

- [[AGENT.md]] - Complete AI agent instructions (replaces COMMANDS.md and SYSTEM_INSTRUCTIONS.md)
- [[COMMANDS_QUICK_REFERENCE.md]] - Quick command lookup

## Getting Started

1. Start logging: `!log Your first entry`
2. Create a project: `!plan Your Project Name`
3. Study something: `!study Your Topic`
4. Process inbox: `!inbox-process`

---

**Note**: This system uses Obsidian-compatible Markdown with Wikilinks. All links use `[[Note Name]]` format.

