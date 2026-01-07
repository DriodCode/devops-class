#!/bin/bash


BACKUP_DEST="/var/backups/users"  
DATE=$(date +%Y-%m-%d_%H%M%S)
USER_NAME=$(whoami)
FILENAME="backup_${USER_NAME}_${DATE}.tar.gz"

mkdir -p "$BACKUP_DEST"

tar -czf "$BACKUP_DEST/$FILENAME" "$HOME" 2>/dev/null

# Keep only the last 5 backups per user to save space
ls -t "$BACKUP_DEST/backup_${USER_NAME}"_* | tail -n +6 | xargs rm -f 2>/dev/null

