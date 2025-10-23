# Voice Automation Project

This project implements Approach 3 from the voice automation guide: Advanced automation with AutoHotkey and WhisperWriter for automating voice input into Claude Desktop.

## Components

- **AutoHotkey Script**: Detects Claude Desktop windows and focuses text fields
- **WhisperWriter**: High-accuracy voice-to-text transcription
- **Configuration**: Customizable settings for hotkeys and behavior

## Setup

1. Install AutoHotkey from https://www.autohotkey.com/
2. Install Python 3.8+ if not already installed
3. Run the WhisperWriter installation script
4. Configure your hotkeys in config/hotkeys.ini
5. Run the AutoHotkey script

## Usage

1. Open Claude Desktop
2. Press your configured hotkey (default: Ctrl+Alt+V)
3. Speak your message
4. WhisperWriter will transcribe and type it into the focused field

## Files

- `scripts/claude_automation.ahk`: Main AutoHotkey automation script
- `scripts/install_whisperwriter.py`: Installation script for WhisperWriter
- `config/settings.json`: Configuration settings
- `config/hotkeys.ini`: Hotkey mappings
- `docs/setup_guide.md`: Detailed setup instructions
- `docs/troubleshooting.md`: Common issues and solutions