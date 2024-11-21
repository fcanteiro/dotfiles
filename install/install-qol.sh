#!/usr/bin/env bash
source "$DOTFILES/install/functions.zsh"

declare -A qol_apps=(
  ["AppCleaner"]="--cask appcleaner:Application uninstaller"
  ["Raycast"]="--cask raycast:Substitute for macOS Spotlight"
  ["Keka"]="--cask keka:File archiver"
  ["Loop"]="mrkai77/cask/loop:Window Manager"
  ["Bartender 5"]="--cask bartender:Menu bar icon organiser"
  ["The Clock"]="--cask the-clock:Clock and time zone app" ##(yyyy-MM-dd ⋅ hh:mm ⋅ E MMM)
  ["Whatsapp"]="--cask whatsapp:Native desktop client for WhatsApp"
  # ["Keyboard Maestro"]="--cask keyboard-maestro:Automation software"
  ["CleanShot"]="--cask cleanshot:Screen capturing tool"
  ["Flycut"]="--cask flycut:Clipboard manager for developers"
  # ["xxx"]="--cask yyy:zzz"
)

echo ''
info 'Installing "Quality of Life" Apps'
brew_install_apps "qol_apps"

info 'App Store Apps'
#mas install 458887729
#success 'Translate Tab' # app store limitations try https://github.com/dbilgili/GoogleTranslate
mas install 1233965871
success 'ScreenBrush (Draw over the entire screen)'

brew cleanup
