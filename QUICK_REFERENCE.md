# Quick Reference Card

## 🚀 Start System
Double-click: `start_voice_automation.bat`

## 🎤 Button Usage

**Simple 2-Step Workflow:**
1. **Click MIC button** → Button turns ORANGE, Windows Voice Typing opens
2. **Press ENTER** → Sends your message

**Button States:**
- 🔵 Blue = Ready
- 🟠 Orange = Recording (speak now!)

**Move Button:** Right-click and drag

## ⌨️ Hotkeys

| Hotkey | Action |
|--------|--------|
| **Ctrl+Shift+V** | Start voice input (alternative to button) |
| **Ctrl+Shift+Enter** | Send message |
| **Ctrl+Shift+A** | Launch/Activate Claude Desktop |
| **Ctrl+Shift+T** | Test script is running |

## 📋 Typical Workflow

1. Open Claude Desktop (or press Ctrl+Shift+A)
2. Click the floating **MIC button** (or press Ctrl+Shift+V)
3. Speak your message into Windows Voice Typing
4. Press **ENTER** (or Ctrl+Shift+Enter) to send

## ✅ Check Status

- Look for **H icon** in system tray (AutoHotkey running)
- Floating MIC button should be visible (blue circle)
- Right-click tray icon for help menu

## 🔧 Troubleshooting Quick Tips

**Button not working?**
- Check Claude Desktop is running
- Restart AutoHotkey script
- Try hotkey Ctrl+Shift+V instead

**Voice not typing?**
- Windows Voice Typing requires Windows 11
- Check microphone permissions in Windows Settings
- Test Win+H manually to verify Voice Typing works

**Button in wrong location?**
- Right-click drag to move it
- Position is remembered until script restarts

## 📁 Important Files

- `scripts/claude_automation_with_button.ahk` - Main script with floating button
- `scripts/window_spy.ahk` - UI debugging tool
- `config/hotkeys.ini` - Hotkey documentation
- `docs/troubleshooting.md` - Detailed help

## 🌐 Resources

- Repository: https://github.com/stagged1-cloud/Chat2AI
- AutoHotkey Docs: https://www.autohotkey.com/docs/