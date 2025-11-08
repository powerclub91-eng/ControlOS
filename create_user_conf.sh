#!/usr/bin/env bash
set -e

TARGET_DIR="$HOME/ControlOS_Settings"
CONF_FILE="$TARGET_DIR/user.conf"

mkdir -p "$TARGET_DIR"

# Якщо вже існує — пропонуємо перезаписати
if [ -f "$CONF_FILE" ]; then
  read -p "user.conf вже існує. Перезаписати? (y/N): " ans
  [[ "$ans" =~ ^[Yy]$ ]] || { echo "Відмінено."; exit 0; }
fi

echo "Створення нового користувача для ControlOS"
read -p "Username: " username
read -p "Display name: " display_name
read -p "Email (опціонально): " email

# пароль (без виведення)
while true; do
  read -s -p "Пароль: " pass1
  echo
  read -s -p "Підтвердіть пароль: " pass2
  echo
  if [ "$pass1" != "$pass2" ]; then
    echo "Паролі не співпадають — спробуй ще."
  elif [ -z "$pass1" ]; then
    echo "Пароль не може бути пустим."
  else
    break
  fi
done

# Хешуємо пароль SHA256 (без newline)
password_hash=$(printf "%s" "$pass1" | shasum -a 256 | awk '{print $1}')

created_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

cat > "$CONF_FILE" <<EOF
{
  "username": "$username",
  "display_name": "$display_name",
  "password_hash": "$password_hash",
  "email": "$email",
  "created_at": "$created_at",
  "prefs": {
    "theme": "dark",
    "desktop_wallpaper": "default"
  }
}
EOF

# Права доступу — тільки власник
chmod 600 "$CONF_FILE"
chown "$USER" "$CONF_FILE"

echo "user.conf створено: $CONF_FILE (права 600)"
