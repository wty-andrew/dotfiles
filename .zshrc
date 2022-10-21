HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=5000

setopt noflowcontrol
setopt autocd
unsetopt correct_all
setopt correct

autoload -U select-word-style
select-word-style bash

source ~/.znap/zsh-snap/znap.zsh

znap eval starship 'starship init zsh --print-full-init'
znap prompt

zstyle ':autocomplete:*' min-input 2
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:*' widget-style menu-select

znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting
znap source wfxr/forgit

znap eval zoxide 'zoxide init zsh'

for file in $HOME/dotfiles/zsh/{env,aliases,functions,local}.sh; do
  [ -f "$file" ] && source "$file"
done
unset file

znap compdef _rustup 'rustup completions zsh rustup'
znap compdef _cargo  'rustup completions zsh cargo'
znap compdef _fnm    'fnm completions --shell zsh'

znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

