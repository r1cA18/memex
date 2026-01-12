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

Add to your Claude Code MCP settings:

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

Start file sync:

```bash
basic-memory sync --watch --project memex
```

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
