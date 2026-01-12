{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "memex-dev";

  buildInputs = with pkgs; [
    # Python 3.12
    python312
    python312Packages.pip
    python312Packages.virtualenv

    # uv package manager
    uv

    # SQLite (basic-memory dependency)
    sqlite
  ];

  shellHook = ''
    echo "vault development environment"
    echo "Python: $(python --version)"
    echo "uv: $(uv --version)"
    echo ""

    # Create venv if not exists
    if [ ! -d ".venv" ]; then
      echo "Creating virtual environment..."
      uv venv --python python3.12
    fi

    # Activate venv
    source .venv/bin/activate

    # Install dependencies if pyproject.toml exists
    if [ -f "pyproject.toml" ]; then
      echo "Syncing dependencies..."
      uv sync
    fi

    echo ""
    echo "Ready! Commands:"
    echo "  uv add basic-memory    # Add basic-memory"
    echo "  uv run basic-memory    # Run basic-memory"
    echo "  exit                   # Exit nix-shell"
  '';
}
