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

**2-Step Process (to avoid Nvidia conflicts):**

1. Press **Ctrl+Shift+V** → Focuses Claude text field
2. Press **Ctrl+Shift+Space** → Starts WhisperWriter voice recording
3. Speak your message
4. Press **Ctrl+Shift+S** → Send message

The script no longer auto-triggers WhisperWriter to avoid conflicts with Nvidia GeForce Experience.

## Files

- `start_voice_automation.bat`: **Quick start script - Run this!**
- `scripts/claude_automation.ahk`: Main AutoHotkey automation script
- `scripts/install_whisperwriter.py`: Installation script for WhisperWriter
- `config/settings.json`: Configuration settings
- `config/hotkeys.ini`: Hotkey mappings
- `docs/setup_guide.md`: Detailed setup instructions
- `docs/troubleshooting.md`: Common issues and solutions

## Hotkeys

**Note:** Changed to Ctrl+Shift combinations to avoid conflicts with Nvidia GeForce Experience

- **Ctrl+Shift+V**: Focus Claude text field and activate voice input
- **Ctrl+Shift+S**: Send message (press Enter)
- **Ctrl+Shift+C**: Clear text field
- **Ctrl+Shift+A**: Launch/Activate Claude Desktop
- **Ctrl+Shift+Space**: WhisperWriter voice recording (configured in WhisperWriter)
- **Ctrl+Shift+T**: Test if script is running