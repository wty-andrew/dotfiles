# github.com/alexmurray/emacs-snap/issues/10
alias spacemacs="(/snap/bin/emacs $* 2>&1 1>/dev/null | grep -v Fontconfig | grep -v libgvfsdbus.so &)"
alias bat=batcat
alias copy="xclip -selection clipboard"
alias ports="netstat -ntlp"
alias mygen="HYGEN_TMPLS=$HOME/dotfiles/_templates hygen"
