---
name: daily-manager
description: Create and manage daily pages. Use when user says "today's page", "daily", "create daily", or asks about today's schedule.
---

# Daily Manager

Manages daily pages in `Daily/YYYY/MM/YYYY-MM-DD.md`.

## When to Use

- User asks to create today's page
- User wants to see today's tasks
- User wants to add to today's log
- Morning routine / daily review

## Create Daily Page

1. Check if `Daily/YYYY/MM/YYYY-MM-DD.md` exists
2. If not, create with template below
3. Scan `Tasks/Active/` for tasks scheduled today
4. Group by timeslot and embed in Tasks section

### Template

```markdown
---
date: YYYY-MM-DD
type: daily
---

## Tasks
### Morning (Wake-09:00)
- (tasks with timeslot: morning and scheduled: today)

### Forenoon (09:00-Lunch)
- (tasks with timeslot: forenoon and scheduled: today)

### Afternoon (Lunch-18:00)
- (tasks with timeslot: afternoon and scheduled: today)

### Evening (18:00-Sleep)
- (tasks with timeslot: evening and scheduled: today)

### Waiting
- (tasks with task_type: waiting)

## Log
- HH:MM Started work

## Reflections
-
```

## Update Tasks Section

When updating, scan all `Tasks/Active/*.md` files:
1. Read `scheduled` and `timeslot` from frontmatter
2. Group by timeslot
3. Format as: `- [ ] [[filename]] (priority) - summary`
4. Include waiting tasks in Waiting section

## Add Log Entry

Format: `- HH:MM Activity description`

If activity links to a log file in `Logs/`, include the link:
`- HH:MM [[log-filename]] Meeting notes`

## Carry Over Incomplete Tasks

When creating new daily page:
1. Check yesterday's daily page
2. Find incomplete tasks (unchecked `- [ ]`)
3. Add note in today's page about carried tasks

## Output

After creating/updating, show summary:
```
Daily page for YYYY-MM-DD

Tasks:
- Morning: N tasks
- Forenoon: N tasks
- Afternoon: N tasks
- Evening: N tasks
- Waiting: N tasks

Ready to start!
```
