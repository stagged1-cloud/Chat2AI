# Quick Reference Card

## 🚀 Start System
Double-click: `start_voice_automation.bat`

## ⌨️ Hotkeys

| Hotkey | Action |
|--------|--------|
| **Ctrl+Alt+V** | Focus text field + activate voice |
| **Ctrl+Alt+S** | Send message (Enter) |
| **Ctrl+Alt+C** | Clear text field |
| **Ctrl+Alt+A** | Launch/Activate Claude Desktop |
| **Ctrl+Shift+Space** | WhisperWriter recording |

## 📋 Typical Workflow

1. Open Claude Desktop (or press Ctrl+Alt+A)
2. Press **Ctrl+Alt+V** to focus and activate voice
3. Speak your message when you hear the beep
4. Wait for transcription to appear
5. Press **Ctrl+Alt+S** to send

## ✅ Check Status

- Look for **H icon** in system tray (AutoHotkey running)
- WhisperWriter should be in system tray or taskbar
- Both must be running for automation to work

## 🔧 Troubleshooting Quick Tips

**Voice not working?**
- Check microphone is connected and working
- Verify WhisperWriter is running
- Try Ctrl+Shift+Space directly to test WhisperWriter

**Text field not focusing?**
- Check Claude.exe name in Task Manager
- Update `ahk_exe claude.exe` in `claude_automation.ahk`
- Use Window Spy to find correct ClassNN for text field

**Nothing happens?**
- Restart both WhisperWriter and AutoHotkey script
- Check hotkey conflicts with other apps
- Run `start_voice_automation.bat` as Administrator

## 📁 Important Files

- `scripts/claude_automation.ahk` - Main automation script
- `config/hotkeys.ini` - Customize hotkeys here
- `docs/troubleshooting.md` - Detailed help

## 🌐 Resources

- Repository: https://github.com/stagged1-cloud/Chat2AI
- WhisperWriter: Located at `c:\Users\don_t\Desktop\Projects\chat to AI\whisper-writer`
- AutoHotkey Docs: https://www.autohotkey.com/docs/