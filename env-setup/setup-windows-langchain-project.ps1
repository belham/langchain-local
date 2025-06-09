# PowerShell script to set up LangChain project dependencies using Pipenv
Write-Host "Setting up LangChain project dependencies..." -ForegroundColor Green

if (-not (Test-Path "pyproject.toml")) {
    Write-Error "pyproject.toml not found. Are you in the project root directory?"
    exit 1
}

if (-not (Get-Command pipenv -ErrorAction SilentlyContinue)) {
    Write-Error "Pipenv not found. Please install it first (see setup-windows-python-env.ps1)."
    exit 1
}

$pythonVersion = (python --version).Split()[1]
$pyMajorMinor = ($pythonVersion -split '\.')[0..1] -join '.'

Write-Host "Initializing Pipenv environment..." -ForegroundColor Green
pipenv --python $pyMajorMinor

Write-Host "Installing project dependencies..." -ForegroundColor Green
pipenv install -e .

Write-Host "Installing development dependencies..." -ForegroundColor Green
pipenv install -e .[dev]

Write-Host "Verifying LangChain installation..." -ForegroundColor Green
pipenv run python -c "import langchain; print(f'LangChain version: {langchain.__version__}')"

Write-Host "\nLangChain project setup complete!" -ForegroundColor Green
Write-Host "To activate the environment, run: pipenv shell" -ForegroundColor Yellow
Write-Host "To run a script without activating: pipenv run python src\\your_script.py" -ForegroundColor Yellow
