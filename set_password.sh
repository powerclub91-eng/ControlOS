#!/bin/bash
CONFIG_FILE="$HOME/ControlOS_Settings/config.txt"

clear
echo -e "\033[1;36mControlOS Password Configuration\033[0m"
echo "-----------------------------------"

read -p "Enter username: " USERNAME
read -s -p "Enter new password: " PASSWORD
echo ""
read -s -p "Confirm password: " CONFIRM
echo ""

if [ "$PASSWORD" != "$CONFIRM" ]; then
  echo -e "\033[31mPasswords do not match.\033[0m"
  exit 1
fi

HASH=$(echo -n "$PASSWORD" | shasum -a 256 | awk '{print $1}')

echo "USERNAME=$USERNAME" > "$CONFIG_FILE"
echo "PASSWORD_HASH=$HASH" >> "$CONFIG_FILE"

echo -e "\033[32mPassword updated!\033[0m"
sleep 1
