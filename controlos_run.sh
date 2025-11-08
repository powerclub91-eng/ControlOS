#!/bin/bash
cd "$(dirname "$0")"
clear
tput civis
echo "==================== ControlOS Desktop (Terminal) ===================="
echo
echo "  [iStore]  [Settings]  [Files]  [Terminal]  [Power]"
echo
echo
echo "  Desktop shortcuts:"
echo "   1) iStore"
echo "   2) Files"
echo "   3) Terminal"
echo
echo "Press number to open, q to quit."
while true; do
  read -rsn1 k
  case "$k" in
    1) echo "Opening iStore... (simulated)"; sleep 1;;
    2) echo "Opening Files... (simulated)"; sleep 1;;
    3) /bin/bash; clear;;
    q) break;;
  esac
done
tput cnorm
