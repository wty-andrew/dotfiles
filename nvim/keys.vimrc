let mapleader = " "
let g:mapleader = " "

" move exactly one line
nnoremap j gj
nnoremap k gk

" Shortcuts
inoremap jj <Esc>
map s <Plug>(easymotion-prefix)

if exists('g:vscode')
  nnoremap <expr> <Leader><Space> VSCodeNotify('workbench.action.showCommands')
  nnoremap <expr> <Leader><Enter> VSCodeNotify('workbench.action.openLink')
  nnoremap <expr> <Leader><Tab> VSCodeNotify('workbench.action.openNextRecentlyUsedEditorInGroup')

  nnoremap <expr> <Leader>/ VSCodeNotify('workbench.action.findInFiles')

  nnoremap <expr> <Leader>bb VSCodeNotify('workbench.action.showAllEditors')
  nnoremap <expr> <Leader>bd VSCodeNotify('workbench.action.closeActiveEditor')
  nnoremap <expr> <Leader>bn VSCodeNotify('workbench.action.nextEditor')
  nnoremap <expr> <Leader>bp VSCodeNotify('workbench.action.previousEditor')

  nnoremap <expr> <Leader>Bt VSCodeNotify('bookmarks.toggle')
  nnoremap <expr> <Leader>Bl VSCodeNotify('bookmarks.list')

  nnoremap <expr> <Leader>ed VSCodeNotify('workbench.action.openSettingsJson')
  nnoremap <expr> <Leader>es VSCodeNotify('workbench.action.openSnippets')
  nnoremap <expr> <Leader>ek VSCodeNotify('workbench.action.openGlobalKeybindings')

  nnoremap <expr> <Leader>ff VSCodeNotify('workbench.action.files.openFile')
  nnoremap <expr> <Leader>fd VSCodeNotify('workbench.action.files.openFolder')
  nnoremap <expr> <Leader>fr VSCodeNotify('workbench.action.openRecent')
  nnoremap <expr> <Leader>fs VSCodeNotify('workbench.action.files.save')
  nnoremap <expr> <Leader>ft VSCodeNotify('workbench.action.toggleSidebarVisibility')
  nnoremap <expr> <Leader>fy VSCodeNotify('workbench.action.files.copyPathOfActiveFile')

  nnoremap <expr> <Leader>vd VSCodeNotify('workbench.view.debug')
  nnoremap <expr> <Leader>ve VSCodeNotify('workbench.view.explorer')
  nnoremap <expr> <Leader>vs VSCodeNotify('workbench.view.search')

  nnoremap <expr> <Leader>tb VSCodeNotify('workbench.action.tasks.build')
  nnoremap <expr> <Leader>tt VSCodeNotify('workbench.action.tasks.test')

  nnoremap <expr> <Leader>TF VSCodeNotify('workbench.action.toggleFullScreen')
  nnoremap <expr> <Leader>TM VSCodeNotify('workbench.action.toggleMenuBar')
  nnoremap <expr> <Leader>TA VSCodeNotify('workbench.action.toggleActivityBarVisibility')

  nnoremap <expr> <Leader>w/ VSCodeNotify('workbench.action.splitEditor')
  nnoremap <expr> <Leader>w- VSCodeNotify('workbench.action.splitEditorDown')
  nnoremap <expr> <Leader>wd VSCodeNotify('workbench.action.closeEditorsInGroup')
  nnoremap <expr> <Leader>wh VSCodeNotify('workbench.action.focusPreviousGroup')
  nnoremap <expr> <Leader>wH VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')
  nnoremap <expr> <Leader>wj VSCodeNotify('workbench.action.focusBelowGroup')
  nnoremap <expr> <Leader>wJ VSCodeNotify('workbench.action.moveActiveEditorGroupDown')
  nnoremap <expr> <Leader>wk VSCodeNotify('workbench.action.focusAboveGroup')
  nnoremap <expr> <Leader>wK VSCodeNotify('workbench.action.moveActiveEditorGroupUp')
  nnoremap <expr> <Leader>wl VSCodeNotify('workbench.action.focusNextGroup')
  nnoremap <expr> <Leader>wL VSCodeNotify('workbench.action.moveActiveEditorGroupRight')
  nnoremap <expr> <Leader>wm VSCodeNotify('workbench.action.toggleEditorWidths')

  nnoremap <expr> <Leader>qr VSCodeNotify('workbench.action.reloadWindow')
else
  nnoremap <leader>ei :tabe $MYVIMRC<CR>
  nnoremap <leader>es :sp<CR>:UltiSnipsEdit<CR>
  nnoremap <leader>nt :NERDTreeToggle<CR>
  nnoremap <leader>so :so $MYVIMRC<CR>
  nnoremap <leader>gs :Gstatus<CR>
endif

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
