# Core Concepts

## Philosophy

**"The Programmable Knowledge Base."**

- **CLI First**: Claude Code + terminal is the primary interface
- **Local First**: Markdown files are the single source of truth
- **Hub-based**: Daily pages are the entry point for all activities
- **Extensible**: Skills, Hooks, and MCP for customization

## Architecture

```
┌─────────────────────────────────────────────────┐
│                   Daily Hub                      │
│            (Today's entry point)                 │
└──────────┬──────────────────┬───────────────────┘
           │                  │
           ▼                  ▼
┌──────────────────┐  ┌──────────────────┐
│      Tasks       │  │       Logs       │
│  (GTD workflow)  │  │  (Life logging)  │
└────────┬─────────┘  └──────────────────┘
         │
         ▼ (extract learnings)
┌──────────────────┐
│    Knowledge     │
│  (Zettelkasten)  │
└──────────────────┘
```

## GTD Integration

Tasks follow Getting Things Done methodology:

| Stage | Location | Description |
|-------|----------|-------------|
| Capture | `Tasks/Inbox/` | Quick capture, no processing |
| Clarify | `/task-manager` | Add metadata, decide next action |
| Organize | `Tasks/Active/` | Prioritized, scheduled |
| Review | Daily page | Daily/weekly review |
| Do | Work | Execute tasks |

## Zettelkasten Integration

Knowledge notes follow Zettelkasten principles:

- **Atomic**: One idea per note
- **Linked**: Connected via `[[wikilinks]]`
- **Flat**: No folder hierarchy in Knowledge/
- **Sourced**: Link back to origin (task, log, etc.)

## MCP: Basic Memory

Provides semantic search and graph navigation:

- `search_notes()`: Find related content
- `build_context()`: Gather context for a topic
- Automatic indexing of all Markdown files
