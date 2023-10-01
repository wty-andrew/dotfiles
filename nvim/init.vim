call plug#begin('~/.config/nvim/plugged')

function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'vimwiki/vimwiki'

"---------- Navigation ----------
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight', Cond(!exists('g:vscode'))
Plug 'ctrlpvim/ctrlp.vim', Cond(!exists('g:vscode'))
Plug 'christoomey/vim-tmux-navigator'

"---------- Completion ----------
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets', Cond(!exists('g:vscode'))
Plug 'jiangmiao/auto-pairs'

"---------- Utility ----------
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'vim-scripts/matchit.zip', Cond(!exists('g:vscode'))

"---------- Git ----------
Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))
Plug 'airblade/vim-gitgutter', Cond(!exists('g:vscode'))

"---------- UI ----------
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))
Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))
Plug 'rakr/vim-one', Cond(!exists('g:vscode'))
Plug 'catppuccin/nvim', Cond(!exists('g:vscode'), { 'as': 'catppuccin' })
Plug 'itchyny/vim-cursorword', Cond(!exists('g:vscode'))
call plug#end()

source ~/.config/nvim/general.vimrc
source ~/.config/nvim/keys.vimrc
source ~/.config/nvim/plugins.vimrc
