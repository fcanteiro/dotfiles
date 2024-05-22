#!/usr/bin/env bash

info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

warning() {
  printf "\r\033[2K  [ \033[00;33m!!\033[0m ] $1\n"
}

fail() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

user() {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

link_file() {
  local src=$1 dst=$2

  local overwrite=
  local backup=
  local skip=
  local action=

  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]; then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then

      # ignoring exit 1 from readlink in case where file already exists
      # shellcheck disable=SC2155
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]; then

        skip=true

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action </dev/tty

        case "$action" in
        o)
          overwrite=true
          ;;
        O)
          overwrite_all=true
          ;;
        b)
          backup=true
          ;;
        B)
          backup_all=true
          ;;
        s)
          skip=true
          ;;
        S)
          skip_all=true
          ;;
        *) ;;

        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]; then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]; then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]; then # "false" or empty
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

prop() {
  PROP_KEY=$1
  PROP_FILE=$2
  PROP_VALUE=$(eval echo "$(cat $PROP_FILE | grep "$PROP_KEY" | cut -d'=' -f2)")
  echo $PROP_VALUE
}

check_directory_exists() {
  local directory=$1
  # Check if the directory exists
  if [ -d "$directory" ]; then
    return 0 # Returns 0 if the directory exists
  else
    return 1 # Returns 1 if the directory does not exist
  fi
}

needs_installing() {
  local app=$1
  if [ -d "/Applications/$app.app" ]; then
    # echo "App is installed."
    return 1
  else
    # echo "App is not installed."
    return 0
  fi
}

function brew_install_apps() {
  local array_name=$1
  declare -n brew_apps=$array_name # Create a nameref or reference to the associative array
  for app in "${!brew_apps[@]}"; do
    IFS=':' read -r command description <<<"${brew_apps[$app]}"
    if needs_installing "$app"; then
      info "Installing $app... ($description)"
      brew install $command --quiet
    fi
    success "$app ($description)"
  done
}

herd_configuration() {
  local CONFIG_FILE="$HOME/Library/Application Support/Herd/config/valet/config.json"
  if [[ ! -f "$CONFIG_FILE" ]]; then
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo '{
    "paths": [
    ],
    "loopback": "127.0.0.1",
    "share-tool": "expose",
    "tld": "xyz"
}' >"$CONFIG_FILE"
  else
    sed -i '' 's/"tld": "test"/"tld": "xyz"/g' "$CONFIG_FILE"
  fi
  success 'Herd Configuration'

  mkdir -p "/etc/resolver"
  sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/xyz'
  success 'set .xyz as a nameserver'
}
