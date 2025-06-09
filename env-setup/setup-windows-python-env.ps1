# PowerShell script to install Python and Pipenv on Windows
# Run this script with Administrator privileges if possible

Write-Host "Setting up Python development environment on Windows..." -ForegroundColor Green

# Check for winget
$winget = Get-Command winget -ErrorAction SilentlyContinue

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    if ($winget) {
        Write-Host "Python not found. Installing via winget..." -ForegroundColor Yellow
        winget install --exact --id Python.Python.3.11 -h
    } else {
        Write-Warning "Python not found and winget is unavailable. Please install Python manually."
    }
} else {
    $ver = (python --version).Trim()
    Write-Host "Python already installed: $ver" -ForegroundColor Green
}

if (-not (Get-Command pipenv -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Pipenv..." -ForegroundColor Green
    python -m pip install --user pipenv
} else {
    Write-Host "Pipenv already installed: $(pipenv --version)" -ForegroundColor Green
}

Write-Host "\nAdd the Python Scripts directory to your PATH if it isn't already." -ForegroundColor Yellow
Write-Host "Windows Python environment setup complete!" -ForegroundColor Green
