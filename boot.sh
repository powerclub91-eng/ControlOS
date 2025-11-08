#!/bin/bash
# ~/iControlServer/boot.sh
# Simple splash and run checks

clear
tput civis  # hide cursor
printf "\n\n"
printf "    %s\n" "██████╗ ██████╗  ██████╗ ██████╗ ██    ██ ██████╗ "
printf "    %s\n" "   ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██    ██ ██╔══██╗"
printf "    %s\n" "   ██████╔╝██████╔╝██║   ██║██████╔╝██    ██ ██████╔╝"
printf "    %s\n" "   ██╔══██╗██╔══██╗██║   ██║██╔══██╗██    ██ ██╔══██╗"
printf "    %s\n" "   ██║  ██║██║  ██║╚██████╔╝██║  ██║╚██████╔╝██║  ██║"
printf "\n"
printf "               %s\n" "iControl — ControlOS boot"
printf "\n"
sleep 0.6
printf "Booting..."
sleep 0.5
printf "."
sleep 0.5
printf "."
sleep 0.3
printf ".\n\n"

# run file check
if [ -x ./boot.check ]; then
  ./boot.check
  rc=$?
  if [ $rc -ne 0 ]; then
    echo "System files not found or corrupted. Entering recovery mode..."
    sleep 1
    ./recovery.sh
    tput cnorm
    exit 0
  fi
else
  echo "boot.check missing — cannot verify system."
  sleep 1
  ./recovery.sh
  tput cnorm
  exit 0
fi

# show menu
if [ -x ./controlos.sh ]; then
  ./controlos.sh
else
  echo "controlos.sh missing or not executable"
fi

tput cnorm
exit 0
