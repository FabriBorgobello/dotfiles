# dotfiles

Automated macOS setup for a new machine. Clone, run one script, and go from zero to fully configured.

## Prerequisites

- A clean macOS installation (Apple Silicon)
- Signed into iCloud / Apple ID
- Signed into the **Mac App Store** (required for App Store installs)

## Usage

Open **Terminal** and run:

```bash
git clone https://github.com/FabriBorgobello/dotfiles.git ~/dotfiles
bash ~/dotfiles/bootstrap.sh
```

## What it does

The bootstrap script runs these steps in order:

| Step | Description |
|---|---|
| **Homebrew** | Installs Homebrew if not already present |
| **Brewfile** | Installs CLI tools and desktop apps |
| **App Store** | Installs App Store apps (skipped if not signed in) |
| **Oh My Zsh** | Installs Oh My Zsh if not already present |
| **Dotfiles** | Copies `.zshrc`, `.gitconfig`, and `.aws/config` to `$HOME` |
| **Post-install** | Installs Node LTS via fnm and clears the Dock |

## After the script finishes

Complete these steps manually:

1. Open **1Password** → Settings → Developer → Enable SSH Agent
2. `gh auth login`
3. `op plugin init aws`
4. `vercel login`
5. Install [Geist font](https://vercel.com/font)
6. Install Autofirma + import certs from 1Password

## Repo structure

```
bootstrap.sh            Entry point — runs everything in order
Brewfile                CLI tools and desktop apps (Homebrew)
Brewfile.mas            Mac App Store apps (requires sign-in)
scripts/copy.sh         Copies dotfiles to $HOME
scripts/post-install.sh Node setup, Dock config, manual steps
dotfiles/.zshrc         Shell config (aliases, PATH, fnm, pnpm)
dotfiles/.gitconfig     Git identity, SSH signing via 1Password
dotfiles/.aws/config    AWS default region/output
```

## Re-running

The script is idempotent — safe to run again. It skips Homebrew and Oh My Zsh if already installed, and `brew bundle` only installs missing packages.