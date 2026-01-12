# Reference

## Directory Structure

```
memex/
├── Daily/          # Daily pages (hub)
│   └── YYYY/MM/YYYY-MM-DD.md
├── Tasks/          # Task management
│   ├── Inbox/      # Unprocessed
│   ├── Active/     # In progress
│   └── Done/       # Completed
├── Knowledge/      # Zettelkasten notes (flat)
├── Logs/           # Life logs
│   └── YYYY/MM/
└── Archive/        # Old items
```

## Naming Conventions

| Target | Style | Example |
|--------|-------|---------|
| Directories | PascalCase | `Daily/`, `Tasks/` |
| Files | kebab-case | `api-design.md` |
| Metadata keys | snake_case | `task_type` |
| Tags | kebab-case | `#api-design` |

## Time Formats

| Type | Format | Example |
|------|--------|---------|
| Date | `YYYY-MM-DD` | `2026-01-12` |
| Time | `HH:MM` (24h) | `09:00` |

## Timeslots

| Slot | Period |
|------|--------|
| `morning` | Wake - 09:00 |
| `forenoon` | 09:00 - Lunch |
| `afternoon` | Lunch - 18:00 |
| `evening` | 18:00 - Sleep |
| `anytime` | Flexible |

## Task Metadata

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
project: "Project/Sub"
parent_task: null
tags: [tag1, tag2]

summary: "Status"
daily: [[YYYY-MM-DD]]
---
```

## Priority Levels

| Level | Meaning |
|-------|---------|
| `P0` | Urgent, highest priority |
| `P1` | Important |
| `P2` | Normal |
| `P3` | Low priority |

## Task Types

| Type | Description |
|------|-------------|
| `now` | Do immediately (GTD Next Actions) |
| `scheduled` | Do on specific date |
| `someday` | Do eventually |
| `waiting` | Blocked by person/task |
| `recurring` | Repeating task |

## Link Syntax

| Type | Syntax | Example |
|------|--------|---------|
| Internal | `[[file]]` | `[[api-design]]` |
| Section | `[[file#heading]]` | `[[api-design#notes]]` |
| Alias | `[[file\|text]]` | `[[api-design\|API]]` |

## File Types

All files have YAML frontmatter with `type`:

- `daily` - Daily pages
- `task` - Task files
- `knowledge` - Knowledge notes
- `log` - Life logs
