#!/bin/bash

# ==========================================
# NMAP MULTI SCAN SCRIPT
# ==========================================
# Usage:
# ./moreFlexScan.sh <IP-ADDRESS> <SCANTYPE> [-p <PortRange>]
# 
# Example:
# ./moreFlexScan.sh 192.168.0.1 tcp udp service -p 1-1000
# ==========================================


# Check if user input args count equals
if [ $# -lt 2 ]; then
    echo "No user input detected..."
    echo "No scan achieved."
    echo
    echo "Usage: $0 <IP-ADDRESS> <OPTIONS> [-p <PortRange>]"
    echo "Options: tcp | service | udp"
    exit 1
fi

ipAddress=$1
shift       # remove first argument (IP), others are scan types (options)

# no port by default
portOption=""
portRange=""

# check if optional -p argument exists
args=()
while (( "$#" )); do 
    if [ "$1" == "-p" ]; then
        # next value is port range
        shift
        portRange=$1
        portOption="-p $portRange"
        shift
    fi
done

# generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# generate log directory
LOGDIR="$HOME/Documents/logFiles/moreFlexScanLogs"
mkdir -p "$LOGDIR" # -p checks, if directory exists

# filename
MAINLOGFILE="$LOGDIR/moreFlexScan_ALL_$(scanType)_$TIMESTAMP.log"

echo "===== NMAP SCAN STARTED $(date) =====" >> "$MAINLOGFILE"
echo "Target: $ipAddress" >> "$MAINLOGFILE"
echo "Option used $@" >> "$MAINLOGFILE"
echo "----------------------------------------------------" >> "$MAINLOGFILE"

# iterates through each option
for scanType in "${args[@]}" ; do
    logfile ="$LOGDIR/moreFlexScan_$(scanType)_$TIMESTAMP.log"

    #  option of scans from user input
    case "$scanType" in
        tcp) 
            options="-sS" ;;  
        service) 
            options="-sV";;
        udp) 
            options="-sU";;
        *)
            echo "Invalid scan type: $scanType"
            echo "[WARNING] Invalid option: $scanType" >> $MAINLOGFILE
            continue
            ;;
    esac
    
    echo "===== STARTING NMAP SCAN ====="
    echo "===== Scan: $scantype ($options $portOption) =====" >> "$MAINLOGFILE"

    # start nmap scan with own log + summary log
    nmap $options $portOption "$ipAddress" | tee -a "$logfile" >> "$MAINLOGFILE"

    echo
    echo "===== All scans completed ====="
    echo "===== Results saved in: ====="
    echo "$logfile"
    echo "=========================="  >> "$MAINLOGFILE"

done

echo "===== All scans completed at $(date) =====" >> "$MAINLOGFILE"
echo "===== Scan log saved in: ====="
echo "===== $MAINLOGFILE ====="