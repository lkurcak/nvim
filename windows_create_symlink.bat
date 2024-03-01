@echo off

:: Check if running with administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges
) else (
    echo Requesting administrator privileges...
    runas /user:Administrator "%~0"
    exit /b
)

:: Set the source and target paths
set "source=%LOCALAPPDATA%\nvim"

:: Check if the source folder exists
if exist "%source%" (
    echo "%source%" already exists.
    exit /b
)

:: Create the symlink
mklink /D "%source%" "%CD%"

:: Check if the symlink creation was successful
if errorlevel 1 (
    echo Symlink creation failed.
) else (
    echo Symlink created successfully!
)
