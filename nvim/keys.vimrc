let mapleader = " "
let g:mapleader = " "

" move exactly one line
nnoremap j gj
nnoremap k gk

" Shortcuts
inoremap jj <Esc>
map s <Plug>(easymotion-prefix)
nnoremap <leader>ei :tabe $MYVIMRC<CR>
nnoremap <leader>so :so $MYVIMRC<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>sp :sp<CR>:UltiSnipsEdit<CR>
nnoremap <leader>gs :Gstatus<CR>

" change directory to match current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" <Tab> compeletion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

function! Expander()
  let line = getline(".")
  let col = col(".")
  let first = line[col-2]
  let second = line[col-1]
  let third = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"
    else
      return "\<CR>"
    endif
  else
    return "\<CR>"
  endif
endfunction

inoremap <expr> <CR> Expander()
