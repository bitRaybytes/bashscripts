#!/bin/bash

# =========================================== #
# Script to print the Vigenère-Chiffre Table  #
# =========================================== # 


# alphabet
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

# header
echo "  $(echo $alphabet | sed 's/./& /g')"
printf -- '%.0s-' {1..55}


# do the stuff
for ((i=0; i<26;i++)); do
    # create shifted alphabet with head and tail
    # head cuts front part and tail the end
    prefix=$(echo $alphabet | head -c $((i++)))
    suffix=$(echo $alphabet | tail -c $((27-i)))
    # concatenate to form rows
    shift_a="$suffix$prefix"

    # create fist char and shift rows
    echo "$firstChar | $(echo $shift_a | sed 's/./& /g')"
done

