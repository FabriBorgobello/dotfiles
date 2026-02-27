#!/bin/bash
set -e

DOTFILES_DIR="$(dirname "$0")/../dotfiles"

cp "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
cp "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
cp "$DOTFILES_DIR/.gitignore_global" "$HOME/.gitignore_global"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
cp "$DOTFILES_DIR/.ssh/config" "$HOME/.ssh/config"
chmod 600 "$HOME/.ssh/config"
mkdir -p "$HOME/.aws"
chmod 700 "$HOME/.aws"
cp "$DOTFILES_DIR/.aws/config" "$HOME/.aws/config"

echo "→ Dotfiles copied."
