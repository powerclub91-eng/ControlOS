#!/bin/bash
# =========================
# ⚙️ ControlOS BIOS Panel
# =========================

SYS_DIR="$HOME/ControlOS_Settings"
source "$SYS_DIR/logger.sh"
source "$SYS_DIR/status.sh"

clear
echo "=========== BIOS ==========="
echo "1. View system info"
echo "2. Edit config files"
echo "3. Restore defaults"
echo "4. Return to OS"
echo "============================"
read -p "Select: " opt

case $opt in
  1)
    echo "CPU: Virtual Terminal CPU"
    echo "RAM: 2GB"
    echo "Kernel: ControlOS 1.5"
    log_event "INFO" "System info viewed"
    ;;
  2)
    read -p "Enter filename to edit: " fname
    nano "$SYS_DIR/$fname"
    log_event "INFO" "Edited file $fname"
    ;;
  3)
    bash "$SYS_DIR/recovery.sh" reset
    ;;
  4)
    exec "$SYS_DIR/os.sh"
    ;;
esac
