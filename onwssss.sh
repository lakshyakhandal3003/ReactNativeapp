#!/bin/bash

# Define the source and destination directories
source_dir="/home/emizen/Downloads"
destination_dir="OneDrive"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Source directory does not exist: $source_dir"
  exit 1
fi

# Check if the destination directory exists
if [ ! -d "$destination_dir" ]; then
#  echo "Destination directory does not exist: $destination_dir"
  
  # Create the destination directory
  mkdir -p "$serverdata"
  
  # Check if the directory creation was successful
  if [ $? -ne 0 ]; then
    echo "Failed to create destination directory: $destination_dir"
    exit 1
  else
    echo "Destination directory created: $destination_dir"
  fi
fi

# Sync data from source to destination using rsync
#rsync -av "$source_dir/" "$destination_dir"

rclone copy "$source_dir/" "$destination_dir"
echo "Data synchronized from $source_dir to $destination_dir"

