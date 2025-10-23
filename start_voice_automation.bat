@echo off
echo Starting Voice Automation System...
echo.

REM Start WhisperWriter
echo [1/2] Starting WhisperWriter...
cd /d "c:\Users\don_t\Desktop\Projects\chat to AI\whisper-writer"
start "" "C:\Users\don_t\AppData\Local\Microsoft\WindowsApps\python3.13.exe" run.py
timeout /t 2 /nobreak >nul

REM Start AutoHotkey Script
echo [2/2] Starting AutoHotkey automation...
cd /d "c:\Users\don_t\Desktop\Projects\chat to AI\voice-automation\scripts"
start "" "claude_automation.ahk"

echo.
echo ========================================
echo Voice Automation is now running!
echo ========================================
echo.
echo Hotkeys:
echo   Ctrl+Alt+V - Focus text field and activate voice
echo   Ctrl+Alt+S - Send message
echo   Ctrl+Alt+C - Clear text field
echo   Ctrl+Alt+A - Launch/Activate Claude Desktop
echo.
echo WhisperWriter hotkey: Ctrl+Shift+Space
echo.
echo Check system tray for AutoHotkey (H icon)
echo.
pause