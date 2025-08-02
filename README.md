# AutoLangSwitcher for DCC

**AutoLangSwitcher** automatically switches the **keyboard layout to English** when specific applications are active — especially useful for digital content creation (DCC) tools like **Blender, Maya, Cinema 4D, Houdini, RizomUV, Nuke**, and more.

---

## ✅ Features

- Automatically switches to **English (US)** layout for selected DCC apps  
- Shows tray icon:  
  - 🖱️ *Keyboard icon* — switching inactive  
  - ✅ *OK icon* — English layout active  
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

```ini
[Settings]
apps=blender.exe,c4d.exe,maya.exe,houdini.exe,RizomUV.exe,nuke.exe
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
- **Exit** – quit the app (separated with a line)

---

## 📜 License

MIT License

---

## 🙏 Credits

- Made with [AutoHotkey v2](https://www.autohotkey.com/)  
- Icons: open source and custom designs
