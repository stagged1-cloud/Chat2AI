# Voice Automation Project

This project implements Approach 3 from the voice automation guide: Advanced automation with AutoHotkey and WhisperWriter for automating voice input into Claude Desktop.

## Components

- **AutoHotkey Script**: Detects Claude Desktop windows and focuses text fields
- **WhisperWriter**: High-accuracy voice-to-text transcription
- **Configuration**: Customizable settings for hotkeys and behavior

## Setup

✅ **Prerequisites Installed:**
- AutoHotkey ✓
- Python 3.13 ✓
- OpenAI Whisper ✓
- WhisperWriter ✓ (located at `c:\Users\don_t\Desktop\Projects\chat to AI\whisper-writer`)

## Quick Start

**Option 1: Use the batch file (Recommended)**
```
Double-click: start_voice_automation.bat
```

**Option 2: Manual start**
1. Run WhisperWriter: `cd whisper-writer && python run.py`
2. Run AutoHotkey script: Open `scripts\claude_automation.ahk`

## Usage

1. Ensure both WhisperWriter and AutoHotkey script are running (check system tray)
2. Open Claude Desktop
3. Press **Ctrl+Alt+V** (or your configured hotkey)
4. When you hear the beep, speak your message
5. WhisperWriter will transcribe and type it into the focused field
6. Press **Ctrl+Alt+S** to send the message

## Files

- `start_voice_automation.bat`: **Quick start script - Run this!**
- `scripts/claude_automation.ahk`: Main AutoHotkey automation script
- `scripts/install_whisperwriter.py`: Installation script for WhisperWriter
- `config/settings.json`: Configuration settings
- `config/hotkeys.ini`: Hotkey mappings
- `docs/setup_guide.md`: Detailed setup instructions
- `docs/troubleshooting.md`: Common issues and solutions

## Hotkeys

- **Ctrl+Alt+V**: Focus Claude text field and activate voice input
- **Ctrl+Alt+S**: Send message (press Enter)
- **Ctrl+Alt+C**: Clear text field
- **Ctrl+Alt+A**: Launch/Activate Claude Desktop
- **Ctrl+Shift+Space**: WhisperWriter voice recording (configured in WhisperWriter)