source_if_exists() {
  if test -r "$1"; then
    source "$1"
  fi
}

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/alias.zsh

if test -z ${ZSH_HIGHLIGHT_DIR+x}; then
  :
else
  source $ZSH_HIGHLIGHT_DIR/zsh-syntax-highlighting.zsh
fi

precmd() {
  source $DOTFILES/zsh/alias.zsh
}

export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin:$DOTFILES/scripts/"
export PATH="/opt/homebrew/bin:$PATH"

