#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

; Initialize tray menu
TrayMenu := A_TrayMenu
TrayMenu.Delete()
TrayMenu.Add("Pause Switching", (*) => Pause(-1))
TrayMenu.Add("Reload Settings", (*) => LoadSettings())  ; Reload config
TrayMenu.Add()  ; ← Separator
TrayMenu.Add("Exit", (*) => ExitApp())

; Paths to resources
dataDir       := A_ScriptDir "\data"
iniFile       := dataDir "\settings.ini"
iconKeyboard  := dataDir "\keyboard.ico"
iconOK        := dataDir "\ok.ico"

; Load configuration initially
LoadSettings()

TraySetIcon(iconKeyboard)
SetTimer(CheckTargetApps, timerInterval)

LoadSettings() {
    global appList, layoutHKL, timerInterval, iniFile

    appListRaw    := IniRead(iniFile, "Settings", "apps", "notepad.exe")
    layoutHKL     := IniRead(iniFile, "Settings", "layout", "04090409") ; en-US
    timerInterval := IniRead(iniFile, "Settings", "interval_ms", "500")
    appList       := StrSplit(appListRaw, ",", " `t")
}

CheckTargetApps() {
    global appList, layoutHKL, iconOK, iconKeyboard

    hwnd := WinExist("A")
    if !hwnd {
        TraySetIcon(iconKeyboard)
        return
    }

    try {
        pid      := WinGetPID("ahk_id " hwnd)
        procName := Trim(ProcessGetName(pid))

        for app in appList {
            if (procName = Trim(app)) {
                threadID    := DllCall("GetWindowThreadProcessId", "Ptr", hwnd, "UInt*", 0)
                currentHKL  := DllCall("GetKeyboardLayout", "UInt", threadID, "UPtr")
                desiredHKL  := DllCall("LoadKeyboardLayout", "Str", layoutHKL, "UInt", 1, "UPtr")

                if (currentHKL != desiredHKL) {
                    DllCall("PostMessage", "Ptr", hwnd, "UInt", 0x50, "Ptr", 0, "Ptr", desiredHKL)
                    TraySetIcon(iconKeyboard)
                } else {
                    TraySetIcon(iconOK)
                }

                return
            }
        }

        TraySetIcon(iconKeyboard)
    } catch as err {
        TrayTip("AutoLangSwitcher Error", err.Message, 5)
        TraySetIcon(iconKeyboard)
    }
}
