## Oh My Zsh ##
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source "$ZSH/oh-my-zsh.sh"
alias zshconfig="c ~/.zshrc"

## IP / Location Utilities ##
alias ip='curl -fsSL https://api.ipify.org || curl -fsSL https://ifconfig.me'
alias location='curl -s http://ipinfo.io/json | jq -r '"'"'.city + ", " + .region + ", " + .country'"'"''

## IDE Shortcuts ##
alias c='open -a "Cursor"'
alias v='open -a "Visual Studio Code"'

## Node.js (via fnm) ##
eval "$(fnm env --use-on-cd)"

## pnpm ##
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

## Android ##
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
