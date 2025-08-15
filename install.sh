#!/bin/bash

# Function to create symlink safely
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [ -L "$target" ]; then
        echo "Symlink $target already exists, skipping..."
    elif [ -e "$target" ]; then
        echo "File/directory $target exists but is not a symlink. Please handle manually."
    else
        ln -s "$source" "$target"
        echo "Created symlink: $target -> $source"
    fi
}

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Create symlinks safely
create_symlink ~/dotfiles/btop ~/.config/btop
create_symlink ~/dotfiles/fastfetch ~/.config/fastfetch
create_symlink ~/dotfiles/htop ~/.config/htop
create_symlink ~/dotfiles/kitty ~/.config/kitty
create_symlink ~/dotfiles/nvim ~/.config/nvim
create_symlink ~/dotfiles/starship.toml ~/.config/starship.toml
create_symlink ~/dotfiles/sublime-merge ~/.config/sublime-merge
create_symlink ~/dotfiles/sublime-text ~/.config/sublime-text
