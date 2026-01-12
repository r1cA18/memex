---
name: task-manager
description: Organize and manage tasks. Use when user says "organize inbox", "show tasks", "today's tasks", "task status", "complete task", or manages task workflow.
---

# Task Manager

Manages tasks in `Tasks/` directory with status-based organization.

## Directory Structure

```
Tasks/
├── Inbox/    # status: inbox
├── Active/   # status: active
└── Done/     # status: done
```

## When to Use

- Organize inbox items
- Show tasks by timeslot/priority/project
- Update task status
- Complete a task
- Check blocked tasks

## Task Metadata Schema

```yaml
---
title: "Task title"
type: task
id: task-YYYY-MM-DD-NNN

status: inbox           # inbox | active | done | trash
task_type: now          # now | someday | waiting | scheduled | recurring
waiting_for: null       # "Person name" or "[[task-id]]"

created: YYYY-MM-DD
deadline: YYYY-MM-DD    # optional
scheduled: YYYY-MM-DD   # when to do
timeslot: forenoon      # morning | forenoon | afternoon | evening | anytime

priority: P2            # P0 | P1 | P2 | P3

project: null           # "Project/Subproject"
parent_task: null       # [[parent-task-id]]
tags: []

summary: null           # Current status one-liner
daily: null             # [[YYYY-MM-DD]]
---
```

## Organize Inbox

When user says "organize inbox" or "inbox":

1. List all files in `Tasks/Inbox/`
2. For each file, ask/suggest:
   - priority (P0-P3)
   - task_type (now/someday/waiting/scheduled)
   - scheduled date
   - timeslot
   - project (if applicable)
3. Update frontmatter
4. Move to `Tasks/Active/` if status becomes active

## Show Today's Tasks

When user says "today's tasks" or "what should I do":

1. Scan `Tasks/Active/` for `scheduled: today`
2. Group by timeslot:
   - Morning (起床-09:00)
   - Forenoon (09:00-ランチ)
   - Afternoon (ランチ-18:00)
   - Evening (18:00-就寝)
3. Sort by priority within each group
4. Show waiting tasks separately

Output format:
```
## Today's Tasks (YYYY-MM-DD)

### Forenoon
- [ ] Task A (P1) - summary
- [ ] Task B (P2)

### Afternoon
- [ ] Task C (P1)

### Waiting
- [ ] Task D - waiting for 山田さん
```

## Complete Task

When user says "complete [task]" or "done with [task]":

1. Update status: done
2. Update summary with completion note
3. Move file to `Tasks/Done/`
4. Ask: "Extract learnings to Knowledge? (use /task-to-knowledge)"

## Update Task Status

When user updates a task:

1. Modify frontmatter fields
2. Update `summary` with current state
3. If status changes, move to appropriate folder
4. Update `daily` link if working on it today

## Check Blocked Tasks

When user asks about blocked tasks:

1. Find tasks with `task_type: waiting`
2. Show what they're waiting for
3. Suggest follow-up actions

## Show by Project

When user asks about a project:

1. Find tasks matching `project:` field (including subprojects)
2. Group by status
3. Show hierarchy if nested

## Generate Task ID

Format: `task-YYYY-MM-DD-NNN`
- YYYY-MM-DD: creation date
- NNN: sequential number for that day (001, 002, ...)
