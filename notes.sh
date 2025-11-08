#!/bin/bash
NOTES_FILE="/Users/arsenii/ControlOS_Settings/user_notes.txt"

clear
echo "📝 ControlOS Notes"
echo "-----------------------------"
echo "1. View notes"
echo "2. Add note"
echo "3. Delete all notes"
echo "4. Back"
echo "-----------------------------"
read -p "Select: " opt

case $opt in
  1) clear; cat "$NOTES_FILE" 2>/dev/null || echo "No notes yet."; read -p "Press Enter..." ;;
  2) read -p "Enter note text: " note; echo "$(date '+%Y-%m-%d %H:%M') - $note" >> "$NOTES_FILE"; echo "Saved!"; sleep 1 ;;
  3) rm -f "$NOTES_FILE"; echo "All notes deleted."; sleep 1 ;;
  4) exit ;;
  *) echo "Invalid option."; sleep 1 ;;
esac
