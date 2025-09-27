#!/bin/bash/


# ==========================================
# Script for monitoring memory usage,
# disk space and drive availability.
# ==========================================


# monitor memory
echo "===== Memory Overview ====="
free -vh
echo "==========================="
echo
# monitor drive capacity in human readable format
echo "===== Hard Drive Overview ====="
df -h
echo "==============================="