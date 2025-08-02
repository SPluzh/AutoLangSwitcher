# AutoLangSwitcher for DCC

**AutoLangSwitcher** automatically switches the **keyboard layout to English** when specific applications are active — especially useful for digital content creation (DCC) tools like **Blender, Maya, Cinema 4D, Houdini, RizomUV, Nuke**, and more.

https://github.com/user-attachments/assets/39a57cb5-3f00-4a65-8fc2-1a7ff43dc6ed

---

## ✅ Features

- Automatically switches to **English (US)** layout for selected DCC apps  
- Shows tray icon:  
  - ⌨️ **Keyboard icon** — switching inactive  
  - ✅ **OK icon** — switching active and layout is set
  - ⏸️ **Paused** — switching temporarily disabled
- Tray menu:
  - ⏸ Pause Switching
  - 🔄 Reload Settings
  - 🛠 Edit Settings
  - ❌ Exit
- Customizable via `settings.ini`  
- Reload config without restart  
- Runs in background, lightweight, unobtrusive

---

## 📦 Installation

1. Download or clone the repository  
2. Make sure file structure is as follows:

   ```
   AutoLangSwitcher.exe
   add_to_startup.bat
   \data\
       keyboard.ico
       ok.ico
       settings.ini
   ```

3. Launch `AutoLangSwitcher.exe`  
4. *(Optional)* Run `add_to_startup.bat` to enable autostart with Windows

---

## ⚙️ Configuration (`data/settings.ini`)

https://github.com/user-attachments/assets/6dbe7aec-2469-4441-9733-73f0ad224680

```ini
[Settings]
apps=maya.exe, blender.exe, cinema4d.exe, rizomuv.exe
layout=0x4090409
interval_ms=500
```

- **`apps`** – Comma-separated list of `.exe` names for target applications  
- **`layout`** – HKL (Hex Keyboard Layout) code to switch to  
- **`interval_ms`** – Interval in milliseconds between checks

---

## 🧩 English Layout HKL Codes

| Layout                 | Locale | HKL        |
|------------------------|--------|------------|
| English (US)           | 🇺🇸     | `0x4090409` |
| English (UK)           | 🇬🇧     | `0x8090809` |
| English (Australia)    | 🇦🇺     | `0x0c09c09` |
| English (Canada)       | 🇨🇦     | `0x10091009` |
| English (New Zealand)  | 🇳🇿     | `0x14091409` |
| English (Ireland)      | 🇮🇪     | `0x18091809` |

To use a different English layout, change the `layout` value in `settings.ini`.

---

## 🖥️ Tray Menu

- **Toggle Switching** – enable/disable automatic switching  
- **Reload Settings** – re-read `settings.ini` without restart  
- **Edit Settings** – open `settings.ini` in your default editor  
- **Exit** – quit the app (separated with a line)

---

## Working from Source (AutoHotkey v2)

If you'd like to use or modify the source script (`AutoLangSwitcher.ahk`), follow these steps:

1. Install [AutoHotkey v2](https://www.autohotkey.com/download).
2. Clone or download this repo.
3. Make sure the `data/` folder is next to the script:
   ```
   AutoLangSwitcher.ahk
   └── data/
       ├── keyboard.ico
       ├── ok.ico
       └── settings.ini
   ```
4. Run `AutoLangSwitcher.ahk` by double-clicking it or using a code editor.

---

## 📜 License

MIT License

---

## 🙏 Credits

- Made with [AutoHotkey v2](https://www.autohotkey.com/)  
- Icons: open source and custom designs
