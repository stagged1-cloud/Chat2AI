# Troubleshooting Guide

## Common Issues and Solutions

### AutoHotkey Script Won't Run
**Problem:** Double-clicking .ahk file does nothing
**Solution:**
- Ensure AutoHotkey is installed
- Right-click the file and select "Run Script"
- Check if script has syntax errors (green H icon in tray indicates running)

### Text Field Not Focusing
**Problem:** Hotkey runs but text doesn't appear in Claude
**Solution:**
- Use AutoHotkey's Window Spy to find correct ClassNN
- Open Claude Desktop
- Run Window Spy (installed with AutoHotkey)
- Click on the text input field
- Update the ControlFocus line with correct ClassNN (e.g., Edit2, RichEdit1)

### WhisperWriter Not Activating
**Problem:** Ctrl+Shift+Space does nothing
**Solution:**
- Ensure WhisperWriter is running (check system tray)
- Verify hotkey settings in WhisperWriter match config/hotkeys.ini
- Test WhisperWriter independently in Notepad first

### Voice Recognition Poor Quality
**Problem:** Transcribed text has many errors
**Solutions:**
- Use a better microphone (USB recommended over laptop mic)
- Choose larger Whisper model in settings.json
- Reduce background noise
- Speak clearly and at normal pace
- Use cloud API instead of local model (requires API key)

### Script Detects Wrong Window
**Problem:** Automation triggers in other applications
**Solution:**
- Update ahk_exe in script to exact executable name
- Add more specific window title matching
- Use ahk_class instead of ahk_exe for better detection

### Claude Desktop Won't Launch
**Problem:** Ctrl+Alt+A doesn't open Claude
**Solution:**
- Update the Run path in script to correct Claude installation location
- Check if Claude is already running (script activates existing window)

### Python/WhisperWriter Installation Fails
**Problem:** pip install fails
**Solutions:**
- Run Command Prompt as Administrator
- Update pip: `python -m pip install --upgrade pip`
- Install dependencies individually
- Check Python version (3.8+ required)

### Hotkeys Conflict
**Problem:** Hotkeys don't work or trigger wrong actions
**Solution:**
- Check if other applications use same hotkeys
- Change hotkeys in config/hotkeys.ini
- Update AutoHotkey script accordingly
- Test hotkeys one at a time

### Performance Issues
**Problem:** System lag or slow response
**Solutions:**
- Use smaller Whisper model
- Increase Sleep delays in script
- Close unnecessary applications
- Use SSD for better performance

### Windows Security Blocks Script
**Problem:** Windows Defender flags AutoHotkey script
**Solution:**
- Add exception for AutoHotkey in Windows Security
- Run script as Administrator
- Temporarily disable real-time protection during setup

## Getting Help

1. Check AutoHotkey documentation: https://www.autohotkey.com/docs/
2. WhisperWriter GitHub issues: https://github.com/your-repo/whisperwriter/issues
3. Community forums: r/AutoHotkey, r/Python
4. Test components individually before combining

## Debug Mode

Add this to top of AutoHotkey script for debugging:
```
#Warn  ; Enable warnings
FileAppend, %A_Now% Script started`n, debug.log
```

Check debug.log for execution flow and errors.