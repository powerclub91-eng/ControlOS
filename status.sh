#!/bin/bash
show_status() {
  level=$1
  message=$2
  case $level in
    ok) echo -e "\033[1;32m✅ OK:\033[0m $message" ;;
    warn) echo -e "\033[1;33m⚠️ WARNING:\033[0m $message" ;;
    err) echo -e "\033[1;31m❌ ERROR:\033[0m $message" ;;
    fatal)
      clear
      echo -e "\033[1;41m💀 SYSTEM FAILURE 💀\033[0m"
      echo "$message"
      bash "$SYS_DIR/recovery.sh"
      ;;
  esac
}
