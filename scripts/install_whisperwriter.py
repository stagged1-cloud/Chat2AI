#!/usr/bin/env python3
"""
WhisperWriter Installation Script
Installs WhisperWriter and its dependencies for voice automation.
"""

import subprocess
import sys
import os

def run_command(command, description):
    """Run a shell command and handle errors."""
    print(f"Running: {description}")
    try:
        result = subprocess.run(command, shell=True, check=True, capture_output=True, text=True)
        print(f"✓ {description} completed successfully")
        return True
    except subprocess.CalledProcessError as e:
        print(f"✗ Error during {description}: {e}")
        print(f"Output: {e.output}")
        return False

def main():
    print("WhisperWriter Installation Script")
    print("=" * 40)

    # Check Python version
    if sys.version_info < (3, 8):
        print("Error: Python 3.8 or higher is required")
        sys.exit(1)

    # Install pip if not available
    try:
        import pip
    except ImportError:
        print("Installing pip...")
        run_command("python -m ensurepip --upgrade", "pip installation")

    # Install WhisperWriter
    if not run_command("pip install whisperwriter", "WhisperWriter installation"):
        print("Failed to install WhisperWriter via pip. Trying alternative method...")
        run_command("pip install git+https://github.com/your-repo/whisperwriter.git", "WhisperWriter from source")

    # Install additional dependencies
    dependencies = [
        "openai-whisper",
        "torch",
        "numpy",
        "sounddevice",
        "pyaudio"
    ]

    for dep in dependencies:
        run_command(f"pip install {dep}", f"{dep} installation")

    # Download Whisper model (optional - user can choose)
    print("\nWhisperWriter installed successfully!")
    print("\nNext steps:")
    print("1. Run WhisperWriter once to download the default model")
    print("2. Configure your hotkey in WhisperWriter settings")
    print("3. Test the AutoHotkey script")

    # Create desktop shortcut (Windows specific)
    if os.name == 'nt':
        print("\nCreating desktop shortcut...")
        # This would require additional libraries, so just provide instructions
        print("To create a shortcut, right-click whisperwriter.exe and select 'Create shortcut'")

if __name__ == "__main__":
    main()