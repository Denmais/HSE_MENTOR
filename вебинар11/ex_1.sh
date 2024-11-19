#!/bin/bash

SOURCE_DIRECTORY="$1"
REMOTE_USER="user"
REMOTE_HOST="localhost" 
REMOTE_BACKUP_DIR="$2"
DATE=$(date +"%Y%m%d_%H%M%S")  
ARCHIVE_NAME="backup_$DATE.tar.gz"

tar -czf "$ARCHIVE_NAME" -C "$SOURCE_DIRECTORY" .

scp "$ARCHIVE_NAME" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_BACKUP_DIR"

rm "$ARCHIVE_NAME"

# (если их больше трёх)
ssh "$REMOTE_USER@$REMOTE_HOST" << EOF
cd "$REMOTE_BACKUP_DIR"
ARCHIVES=($(ls -t backup_*.tar.gz))
if [ ${#ARCHIVES[@]} -gt 3 ]; then
    for ((i=3; i<${#ARCHIVES[@]}; i++)); do
        rm "${ARCHIVES[$i]}"
        echo "Deleted old backup: ${ARCHIVES[$i]}"
    done
fi
