call plug#begin('~/.config/nvim/plugged')

function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

Plug 'vimwiki/vimwiki'

"---------- Navigation ----------
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'

"---------- Completion ----------
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'

"---------- Utility ----------
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
Plug 'vim-scripts/matchit.zip'

"---------- Git ----------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"---------- UI ----------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'itchyny/vim-cursorword'
call plug#end()

source ~/.config/nvim/general.vimrc
source ~/.config/nvim/keys.vimrc
source ~/.config/nvim/plugins.vimrc
