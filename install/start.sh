#!/usr/bin/env bash

cd "$(dirname "$0")/.."
DOTFILES=$(pwd -P)

set -e

source "$DOTFILES/install/functions.zsh"

echo ''

install_dotfiles() {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  find -H "$DOTFILES" -maxdepth 2 -name 'links.prop' -not -path '*.git*' | while read linkfile; do
    cat "$linkfile" | while read line; do
      local src dst dir
      src=$(eval echo "$line" | cut -d '=' -f 1)
      dst=$(eval echo "$line" | cut -d '=' -f 2)
      dir=$(dirname "$dst")

      mkdir -p "$dir"
      link_file "$src" "$dst"
    done
  done
}

create_env_file() {
  if test -f "$HOME/.env.sh"; then
    success "$HOME/.env.sh file already exists, skipping"
  else
    echo "export DOTFILES=$DOTFILES" >$HOME/.env.sh
    success 'created ~/.env.sh'
  fi
}

install_dotfiles
create_env_file

chmod u+x $DOTFILES/bin/pam_tid.py

echo ''
info 'Installing/Upgrading Bash'
brew install bash
echo ''
info 'Installing Python'
brew install python@3

echo ''
brew install mas --quiet
success "mas (Mac App Store command-line interface)"
brew install --cask warp --quiet
success "Warp (Rust-based terminal)"

git config --global core.excludesfile ~/.gitignore

lines=("source \$HOME/.env.sh" "source \$DOTFILES/zsh/rc.zsh")
file="$HOME/.zshrc"
for line in "${lines[@]}"; do
  if ! grep -Fxq "$line" "$file"; then
    echo "$line" >>"$file"
  fi
done
source "$HOME/.zshrc"

echo ''
success 'All installed!'
echo ''
echo ''
warning 'Restart/Open Warp'
