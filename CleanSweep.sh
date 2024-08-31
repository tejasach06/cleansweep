#!/bin/bash

# List of directories to check
directories=(
    "/home/tejasacharya/shell-scripts/test_dir"
    # Add more directories here if needed
)

# Function to check if a directory contains video files
check_video_files() {
    local dir="$1"
    # Check if the directory contains any video files
    if find "$dir" -type f \
        -regex '.*/.*\.\(mp4\|avi\|mkv\|mov\|wmv\|flv\|webm\)' -print -quit | grep -q .; then
        return 0
    else
        return 1
    fi
}

# Iterate through the directories
for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then # Check if the directory exists
        # Iterate through subdirectories
        for subdir in "$dir"/*; do
            if [ -d "$subdir" ]; then # Check if it's a directory
                # Check if the subdirectory contains any video files
                if ! check_video_files "$subdir"; then
                    if [[ ! " ${directories[@]} " =~ " $subdir " ]]; thens
                        echo "Deleting empty subdirectory: $subdir"
                        rm -rf "$subdir" # Delete the subdirectory
                    fi
                fi
            fi
        done
    else
        echo "Directory not found: $dir"
    fi
done
