; Claude Desktop Voice Automation with Floating Button
; Shows a floating "🎤" button over Claude that you can click to start voice input
; Click once to start recording, click again to send the message

#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

; Track button state: 0 = ready to record, 1 = recording (ready to send)
global ButtonState := 0

; Create a round, 3D button with shadow effect (30% smaller)
Gui, +AlwaysOnTop -Caption +ToolWindow +E0x20
Gui, Margin, 0, 0
Gui, Color, 4169E1  ; Royal Blue

; Create button text - centered (smaller button 70x70)
Gui, Font, s8 bold, Segoe UI
Gui, Add, Text, x0 y22 w70 h28 cWhite gToggleVoice Center BackgroundTrans vButtonText, MIC`nCLICK

Gui, Show, w70 h70 NA, Voice Button

; Make the GUI window round (circular)
WinSet, Region, 0-0 W70 H70 R35-35, Voice Button

; Initially hide the button
Gui, Hide

; Monitor for Claude window
SetTimer, CheckClaudeWindow, 500
return

CheckClaudeWindow:
    IfWinExist, ahk_exe claude.exe
    {
        IfWinActive, ahk_exe claude.exe
        {
            ; Get Claude window position
            WinGetPos, WinX, WinY, WinWidth, WinHeight, A
            
            ; Position smaller button (70x70) in bottom-right corner
            ButtonX := WinX + WinWidth - 90
            ButtonY := WinY + WinHeight - 180
            
            ; Show and position the button
            Gui, Show, x%ButtonX% y%ButtonY% w70 h70 NA, Voice Button
        }
        else
        {
            ; Hide button when Claude is not active
            Gui, Hide
        }
    }
    else
    {
        ; Hide button when Claude is not running
        Gui, Hide
    }
return

; When button is clicked - toggle between recording and sending
ToggleVoice:
    if (ButtonState = 0)
    {
        ; First click: Start voice recording
        Gui, Color, FF6600  ; Bright orange (recording)
        ButtonState := 1
        
        ; Update button text
        GuiControl,, ButtonText, REC`nON
        
        ; Activate Claude
        WinActivate, ahk_exe claude.exe
        Sleep, 150
        
        ; SMART APPROACH: Use Ctrl+N to start new chat (focuses input)
        ; OR use Ctrl+Shift+Space which often focuses input in Electron apps
        ; OR simply press Escape to clear any popups, then start typing
        Send, {Escape}
        Sleep, 100
        
        ; Try clicking in bottom 30% of window (more reliable than fixed pixels)
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A
        ClickX := WinX + (WinWidth / 2)
        ClickY := WinY + (WinHeight * 0.85)  ; 85% down = bottom area
        Click, %ClickX%, %ClickY%
        Sleep, 200
        
        ; Start Windows Voice Typing
        Send, #{h}
        
        ; Show clean tooltip
        ToolTip, Recording... Click button again to send
        SetTimer, RemoveToolTip, 3000
    }
    else
    {
        ; Second click: Send the message
        Gui, Color, 00CC00  ; Bright green (sending)
        GuiControl,, ButtonText, SEND`nING
        Sleep, 150
        
        ; Send the message
        WinActivate, ahk_exe claude.exe
        Sleep, 100
        Send, {Enter}
        
        ; Show clean tooltip
        ToolTip, Message sent!
        SetTimer, RemoveToolTip, 1500
        
        ; Reset to ready state
        Sleep, 250
        Gui, Color, 4169E1  ; Back to blue
        GuiControl,, ButtonText, MIC`nCLICK
        ButtonState := 0
    }
return

; Hotkey: Ctrl+Shift+V - Start voice input (alternative to button)
^+v::
    IfWinExist, ahk_exe claude.exe
    {
        WinActivate
        Sleep, 100
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
    MsgBox, 64, Voice Automation, Script is running!`n`nUSAGE:`n`n1. Click the MIC button once to START recording`n   (Button turns ORANGE: "REC ON")`n`n2. Speak your message`n`n3. Click the button again to SEND`n   (Button flashes GREEN: "SENDING")`n`nThe button appears when Claude is active!
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
    MsgBox, 64, Voice Automation Help, ONE-BUTTON WORKFLOW:`n`n1. Open Claude Desktop`n`n2. Click the MIC button to START recording`n   → Button turns ORANGE: "REC ON"`n`n3. Speak your message`n`n4. Click the button again to SEND`n   → Button flashes GREEN: "SENDING"`n`nThat's it! Two clicks total.`n`nAlternative hotkeys:`nCtrl+Shift+V - Start voice typing`nCtrl+Shift+S - Send message
return

ReloadScript:
    Reload
return

ExitScript:
    ExitApp
return

GuiClose:
    return  ; Prevent closing the button