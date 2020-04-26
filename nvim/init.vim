call plug#begin('~/.config/nvim/plugged')
Plug 'vimwiki/vimwiki'

"---------- Navigation ----------
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

"---------- Completion ----------
Plug 'othree/jspc.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

"---------- Syntax Checking & Formatting ----------
Plug 'w0rp/ale'
Plug 'Chiel92/vim-autoformat'

"---------- Utility ----------
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'

"---------- Git ----------
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"---------- JavaScript ----------
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jxnblk/vim-mdx-js'
Plug 'maksimr/vim-jsbeautify'
Plug 'heavenshell/vim-jsdoc'

"---------- CSS ----------
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

"---------- UI ----------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'itchyny/vim-cursorword'
Plug 'Valloric/MatchTagAlways'
" Plug 'ryanoasis/vim-devicons'
call plug#end()

source ~/.config/nvim/general.vimrc
source ~/.config/nvim/keys.vimrc
source ~/.config/nvim/plugins.vimrc
