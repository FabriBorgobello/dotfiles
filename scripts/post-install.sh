#!/bin/bash
set -e

echo "→ Setting up Node via fnm..."
eval "$(fnm env)"
fnm install --lts

echo "→ Configuring macOS defaults..."

# Trackpad: disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Keyboard: fast key repeat, short delay
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Finder: show extensions, show hidden files, list view by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Screenshots: save to ~/Screenshots, PNG, no shadow
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture disable-shadow -bool true

# Dock
echo "→ Setting up Dock..."
defaults write com.apple.dock persistent-apps -array

dock_add() {
  defaults write com.apple.dock persistent-apps -array-add \
    "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

dock_add "/System/Applications/Finder.app"
dock_add "/Applications/Google Chrome.app"
dock_add "/System/Applications/Utilities/Terminal.app"
dock_add "/System/Applications/Launchpad.app"

killall Dock
killall Finder

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Automated setup complete."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "⚠️  Complete these manually in order:"
echo ""
echo "  1. Open 1Password → Settings → Developer → Enable SSH Agent"
echo "  2. gh auth login"
echo "  3. op plugin init aws"
echo "  4. vercel login"
echo "  5. Install Geist font: https://vercel.com/font"
echo "  6. Install Autofirma + import certs from 1Password"
echo ""
