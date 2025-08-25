#!/bin/bash

# ---------------------------------------------
# SYSTEM UPDATE AND UPGRADE SCRIPT
# ---------------------------------------------
# Usage:
# ./update.sh
# 
# then follow instructions
# ---------------------------------------------

# ----- CONFIGURATION -----
# generate log directory
LOGDIR="$HOME/Documents/updateLogs"
mkdir -p "$LOGDIR"

# generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# filename
LOGFILE="$LOGDIR/update_$(scanType)_$TIMESTAMP.log"

# find log files older 30 days and remove them
find "$LOGDIR" -type f -name "update_*.log" -mtime 30 -exec rm -v {} \;


# ----- BANNER -----
echo "======================================="
echo "       SYSTEM UPDATE AND UPGRADE       "
echo "======================================="
echo "          Logfile is created:          "
echo "$LOGFILE"
echo "---------------------------------------"

# ----- INTERACTIVE CALL -----
read -p "Confirm update automatically (y/N): " AUTO_CONFIRM
AUTO_CONFIRM=$(echo "$AUTO_CONFIRM" | tr '[:upper:]' '[:lower:]')

if [[ "$AUTO_CONFIRM" == "y" ]]: then
    CONFIRM_FLAG="-y"
else
    CONFIRM_FLAG=""
fi

# ----- AUTOREMOVE OLD PACKAGES -----
read -p "Remove old, unnecaissary packages (y/N): " AUTOREMOVE
AUTOREMOVE=$(echo "$AUTOREMOVE" | tr '[:upper:]' '[:lower:]' )

if [[ "$AUTOREMOVE" == "-y" ]]; then
    echo ">>>>> sudo apt autoremove -y"
    sudo apt autoremove -y 2>&1 | tee -a "$LOGFILE"
else
    echo "Autoremove skipped" | tee -a "$LOGFILE"
fi

# ----- UPDATE & UPGRADE -----
echo "===== Update started on $(date) =====" | tee -a "$LOGFILE"
echo ">>>>> sudo apt update" | tee -a "$LOGFILE"
sudo apt update 2>&1 | tee -a "$LOGFILE"

echo
echo ">>>>> sudo apt upgrade $CONFIRM_FLAG" | tee -a "$LOGFILE"
sudo apt update $CONFIRM_FLAG 2>&1 | tee -a "$LOGFILE"

# ----- SUMMARY -----
echo
echo "===== SUMMARY OF SYSTEM UPDATE & UPGADE ====="
echo "===== Update & Upgrade successfully completed =====" | tee -a "$LOGFILE"
echo
echo ">>>>> Summary of installed packages:" | tee -a "$LOGFILE"
apt list --upgradable 2>/dev/null | tee -a "$LOGFILE"

# Overview of log files
echo
echo ">>>>> Current logfiles in directory $LOGDIR:"
ls -lh "$LOGDIR" | tee -a "$LOGFILE"
