#!/bin/bash

# Directory where dotfiles repo is cloned
DOTFILES_DIR="$HOME/dotfiles"

# Backup directory for existing dotfiles
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# List of files and directories to symlink (add your dotfiles and directories here)
FILES=".zshrc .vimrc .tmux.conf .vim"  # Include directories like .vim

for file in $FILES; do
    # Check if the source exists in the dotfiles repo
    if [ ! -e "$DOTFILES_DIR/$file" ] && [ ! -d "$DOTFILES_DIR/$file" ]; then
        echo "Error: $DOTFILES_DIR/$file does not exist in the repo. Skipping."
        continue
    fi

    # Back up existing file or directory if it exists and is not a symlink
    if [ -e "$HOME/$file" ] || [ -d "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        echo "Backing up existing ~/$file to $BACKUP_DIR/"
        mv "$HOME/$file" "$BACKUP_DIR/"
    fi

    # Remove existing symlink if it exists
    if [ -L "$HOME/$file" ]; then
        echo "Removing existing symlink ~/$file"
        rm "$HOME/$file"
    fi

    # Create new symlink (works for both files and directories)
    echo "Creating symlink: ~/$file -> $DOTFILES_DIR/$file"
    ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
done

echo "Installation complete. Backups are in $BACKUP_DIR if needed."

