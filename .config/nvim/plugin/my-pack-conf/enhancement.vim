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

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_layout = { 'window': 'aboveleft 12split enew' }

command! -nargs=* Ag call fzf#vim#ag(<q-args>, '-i --line-numbers --hidden -S', g:fzf_layout)
" }}}
