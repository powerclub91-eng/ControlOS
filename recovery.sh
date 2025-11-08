#!/bin/bash
# =========================
# 🔁 ControlOS Recovery
# =========================
SYS_DIR="$HOME/ControlOS_Settings"
source "$SYS_DIR/logger.sh"
source "$SYS_DIR/status.sh"

clear
if [ "$1" == "reset" ]; then
  show_status warn "Resetting to defaults..."
  rm -f "$SYS_DIR/user.conf"
  log_event "WARN" "System reset to defaults"
  sleep 1
  exec "$SYS_DIR/boot.command"
fi

echo "ControlOS First-Time Setup"
echo "==========================="
read -p "Create username: " user
read -p "Create password: " pass

echo "username=$user" > "$SYS_DIR/user.conf"
echo "password=$pass" >> "$SYS_DIR/user.conf"
log_event "INFO" "New user $user created"
show_status ok "Setup complete!"
exec "$SYS_DIR/boot.command"
