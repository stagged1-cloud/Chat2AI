@echo off
echo Starting Voice Automation System...
echo.

REM Start AutoHotkey Script with Floating Button
echo Starting AutoHotkey automation with floating button...
cd /d "c:\Users\don_t\Desktop\Projects\chat to AI\voice-automation\scripts"
start "" "claude_automation_with_button.ahk"

echo.
echo ========================================
echo Voice Automation is now running!
echo ========================================
echo.
echo USAGE:
echo   1. Open Claude Desktop
echo   2. Look for the floating microphone button
echo   3. Click it to start voice input
echo   4. Speak your message
echo   5. Press Ctrl+Shift+S to send
echo.
echo Alternative: Press Ctrl+Shift+V anywhere
echo.
echo Check system tray for AutoHotkey (H icon)
echo.
pause