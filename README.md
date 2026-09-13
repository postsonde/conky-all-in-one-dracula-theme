# All-in-One Conky Dracula Theme 🧛‍♂️

An extremely elegant, modern, and automated dual-widget setup for **MX Linux KDE**, themed with the world-famous **Dracula color palette**.

This project manages two windows simultaneously: a compact to-do list on the left side of your screen and a comprehensive, slim system monitor on the right side.

---

## 📊 Features at a Glance

### ⬅️ Left Side: My Tasks (To-Do List)
- **Hidden Management:** Your tasks are saved in a hidden file (`~/Dokumente/.conkytodo.txt`) to keep your folders clean.
- **KDE Menu Launcher:** A custom application shortcut is added to your system menu, allowing you to open and edit your tasks in **Kate** with a single click.
- **Custom Spacing:** Your manually added blank lines and task layout are reflected exactly on your desktop.

### ➡️ Right Side: Slim System Monitor (310px)
- **Smooth Dual-Column Layout:** The Top 10 CPU and RAM processes are displayed side-by-side (5 left, 5 right) to save vertical space. Process names are automatically trimmed to 7 characters to avoid overlapping.
- **Dynamic Device Detection:** Attached USB drives as well as your **Acer mouse & keyboard** automatically appear with their specific names and battery percentages, disappearing completely when disconnected.
- **Enhanced Memory Tracking:** Displays real-time RAM usage along with the live size of your current KDE clipboard (Klipper) in bytes.
- **Overheating Protection:** The CPU temperature text color dynamically switches to flashing Dracula Red if it exceeds 65°C.
- **Smart Network Speed:** Automatically detects your active internet interface and dynamically scales speed metrics up to **MiB/s** under load.

---

## 🚀 One-Click Installation

This script dynamically adapts to any username on your Linux system.

1. Download the `conky-all-in-one-dracula-theme.sh` file from this repository.
2. Open your terminal in the script's folder and make it executable:
   ```bash
   chmod +x conky-all-in-one-dracula-theme.sh
   ```
3. Run the installation:
   ```bash
   ./conky-all-in-one-dracula-theme.sh
   ```

*The script handles everything for you: it clears old session caches, builds both configurations, and registers them into the **KDE Autostart** system so they load automatically every time your computer boots.*

