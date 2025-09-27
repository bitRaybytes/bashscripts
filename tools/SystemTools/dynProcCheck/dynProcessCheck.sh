#!/bin/bash

# ==========================================
# Script for monitoring processes
# in an user specified intervall
# ==========================================
# Usage:
# ./dynProcessCheck.sh [seconds] [listing]
# 
# Example:
# ./dynProcessCheck.sh 5 15
#
# This example will list 15 active 
# process in a 5 second intervall
# ==========================================


if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "[WARNING] Invalid input."
    echo "Usage: $0 <seconds> <amount of processes>"
    exit 1 
fi

echo "Start monitoring processes. To quit press CTRL+C or CMD+C"
echo "----------------------------------------------------------"
echo
while true; do
    clear
    echo "====== Process of $(hostname) on $(date) ======"
    ps -eo user,pid,%cpu,%mem,comm --sort=-%cpu | head $2
    sleep $1
done