#!/bin/bash
clear
echo "⚠️  Restore System"
read -p "Are you sure you want to reset ControlOS? (y/n): " ans
if [ "$ans" = "y" ]; then
  rm -f /Users/arsenii/ControlOS_Settings/user.conf
  echo "System reset complete. Rebooting..."
  sleep 2
  exec /Users/arsenii/ControlOS_Settings/boot.command
else
  echo "Cancelled."
  sleep 1
fi
