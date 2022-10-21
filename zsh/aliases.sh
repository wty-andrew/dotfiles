alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

alias l="ls -lah"
alias la="ls -lAh"
alias ll="ls -lh"
alias ls="ls --color=auto"

alias grep="grep --color=auto --exclude-dir={.git,node_modules,.mypy_cache}"

alias spacemacs="(/usr/local/bin/emacs $* 2>&1 1>/dev/null &)"
alias bat=batcat
alias copy="xclip -selection clipboard"
alias ports="netstat -ntlp"
alias mygen="HYGEN_TMPLS=$HOME/dotfiles/_templates hygen"
