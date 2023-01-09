#!/bin/bash

read -p "Enter the name of the input file: " input_file
read -p "Enter the name of the output file: " output_file

while read -r ip; do
    echo "Processing IP address: $ip"
    output=$(ipcalc "$ip")
    network=$(echo "$output" | grep "Network" | awk '{print $2}')
    echo "Network: $network"
    echo "$network" >> "$output_file"
done < "$input_file"
