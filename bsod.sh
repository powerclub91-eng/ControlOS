#!/bin/bash
clear
echo "💀 Your system encountered a critical error!"
echo "-------------------------------------------"
echo "ERROR CODE: 0x000BADF00D"
echo "Reason: Missing or corrupted system file"
echo ""
echo "🌀 Restarting in Recovery Mode in 15 seconds..."
sleep 15
bash restore.sh
