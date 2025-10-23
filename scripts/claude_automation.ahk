; Claude Desktop Voice Automation Script
; This script detects when Claude Desktop is active and provides hotkeys for voice input automation

#IfWinActive ahk_exe claude.exe  ; Adjust exe name if different (check Task Manager)

; Hotkey: Ctrl+Alt+V - Focus text field and activate WhisperWriter
^!v::
    ; Focus the main text input field (adjust ClassNN if needed)
    ControlFocus, Edit1, A
    Sleep, 100  ; Brief pause to ensure focus
    
    ; Trigger WhisperWriter (default hotkey: Ctrl+Shift+Space)
    Send, ^+{Space}
return

; Hotkey: Ctrl+Alt+S - Send message (press Enter)
^!s::
    Send, {Enter}
return

; Hotkey: Ctrl+Alt+C - Clear text field
^!c::
    ControlSetText, Edit1, , A
return

#IfWinActive

; Global hotkey to activate Claude Desktop and start voice input
^!a::
    ; Check if Claude is running
    IfWinExist, ahk_exe claude.exe
    {
        WinActivate
        Sleep, 200
        ; Trigger the voice input sequence
        Send, ^!v
    }
    else
    {
        ; Launch Claude Desktop (adjust path as needed)
        Run, "C:\Path\To\Claude.exe"
        Sleep, 3000  ; Wait for app to load
        Send, ^!v
    }
return

; Tray menu for easy access
Menu, Tray, Add, Reload Script, ReloadScript
Menu, Tray, Add, Edit Script, EditScript
Menu, Tray, Add, Exit, ExitScript

ReloadScript:
    Reload
return

EditScript:
    Run, notepad.exe "%A_ScriptFullPath%"
return

ExitScript:
    ExitApp
return