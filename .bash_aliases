# General QoL Aliases
alias btw='neofetch'
alias hgrep='history | grep'
alias refresh='clear && source $HOME/.bashrc'
alias v='nvim'

# Git Aliases
alias gstat='git status'
alias gadd='git add'
alias gpush='git push'
alias gpull='git pull'
alias gcomm='git commit'
alias gcout='git checkout'
alias gdiff='git diff'
alias glog='git log'

# Docker Aliases
alias dkr_stopall='docker stop $(docker ps -q) &> /dev/null || echo "No running containers"'
