# Voice Automation for Claude Desktop

Simple voice automation using AutoHotkey and Windows Voice Typing for hands-free interaction with Claude Desktop.

## Components

- **AutoHotkey Script**: Floating button that triggers Claude's text field focus and Windows Voice Typing
- **Windows Voice Typing**: Built-in Windows 11 speech recognition (Win+H)
- **Configuration**: Customizable hotkeys and settings

## Setup

✅ **Prerequisites:**
- Windows 11 (for Voice Typing feature)
- AutoHotkey v2 installed
- Claude Desktop installed

## Quick Start

**Double-click:** `start_voice_automation.bat`

This launches the AutoHotkey script with a floating button.

## Usage

**Simple Workflow:**

1. Open Claude Desktop
2. **Click the MIC button** → Button turns **ORANGE** and Windows Voice Typing opens
3. **Speak** your message
4. **Press ENTER** (or Ctrl+Shift+Enter) to send

**Button States:**
- 🔵 **Blue "MIC CLICK"** = Ready to start recording
- 🟠 **Orange "REC ON"** = Recording active (speak now!)

**Features:**
- Uses Claude's native `Ctrl+Alt+Space` hotkey to focus text field reliably
- Right-click drag to move button anywhere on screen
- Auto-resets after 30 seconds
- Works with any Claude window size


## Files

- `start_voice_automation.bat`: Quick start script - Run this!
- `scripts/claude_automation_with_button.ahk`: Main script with floating button
- `scripts/window_spy.ahk`: Debugging utility to inspect UI elements
- `config/settings.json`: Configuration settings
- `config/hotkeys.ini`: Hotkey mappings

## Hotkeys

**Primary Method: Click MIC button, then press Enter to send**

**Alternative Hotkeys:**

- **Ctrl+Shift+V**: Start voice input manually (without button)
- **Ctrl+Shift+Enter**: Send message from anywhere
- **Ctrl+Shift+A**: Launch/Activate Claude Desktop
- **Ctrl+Shift+T**: Test if script is running

## How It Works

1. Button click sends `Ctrl+Alt+Space` (Claude's native text field focus hotkey)
2. Then automatically opens Windows Voice Typing (`Win+H`)
3. You speak your message
4. Press Enter to send (button GUI would steal focus if clicked again, so we use keyboard)
