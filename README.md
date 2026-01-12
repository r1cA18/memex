# memex

The Programmable Knowledge Base.

A CLI-first, local Markdown-based knowledge base & task management system built for [Claude Code](https://claude.ai/code).

## Quick Start

```bash
# Clone
git clone https://github.com/r1cA18/memex.git
cd memex

# Enter dev environment (requires Nix)
nix-shell

# Ready!
```

<details>
<summary>Without Nix</summary>

```bash
# Requires Python 3.12+ and uv
uv venv --python python3.12
source .venv/bin/activate
uv sync
```

</details>

## Documentation

- [Getting Started](docs/getting-started.md) - Installation & setup
- [Concepts](docs/concepts.md) - Architecture & philosophy
- [Skills](docs/skills.md) - Available commands
- [Workflow](docs/workflow.md) - Daily usage
- [Reference](docs/reference.md) - Conventions & metadata

## License

MIT
