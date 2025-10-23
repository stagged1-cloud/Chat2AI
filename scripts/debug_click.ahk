; Debug version - Shows where the script clicks
; Press Ctrl+Shift+D to see click location

#SingleInstance Force
CoordMode, Mouse, Client
CoordMode, Pixel, Client

^+d::
    IfWinExist, ahk_exe claude.exe
    {
        WinActivate, ahk_exe claude.exe
        WinWaitActive, ahk_exe claude.exe, , 2
        
        ; Get window dimensions
        WinGetPos, WinX, WinY, WinWidth, WinHeight, A
        
        ; Calculate click position
        InputX := WinWidth / 2
        InputY := WinHeight - 80
        
        ; Show a red dot where we're going to click
        Gui, +AlwaysOnTop -Caption +ToolWindow
        Gui, Color, Red
        Gui, Show, x%InputX% y%InputY% w20 h20 NoActivate
        
        MsgBox, Window size: %WinWidth% x %WinHeight%`nClick position: %InputX%, %InputY%`n`nRed dot shows where script will click.`nPress OK to click there.
        
        Gui, Destroy
        
        ; Now click
        Click, %InputX%, %InputY%
        ToolTip, Clicked at %InputX%, %InputY%
        SetTimer, RemoveToolTip, 2000
    }
    else
    {
        MsgBox, Claude not running
    }
return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

^+q::ExitApp