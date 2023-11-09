#!/bin/bash

# Define the source and destination directories
source_dir="/home/emizen/Downloads"
destination_dir="/root/OneDrive/one"

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Source directory does not exist: $source_dir"
  exit 1
fi

# Check if the destination directory exists
if [ ! -d "$destination_dir" ]; then
  echo "Destination directory does not exist: $destination_dir"
  exit 1
fi
# Check if the data size is less than or equal to 1GB (1048576 KB)
if [ "$data_size" -le 1048576 ]; then
    # Run OneDrive to sync code & Database
    onedrive --synchronize --upload-only
#else
#    echo "Data size exceeds 1GB. Not syncing."
#fi

# Sync data from source to destination using rsync
rsync -av "$source_dir/" "$destination_dir"

echo "Data synchronized from $source_dir to $destination_dir"
