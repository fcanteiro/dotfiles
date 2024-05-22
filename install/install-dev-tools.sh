#!/usr/bin/env bash
source "$DOTFILES/install/functions.zsh"

info 'Installing & Configuring Laravel Herd'
brew install --cask herd --quiet
herd_configuration
success 'Laravel Herd (Laravel and PHP development environment manager)'

declare -A apps=(
  ["Google Chrome"]="--cask google-chrome:Web browser"
  ["1Password"]="--cask 1password:Password manager that keeps all passwords secure behind one password"
  ["python@3"]="python@3:Interpreted, interactive, object-oriented programming language"
  ["JetBrains Toolbox"]="--cask jetbrains-toolbox:JetBrains tools manager"
  ["Sublime Text"]="--cask sublime-text:Text editor for code, markup and prose"
  ["TablePlus"]="--cask tableplus-toolbox:Native GUI tool for relational databases"
  ["GitHub Desktop"]="--cask github-text:Desktop client for GitHub repositories"
  ["Tinkerwell"]="--cask tinkerwell:Tinker tool for PHP and Laravel developers"
  ["Postman"]="--cask postman:Collaboration platform for API development"
  ["Transmit"]="--cask transmit:File transfer application"
  ["OpenVPN Connect"]="--cask openvpn-connect:Client program for the OpenVPN Access Server"
  ["AnyDesk"]="--cask anydesk:Allows connection to a computer remotely"
  ["Another Redis Desktop Manager"]="--cask another-redis-desktop-manager:Redis desktop manager"
  ["Medis"]="--cask medis:Modern GUI for Redis"
)

echo ''
info 'Basic Tools'
brew_install_apps "apps"

echo ''
info 'Extra Tools'
declare -A extra_apps=(
  ["DeltaWalker"]="--cask deltawalker:Tool to compare and synchronise files and folders"
  ["Insomnia"]="--cask insomnia:HTTP and GraphQL Client"
  ["ResponsivelyApp"]="--cask responsively:Modified browser that helps in responsive web development"
  ["Tempbox"]="--cask tempbox:Disposable email client"
  ["Cyberduck"]="--cask cyberduck:Server and cloud storage browser"
  # ["xxx"]="--cask yyy:zzz"
)
brew_install_apps "extra_apps"

echo ''
info 'App Store Apps'
mas install 1354318707
success 'Core Tunnel'
