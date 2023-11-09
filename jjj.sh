#!/bin/bash

# Go to OneDrive directory.
cd /root/OneDrive

# Create a directory with a site's name.
#mkdir sites-name
Check if the size is less than or equal to 1 GB.
if (( $(echo "$size_in_gb <= 1" | bc -l) ));

# Create a symbolic link from /opt/autobackup/daily_backup/web_backup/ to /root/OneDrive/ttt.
ln -s /home/emizen/Downloads /root/OneDrive/jhews

# Commented out lines for creating symbolic links for MySQL backups.
# ln -s /opt/autobackup/daily_backup/mysql_backup/2023-10-22/classified_db.sql.gz /root/OneDrive/Devovh301/classifiednode.ezxdemo.com

# Dry run to check synchronization with verbosity.
onedrive --synchronize --verbose --dry-run

# Check file size before syncing.
size=$(du -s /home/emizen/Downloads | cut -f1)
size_in_gb=$(awk "BEGIN {print $size/1024/1024}")
echo "Size of /home/emizen/Downloads: $size_in_gb GB"

# Check if the size is less than or equal to 1 GB.
if (( $(echo "$size_in_gb <= 1" | bc -l) )); then
  # Synchronize code and database to OneDrive in upload-only mode.
  onedrive --synchronize --upload-only
else
  echo "File size exceeds 1 GB. Synchronization aborted."

