#!/bin/bash
# controlos.sh — простий TUI: Start ControlOS / Enter BIOS / Power Off / Recovery
cd "$(dirname "$0")" || exit 1
tput civis
clear

width=$(tput cols)
height=$(tput lines)

# намалювати рамку в центрі
W=80
H=18
X=$(( (width - W) / 2 ))
Y=$(( (height - H) / 2 ))

# функції для малювання
draw_box(){
  clear
  for ((r=0;r<H;r++)); do
    for ((c=0;c<width;c++)); do
      printf " "
    done
    echo
  done
  # заголовок
  tput cup $Y $X
  echo -e "\033[32m+$(printf '%.0s-' $(seq 1 $((W-2))))+\033[0m"
  for ((i=1;i<=H-2;i++)); do
    tput cup $((Y+i)) $X
    echo -e "\033[32m|\033[0m$(printf ' %.0s' $(seq 1 $((W-2))))\033[32m|\033[0m"
  done
  tput cup $((Y+H-1)) $X
  echo -e "\033[32m+$(printf '%.0s-' $(seq 1 $((W-2))))+\033[0m"
}

# меню елементи
items=("Start ControlOS" "Enter BIOS" "Recovery" "Power Off")
sel=0

draw()
{
  draw_box
  tput cup $((Y+1)) $((X+3))
  echo -e "\033[36m ControlOS Launcher \033[0m"
  for i in "${!items[@]}"; do
    tput cup $((Y+3+i)) $((X+4))
    if [ $i -eq $sel ]; then
      echo -e "\033[44m  ${items[$i]}  \033[0m"
    else
      echo "  ${items[$i]}"
    fi
  done
  tput cup $((Y+H-3)) $((X+4))
  echo -e "\033[2mUse ↑ ↓ and Enter\033[0m"
}

# обробка клавіш
draw
while true; do
  IFS= read -rsn1 key
  if [[ $key == $'\x1b' ]]; then
    read -rsn2 -t 0.0001 rest
    key+=$rest
  fi
  case "$key" in
    $'\x1b[A') # up
      sel=$(( (sel - 1 + ${#items[@]}) % ${#items[@]} ))
      draw
      ;;
    $'\x1b[B') # down
      sel=$(( (sel + 1) % ${#items[@]} ))
      draw
      ;;
    "") # Enter
      case $sel in
        0)  # Start ControlOS
            clear
            tput cnorm
            # тут починаємо "повноцінний" ControlOS — симуляція робочого столу
            ./controlos_run.sh 2>/dev/null || { echo "Launching ControlOS app..."; sleep 0.5; }
            exit 0
            ;;
        1)  # Enter BIOS
            clear
            ./bios.sh
            draw
            ;;
        2)  # Recovery
            clear
            if [ -x ./recovery.sh ]; then
              ./recovery.sh
            else
              echo "Recovery not found."
              sleep 1.2
            fi
            draw
            ;;
        3)  # Power Off
            clear
            echo "Powering off..."
            sleep 0.8
            tput cnorm
            exit 0
            ;;
      esac
      ;;
    q|Q)
      tput cnorm
      clear
      exit 0
      ;;
  esac
done
