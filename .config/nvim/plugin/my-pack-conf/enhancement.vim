if !(exists('g:myPackConfOpt') && g:myPackConfOpt)
  finish
endif
if (exists('g:loaded_myPackConfEnhancement') && g:loaded_myPackConfEnhancement)
  finish
endif
let g:loaded_myPackConfEnhancement = 1

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

let g:fzf_layout = { 'window': 'top 12split enew' }

command! -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore-case --line-numbers --hidden --smart-case', g:fzf_layout)

autocmd! FileType fzf setlocal nonumber norelativenumber
" }}}

" plugin:ctrlspace {{{
let g:CtrlSpaceGlobCommand = 'ag --files-with-matches --nocolor -g ""'
let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
highlight CtrlSpaceNormal ctermfg=252 ctermbg=236
highlight CtrlSpaceSelected ctermfg=252 ctermbg=23
" autocmd BufDelete CtrlSpace setlocal signcolumn=no
" autocmd BufNewFile,BufRead cs_workspaces setlocal filetype=vim
" }}}
