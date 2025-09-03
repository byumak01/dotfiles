#!/usr/bin/env python3
import os
import re
import glob

def clean_filename(filename):
    """Clean filename to be Linux-friendly"""
    # Get name without extension
    name, ext = os.path.splitext(filename)
    
    # Replace spaces with underscores
    name = re.sub(r'\s+', '_', name)
    
    # Remove special characters, keep only alphanumeric, underscore, hyphen, dot
    name = re.sub(r'[^a-zA-Z0-9._-]', '', name)
    
    # Remove multiple consecutive underscores
    name = re.sub(r'_+', '_', name)
    
    # Remove leading/trailing underscores
    name = name.strip('_')
    
    # Truncate if too long
    if len(name) > 200:
        name = name[:200]
    
    return name + ext

def main():
    pdf_files = glob.glob('*.pdf')
    
    for old_file in pdf_files:
        new_file = clean_filename(old_file)
        
        if old_file != new_file:
            print(f"Renaming: '{old_file}' -> '{new_file}'")
            try:
                os.rename(old_file, new_file)
            except OSError as e:
                print(f"Error renaming {old_file}: {e}")
        else:
            print(f"No change needed: '{old_file}'")

if __name__ == "__main__":
    main()
