export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="bullet-train"

export EDITOR=nvim

typeset -U path

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-completions docker docker-compose)

source $ZSH/oh-my-zsh.sh

autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

unsetopt correct_all
setopt correct

for file in $HOME/dotfiles/zsh/{env,aliases,functions,local}.sh; do
  [ -f "$file" ] && source "$file"
done
unset file

if command -v pyenv &>/dev/null; then
  eval "$(pyenv init -)"
fi
if command -v pyenv-virtualenv &>/dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi
