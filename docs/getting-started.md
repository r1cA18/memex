# Getting Started

## Requirements

- [Nix](https://nixos.org/download.html) package manager
- [Claude Code](https://claude.ai/code) CLI

## Installation

```bash
# Clone repository
git clone https://github.com/r1cA18/memex.git
cd memex

# Enter development environment
nix-shell

# Done! Dependencies are auto-installed.
```

## Verify Setup

```bash
# Check Python version
python --version  # Should be 3.12.x

# Check basic-memory
basic-memory --version
```

## MCP Setup

### 1. Register Project

Register your vault directory with basic-memory:

```bash
# Replace /path/to/vault with your actual vault path
uvx basic-memory project add memex /path/to/vault --default
```

Example:
```bash
uvx basic-memory project add memex ~/vault --default
```

### 2. Configure Claude Code

Add to your Claude Code MCP settings (`~/.claude/settings.json`):

```json
{
  "mcpServers": {
    "basic-memory": {
      "type": "stdio",
      "command": "uvx",
      "args": ["basic-memory", "mcp", "--project", "memex"]
    }
  }
}
```

### 3. Start File Sync

```bash
uvx basic-memory sync --watch --project memex
```

> **Note:** After configuring MCP, restart Claude Code (`/quit` and reopen) for changes to take effect.

## First Run

1. Open the vault directory in Claude Code
2. Say "Create today's page" to generate your first daily page
3. Start adding tasks and notes!

## Without Nix

If you prefer not to use Nix:

```bash
# Requires Python 3.12+ and uv installed
git clone https://github.com/r1cA18/memex.git
cd memex

uv venv --python python3.12
source .venv/bin/activate
uv sync
```

## Obsidian Integration

Open the `memex/` directory as an Obsidian vault for:
- Mobile access
- Graph view
- Visual editing

## Updating

When memex template updates (new skills, bug fixes, etc.), you can pull changes while keeping your data intact.

### Setup (one-time)

```bash
# Add upstream remote
git remote add upstream https://github.com/r1cA18/memex.git
```

### Pull Updates

```bash
# Fetch latest changes
git fetch upstream

# Merge (data folders won't conflict - they're gitignored in upstream)
git merge upstream/main --allow-unrelated-histories
```

If conflicts occur, they'll be in system files (`.claude/`, `docs/`, etc.). Resolve by keeping upstream version for template files.

### What Gets Updated

| Updated (System) | Preserved (Data) |
|------------------|------------------|
| `.claude/skills/` | `Daily/` |
| `.claude/rules/` | `Tasks/` |
| `docs/` | `Knowledge/` |
| `CLAUDE.md` | `Logs/` |
| `*.nix`, `*.toml` | `Archive/` |

### Manual Update (alternative)

If you prefer not to merge:

```bash
# Download and overwrite specific files
curl -O https://raw.githubusercontent.com/r1cA18/memex/main/CLAUDE.md
curl -O https://raw.githubusercontent.com/r1cA18/memex/main/.claude/skills/daily-manager/SKILL.md
# etc.
```
