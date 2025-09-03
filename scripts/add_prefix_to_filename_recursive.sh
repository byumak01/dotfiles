#!/bin/bash

rename_recursive() {
    local target_dir="$1"
    local prefix="$2"
    
    for file in "$target_dir"/*; do
        if [ -f "$file" ]; then
            dir=$(dirname "$file")
            base=$(basename "$file")
            mv "$file" "$dir/${prefix}$base"
        elif [ -d "$file" ]; then
            rename_recursive "$file" "$prefix"
        fi
    done
}

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Both directory and prefix are required!"
    echo "Usage: $0 <directory> <prefix>"
    echo "Example: $0 /path/to/directory backup_"
    exit 1
fi

# Check if directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist!"
    exit 1
fi

target_dir="$1"
prefix="$2"

# Count files that will be renamed
file_count=$(find "$target_dir" -type f | wc -l)

# Confirmation prompt
echo "This will recursively rename $file_count files in '$target_dir'"
echo "Adding prefix '$prefix' to all filenames."
echo ""
read -p "Are you sure you want to continue? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 0
fi

echo "Renaming files..."
rename_recursive "$target_dir" "$prefix"
echo "Done! Renamed $file_count files."
