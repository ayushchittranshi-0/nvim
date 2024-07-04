

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

EnvGet, PCTypeValue, pc_type
; Check if the 'pc_type' variable is set to a specific value
if (PCTypeValue = "work")
{
   ;WORKPLACE WORKSTATION
   Run, cmd.exe /C start chrome "chatgpt.peerxp.com" --start-maximized --new-window --window-name="jc" 
}
else
{
   ;HOME WORKSTATION
   Run, cmd.exe /C start chrome "chat.openai.com" --start-maximized --new-window --window-name="jc" 
}
