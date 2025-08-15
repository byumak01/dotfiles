#!/bin/bash

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Create symlinks
ln -sf ~/dotfiles/btop ~/.config/btop
ln -sf ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/dotfiles/htop ~/.config/htop
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/sublime-merge ~/.config/sublime-merge
ln -sf ~/dotfiles/sublime-text ~/.config/sublime-text

echo "Dotfiles symlinked successfully!"
