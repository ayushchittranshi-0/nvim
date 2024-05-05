setlocal

:: Set process names
set "POWERTOYS_PROCESS=PowerToys.exe"
set "VSCODE_PROCESS=Code.exe"

:: Check if PowerToys is running
tasklist /FI "IMAGENAME eq %POWERTOYS_PROCESS%" 2>NUL | find /I /N "%POWERTOYS_PROCESS%">NUL
if "%ERRORLEVEL%"=="0" (
    echo %POWERTOYS_PROCESS% is running, terminating now...
    taskkill /F /IM "%POWERTOYS_PROCESS%"
    taskkill /F /IM "%VSCODE_PROCESS%"
    code --uninstall-extension vscodevim.vim
    start "" "C:\Users\%USERNAME%\Visual Studio Code.lnk"
    if "%ERRORLEVEL%"=="0" echo Successfully terminated %POWERTOYS_PROCESS%.
    if "%ERRORLEVEL%" NEQ "0" echo Failed to terminate %POWERTOYS_PROCESS%.
) else (
    echo %POWERTOYS_PROCESS% is not running, starting now...
    start "" "C:\Program Files\PowerToys\PowerToys.exe"
    code --install-extension vscodevim.vim
)
endlocal
