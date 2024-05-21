#!/bin/bash

set -u # Exit if uninitialized variables are used
set -e # Exit if a command fails

abort() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

if [ -z "${BASH_VERSION:-}" ]; then
  abort "Bash is required to interpret this script."
fi

# Check if script is run in POSIX mode
if [[ -n "${POSIXLY_CORRECT+1}" ]]; then
  abort 'Bash must not run in POSIX mode. Please unset POSIXLY_CORRECT and try again.'
fi

# List of tools to check
tools=("git" "brew")

# Loop over each tool
for tool in "${tools[@]}"; do
  if which "$tool" >/dev/null 2>&1; then
    echo "$tool is installed."
  else
    abort "$tool is not installed."
  fi
done

git clone https://github.com/fcanteiro/dotfiles.git .

./install/start.sh
