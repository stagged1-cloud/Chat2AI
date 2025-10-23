; Claude Desktop Voice Automation with Floating Button
; Shows a floating "🎤" button over Claude that you can click to start voice input
; Click once to start recording, click again to send the message

#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

; Track button state: 0 = ready to record, 1 = recording (ready to send)
global ButtonState := 0

; Create a round, 3D button with shadow effect
Gui, +AlwaysOnTop -Caption +ToolWindow +E0x20
Gui, Margin, 0, 0
Gui, Color, 4169E1  ; Royal Blue

; Create button text - centered
Gui, Font, s10 bold, Segoe UI
Gui, Add, Text, x0 y30 w100 h40 cWhite gToggleVoice Center BackgroundTrans vButtonText, MIC`nCLICK

Gui, Show, w100 h100 NA, Voice Button

; Make the GUI window round (circular)
WinSet, Region, 0-0 W100 H100 R50-50, Voice Button

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
            
            ; Position button higher up in bottom-right corner
            ButtonX := WinX + WinWidth - 120
            ButtonY := WinY + WinHeight - 180
            
            ; Show and position the button
            Gui, Show, x%ButtonX% y%ButtonY% w100 h100 NA, Voice Button
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
        
        ; Activate Claude and get its window position
        WinActivate, ahk_exe claude.exe
        Sleep, 150
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A
        
        ; Click in the text input field at the bottom of Claude
        ; The text field is typically around 60-100 pixels from the bottom
        ClickX := WinX + (WinWidth / 2)
        ClickY := WinY + WinHeight - 60
        
        ; Click to focus the text field
        Click, %ClickX%, %ClickY%
        Sleep, 100
        
        ; Click again to ensure the text field is focused
        Click, %ClickX%, %ClickY%
        Sleep, 250
        
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