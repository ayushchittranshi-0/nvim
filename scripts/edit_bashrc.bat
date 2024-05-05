@echo off
setlocal enabledelayedexpansion

set "file=\\wsl.localhost\Ubuntu-22.04\home\ayush-pc\.bashrc"
set "tempfile=tempfile.tmp"

REM Initialize variables to track the last line
set "lastLine="
set "lineNumber=0"

REM Read each line and keep track of the last one
for /F "delims=" %%i in (%file%) do (
    set /a lineNumber+=1
    set "lastLine=%%i"
)

REM Determine if the last line is commented
set "isCommented=!lastLine:~0,1!"
if "!isCommented!"=="#" (
    set "newLastLine=!lastLine:~1!"
) else (
    set "newLastLine=#!lastLine!"
)

REM Output all lines except the last, then output the modified last line
set /a "lastLineNum=lineNumber-1"
set "lineCount=0"
(
    for /F "delims=" %%i in (%file%) do (
        set /a "lineCount+=1"
        set "lineData=%%i"
        if !lineCount! lss %lastLineNum% (
            echo(!lineData!
        ) else if !lineCount! equ %lastLineNum% (
            echo(!lineData!
        )
    )
    REM Output the last line without a newline character
    <nul set /p="!newLastLine!"
) > "%tempfile%"

REM Move the temporary file to replace the original
move /Y "%tempfile%" "%file%"

endlocal
