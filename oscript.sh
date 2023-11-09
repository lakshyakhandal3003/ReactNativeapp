# Define the source and destination directories
source_dir="/home/emizen/Downloads"
destination_dir="/root/OneDrive/Serverdata"
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
# Create a symbolic link from the source to the destination
if [ -e "$destination_dir/$(basename "$source_dir")" ]; then
  echo "Symbolic link already exists."
else
  ln -s "$source_dir" "$destination_dir"
  echo "Symbolic link created from $source_dir to $destination_dir"
fi
