@echo off
setlocal

set "PROCESSNAME=PowerToys.exe"

:: Check if PowerToys is running
tasklist /FI "IMAGENAME eq %PROCESSNAME%" 2>NUL | find /I /N "%PROCESSNAME%">NUL
if "%ERRORLEVEL%"=="0" (
    echo %PROCESSNAME% is running, terminating now...
    taskkill /F /IM "%PROCESSNAME%"
    if "%ERRORLEVEL%"=="0" echo Successfully terminated %PROCESSNAME%.
    if "%ERRORLEVEL%" NEQ "0" echo Failed to terminate %PROCESSNAME%.
) else (
    echo %PROCESSNAME% is not running, starting now...
    start "" "C:\Program Files\PowerToys\PowerToys.exe"
)

endlocal

