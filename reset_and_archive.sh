#!/bin/bash
clear
echo "🧩 ControlOS — Повне скидання системи"
sleep 0.6

BASE="$HOME/ControlOS_Settings"
BACKUP_DIR="$HOME/ControlOS_History"
DATE_TAG=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="ControlOS_HISTORY_$DATE_TAG.iso"

echo ""
read -p "⚠️  Увага! Усі дані системи будуть стерті. Продовжити? (y/N): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "❌ Відмінено користувачем."
  exit 0
fi

echo ""
echo "🗑️  Видаляємо старі файли..."
rm -rf "$BASE/user" "$BASE/cache" "$BASE/logs" "$BASE/tmp" "$BASE/backup"
sleep 0.5

echo "🪄 Відновлюємо системні файли..."
mkdir -p "$BASE/user" "$BASE/logs" "$BASE/system" "$BASE/tmp"

echo "default_user" > "$BASE/user/config.txt"
echo "System reset at $DATE_TAG" > "$BASE/logs/reset.log"
echo "VERSION=1.0.0" > "$BASE/system/info.txt"

# можна створити базовий boot.check або файл прапорець
echo "OK" > "$BASE/system/boot.check"

sleep 0.5
echo "✅ Система очищена."

echo ""
echo "💾 Створюємо архів ControlOS..."
mkdir -p "$BACKUP_DIR"

hdiutil makehybrid -o "$BACKUP_DIR/$ARCHIVE_NAME" "$BASE" -iso -joliet -default-volume-name "ControlOS_HISTORY" >/dev/null

if [ $? -eq 0 ]; then
  echo "📦 Архів створено: $BACKUP_DIR/$ARCHIVE_NAME"
else
  echo "❌ Помилка при створенні ISO."
fi

echo ""
echo "📁 Поточна система тепер чиста і готова до роботи."
sleep 1
echo "🔄 Запуск ControlOS..."
bash "$BASE/boot.command"
