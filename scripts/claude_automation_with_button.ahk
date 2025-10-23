; Claude Desktop Voice Automation with Floating Button
; Click button to start voice input, press Enter to send
; Right-click drag to move button

#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

; Track button state: 0 = ready, 1 = recording
global ButtonState := 0

; Create a round, moveable button
Gui, +AlwaysOnTop -Caption +ToolWindow
Gui, Margin, 0, 0
Gui, Color, 4169E1  ; Royal Blue

; Create button text - centered (70x70 button)
Gui, Font, s8 bold, Segoe UI
Gui, Add, Text, x0 y22 w70 h28 cWhite gToggleVoice Center BackgroundTrans vButtonText, MIC`nCLICK

; Show button in default position (bottom-right of screen)
SysGet, ScreenWidth, 78
SysGet, ScreenHeight, 79
ButtonX := ScreenWidth - 100
ButtonY := ScreenHeight - 150
Gui, Show, x%ButtonX% y%ButtonY% w70 h70, Voice Button

; Make the GUI window round (circular)
WinSet, Region, 0-0 W70 H70 R35-35, Voice Button

; Enable dragging with right-click
OnMessage(0x204, "WM_RBUTTONDOWN")

return

; When button is clicked - START recording only
ToggleVoice:
    global ButtonState
    
    ; Button only starts recording - you press Enter manually to send
    ButtonState := 1
    Gui, Color, FF6600  ; Orange (recording)
    GuiControl,, ButtonText, REC`nON
    
    ; Activate Claude
    WinActivate, ahk_exe claude.exe
    Sleep, 150
    
    ; Use Claude's built-in hotkey to focus text field
    Send, ^!{Space}
    Sleep, 250
    
    ; Start Windows Voice Typing
    Send, #{h}
    
    ; Show tooltip with instructions
    ToolTip, Recording... Press ENTER to send
    SetTimer, RemoveToolTip, 4000
    
    ; Auto-reset button after 30 seconds
    SetTimer, ResetButton, 30000
return


; Hotkey to send message - Ctrl+Shift+Enter
^+Enter::
    Send, {Enter}
    ToolTip, Message sent!
    SetTimer, RemoveToolTip, 1500
return

ResetButton:
    SetTimer, ResetButton, Off
    global ButtonState
    
    Gui, Color, 4169E1  ; Back to blue
    GuiControl,, ButtonText, MIC`nCLICK
    ButtonState := 0
return

; Make button draggable with right-click
WM_RBUTTONDOWN()
{
    PostMessage, 0xA1, 2,,, Voice Button
}

; Hotkey: Ctrl+Shift+V - Start voice input (alternative to button)
^+v::
    IfWinExist, ahk_exe claude.exe
    {
        WinActivate
        Sleep, 100
        Send, ^!{Space}  ; Focus text field using Claude's hotkey
        Sleep, 200
    }
    Send, #{h}
return

; Hotkey: Ctrl+Shift+A - Launch Claude
^+a::
    IfWinExist, ahk_exe claude.exe
    {
        WinActivate
    }
    else
    {
        Run, "C:\Users\don_t\AppData\Local\AnthropicClaude\app-0.14.4\claude.exe"
    }
return

; Test hotkey
^+t::
    MsgBox, 64, Voice Automation, Script is running!`n`nUSAGE:`n`n1. Click MIC button = START recording (ORANGE)`n2. Speak your message`n3. Press ENTER to send`n`nFEATURES:`n• Uses Ctrl+Alt+Space (Claude's native hotkey)`n• Right-click drag to MOVE button`n• Works with any window size!`n`nHotkeys:`nCtrl+Shift+V - Start voice`nCtrl+Shift+Enter - Send message
return


; Helper function to remove tooltip
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

; Tray menu
Menu, Tray, Tip, Claude Voice Automation
Menu, Tray, NoStandard
Menu, Tray, Add, How to Use, ShowHelp
Menu, Tray, Add
Menu, Tray, Add, Reload Script, ReloadScript
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Default, How to Use

ShowHelp:
    MsgBox, 64, Voice Automation Help, SIMPLE WORKFLOW:`n`n1. Click MIC button → ORANGE "REC ON"`n2. Speak your message`n3. Press ENTER to send`n`nFEATURES:`n• Uses Ctrl+Alt+Space (Claude's native hotkey)`n• Right-click drag to MOVE button`n• Works with any window size`n`nHotkeys:`nCtrl+Shift+V - Start voice`nCtrl+Shift+Enter - Send message`nCtrl+Shift+T - Test script
return

ReloadScript:
    Reload
return

ExitScript:
    ExitApp
return

GuiClose:
    return  ; Prevent closing the button
