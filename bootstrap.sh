#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$0")"

# Homebrew
if ! command -v brew &>/dev/null; then
  echo "→ Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "→ Homebrew already installed."
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# Packages
echo "→ Installing packages from Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile"

# App Store apps
if mas account &>/dev/null; then
  echo "→ Installing App Store apps..."
  brew bundle --file="$SCRIPT_DIR/Brewfile.mas"
else
  echo "⚠️  Not signed into App Store — skipping mas installs."
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "→ Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "→ Oh My Zsh already installed."
fi

# Dotfiles & post-install
echo "→ Copying dotfiles..."
bash "$SCRIPT_DIR/scripts/copy.sh"

echo "→ Running post-install..."
bash "$SCRIPT_DIR/scripts/post-install.sh"
