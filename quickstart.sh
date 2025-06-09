#!/bin/bash
# Quickstart script to set up the environment and run the demo
set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create virtual environment if it doesn't exist
if [ ! -d "$PROJECT_ROOT/venv" ]; then
    python3 -m venv "$PROJECT_ROOT/venv"
fi

# Activate the environment
source "$PROJECT_ROOT/venv/bin/activate"

# Upgrade pip to avoid using an outdated version
pip install --upgrade pip >/dev/null

# Install project dependencies
pip install -e "$PROJECT_ROOT" -v
pip install -e "$PROJECT_ROOT[dev]" -v

# Sync available models with Ollama
python "$PROJECT_ROOT/src/utils/sync_models.py"

# Run the interactive chat script
python "$PROJECT_ROOT/src/test_chat.py" "$@"
