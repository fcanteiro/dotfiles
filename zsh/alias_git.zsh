#GIT
alias g="git"
alias gf="git diff"
alias gfm="git diff | mate"
alias go="git checkout"
alias gom="go master"
alias gs="git status"
alias gb="git branch"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias stash="git stash"
alias gpr="git pull --rebase"
alias sign.test="echo "test" | gpg --clearsign"
hellnah() {
  git reset --hard HEAD
  echo -n "\033[0;32mChanges cleared successfully.\033[0m\n"
}
nah() {
  echo -n "Are you sure you want to clear all changes? (\033[1;33mYes\033[0m/no): "
  read response
  response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
  if [ -z "$response" ] || [ "$response" = "yes" ] || [ "$response" = "y" ]; then
    hellnah
  else
    echo "Operation aborted."
  fi
}
