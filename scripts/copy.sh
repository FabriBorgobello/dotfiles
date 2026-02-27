#!/bin/bash
DOTFILES_DIR="$(dirname "$0")/../dotfiles"

cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
cp "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/.aws"
cp "$DOTFILES_DIR/.aws/config" "$HOME/.aws/config"

echo "→ Dotfiles copied."
