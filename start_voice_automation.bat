@echo off
echo Starting Voice Automation System...
echo.

REM Start WhisperWriter
echo [1/2] Starting WhisperWriter...
cd /d "c:\Users\don_t\Desktop\Projects\chat to AI\whisper-writer"
start "WhisperWriter" "C:\Users\don_t\AppData\Local\Microsoft\WindowsApps\python3.13.exe" run.py
timeout /t 3 /nobreak >nul

REM Start AutoHotkey Script
echo [2/2] Starting AutoHotkey automation...
cd /d "c:\Users\don_t\Desktop\Projects\chat to AI\voice-automation\scripts"
start "" "claude_automation.ahk"

echo.
echo ========================================
echo Voice Automation is now running!
echo ========================================
echo.
echo USAGE:
echo   1. Click in Claude's text field
echo   2. Press Ctrl+Shift+V to start voice
echo   3. Speak your message
echo   4. Press Ctrl+Shift+S to send
echo.
echo WhisperWriter should show a window.
echo Check system tray for AutoHotkey (H icon)
echo.
echo If WhisperWriter window doesn't appear,
echo run it manually from the whisper-writer folder
echo.
pause