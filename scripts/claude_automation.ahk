; Claude Desktop Voice Automation Script
; This script detects when Claude Desktop is active and provides hotkeys for voice input automation

; Set up script behavior
#SingleInstance Force
SetTitleMatchMode, 2  ; Partial title matching

; Show startup message
TrayTip, Voice Automation, Ctrl+Shift+V ready for voice input!, 3, 1

; Global hotkey to activate Claude and start voice input (Changed from Ctrl+Alt+V to avoid Nvidia conflict)
^+v::
    ; Check if Claude is running and activate it
    IfWinExist, ahk_exe claude.exe
    {
        WinActivate, ahk_exe claude.exe
        WinWaitActive, ahk_exe claude.exe, , 2
        Sleep, 300  ; Wait for window to activate
        
        ; Show activation message
        TrayTip, Voice Automation, Activating voice input..., 2, 1
        
        ; Click in the center-bottom area where text input usually is
        ; This is more reliable than ControlFocus for Electron apps
        WinGetPos, X, Y, Width, Height, A
        ClickX := Width / 2
        ClickY := Height - 150  ; 150 pixels from bottom
        Click, %ClickX%, %ClickY%
        Sleep, 200
        
        ; Trigger WhisperWriter (default hotkey: Ctrl+Shift+Space)
        Send, ^+{Space}
        
        ; Show notification
        ToolTip, Voice input activated! Speak now...
        SetTimer, RemoveToolTip, 3000
    }
    else
    {
        MsgBox, 48, Voice Automation, Claude Desktop is not running.`n`nPress Ctrl+Shift+A to launch it.
    }
return

; Hotkey: Ctrl+Shift+S - Send message (press Enter) - Works only in Claude
#IfWinActive ahk_exe claude.exe
^+s::
    Send, {Enter}
return

; Hotkey: Ctrl+Shift+C - Clear text field - Works only in Claude
^+c::
    ControlSetText, Edit1, , A
return
#IfWinActive

; Global hotkey to launch/activate Claude Desktop
^+a::
    ; Check if Claude is running
    IfWinExist, ahk_exe claude.exe
    {
        WinActivate
        Sleep, 200
    }
    else
    {
        ; Launch Claude Desktop (using actual path)
        Run, "C:\Users\don_t\AppData\Local\AnthropicClaude\app-0.14.4\claude.exe"
        Sleep, 3000  ; Wait for app to load
    }
return

; Test hotkey to verify script is running - Press Ctrl+Shift+T
^+t::
    MsgBox, 64, Voice Automation Test, Script is running successfully!`n`nHotkeys available (Ctrl+Shift combinations):`n• Ctrl+Shift+V - Voice input`n• Ctrl+Shift+A - Open Claude`n• Ctrl+Shift+S - Send message`n• Ctrl+Shift+C - Clear field`n`nChanged from Ctrl+Alt to avoid Nvidia conflicts!
return

; Helper function to remove tooltip
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

; Tray menu for easy access
Menu, Tray, Tip, Claude Voice Automation - Active (Ctrl+Shift+V)
Menu, Tray, NoStandard
Menu, Tray, Add, Test Voice Input (Ctrl+Shift+V), TestVoice
Menu, Tray, Add
Menu, Tray, Add, Reload Script, ReloadScript
Menu, Tray, Add, Edit Script, EditScript
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Default, Test Voice Input (Ctrl+Shift+V)

TestVoice:
    Send, ^+v
return

ReloadScript:
    Reload
return

EditScript:
    Run, notepad.exe "%A_ScriptFullPath%"
return

ExitScript:
    ExitApp
return