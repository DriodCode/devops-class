#!/bin/bash

# Assign command line arguments to variables
IP=$1
USER=$2
PASS=$3


if [ -z "$IP" ] || [ -z "$USER" ] || [ -z "$PASS" ]; then
    echo "Usage: $0 <IP> <User> <Password>"
    exit 1
fi

# Ping the server once (-c 1) and suppress output
if ping -c 1 "$IP" > /dev/null 2>&1; then
    echo "Server $IP is accessible. Sending /etc/passwd..."
    


    sshpass -p "$PASS" scp /etc/passwd "$USER@$IP:/home/$USER/"
    

    if [ $? -eq 0 ]; then
        echo "File successfully sent."
    else
        echo "Ping succeeded, but file transfer failed (Check credentials or SSH access)."
    fi
else
    echo "The server $IP is not accessible."
fi

