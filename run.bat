@echo off

:: Check if env exists
if not exist "venv\" (
    echo Error: no environment found
    echo Run setup.bat
    exit /b 1
)

:: Check if filename argument is provided
if "%1"=="" (
    echo Error: no filename
    echo Usage: run.bat ^<filename^>
    echo Example: run.bat metrics_example.csv
    exit /b 1
)

:: Check if file exists in data\ directory
if not exist "data\%1" (
    echo Error: file 'data\%1' not found
    echo Available files in data\:
    dir /b data\ 2>nul
    if errorlevel 1 echo   (no files found)
    exit /b 1
)

:: Run the script
call venv\Scripts\activate.bat
python main.py %1
call deactivate