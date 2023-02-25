set encoding=utf8
set clipboard=unnamedplus

"---------- Spaces & Tabs ----------
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

"---------- UI ----------
set number
set cursorline
set ruler
set mousehide
set listchars=space:·,eol:¬
set nolist
set background=light
set colorcolumn=81
colorscheme one

"---------- Searching ----------
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildignorecase

"---------- Folding ----------
set foldmethod=syntax
set foldlevelstart=20
set foldenable

set nobackup
set noswapfile
set nowritebackup
set backspace=indent,eol,start
set laststatus=2
set autoindent
set ch=2
set splitbelow

"---------- FileType Settings ----------
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd BufNewFile,BufRead *.launch set syntax=xml
autocmd BufNewFile,BufRead *.test set syntax=xml
autocmd BufNewFile,BufRead .customrc set syntax=sh

"---------- Disable preview ----------
set completeopt-=preview
