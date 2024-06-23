#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;to open shortcuts we can use this
;run, %comspec% /c start C:\Users\ayush.chittranshi_pe\qee.lnk,,hide

Send !k
Send !k
Send !k
Send !k
Send !k
Send !k
Send !k

; Check for the value of the 'pc_type' user variable
EnvGet, PCTypeValue, pc_type
; Run another AHK script
Run, j1.ahk
Run, jc.ahk
Sleep 4000
Send !j
Run, jj.ahk
Run, ji.ahk
Sleep 4000
Send !j
Run, j3.ahk
Run, jo.ahk
Run, jm.ahk
;Run, jl.ahk
Run, ju.ahk
;Run, jh.ahk
Run, js.ahk
Run, jv.ahk
;Run, jy.ahk
Sleep 4000
Send !j
;Run, uu.ahk
;Run, ui.ahk
Sleep 4000
Send !j
Run, jn.ahk
;Run, j5.ahk
