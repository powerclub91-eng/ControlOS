# 🧠 ControlOS v1.0 – The Terminal Operating System

Welcome to **ControlOS**, a fully simulated command-line operating system written entirely in Bash.  
It combines the structure and feel of a real OS with the flexibility of the shell, allowing users to experience  
booting, BIOS access, system recovery, error logging, and even an integrated app store — all from your terminal.

ControlOS isn’t just a script. It’s a *world inside your console* — where every command, every beep, and every  
warning line is designed to make you feel like you’re running your own micro-operating system.

---

## ⚙️ Core Features

### 🧩 Boot System
ControlOS simulates a full boot sequence — from POST-style checks to system loading animations.  
Users can hold **B** during startup to enter the built-in **BIOS shell**, where hardware and boot parameters can be adjusted.

### 🛠️ BIOS Interface
The BIOS menu includes:
- System information display (hardware, version, uptime)
- User configuration editing
- ISO installer and recovery options
- Access to the internal Nano-based file editor
- Power and restart controls

### 💾 Recovery Mode
If ControlOS detects missing or corrupted files, it automatically switches to **Recovery Mode**.  
From there, users can reinstall components, restore backups, or mount ISO images to rebuild the OS.

### 📂 Real-Time Error Detection
The system constantly monitors all essential scripts.  
If any core file (like `boot.sh`, `os.sh`, `notes.sh`) is missing or unreadable,  
ControlOS generates an error log and shows a warning screen (⚠️ SYSTEM ERROR).  
All logs are saved to `/Users/<username>/ControlOS_Settings/logs/`.

### 🧑‍💻 User Accounts & Permissions
ControlOS supports user setup through a simple configuration file.  
The first launch prompts you to create a username and secure password, which is required  
for all administrative actions (like system restore or editing protected files).

### 🏪 iStore
An integrated **iStore** lets you install mini-apps made for ControlOS, such as:
- 📝 Notes – create and save terminal notes  
- 🧮 Calc – simple command-line calculator  
- 🗂️ File Manager – manage files and folders through text interface  
- 🧠 System Monitor – check uptime, RAM usage (simulated), and CPU activity  
---

## ⚠️ Troubleshooting & Privileges

If you see this message The "boot.command" file could not be executed because you do not have the appropriate access privileges... while running ControlOS:
That means your system scripts are not yet executable.

To fix this, open the Terminal and run:

```sudo chmod -R 755 /Users/$USER/ControlOS_Settings
