#!/bin/bash

# ==========================================
# FLEX SCAN SCRIPT
# ==========================================
# Output in log file
# 
# Usage:
# ./flexScan.sh <IP-ADDRESS> <SCANTYPE>
# 
# Example:
# ./flexScan.sh 192.168.0.1 tcp udp service
# ==========================================


# check if user input args count is valid
if [ $# -lt 2 ]; then
    echo "No user input detected..."
    echo "No scan achieved."
    echo
    echo "Usage: $0 <IP-ADDRESS> <SCANTYPE>"
    echo "Options: tcp | service | udp"
fi

ipAddress=$1
scanType=$2

# generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# generate log directory
LOGDIR="$HOME/Documents/logFiles/FlexScanLogs"
mkdir -p "$LOGDIR" # -p checks, if directory exists

# filename
LOGFILE="$LOGDIR/flexScan_$(scanType)_$TIMESTAMP.log"

# option of scans from user input
case $scanType in
    tcp)    options="-sS" ;;    #TCP Syn scan
    service) options="-sV";;  # Version scan
    udp)    options="-sU";;   # UDP scan
    *)
    echo "Invalid scan type: $scanType"
    echo "Valid types: tcp | service | udp"
    exit 1
esac

# start scan
echo "Starting nmap scan: $options $ipAddress"
nmap $options "$ipAddress" >> "$LOGFILE" # output logfile

echo "Scan completed."
echo "Scan log saved in:"
echo "$LOGFILE"