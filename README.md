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

**One-Button Workflow (Easiest!):**

1. Open Claude Desktop
2. **Click the 🎤 button** → Button turns **ORANGE** and starts recording
3. **Speak** your message
4. **Click the 🎤 button again** → Button flashes **GREEN** and sends message

**That's it! Just two clicks total - one to record, one to send!**

**Button Colors:**
- 🔵 **Blue** = Ready to record
- 🟠 **Orange** = Recording (speak now!)
- 🟢 **Green** = Sending your message

> The floating microphone button automatically appears when Claude Desktop is active and disappears when you switch to other windows!

## Files

- `start_voice_automation.bat`: **Quick start script - Run this!**
- `scripts/claude_automation.ahk`: Main AutoHotkey automation script
- `scripts/install_whisperwriter.py`: Installation script for WhisperWriter
- `config/settings.json`: Configuration settings
- `config/hotkeys.ini`: Hotkey mappings
- `docs/setup_guide.md`: Detailed setup instructions
- `docs/troubleshooting.md`: Common issues and solutions

## Hotkeys

**Primary Method: 🎤 Button (Click twice - record, then send)**

**Alternative Hotkeys:**

- **Ctrl+Shift+V**: Start voice input manually
- **Ctrl+Shift+S**: Send message manually
- **Ctrl+Shift+A**: Launch/Activate Claude Desktop
- **Ctrl+Shift+T**: Test if script is running