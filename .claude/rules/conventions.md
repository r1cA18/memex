---
paths:
  - "**/*.md"
---

# Memex Conventions

## Naming

| Target | Style | Example |
|--------|-------|---------|
| Directories | PascalCase | `Daily/`, `Tasks/` |
| Files | kebab-case | `api-design.md` |
| Metadata keys | snake_case | `task_type` |
| Tags | kebab-case | `#api-design` |

## Time

- Date: `YYYY-MM-DD`
- Time: `HH:MM` (24-hour)
- Timestamp: `YYYY-MM-DD HH:MM`

## Timeslots

| Slot | Period |
|------|--------|
| `morning` | Wake - 09:00 |
| `forenoon` | 09:00 - Lunch |
| `afternoon` | Lunch - 18:00 |
| `evening` | 18:00 - Sleep |
| `anytime` | Flexible |

## Links

- Internal: `[[filename]]`
- Section: `[[filename#heading]]`
- Alias: `[[filename|display]]`

## Task Status

- `inbox`: Unprocessed
- `active`: In progress
- `done`: Completed
- `trash`: Discarded

## Task Type

- `now`: Immediate action
- `scheduled`: Specific date
- `someday`: Eventually
- `waiting`: Blocked
- `recurring`: Repeating

## Priority

- `P0`: Urgent
- `P1`: Important
- `P2`: Normal
- `P3`: Low

## File Types

All files must have YAML frontmatter with `type` field:
- `daily`: Daily pages
- `task`: Task files
- `knowledge`: Knowledge notes
- `log`: Life logs
