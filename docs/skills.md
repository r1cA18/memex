# Skills Reference

## /daily-manager

Manages daily pages.

### Triggers

- "Create today's page"
- "Show today's tasks"
- "Daily page"

### Functions

- Generate daily page from template
- Embed tasks grouped by timeslot
- Carry over incomplete tasks from yesterday

### Example

```
> Create today's page

Created Daily/2026/01/2026-01-12.md

## Today's Tasks

### Forenoon (09:00-Lunch)
- [ ] [[task-api-design]] (P1) - In progress

### Waiting
- [ ] [[task-review]] - Waiting for feedback
```

---

## /task-manager

Organizes and manages tasks.

### Triggers

- "Organize inbox"
- "Show inbox"
- "Today's tasks"
- "Update task status"

### Functions

- Process inbox items (add metadata)
- Display tasks by timeslot/priority
- Update task status and summary
- Suggest Done → Knowledge/Archive flow

### Example

```
> Organize inbox

Found 3 items in Inbox:

1. api-design.md
   → Suggested: P1, timeslot: forenoon, type: now
   → Move to Active? (y/n)
```

---

## /task-to-knowledge

Extracts learnings from completed tasks.

### Triggers

- "Extract knowledge from this"
- "Create knowledge note"
- "What did I learn?"

### Functions

- Analyze completed task content
- Generate atomic knowledge note
- Add source link to original task
- Suggest related existing notes

### Example

```
> Extract knowledge from task-api-design

Extracted insights:
1. "REST API versioning strategies" → Knowledge/rest-api-versioning.md
2. "Authentication flow patterns" → Knowledge/auth-patterns.md

Created 2 knowledge notes with backlinks.
```
