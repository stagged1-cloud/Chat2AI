; Claude Desktop Voice Automation Script
; ULTRA-SIMPLE - Uses Windows Voice Typing (Win+H) instead of WhisperWriter

; Set up script behavior
#SingleInstance Force
SetTitleMatchMode, 2

; Show startup message
TrayTip, Voice Automation, Ready! Using Windows Voice Typing, 3, 1

; Ctrl+Shift+V - Start voice input using Windows Voice Typing
^+v::
    ToolTip, Starting Windows Voice Typing...
    SetTimer, RemoveToolTip, 2000
    
    ; Trigger Windows Voice Typing (Win+H)
    Sleep, 100
    Send, #{h}
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
    MsgBox, 64, Voice Automation, Script is running!`n`nSIMPLE WORKFLOW:`n`n1. Click in Claude's text field`n2. Press Ctrl+Shift+V`n3. Windows Voice Typing opens (Win+H)`n4. Speak your message`n5. Press Ctrl+Shift+S to send`n`nNo WhisperWriter needed - uses Windows built-in!
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
    MsgBox, 64, Voice Automation Help, SIMPLE 3-STEP PROCESS:`n`n1. Click in Claude's text field`n`n2. Press Ctrl+Shift+V`n   → Opens Windows Voice Typing`n`n3. Speak your message`n`n4. Press Ctrl+Shift+S to send`n`nUses Windows built-in voice typing (Win+H)`nNo complex setup needed!
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