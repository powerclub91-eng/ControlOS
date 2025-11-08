#!/bin/bash
LOG_FILE="$HOME/ControlOS_Settings/system_log.txt"

log_event() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$1] $2" >> "$LOG_FILE"
}

if [ "$1" == "show_last_logs" ]; then
  tail -n 5 "$LOG_FILE" 2>/dev/null || echo "No logs yet."
fi
