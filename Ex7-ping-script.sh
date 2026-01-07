#!/bin/bash


INPUT_FILE="ips.txt"
LOG_DATE=$(date +%Y-%m-%d)
LOG_FILE="ping_log_$LOG_DATE.log"


if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: $INPUT_FILE not found."
    exit 1
fi

echo "--- Starting Ping Test: $(date) ---" >> "$LOG_FILE"


while read -r ip; do

    [[ -z "$ip" ]] && continue



    hostname=$(dig -x "$ip" +short | sed 's/\.$//')
    

    if [[ -z "$hostname" ]]; then
        hostname="Unknown"
    fi


    if ping -c 1 -W 1 "$ip" > /dev/null 2>&1; then
        status="UP"
    else
        status="DOWN"
    fi


    echo "$(date '+%H:%M:%S') | Host: $hostname | IP: $ip | Status: $status" >> "$LOG_FILE"

done < "$INPUT_FILE"

echo "Ping results saved to $LOG_FILE"

