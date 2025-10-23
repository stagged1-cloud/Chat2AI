; Claude Desktop Voice Automation Script
; SIMPLIFIED - Manual click version (most reliable)

; Set up script behavior
#SingleInstance Force
SetTitleMatchMode, 2

; Show startup message
TrayTip, Voice Automation, Ready! Click text field then use Ctrl+Shift+V, 3, 1

; Ctrl+Shift+V - Start voice input (you click the text field manually first)
^+v::
    ToolTip, Starting voice recording...
    SetTimer, RemoveToolTip, 2000
    
    ; Trigger WhisperWriter
    Sleep, 100
    Send, ^+{Space}
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
    MsgBox, 64, Voice Automation, Script is running!`n`nSIMPLE WORKFLOW:`n`n1. Click in Claude's text field (manual)`n2. Press Ctrl+Shift+V to start recording`n3. Speak your message`n4. Press Ctrl+Shift+S to send`n`nNo automated clicking - more reliable!
return

; Helper function to remove tooltip
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

; Tray menu for easy access
Menu, Tray, Tip, Voice Automation (Manual click + Ctrl+Shift+V)
Menu, Tray, NoStandard
Menu, Tray, Add, How to Use, ShowHelp
Menu, Tray, Add
Menu, Tray, Add, Start Voice (Ctrl+Shift+V), StartVoice
Menu, Tray, Add
Menu, Tray, Add, Reload Script, ReloadScript
Menu, Tray, Add, Edit Script, EditScript
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Default, How to Use

ShowHelp:
    MsgBox, 64, Voice Automation Help, SIMPLE 3-STEP PROCESS:`n`n1. Click in Claude's text field (manual)`n`n2. Press Ctrl+Shift+V`n   → Triggers voice recording`n`n3. Speak your message`n`n4. Press Ctrl+Shift+S to send`n`nWhy manual click?`nMore reliable than automated clicking!
return

StartVoice:
    Send, ^+v
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