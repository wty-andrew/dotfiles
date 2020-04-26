export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="bullet-train"

export EDITOR=nvim

for file in $HOME/dotfiles/zsh/{env,aliases,functions,local}.sh; do
  [ -f "$file" ] && source "$file"
done
unset file

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-completions docker docker-compose)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

unsetopt correct_all
setopt correct
