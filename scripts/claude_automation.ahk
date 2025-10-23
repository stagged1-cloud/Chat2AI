; Claude Desktop Voice Automation Script
; SIMPLIFIED VERSION - No auto WhisperWriter trigger to avoid Nvidia conflicts

; Set up script behavior
#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen  ; Use screen coordinates

; Show startup message
TrayTip, Voice Automation, Hotkeys ready! See tray menu for help., 3, 1

; Ctrl+Shift+V - Focus Claude text input field
^+v::
    IfWinExist, ahk_exe claude.exe
    {
        ; Activate Claude window
        WinActivate, ahk_exe claude.exe
        WinWaitActive, ahk_exe claude.exe, , 1
        Sleep, 150
        
        ; Get window position and size
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A
        
        ; Calculate center-bottom position for text input
        ; The text input in Claude is typically at the bottom
        ClickX := WinX + (WinWidth / 2)
        ClickY := WinY + WinHeight - 80  ; 80 pixels from bottom edge
        
        ; Click the text input area
        Click, %ClickX%, %ClickY%
        Sleep, 100
        
        ; Show confirmation
        ToolTip, Text field focused! Now press Ctrl+Shift+Space for voice input.
        SetTimer, RemoveToolTip, 3000
    }
    else
    {
        ToolTip, Claude Desktop not found! Press Ctrl+Shift+A to launch.
        SetTimer, RemoveToolTip, 2000
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
    MsgBox, 64, Voice Automation Test, Script is running successfully!`n`nHotkeys available:`n`n• Ctrl+Shift+V - Focus Claude text field`n• Ctrl+Shift+Space - Start voice recording (WhisperWriter)`n• Ctrl+Shift+S - Send message`n• Ctrl+Shift+A - Open Claude`n`nWorkflow:`n1. Press Ctrl+Shift+V to focus`n2. Press Ctrl+Shift+Space to record`n3. Speak your message`n4. Press Ctrl+Shift+S to send
return

; Helper function to remove tooltip
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

; Tray menu for easy access
Menu, Tray, Tip, Claude Voice Automation (2-step: Ctrl+Shift+V then Ctrl+Shift+Space)
Menu, Tray, NoStandard
Menu, Tray, Add, How to Use, ShowHelp
Menu, Tray, Add
Menu, Tray, Add, Focus Text Field (Ctrl+Shift+V), FocusField
Menu, Tray, Add
Menu, Tray, Add, Reload Script, ReloadScript
Menu, Tray, Add, Edit Script, EditScript
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Default, How to Use

ShowHelp:
    MsgBox, 64, Voice Automation Help, 2-Step Voice Input Process:`n`n1. Press Ctrl+Shift+V`n   → Focuses Claude text field`n`n2. Press Ctrl+Shift+Space`n   → Starts voice recording`n`n3. Speak your message`n`n4. Press Ctrl+Shift+S to send`n`nThis avoids Nvidia conflicts!
return

FocusField:
    Send, ^+v
return

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