# Voice Automation Setup Guide

## Prerequisites

- Windows 10 or 11
- Python 3.8+ (for WhisperWriter)
- Administrator privileges for installation

## Step 1: Install AutoHotkey

1. Download AutoHotkey from https://www.autohotkey.com/
2. Run the installer and follow the default options
3. Verify installation by running `AutoHotkey` from Start menu

## Step 2: Install WhisperWriter

1. Open Command Prompt or PowerShell as Administrator
2. Navigate to the scripts directory:
   ```
   cd "c:\Users\don_t\Desktop\Projects\chat to AI\voice-automation\scripts"
   ```
3. Run the installation script:
   ```
   python install_whisperwriter.py
   ```
4. Wait for all dependencies to install

## Step 3: Configure WhisperWriter

1. Run WhisperWriter once to initialize
2. Open WhisperWriter settings
3. Set hotkey to Ctrl+Shift+Space (or update config/hotkeys.ini accordingly)
4. Choose your preferred Whisper model (base for speed, large for accuracy)
5. Test voice recognition in a text editor

## Step 4: Configure AutoHotkey Script

1. Open `scripts/claude_automation.ahk` in a text editor
2. Update the executable name if Claude Desktop uses a different .exe file:
   - Open Task Manager (Ctrl+Shift+Esc)
   - Find Claude Desktop in Processes tab
   - Note the exact .exe name
3. Update the text control ClassNN:
   - Download and run AutoHotkey's Window Spy
   - Open Claude Desktop and click on the text input field
   - Note the ClassNN value (usually Edit1 or similar)

## Step 5: Test the Automation

1. Right-click `scripts/claude_automation.ahk` and select "Run Script"
2. Open Claude Desktop
3. Press Ctrl+Alt+V (or your configured hotkey)
4. Speak a test message
5. Verify text appears in the input field

## Step 6: Customize Hotkeys (Optional)

Edit `config/hotkeys.ini` to change hotkey combinations:
- Use ^ for Ctrl, ! for Alt, + for Shift
- Examples: ^!v (Ctrl+Alt+V), ^+c (Ctrl+Shift+C)

## Troubleshooting

- If text field doesn't focus: Update the ClassNN in the script
- If WhisperWriter doesn't activate: Check hotkey settings match
- If script doesn't run: Ensure AutoHotkey is installed and script has .ahk extension

## Advanced Configuration

- For multiple applications: Copy the script and modify window detection
- For different voice engines: Replace WhisperWriter with alternatives like Windows Voice Typing
- For cloud processing: Set use_local_model to false in settings.json and add API key