#!/bin/bash
SYS_DIR="$HOME/ControlOS_Settings"
source "$SYS_DIR/logger.sh"
source "$SYS_DIR/status.sh"

while true; do
  for f in "$SYS_DIR"/*.sh; do
    if [ ! -s "$f" ]; then
      show_status err "Corrupted file: $(basename $f)"
      log_event "ERROR" "Corrupted: $(basename $f)"
    fi
  done
  sleep 1
done
