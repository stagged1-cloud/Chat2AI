; ULTRA-SIMPLE VERSION - Just triggers WhisperWriter
; You manually click in Claude's text field, then press Ctrl+Shift+V

#SingleInstance Force

; Show startup
TrayTip, Voice Automation, Simple mode: Click text field, then Ctrl+Shift+V, 3, 1

; Ctrl+Shift+V - Just activate voice (you click the field yourself)
^+v::
    ToolTip, Starting voice recording...
    SetTimer, RemoveToolTip, 2000
    
    ; Just send the WhisperWriter hotkey
    Sleep, 100
    Send, ^+{Space}
return

; Ctrl+Shift+S - Send message
^+s::
    Send, {Enter}
return

RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return

; Test
^+t::
    MsgBox, Simple voice mode active!`n`n1. Click in Claude text field`n2. Press Ctrl+Shift+V`n3. Speak`n4. Press Ctrl+Shift+S to send
return

^+q::ExitApp