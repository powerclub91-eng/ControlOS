#!/bin/bash
# ==============================================
# 🧰 ControlOS Setup Wizard v3.0 (Fullscreen)
# ==============================================
SYS_DIR="$HOME/ControlOS_Settings"
source "$SYS_DIR/logger.sh" 2>/dev/null
source "$SYS_DIR/status.sh" 2>/dev/null

# Повноекранний режим
clear
tput civis
printf '\033[8;50;120t'  # висота x ширина
clear

# Колір фону
echo -e "\033[44m\033[37m"  # синій фон, білий текст

# Заголовок
echo "┌────────────────────────────────────────────────────────────┐"
echo "│               ⚙️ CONTROL OS SETUP WIZARD                   │"
echo "└────────────────────────────────────────────────────────────┘"
echo ""
sleep 0.5

read -p "🧑 Enter new username: " username
read -sp "🔑 Create password: " password
echo ""
sleep 0.3

# створення user.conf
mkdir -p "$SYS_DIR"
echo "username=$username" > "$SYS_DIR/user.conf"
echo "password=$password" >> "$SYS_DIR/user.conf"

clear
echo "┌────────────────────────────────────────────────────────────┐"
echo "│              Installing ControlOS Components...            │"
echo "└────────────────────────────────────────────────────────────┘"
sleep 0.5

# анімація
for i in {1..100}; do
  printf "\rProgress: [%-50s] %d%%" "$(printf '#%.0s' $(seq 1 $((i/2))))" "$i"
  sleep 0.03
done

sleep 0.5
echo ""
echo "✅ User $username created successfully!"
sleep 0.8

# системні файли
FILES=("system_log.txt" "logger.sh" "status.sh" "process_monitor.sh")
for f in "${FILES[@]}"; do
  echo "🧩 Creating $f..."
  touch "$SYS_DIR/$f"
  sleep 0.2
done

sleep 1
echo ""
echo "✅ Setup complete. Welcome, $username!"
sleep 1
echo "🚀 Booting into ControlOS..."
sleep 1.5

# Звук BIOS
echo -ne "\007"

# Повертаємо курсор перед запуском системи
tput cnorm
bash "$SYS_DIR/boot.command"
