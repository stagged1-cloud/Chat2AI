; Claude Desktop Voice Automation with Floating Button
; Shows a floating "🎤" button over Claude that you can click to start voice input
; Click once to start recording, click again to send the message

#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

; Track button state: 0 = ready to record, 1 = recording (ready to send)
global ButtonState := 0

; Create the floating microphone button with rounded corners
Gui, +AlwaysOnTop -Caption +ToolWindow
Gui, Color, 4169E1  ; Royal Blue
Gui, Font, s24 bold, Segoe UI Emoji
Gui, Add, Text, cWhite gToggleVoice Center w60 h60, 🎤
Gui, Show, NA, Voice Button

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
            
            ; Position button in bottom-right of Claude window
            ButtonX := WinX + WinWidth - 80
            ButtonY := WinY + WinHeight - 80
            
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
        Gui, Color, FF4500  ; Orange-red (recording)
        ButtonState := 1
        
        ; Click in the text field area
        WinActivate, ahk_exe claude.exe
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A
        ClickX := WinX + (WinWidth / 2)
        ClickY := WinY + WinHeight - 100
        Click, %ClickX%, %ClickY%
        Sleep, 200
        
        ; Start Windows Voice Typing
        Send, #{h}
        
        ; Show tooltip
        ToolTip, 🎙️ Recording... Click button again to SEND
        SetTimer, RemoveToolTip, 3000
    }
    else
    {
        ; Second click: Send the message
        Gui, Color, 32CD32  ; Lime green (sending)
        Sleep, 200
        
        ; Send the message
        WinActivate, ahk_exe claude.exe
        Sleep, 100
        Send, {Enter}
        
        ; Show tooltip
        ToolTip, ✅ Message sent!
        SetTimer, RemoveToolTip, 2000
        
        ; Reset to ready state
        Sleep, 300
        Gui, Color, 4169E1  ; Back to blue
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
    MsgBox, 64, Voice Automation, Script is running!`n`nUSAGE:`n`n1. Click the 🎤 button once to START recording`n   (Button turns ORANGE)`n`n2. Speak your message`n`n3. Click the 🎤 button again to SEND`n   (Button flashes GREEN)`n`nThe button appears when Claude is active!
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
    MsgBox, 64, Voice Automation Help, ONE-BUTTON WORKFLOW:`n`n1. Open Claude Desktop`n`n2. Click the 🎤 button to START recording`n   → Button turns ORANGE`n`n3. Speak your message`n`n4. Click the 🎤 button again to SEND`n   → Button flashes GREEN`n`nThat's it! Two clicks total.`n`nAlternative hotkeys:`nCtrl+Shift+V - Start voice typing`nCtrl+Shift+S - Send message
return

ReloadScript:
    Reload
return

ExitScript:
    ExitApp
return

GuiClose:
    return  ; Prevent closing the button