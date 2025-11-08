#!/bin/bash
# =======================================================
# 🧠 ControlOS Process & File Integrity Monitor v1.0
# =======================================================

source "$HOME/ControlOS_Settings/status.sh"

# === Шлях до системної директорії ===
SYS_DIR="$HOME/ControlOS_Settings"

# === Ключові системні файли, які треба перевіряти ===
CORE_FILES=(
  "boot.command"
  "os.sh"
  "recovery.sh"
  "bios.sh"
  "status.sh"
  "user.conf"
)

# === Функція перевірки файлів ===
check_files() {
  for file in "${CORE_FILES[@]}"; do
    if [ ! -f "$SYS_DIR/$file" ]; then
      show_status fatal "Critical file missing: $file"
    fi
  done
}

# === Перевірка стану процесів ===
check_processes() {
  local running_processes=$(ps -A -o comm | grep -E "bash|sh" | wc -l)
  if [ "$running_processes" -lt 2 ]; then
    show_status err "No active ControlOS processes detected."
  fi
}

# === Перевірка навантаження системи ===
check_load() {
  local cpu_load=$(ps -A -o %cpu | awk '{s+=$1} END {print s}')
  if (( $(echo "$cpu_load > 80" | bc -l) )); then
    show_status warn "High CPU load detected ($cpu_load%)."
  fi
}

# === Основний цикл моніторингу ===
run_monitor() {
  while true; do
    check_files
    check_processes
    check_load
    sleep 1
  done
}
