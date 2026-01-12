# memex

The Programmable Knowledge Base for Hackers.

CLI-first, local Markdown-based knowledge base & task management system built for Claude Code.

## Features

- **Daily Hub**: Daily pages as the central entry point for all activities
- **GTD + Zettelkasten**: Task management with knowledge extraction workflow
- **Claude Code Native**: Skills for automation, MCP for semantic search
- **Local First**: Markdown files are the single source of truth
- **Obsidian Compatible**: Use Obsidian for mobile/visual access

## Quick Start

```bash
# Clone as "vault" (Obsidian convention)
git clone https://github.com/r1cA18/memex.git vault
cd vault

# Enter development environment (requires Nix)
nix-shell

# Dependencies are auto-installed via uv
# Ready to use!
```

## Requirements

- [Nix](https://nixos.org/download.html) package manager
- That's it. Nix handles Python 3.12, uv, and all dependencies.

## Directory Structure

```
vault/
├── Daily/          # Daily pages (hub) - YYYY/MM/YYYY-MM-DD.md
├── Tasks/          # Task management
│   ├── Inbox/      # Unprocessed items
│   ├── Active/     # In progress
│   └── Done/       # Completed
├── Knowledge/      # Zettelkasten-style notes
├── Logs/           # Life logs, meeting notes
└── Archive/        # Old items
```

## Usage with Claude Code

### Skills

| Command | Description |
|---------|-------------|
| `/daily-manager` | Create/update daily pages, show today's tasks |
| `/task-manager` | Organize inbox, update task status |
| `/task-to-knowledge` | Extract learnings from completed tasks |

### MCP Integration

Basic Memory provides semantic search across your vault:

```bash
# Start sync (watches for file changes)
basic-memory sync --watch --project memex
```

## Daily Workflow

```
Morning     → "Create today's page"      → Daily page generated
During work → Dump ideas to Tasks/Inbox/ → Log activities to Daily/
Breaks      → "Organize inbox"           → Tasks get metadata, sorted
Completion  → "Mark task done"           → Status updated
Reflection  → "Extract knowledge"        → Learnings saved to Knowledge/
```

## Manual Setup (without Nix)

```bash
# Requires Python 3.12+ and uv
uv venv --python python3.12
source .venv/bin/activate
uv sync
```

## License

MIT
