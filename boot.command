#!/bin/bash
# ==============================================
# 🚀 ControlOS Bootloader v1.2
# ==============================================

SYS_DIR="$HOME/ControlOS_Settings"
source "$SYS_DIR/logger.sh"
source "$SYS_DIR/status.sh"

clear
echo "=============================="
echo "     ControlOS Booting...     "
echo "=============================="
sleep 1

# 🔍 Перевіряємо, чи існує user.conf
if [ ! -f "$SYS_DIR/user.conf" ]; then
  show_status warn "No user configuration found."
  log_event "WARN" "User configuration missing — launching setup."
  bash "$SYS_DIR/setup.sh"
  exit 0
fi

# 🧠 Якщо все ок, продовжуємо
log_event "INFO" "System boot started successfully."
bash "$SYS_DIR/boot.check" 2>/dev/null
bash "$SYS_DIR/os.sh"
