#!/bin/bash
set -e

echo "→ Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "→ Installing packages from Brewfile..."
brew bundle --file="$(dirname "$0")/Brewfile"

echo "→ Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "→ Copying dotfiles..."
bash "$(dirname "$0")/scripts/copy.sh"

echo "→ Running post-install..."
bash "$(dirname "$0")/scripts/post-install.sh"
