#!/bin/bash
set +ex
# Load constants
source ~/terraria/terraria-server/scripts/shared_variables.sh

# Get current date and time in the format YYYY-MM-DD_HH-MM-SS
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a backup folder with the timestamp
BACKUP_FOLDER="${BACKUPS_PATH}backup_${TIMESTAMP}"

# Create the backup directory
mkdir -p "$BACKUP_FOLDER"

# Copy the world saves to the backup directory
cp -r ${WORLD_SAVES_PATH} "$BACKUP_FOLDER"

echo "Backup completed! World saves have been copied to: $BACKUP_FOLDER"
