if !(exists('g:myPackConfOpt') && g:myPackConfOpt)
  finish
endif
if (exists('g:loaded_myPackConfEnhancement') && g:loaded_myPackConfEnhancement)
  finish
endif
let g:loaded_myPackConfEnhancement = 1

" plugin:bookmarks {{{
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save_file = $HOME.'/.local/share/nvim/bookmarks.vim'
" }}}

" plugin:undotree {{{
let g:undotree_SplitWidth = 29
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 3
" }}}

" plugin:fzf {{{
" \ 'ctrl-s': function('BuildFZFQuickfixList'),
" \ 'ctrl-d': function('EchoLines'),
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = $HOME.'/.local/share/nvim/fzf-history'

let g:fzf_layout = { 'window': 'aboveleft 12split enew' }

command! -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore-case --line-numbers --hidden --smart-case', g:fzf_layout)
" }}}

" plugin:ctrlspace {{{
let g:CtrlSpaceGlobCommand = 'ag --files-with-matches --nocolor -g ""'
let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
hi CtrlSpaceNormal   ctermfg=252 ctermbg=236
hi CtrlSpaceSelected ctermfg=252 ctermbg=23
autocmd BufDelete CtrlSpace setlocal signcolumn=no
autocmd BufNewFile,BufRead cs_workspaces setlocal filetype=vim
" }}}

" plugin:startify {{{
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = []
let g:startify_files_number = 5
let g:startify_enable_special = 0
let g:startify_use_env = 1
let g:startify_relative_path = 1
let g:startify_session_dir = '~/.local/share/nvim/session'
let g:startify_skiplist = [
       \ '^/usr/local/share/nvim/site/pack/git/.*/doc/.*.txt',
       \ '^/mnt/cloud',
       \ '^/tmp',
       \ ]
autocmd User Startified for key in ['q', 'e'] |
      \ execute 'nunmap <buffer>' key | endfor
autocmd User Startified setlocal cursorline
" }}}
