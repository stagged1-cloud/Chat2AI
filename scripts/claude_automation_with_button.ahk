; Claude Desktop Voice Automation with Floating Button
; Shows a floating "🎤" button over Claude that you can click to start voice input

#SingleInstance Force
SetTitleMatchMode, 2
CoordMode, Mouse, Screen

; Create the floating microphone button
Gui, +AlwaysOnTop -Caption +ToolWindow
Gui, Color, 4169E1  ; Royal Blue
Gui, Font, s20, Segoe UI Emoji
Gui, Add, Text, cWhite gStartVoice, 🎤
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
            ButtonX := WinX + WinWidth - 70
            ButtonY := WinY + WinHeight - 70
            
            ; Show and position the button
            Gui, Show, x%ButtonX% y%ButtonY% w50 h50 NA, Voice Button
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

; When button is clicked
StartVoice:
    ; Flash the button to show it was clicked
    Gui, Color, FF4500  ; Orange-red
    Sleep, 100
    Gui, Color, 4169E1  ; Back to blue
    
    ; Click in the text field area
    WinActivate, ahk_exe claude.exe
    WinGetPos, WinX, WinY, WinWidth, WinHeight, A
    ClickX := WinX + (WinWidth / 2)
    ClickY := WinY + WinHeight - 100
    Click, %ClickX%, %ClickY%
    Sleep, 200
    
    ; Start Windows Voice Typing
    Send, #{h}
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
    MsgBox, 64, Voice Automation, Script is running!`n`nUSAGE:`n`n1. Click the floating 🎤 button`n   OR press Ctrl+Shift+V`n`n2. Speak your message`n`n3. Press Ctrl+Shift+S to send`n`nThe 🎤 button appears when Claude is active!
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
    MsgBox, 64, Voice Automation Help, FLOATING BUTTON MODE:`n`n1. Open Claude Desktop`n`n2. Click the floating 🎤 button`n   (appears in bottom-right)`n`n3. Speak your message`n`n4. Press Ctrl+Shift+S to send`n`nAlternative: Press Ctrl+Shift+V anywhere
return

ReloadScript:
    Reload
return

ExitScript:
    ExitApp
return

GuiClose:
    return  ; Prevent closing the button