; Window Spy Tool - Shows control information under mouse cursor
; Press Ctrl+Alt+I to inspect the element under your mouse cursor

#SingleInstance Force

^!i::  ; Ctrl+Alt+I
    MouseGetPos, MouseX, MouseY, WindowID, ControlID
    WinGetClass, WindowClass, ahk_id %WindowID%
    WinGetTitle, WindowTitle, ahk_id %WindowID%
    ControlGetText, ControlText, %ControlID%, ahk_id %WindowID%
    
    Info := "WINDOW INFO:`n"
    Info .= "Title: " . WindowTitle . "`n"
    Info .= "Class: " . WindowClass . "`n"
    Info .= "Window ID: " . WindowID . "`n`n"
    Info .= "CONTROL INFO:`n"
    Info .= "Control ID: " . ControlID . "`n"
    Info .= "Control Text: " . ControlText . "`n`n"
    Info .= "MOUSE POSITION:`n"
    Info .= "X: " . MouseX . " Y: " . MouseY
    
    MsgBox, 64, Window Spy, %Info%
return

^!c::  ; Ctrl+Alt+C - List all controls in active window
    WinGet, ControlList, ControlList, A
    WinGetTitle, WindowTitle, A
    
    Info := "CONTROLS IN: " . WindowTitle . "`n`n"
    Loop, Parse, ControlList, `n
    {
        Info .= A_Index . ". " . A_LoopField . "`n"
    }
    
    MsgBox, 64, Control List, %Info%
return

^!h::  ; Ctrl+Alt+H - Show help
    MsgBox, 64, Window Spy Help, HOTKEYS:`n`nCtrl+Alt+I - Inspect element under cursor`nCtrl+Alt+C - List all controls in active window`nCtrl+Alt+H - Show this help
return
