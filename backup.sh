#!/bin/bash
source_dir="C:\Users\USER\Documents\DEVOPS\BASH\files"
#!/bin/bash

# Define the source directory and backup directory
source_dir="C:\Users\USER\Documents\DEVOPS\BASH\files"
backup_dir="C:\Users\USER\Documents\DEVOPS\BASH\backup"
timestamp=$(date +'%Y%m%d%H%M%S')  # Timestamp for unique backup folder

# Create a unique backup folder using the timestamp
backup_folder="$backup_dir/backup_$timestamp"

# Create the backup folder
mkdir -p "$backup_folder"

# Check if the backup folder was created successfully
if [ $? -ne 0 ]; then
    echo "Failed to create backup folder."
    exit 1
fi

# Loop through files in the source directory
for file in "$source_dir"/*; do
    if [ -f "$file" ]; then
        # Get the filename without the path
        filename=$(basename "$file")
        
        # Backup the file by copying it to the backup folder
        cp "$file" "$backup_folder/$filename"
        
        # Check if the copy operation was successful
        if [ $? -ne 0 ]; then
            echo "Failed to copy $filename to backup folder."
        else
            echo "Backed up $filename to $backup_folder"
        fi
    fi
done


echo "Backup completed successfully"

