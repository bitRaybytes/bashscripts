#!/bin/bash

# ==========================================
#   SYSTEM MONITORING SCRIPT
# ==========================================
# Includes warning message if
# memo utilization is above 90% and
# system info if utilization is above 75%
# 
# it will also create logfiles after
# system monitoring is done
# 
# you can find the log files in your
# $HOME/Documents/SystemLogs/updateLogs
# ==========================================

# ----- CONFIGURATIONS -----
INTERVAL=$1
shift

# directory for logs
LOGDIR="$HOME/Documents/SystemLogs/updateLogs"
mkdir -p "$LOGDIR"

# preparing files
LOGFILES="$LOGDIR/system_monitor_$(date '%Y-%m-%d_%H-%M-%S')"

# check start of programm for user input
if [ -z "$INTERVAL" ]; then
    echo "[WARNING] Invalid input."
    echo "[INFO] Usage: $0 <SECONDS>"
    exit 1
fi

echo "===== SYSTEM MONITORING STARTED =====" | tee -a >> "$LOGFILE"
echo "===== DATE: $(date) =====" >> "$LOGFILE"
echo "===== Logs saved in: $LOGFILE"
echo "--------------------------------------------------------" | tee -a "$LOGFILE"

while true; do
    {
        echo "=========================="
        echo "===== SYSTEM MONITORING ====="
        echo "===== Started at $(date) ====="
        echo "=========================="
        echo "===== Memory Overview: ====="

        free -h
        echo
        echo

        # calculating memory usage in %
        used_mem=$(free -m | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
        # total memory
        total_mem=$(free -h | awk '/Mem:/ {printf $2}')
        # used memory
        used_human=$(free -h | awk '/Mem:/ {printf $3}')
        # available memory
        avail_human=$(free -h | awk 'Mem;/ {printf $7}')

        # echo stats in compact fomat
        echo ">>> Compact Overview:"
        printf "%-8s | %-8s | %-10s | %-6s\n" "Total" "Used" "Available" "Use%"
        printf '%s\n' "-----------------------------------------------"
        printf "%-8s | %-8s | %-10s | %-6s\n" "$total_mem" "$used_human" "$avail_human" "$(used_mem)%"
        echo "Total: $total_mem | Occupied: $used_human | Available: $avail_human | Usage: $used_mem"

        # echo warning if memory usage is above 90% and info if above 75%
        if [ -n "$used_mem" ] && [ "$used_mem" -gt 90 ]; then
            echo "[WARNING] RAM utilization at $(used_mem)%."
        elif [ -n "$used_mem" ] && [ "$used_mem" -gt 75 ]; then
            echo "[SYS-INFO] RAM utilization at $(used_mem)%."
        fi

        echo
        echo
        echo "===== HARD DRIVE SPACES: ====="

        # report file system disk space usage
        df -h
        echo 
        echo
        
        # compact version of hard drive space
        echo ">>> Compact Overview:"
        printf "%-10s | %-6s | %-8s | %-8s | %-6s\n" "Mount" "Size" "Used" "Avail" "Use%"
        printf '%s\n' "-----------------------------------------------"

        df -h --output=target,size,used,avail,pcent | tail -n +2 | while read mnt size used avail perc ; do
                printf "%-10s | %-6s | %-8s | %-8s | %-6s\n" "$mnt" "$size" "$used" "$avail" "$perc"
                percent=$(echo $perc | tr -d '%')
            done
        
        # System disk space warning if partition is used > 90%
         df -h --output=pcent,target | tail -n +2 | while read usage mount ; do
                percent=$(echo $usage | tr -d '%')
                if [ -n "$percent" ] && [ "$percent" -gt 90 ]; then
                    echo "[WARNING] Partition $mount at ${percent}% utilization"
                elif  [ -n "$percent" ] && [ "$percent" -gt 75 ]; then
                    echo "[WARNING] Partition $mount at ${percent}% utilization"
                fi
            done
        
        echo
        echo

        # top 5 processes sort by CPU utilization
        echo "===== Top 5 Processes by CPU: ====="
        printf "%-6s | %-15s | %-6s | %-6s\n" "PID" "Process" "CPU%" "MEM%"
        printf '%s\n' "---------------------------------------------"
        ps -eo pid,comm,%cpu,%mem --sort=-%cpu | awk 'NR==1 || NR<=6 {printf "%-6s | %-15s | %-6s | %-6s\n", $1, $2, $3, $5}'
    
    } | tee -a "$LOGFILE"

    sleep $INTERVAL
done