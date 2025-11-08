#!/bin/bash
CONFIG_FILE="$HOME/ControlOS_Settings/config.txt"

# Зчитуємо логін і пароль
if [ -f "$CONFIG_FILE" ]; then
  source "$CONFIG_FILE"
else
  echo -e "\033[31mConfig file not found! Run set_password.sh first.\033[0m"
  exit 1
fi

clear
echo -e "\033[1;36mWelcome to ControlOS\033[0m"
read -s -p "Enter password for $USERNAME: " input
echo ""

input_hash=$(echo -n "$input" | shasum -a 256 | awk '{print $1}')

if [ "$input_hash" == "$PASSWORD_HASH" ]; then
  echo -e "\033[32mAccess granted.\033[0m"
  sleep 1
  bash ~/ControlOS_Settings/os.sh
else
  echo -e "\033[31mAccess denied.\033[0m"
  sleep 2
fi
