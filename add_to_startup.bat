@echo off
setlocal

:: Get the directory of this .bat file
set "script_dir=%~dp0"

:: Set the full path to the executable
set "target=%script_dir%AutoLangSwitcher.exe"

:: Get the Startup folder path for the current user
set "startup=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Set the full path to the shortcut that will be created
set "shortcut=%startup%\AutoLangSwitcher.lnk"

:: Create the shortcut using PowerShell
powershell -nologo -command ^
 "$s = (New-Object -COM WScript.Shell).CreateShortcut('%shortcut%');" ^
 "$s.TargetPath = '%target%';" ^
 "$s.WorkingDirectory = '%script_dir%';" ^
 "$s.Save()"

echo Shortcut created in startup folder: %shortcut%
pause
