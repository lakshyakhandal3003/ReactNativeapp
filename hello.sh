#!/bin/bash

# Set your OneDrive remote name (the name you gave during rclone configuration)
REMOTE_NAME="onedrive"

# Set the local directory you want to upload
SOURCE_DIR="/home/emizen/Downloads"

# Set the remote directory on OneDrive
DESTINATION_DIR="/root/OneDrive/server301"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory does not exist: $SOURCE_DIR"
  exit 1
fi

# Sync local directory to OneDrive
onedrive --synchronize --upload-only "$SOURCE_DIR" "$REMOTE_NAME:$DESTINATION_DIR"

