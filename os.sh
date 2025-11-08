#!/bin/bash

SYSTEM_PATH="/Users/arsenii/ControlOS_Settings"
clear

# --- Boot screen ---
echo ""
echo "=============================="
echo "      Loading ControlOS...    "
echo "=============================="
sleep 1
for i in {1..20}; do
  echo -n "#"
  sleep 0.1
done
echo ""
sleep 1
clear

# --- System file check ---
REQUIRED_FILES=("boot.check" "notes.sh" "restore.sh" "snake.sh" "istore.sh")
for file in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$SYSTEM_PATH/$file" ]; then
    clear
    echo "⚠️  SYSTEM ERROR"
    echo "Missing system file: $file"
    echo "Your system may be corrupted."
    echo "Press Enter to reboot..."
    read
    exec "$SYSTEM_PATH/boot.command"
  fi
done

# --- Main menu ---
while true; do
  clear
  echo "╔══════════════════════════════════════╗"
  echo "║            CONTROL OS  v1.0          ║"
  echo "╠══════════════════════════════════════╣"
  echo "║  [1] 📝 Notes                        ║"
  echo "║  [2] 🧠 Log Viewer                   ║"
  echo "║  [3] 🐍 Snake+                       ║"
  echo "║  [4] 🔧 Restore System               ║"
  echo "║  [5] 🛒 iStore (App Center)          ║"
  echo "║  [6] 💻 Exit                         ║"
  echo "╚══════════════════════════════════════╝"
  echo ""
  read -p "Select option [1-6]: " choice

  case $choice in
    1) clear; bash "$SYSTEM_PATH/notes.sh" ;;
    2) clear; cat "$SYSTEM_PATH/system.log"; echo ""; read -p "Press Enter to return..." ;;
    3) clear; bash "$SYSTEM_PATH/snake.sh" ;;
    4) clear; bash "$SYSTEM_PATH/restore.sh" ;;
    5) clear; bash "$SYSTEM_PATH/istore.sh" ;;
    6) clear; echo "Shutting down ControlOS..."; sleep 1; clear; exit 0 ;;
    *) echo "Invalid option"; sleep 1 ;;
  esac
done
