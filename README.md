# LangChain Local LLM Template

A template for building LangChain applications with local LLMs (Ollama, LM Studio). This template provides a structured foundation for developing applications that interact with locally-hosted large language models.

## Project Structure

```
langchain-local-template/
├── env-setup/          # Environment setup scripts
├── src/                # Source code
│   └── models/         # Model-related code
├── tests/              # Test files
├── config/             # Configuration files
│   ├── models.yaml     # Model definitions
│   └── providers.yaml  # Provider settings
└── data/               # Data directory
    ├── inputs/         # Input files
    └── outputs/        # Generated outputs
```

## Prerequisites

- Python 3.9+
- Ollama or LM Studio installed and running locally
- VS Code (recommended for development)

## Setup

### Make a copy of this repo
   ```bash
   gh repo create your-new-project \
   --template arvindvenkataramani/langchain-local-template \
   --clone
   ```
Or, on GitHub:
* Go to the repository page.
* Click on the "Use this template" button.
* Choose Create a new repository.
* Name your new repository and set it to public or private as desired.

### Automated Setup
#### macOS/Linux
Make the setup scripts executable and run them:
```bash
chmod +x env-setup/*.sh
./env-setup/setup-mac-python-env.sh
./env-setup/setup-langchain-project.sh
```

#### Windows
From a PowerShell prompt run:
```powershell
./env-setup/setup-windows-python-env.ps1
./env-setup/setup-windows-langchain-project.ps1
```

#### Individual Setup
You can also run the scripts separately.

**macOS/Linux**
```bash
./env-setup/setup-mac-python-env.sh
./env-setup/setup-langchain-project.sh
```

**Windows**
```powershell
./env-setup/setup-windows-python-env.ps1
./env-setup/setup-windows-langchain-project.ps1
```


### Manual setup
Ensure you have `python 3.11` installed.

1. Set up a Python virtual environment:
   ```bash
   python3.11 -m venv venv
   source venv/bin/activate  # On Windows: .\venv\Scripts\activate
   ```
2. Install langchain:
   ```bash
   # Core langchain packages
   pip install -e . -v

   # verify that this worked
   python -c "import langchain; print(f'LangChain version: {langchain.__version__}')"

   # For development (includes testing and code quality tools)
   pip install -e ".[dev]" -v
   ```

### Start coding
You will need to activate the pipenv environment and load package dependencies
```bash
pipenv shell
```

## Configuration

1. Configure your models in `config/models.yaml`
2. Configure your providers in `config/providers.yaml`
3. Ensure your local LLM service (Ollama/LM Studio) is running

## Testing the Setup

1. Sync your Ollama models with the configuration:
   ```bash
   python src/utils/sync_models.py
   ```
   This will create `config/models_ollama_synced.yaml` with configurations for all your available models.

2. Run the test chat script:
   ```bash
   # Test with default model
   python src/test_chat.py

   # Test with a specific model
   python src/test_chat.py llama3.2:latest
   ```

   The script will:
   - Load the specified model (or default model if none specified)
   - Send a test prompt
   - Enter interactive mode where you can chat with the model


## Development

This template includes several tools for development:

- `black`: Code formatting
- `ruff`: Linting
- `mypy`: Type checking
- `pytest`: Testing
- VS Code configurations for Python development

VS Code will automatically:
- Format code on save
- Show type hints
- Run linting
- Provide intelligent code completion

## Testing

Run tests using pytest:
```bash
pytest tests/
```

## Project Organization

- `src/models/`: Core model interaction code
- `config/`: YAML configuration files
- `data/`: Input and output data
- `tests/`: Test files
- `env-setup/`: Environment setup scripts
- `.vscode/`: VS Code configuration
- `notes/`: a place for project notes

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Create a pull request

## License
Choose a license when you copy this template.

#### Badges
[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![GPLv3](https://img.shields.io/badge/License-GPLv3-green.svg)](https://opensource.org/licenses/GPLv3)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/yourusername/langchain-local-template/graphs/commit-activity)
[![Template](https://img.shields.io/badge/GitHub-Template-green?logo=github)](https://github.com/yourusername/langchain-local-template/generate)
[![LangChain](https://img.shields.io/badge/🦜_LangChain-Powered-blue)](https://github.com/langchain-ai/langchain)
