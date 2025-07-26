# Desktop Hotkey Manager (AutoHotkey Version)

A simple and reliable Windows 11 virtual desktop switcher using AutoHotkey.

## Features

- **Global Hotkeys**: Alt+1 through Alt+0 to switch between virtual desktops
- **Auto-Create Desktops**: Automatically creates new virtual desktops when needed
- **System Tray Integration**: Runs quietly in the background
- **Reliable**: Uses AutoHotkey's proven Windows automation
- **Fast**: Instant desktop switching with no delays
- **Lightweight**: Minimal resource usage

## Hotkey Mapping

- **Alt+1**: Switch to Desktop 1
- **Alt+2**: Switch to Desktop 2
- **Alt+3**: Switch to Desktop 3
- **Alt+4**: Switch to Desktop 4
- **Alt+5**: Switch to Desktop 5
- **Alt+6**: Switch to Desktop 6
- **Alt+7**: Switch to Desktop 7
- **Alt+8**: Switch to Desktop 8
- **Alt+9**: Switch to Desktop 9
- **Alt+0**: Switch to Desktop 10
- **Alt+`** (backtick): Switch to last active desktop

## Installation & Usage

### Method 1: Run the Script (Requires AutoHotkey)

1. **Install AutoHotkey**: Download from <https://www.autohotkey.com/>
2. **Run the script**: Double-click `desktop-hotkey.ahk`
3. **Use hotkeys**: Press Alt+Number to switch desktops

### Method 2: Standalone Executable

1. **Compile to .exe**: Use AutoHotkey to compile `desktop-hotkey.ahk` to `desktop-hotkey.exe`
2. **Run executable**: Double-click the .exe file
3. **Use hotkeys**: Press Alt+Number to switch desktops

## System Tray

- **Icon**: Shows in system tray when running
- **Right-click menu**: Shows hotkey information and exit option
- **Tooltip**: Hover to see current status

## Requirements

- **Windows 11** (for virtual desktop support)
- **AutoHotkey v2.0+** (if running the .ahk script directly)
- **Virtual desktops enabled** in Windows 11

## How It Works

The script uses Windows' built-in virtual desktop shortcuts:

- **Win+Ctrl+Right**: Move to next desktop
- **Win+Ctrl+Left**: Move to previous desktop
- **Win+Ctrl+D**: Create new virtual desktop

When you press Alt+Number, the script:

1. **Checks if the desktop exists** - If the target desktop number is higher than existing ones
2. **Creates new desktops if needed** - Uses Win+Ctrl+D to create missing desktops
3. **Switches to the target** - Calculates the shortest path and sends Win+Ctrl+Arrow keys

### Smart Desktop Creation

- **Alt+1 to Alt+3**: If you only have 1 desktop, pressing Alt+3 will create desktops 2 and 3, then switch to desktop 3
- **Alt+5**: If you have 2 desktops, this creates desktops 3, 4, and 5, then switches to desktop 5
- **Existing desktops**: Pressing Alt+1 when you have 5 desktops just switches normally

### Last Desktop Switching

- **Alt+`**: Quickly toggle between your current desktop and the previously active one
- **Example**: Desktop 1 → Alt+3 (go to 3) → Alt+\` (back to 1) → Alt+\` (back to 3)
- **Perfect for**: Switching between two workspaces you're actively using

## Compiling to Executable

To create a standalone .exe file:

1. **Install AutoHotkey** if you haven't already
2. **Right-click** `desktop-hotkey.ahk`
3. **Select "Compile Script"** from the context menu
4. **Share the .exe** - it will run on any Windows 11 machine without requiring AutoHotkey

## Troubleshooting

- **Hotkeys not working**: Make sure no other application is using Alt+1-0
- **Desktop not switching**: Ensure you have multiple virtual desktops created in Windows 11
- **Script not starting**: Run as Administrator if needed

## Exit

To exit the application:

- **Right-click** the system tray icon and select "Exit"
- **Or** press Ctrl+Alt+Esc (if you add this hotkey to the script)
