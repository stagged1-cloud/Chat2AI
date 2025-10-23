; Claude Desktop Voice Automation with Floating Button
; Shows a floating "🎤" button over Claude that you can click to start voice input
; Click once to start recording, click again to send the message

#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

; Track button state: 0 = ready to record, 1 = recording (ready to send)
global ButtonState := 0

; Create a round, freely moveable button
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

; When button is clicked - toggle between recording and sending
ToggleVoice:
    global ButtonState
    
    if (ButtonState == 0)
    {
        ; First click: Start voice recording
        ButtonState := 1
        Gui, Color, FF6600  ; Bright orange (recording)
        
        ; Update button text
        GuiControl,, ButtonText, REC`nON
        
        ; Activate Claude
        WinActivate, ahk_exe claude.exe
        Sleep, 150
        
        ; Use Claude's built-in hotkey to focus text field!
        Send, ^!{Space}
        Sleep, 250
        
        ; Start Windows Voice Typing
        Send, #{h}
        
        ; Show clean tooltip
        ToolTip, Recording... Click button again to SEND
        SetTimer, RemoveToolTip, 3000
        
        return
    }
    
    if (ButtonState == 1)
    {
        ; Second click: Send the message
        ; CRITICAL: Send Enter FIRST before changing button state/color!
        ; The button GUI manipulation causes focus loss which closes the popup
        
        ; Send Enter IMMEDIATELY with no delays
        Send, {Enter}
        
        ; NOW update the button (after Enter is sent)
        ButtonState := 2
        Gui, Color, 00CC00  ; Bright green (sending)
        GuiControl,, ButtonText, SEND`nING
        
        ; Show tooltip
        ToolTip, Message sent!
        SetTimer, RemoveToolTip, 1500
        
        ; Reset to ready state
        Sleep, 500
        Gui, Color, 4169E1  ; Back to blue
        GuiControl,, ButtonText, MIC`nCLICK
        ButtonState := 0
        
        return
    }
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

; Hotkey: Ctrl+Shift+S - Send message
#IfWinActive ahk_exe claude.exe
^+s::
    Send, {Enter}
return
#IfWinActive

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
    MsgBox, 64, Voice Automation, Script is running!`n`nUSAGE:`n`n1. Click MIC button = START recording (ORANGE)`n2. Speak your message`n3. Click button again = SEND (GREEN)`n`nFEATURES:`n• Uses Ctrl+Alt+Space to focus text field`n• Shift+Click button to MOVE it`n• Works with any Claude window size!`n`nHotkeys:`nCtrl+Shift+V - Start voice`nCtrl+Shift+S - Send
return

; Helper function to remove tooltip
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

; Tray menu
Menu, Tray, Tip, Claude Voice Automation with Floating Button
Menu, Tray, NoStandard
Menu, Tray, Add, How to Use, ShowHelp
Menu, Tray, Add
Menu, Tray, Add, Reload Script, ReloadScript
Menu, Tray, Add, Exit, ExitScript
Menu, Tray, Default, How to Use

ShowHelp:
    MsgBox, 64, Voice Automation Help, ONE-BUTTON WORKFLOW:`n`n1. Click MIC button → ORANGE "REC ON"`n2. Speak your message`n3. Click button again → GREEN "SENDING"`n`nFEATURES:`n• Uses Ctrl+Alt+Space (Claude's hotkey!)`n• Works with ANY window size`n• Shift+Click to MOVE button`n`nHotkeys:`nCtrl+Shift+V - Start voice`nCtrl+Shift+S - Send message`nCtrl+Shift+T - Test script
return

ReloadScript:
    Reload
return

ExitScript:
    ExitApp
return

GuiClose:
    return  ; Prevent closing the button