#!/bin/bash
set -e

echo "→ Setting up Node via fnm..."
eval "$(fnm env)"
fnm install --lts

echo "→ Clearing Dock..."
defaults write "com.apple.dock" "persistent-apps" -array && killall Dock

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
