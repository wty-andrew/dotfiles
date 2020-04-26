"---------- vim-jsdoc Settings ----------
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1


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

"---------- Ale Settings ---------- 
let g:ale_sign_column_always = 1
"let g:ale_open_list = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\ 'javascript': ['eslint'],
\}
let g:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'python': ['autopep8'],
\}
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

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

"---------- Javascript-libraries-syntax Settings ---------- 
let g:used_javascript_libs = 'vue,react,chai'

"---------- Closetag Settings ---------- 
let g:closetag_filenames = "*.html,*.vue,*.jsx,*.js"

"---------- Emmet Settings ---------- 
let g:user_emmet_settings = {
\'javascript.jsx': {
\    'extends': 'jsx',
\  },
\}

"---------- vim-jsx Settings ---------- 
let g:jsx_ext_required = 0

"---------- MatchTagAlways Settings ---------- 
let g:mta_filetypes = {
\ 'html': 1,
\ 'javascript.jsx': 1,
\ 'vue': 1,
\}

"---------- auto-pairs Settings ---------- 
au Filetype lisp let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

