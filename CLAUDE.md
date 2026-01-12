# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

"The Programmable Knowledge Base for Hackers."

Local Markdown-based knowledge base & task management system. Daily pages serve as the central hub for all activities.

## Directory Structure

```
vault/
├── Daily/          # Daily pages (hub) - YYYY/MM/YYYY-MM-DD.md
├── Tasks/          # Task management (status-based)
│   ├── Inbox/      # Unprocessed
│   ├── Active/     # In progress (todo + doing)
│   └── Done/       # Completed (pending knowledge extraction or archive)
├── Knowledge/      # Zettelkasten-style notes (flat structure)
├── Logs/           # Life logs (audio transcripts, meeting notes) - YYYY/MM/
└── Archive/        # Old completed items
```

## Naming Conventions

| Target | Style | Example |
|--------|-------|---------|
| Directories | PascalCase | `Daily/`, `Tasks/` |
| Files | kebab-case | `api-design.md`, `2026-01-12.md` |
| Metadata keys | snake_case | `task_type`, `waiting_for` |
| Tags | kebab-case | `#backend`, `#api-design` |

## Time Formats

- Date: `YYYY-MM-DD` (e.g., `2026-01-12`)
- Time: `HH:MM` 24-hour format (e.g., `09:00`, `18:30`)

### Timeslots

| Slot | Period |
|------|--------|
| `morning` | Wake up - 09:00 |
| `forenoon` | 09:00 - Lunch |
| `afternoon` | Lunch - 18:00 |
| `evening` | 18:00 - Sleep |
| `anytime` | Flexible |

## Task Management

### Status Flow
```
inbox → active → done → (Knowledge/ or Archive/)
```

### Task Metadata Schema
```yaml
---
title: "Task title"
type: task
id: task-YYYY-MM-DD-NNN

status: active           # inbox | active | done | trash
task_type: now           # now | someday | waiting | scheduled | recurring
waiting_for: null        # Person or [[task-id]]

created: YYYY-MM-DD
deadline: YYYY-MM-DD
scheduled: YYYY-MM-DD
timeslot: forenoon

priority: P1             # P0 | P1 | P2 | P3

project: "Project/Subproject"
parent_task: null        # [[parent-task-id]]
tags: [tag1, tag2]

summary: "Current status in one line"
daily: [[YYYY-MM-DD]]
---
```

### Priority Levels
- `P0`: Urgent, highest priority
- `P1`: Important
- `P2`: Normal
- `P3`: Low priority

### Task Types
- `now`: Do immediately (GTD Next Actions)
- `scheduled`: Do on specific date
- `someday`: Do eventually
- `waiting`: Blocked (person or other task)
- `recurring`: Repeating task

## MCP

- `basic-memory`: Semantic search and graph navigation
- Use `search_notes()` for searching, `build_context()` for gathering related info

## Skills

- `/daily-manager` - Create/update daily pages, show today's tasks
- `/task-manager` - Organize inbox, update status, manage tasks
- `/task-to-knowledge` - Extract learnings from completed tasks

## Link Syntax

- Internal: `[[filename]]`
- Section: `[[filename#heading]]`
- Alias: `[[filename|display text]]`

## Daily Page Template

```markdown
---
date: YYYY-MM-DD
type: daily
---

## Tasks
### Morning (Wake-09:00)
### Forenoon (09:00-Lunch)
### Afternoon (Lunch-18:00)
### Evening (18:00-Sleep)
### Waiting

## Log
- HH:MM Activity

## Reflections
- Learnings
- Insights
```

## Workflow

1. Morning: Create daily page, review tasks
2. During work: Dump ideas to Tasks/Inbox/, log activities to Daily/
3. Breaks: Organize inbox with `/task-manager`
4. Completion: Update status, add summary
5. Reflection: Extract knowledge with `/task-to-knowledge`
