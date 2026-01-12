# memex

The Programmable Knowledge Base.

A CLI-first, local Markdown-based knowledge base & task management system built for [Claude Code](https://claude.ai/code).

## Quick Start

### 1. Create Your Repository

Click **"Use this template"** → **"Create a new repository"** on GitHub.

Repository name: `vault` recommended (or any name you prefer).

<details>
<summary>Manual setup (without GitHub)</summary>

```bash
git clone https://github.com/r1cA18/memex.git vault
cd vault
rm -rf .git
git init
git add .
git commit -m "Initial commit from memex template"
```

</details>

### 2. Setup Environment

```bash
cd vault

# With Nix (recommended)
nix-shell

# Without Nix (requires Python 3.12+ and uv)
uv venv --python python3.12
source .venv/bin/activate
uv sync
```

### 3. Register with basic-memory

```bash
# Register your vault directory (replace path with your actual location)
uvx basic-memory project add memex /path/to/vault --default

# Example:
uvx basic-memory project add memex ~/vault --default
```

Then add basic-memory to your Claude Code MCP settings. See [Getting Started](docs/getting-started.md#mcp-setup) for details.

### 4. Start Using

```bash
claude  # Start Claude Code in your memex directory
```

Then try `/daily-manager` to create today's page.

## Documentation

- [Getting Started](docs/getting-started.md) - Installation & setup
- [Concepts](docs/concepts.md) - Architecture & philosophy
- [Skills](docs/skills.md) - Available commands
- [Workflow](docs/workflow.md) - Daily usage
- [Reference](docs/reference.md) - Conventions & metadata

## License

MIT
