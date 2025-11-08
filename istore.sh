#!/bin/bash
clear
echo "🛒 ControlOS iStore"
echo "-----------------------------"
echo "Available apps:"
echo "1. Snake+"
echo "2. Notes"
echo "3. Coming soon..."
echo "-----------------------------"
read -p "Select app to (re)install [1-2 or q]: " opt

case $opt in
  1) cp /Users/arsenii/ControlOS_Settings/snake.sh /Users/arsenii/ControlOS_Settings/; echo "Snake+ installed."; sleep 1 ;;
  2) cp /Users/arsenii/ControlOS_Settings/notes.sh /Users/arsenii/ControlOS_Settings/; echo "Notes installed."; sleep 1 ;;
  q) echo "Leaving iStore..."; sleep 1 ;;
  *) echo "Invalid option"; sleep 1 ;;
esac
