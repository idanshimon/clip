@echo off
setlocal

set "VERSION=1.0.0"

if "%~1"=="" (
  echo clip v%VERSION% - Copy file contents to clipboard
  echo.
  echo Usage: clip ^<file^>
  echo.
  echo Options:
  echo   -h, --help      Show this help message
  echo   -v, --version   Show version
  exit /b 1
)

if "%~1"=="-h" goto :help
if "%~1"=="--help" goto :help
if "%~1"=="-v" goto :version
if "%~1"=="--version" goto :version

if not exist "%~1" (
  echo Error: '%~1' is not a file >&2
  exit /b 1
)

type "%~1" | clip.exe >nul 2>&1
if errorlevel 1 (
  echo Error: Failed to copy to clipboard >&2
  exit /b 1
)

for /f %%a in ('find /c /v "" ^< "%~1"') do set "lines=%%a"
echo Copied %lines% lines from '%~1' to clipboard
exit /b 0

:help
echo clip v%VERSION% - Copy file contents to clipboard
echo.
echo Usage: clip ^<file^>
echo.
echo Options:
echo   -h, --help      Show this help message
echo   -v, --version   Show version
exit /b 0

:version
echo clip v%VERSION%
exit /b 0
