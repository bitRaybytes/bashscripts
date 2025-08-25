#!/bin/bash

# ==========================================
# A small script to check your running tasks
# ==========================================
# Usage:
# ./lsProc.sh <INT>
# ------------------------------------------
# Example: list 20 processes
# ./lsProc.sh 20
# ------------------------------------------

listcount=$1

# ----- CONFIGURATION -----

if [ -z "$listcount" ]; then
  echo "[WARNING] Invalid input."
  echo "[INFO] Usage: $0 <INTEGER>
  exit 1
fi

# informational
echo "==== Running processes on $(hostname) ====="
echo "==== date ===="
echo "------------------------------------"

# all processes with user, PID, CPU and command
# with a head of n (user input)
ps -eo user,pid,%cpu,%mem,comm --sort %cpu | head "-$1"
