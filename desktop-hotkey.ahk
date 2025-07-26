#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode("Input")

; Global variables
currentDesktop := 1
maxDesktops := 1
lastDesktop := 1

; System tray
A_TrayMenu.Delete()
A_TrayMenu.Add("Desktop Hotkey Manager", (*) => {})
A_TrayMenu.Add()
A_TrayMenu.Add("Alt+1-5: Switch desktops", (*) => {})
A_TrayMenu.Add("Alt+0: Remove all but desktop 1", (*) => {})
A_TrayMenu.Add("Alt+`: Last desktop", (*) => {})
A_TrayMenu.Add()
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_IconTip := "Desktop Hotkey Manager"

; Hotkeys
!1::SwitchToDesktop(1)
!2::SwitchToDesktop(2)
!3::SwitchToDesktop(3)
!4::SwitchToDesktop(4)
!5::SwitchToDesktop(5)
!0::RemoveAllDesktops()
!`::SwitchToLastDesktop()


; Switch to specific desktop (1-5 only)
SwitchToDesktop(target) {
    global currentDesktop, maxDesktops, lastDesktop
    
    if (target == currentDesktop || target > 5) {
        return
    }
    
    lastDesktop := currentDesktop
    
    ; Create desktops if needed (up to 5)
    if (target > maxDesktops) {
        ; Go to rightmost desktop
        while (currentDesktop < maxDesktops) {
            Send("{LWin down}{Ctrl down}{Right}{Ctrl up}{LWin up}")
            currentDesktop++
            Sleep(50)
        }
        
        ; Create new desktops up to target
        Loop (target - maxDesktops) {
            Send("{LWin down}{Ctrl down}d{Ctrl up}{LWin up}")
            maxDesktops++
            currentDesktop := maxDesktops
            Sleep(100)
        }
        return
    }
    
    ; Navigate to target
    steps := target - currentDesktop
    direction := steps > 0 ? "{Right}" : "{Left}"
    steps := Abs(steps)
    
    Loop steps {
        Send("{LWin down}{Ctrl down}" . direction . "{Ctrl up}{LWin up}")
        Sleep(50)
    }
    
    currentDesktop := target
}

; Remove all desktops except desktop 1
RemoveAllDesktops() {
    global currentDesktop, maxDesktops, lastDesktop
    
    ; Go to desktop 1 first
    while (currentDesktop > 1) {
        Send("{LWin down}{Ctrl down}{Left}{Ctrl up}{LWin up}")
        currentDesktop--
        Sleep(50)
    }
    
    ; Remove all other desktops (Win+Ctrl+F4 closes current desktop)
    while (maxDesktops > 1) {
        ; Move to desktop 2 (if it exists)
        Send("{LWin down}{Ctrl down}{Right}{Ctrl up}{LWin up}")
        Sleep(50)
        
        ; Close this desktop (moves us back to desktop 1)
        Send("{LWin down}{Ctrl down}{F4}{Ctrl up}{LWin up}")
        maxDesktops--
        Sleep(100)
    }
    
    ; Reset tracking
    currentDesktop := 1
    maxDesktops := 1
    lastDesktop := 1
}

; Switch to last desktop
SwitchToLastDesktop() {
    global currentDesktop, lastDesktop
    
    if (lastDesktop == currentDesktop) {
        return
    }
    
    temp := currentDesktop
    SwitchToDesktop(lastDesktop)
    lastDesktop := temp
}


