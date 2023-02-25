"---------- CtrlP Settings ---------- 
let g:ctrlp_custom_ignore = '\v[\/](node_modules|venv|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_cmd = 'CtrlP :pwd'
let g:ctrlp_show_hidden = 1

"---------- Vimwiki Settings ---------- 
let g:vimwiki_folding = 'custom'
let g:vimwiki_listsyms = ' .oO✓'
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_list = [
\ {'path': '$HOME/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path': '/Diary/', 'nested_syntaxes': {'py': 'python', 'js': 'javascript', 'css': 'css'}},
\ {'path': '$HOME/Dropbox/vimwiki/Notes/', 'syntax': 'markdown', 'ext': '.md', 'nested_syntaxes': {'py': 'python', 'js': 'javascript', 'css': 'css', 'sh': 'bash'}},
\ {'path': '$HOME/Dropbox/vimwiki/Japanese/', 'syntax': 'markdown', 'ext': '.md'},
\]

"---------- UltiSnips Settings ---------- 
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips', 'UltiSnips']

"---------- Nerd Tree Settings ----------
let g:NERDTreeWinPos = 'right'
let NERDTreeShowHidden = 1
let NERDTreeIgnore=[
\ '\.swp',
\ '\.pyc$',
\ '\.egg-info[[dir]]',
\ '\.__pycache__[[dir]]',
\ '\.git[[dir]]',
\ '^node_modules[[dir]]'
\]

"---------- Nerd Commenter Settings ---------- 
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

"---------- Airline Settings ---------- 
let g:airline_powerline_fonts = 1
let g:airline_theme='one'
let g:airline#extensions#ale#enabled = 1

