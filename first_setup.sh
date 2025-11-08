#!/bin/bash
clear
echo "🎉 Welcome to ControlOS Setup! (Вітаємо у налаштуванні ControlOS)"
echo "────────────────────────────────────────────"
echo ""

SETTINGS_DIR="$HOME/ControlOS_Settings"
CONF_FILE="$SETTINGS_DIR/user.conf"

mkdir -p "$SETTINGS_DIR"

# Ask for user info (Запитуємо дані користувача)
read -p "Username (Ім’я користувача): " username
read -p "Display name (Ім’я, що буде відображатись): " display_name

# Create password (Створення пароля)
while true; do
  read -s -p "Create password (Створіть пароль): " pass1
  echo
  read -s -p "Confirm password (Підтвердіть пароль): " pass2
  echo
  if [ "$pass1" != "$pass2" ]; then
    echo "⚠️ Passwords do not match! (Паролі не співпадають!)"
  elif [ -z "$pass1" ]; then
    echo "⚠️ Password cannot be empty! (Пароль не може бути порожнім!)"
  else
    break
  fi
done

# Save configuration (Збереження налаштувань)
password_hash=$(printf "%s" "$pass1" | shasum -a 256 | awk '{print $1}')
created_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat > "$CONF_FILE" <<EOF
{
  "username": "$username",
  "display_name": "$display_name",
  "password_hash": "$password_hash",
  "created_at": "$created_at",
  "prefs": {
    "theme": "dark",
    "desktop_wallpaper": "default"
  }
}
EOF

chmod 600 "$CONF_FILE"

echo ""
echo "✅ Setup complete! (Налаштування завершено!)"
sleep 1
bash "$SETTINGS_DIR/os.sh"
