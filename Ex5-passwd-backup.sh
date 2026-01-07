#!/bin/bash


BACKUP_DIR="$HOME/passwd_backups"
DATE=$(date +%Y-%m-%d)
mkdir -p "$BACKUP_DIR"

cut -d: -f1,3 /etc/passwd > "$BACKUP_DIR/passwd_$DATE.txt"

find "$BACKUP_DIR" -name "passwd_*.txt" -type f -mtime +1 -delete

echo "Backup for $DATE completed. Old files removed."

