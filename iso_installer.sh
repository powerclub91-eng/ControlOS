#!/bin/bash
clear
echo -e "\033[36mControlOS ISO Installer\033[0m"
read -p "Enter full path to ControlOS ISO folder: " ISO_PATH

if [ -d "$ISO_PATH" ]; then
  echo "Installing from $ISO_PATH..."
  cp -r "$ISO_PATH/"* "$HOME/ControlOS_Settings/"
  echo -e "\033[32mInstallation complete!\033[0m"
else
  echo -e "\033[31mInvalid path or ISO not found.\033[0m"
fi
sleep 2
