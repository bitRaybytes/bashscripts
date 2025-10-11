#!/bin/bash

# ==========================================
# Password Generetaor Script
# ==========================================
# Usage:
#   ./pwGenerator.sh <Length> <hash>
# 
# Example:
#   ./pwGenerator.sh
# ==========================================



if [[ -z "$1" ]]; then
    echo "[WARNING] Invalid input."
    echo "Usage: $0 <PW Length>"
    exit 1 
fi

PWLENGTH=$1

set='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_><!"§$%&/()=?#.:,;+*'
rand=""

for ((i=1;i<$PWLENGTH;i++)); do
    char=${set:$RANDOM % ${#set}:1}
    rand+=$char
done

echo "Genreated password: $rand"
echo

# convert password to base64
BASE64=$(echo -n "$rand" | base64)
echo "BASE64: $BASE64"