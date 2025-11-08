#!/bin/bash
clear
echo "🟦 ControlOS Installer"
sleep 0.8
echo ""
read -e -p "Вкажи шлях до ISO (наприклад: ~/Downloads/ControlOS.iso): " ISO_PATH

if [ ! -f "$ISO_PATH" ]; then
  echo "❌ Не знайдено файл $ISO_PATH"
  exit 1
fi

TARGET_DIR="$HOME/ControlOS_Settings"

# Якщо вже існує — питаємо
if [ -d "$TARGET_DIR" ]; then
  echo "⚠️  Папка ControlOS_Settings вже існує."
  read -p "Перезаписати її? (y/n): " ans
  if [[ "$ans" != "y" ]]; then
    echo "🚫 Встановлення скасовано."
    exit 0
  fi
  rm -rf "$TARGET_DIR"
fi

mkdir -p "$TARGET_DIR"

echo "📀 Монтуємо ISO..."
MOUNT_POINT=$(hdiutil attach "$ISO_PATH" -nobrowse -readonly | grep Volumes | awk '{print $3}')

if [ -z "$MOUNT_POINT" ]; then
  echo "❌ Помилка монтування ISO."
  exit 1
fi

echo "📂 Копіюємо файли системи..."
cp -R "$MOUNT_POINT"/* "$TARGET_DIR"/

echo "🔧 Надаємо права..."
find "$TARGET_DIR" -type f -name "*.sh" -exec chmod +x {} \;
find "$TARGET_DIR" -type f -name "*.command" -exec chmod +x {} \;

echo "💾 Від'єднуємо ISO..."
hdiutil detach "$MOUNT_POINT" >/dev/null

echo "✅ ControlOS успішно встановлено!"
echo "📁 Шлях: $TARGET_DIR"
echo ""
echo "▶️  Запуск: $TARGET_DIR/boot.command"
sleep 2
open "$TARGET_DIR"