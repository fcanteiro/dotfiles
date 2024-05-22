alias x="exit"
alias h="cd ~"
alias l="ls -al"
alias sz="source ~/.zshrc"

source $DOTFILES/zsh/alias_laravel.zsh
source $DOTFILES/zsh/alias_git.zsh

# System
alias enable.touchid="sudo sed -i '' -e \"1s/^//p; 1s/^.*/auth       sufficient     pam_tid.so/\" /etc/pam.d/sudo"
function sudo {
  $DOTFILES/bin/pam_tid.py --check || echo "Enabling Touch ID for sudo..."
  /usr/bin/sudo ${DOTFILES}/bin/pam_tid.py
  /usr/bin/sudo "$@"
}
dock.addspace() {
  killall Dock
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
  echo "Space Added"
  killall Dock
  echo "Dock restarted"
}
testSSL() {
  if [ "$1" ]; then
    for i in {1..1}; do
      curl -o /dev/null -w "namelookup:	%{time_namelookup}\nconnect:	%{time_connect}\nappconnect:	%{time_appconnect}\npretransfer:	%{time_pretransfer}\nredirect:	%{time_redirect}\nstarttransfer:	%{time_starttransfer}\n----------\ntotal:		%{time_total}\n\n\n" -s $1
    done
  else
    echo "NO URL Passed!"
  fi
}
alias port='f() { lsof -i tcp:$1 };f'
alias kill.node="pkill -f node"
alias killprocessid='f() { sudo kill -9 $1 };f'
alias clear.dsStore='find . -name ".DS_Store" -delete'

# System DNS
alias dns.clearCache='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias dns.restart="sudo killall -HUP mDNSResponder"
alias dns.txt="dig -t txt"
alias dns.mx="dig -t mx"
alias digTXT='f() { dig -t txt "$1" +short };f'

# Application Aliases
alias s='smerge .'
alias python='python3'
alias edit="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias code.="code ."

alias docker.start='colima start'

# ngrok #
# alias tunnel.localhost='f() { lt --port 80 --local-host "$1" };f'
alias tunnel.localhost='f() { ngrok http --host-header="$1" 80 };f'
alias tunnel.localhost.port='f() { ngrok http --host-header="$1" $2 };f'

# Disable Adobe Bloatware &B Spyware
alias nothankyouadobe="sudo -H killall ACCFinderSync \"Core Sync\" AdobeCRDaemon \"Adobe Creative\" AdobeIPCBroker node \"Adobe Desktop Service\" \"Adobe Crash Reporter\";sudo -H rm -rf \"/Library/LaunchAgents/com.adobe.AAM.Updater-1.0.plist\" \"/Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist\" \"/Library/LaunchDaemons/com.adobe.*.plist\""
alias kill.adobe="nothankyouadobe"

#YARN
alias yrb="yarn run build"
alias yrd="yarn run dev"
alias yrp="yarn run production"
alias yrw="yarn run watch"
alias yrwp="yarn run watch-prod"

#NPM
alias npm.list="npm list --depth 0"
alias npm.list.global="npm -g list --depth 0"
alias nrb="npm run build"
alias nrd="npm run dev"
alias nrp="npm run production"
alias nrw="npm run watch"
alias nrwp="npm run watch-prod"

#NPX
alias npxd="npx mix"
alias npxp="npx mix --production"
