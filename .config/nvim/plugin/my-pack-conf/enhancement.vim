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

" plugin:nerdtree {{{
" autocmd FileType tagbar setlocal nocursorcolumn
let g:NERDTreeWinSize = 39
" показывать все скрытые файлы
let NERDTreeIgnore = []
let NERDTreeRespectWildIgnore = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinPos = 'right'
let NERDTreeCaseSensitiveSort = 1
let NERDTreeNaturalSort = 1
" https://github.com/scrooloose/nerdtree/pull/417
function NERDTreeMyOpenFile(node)
  call a:node.activate({'reuse': 'currenttab', 'where': 'p'})
endfunction
autocmd VimEnter * :call NERDTreeAddKeyMap({ 'key': 'o', 'callback': 'NERDTreeMyOpenFile', 'scope': 'FileNode', 'override': 1 })
" }}}

" plugin:nerdtree-git {{{
" }}}

" plugin:startify {{{
let g:startify_disable_at_vimenter = 1
let g:startify_session_dir         = '~/.local/share/nvim/sessions/'
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
  \ 'set splitbelow splitright',
  \ 'call DeleteOtherBuffers()',
  \ 'call SaveTabVars()',
  \ ]
let g:startify_session_savevars = [
  \ 'g:TabVars',
  \ 'g:LastTab',
  \ ]
let g:startify_session_savecmds = [
  \ 'call RestoreTabVars()',
  \ 'call RefreshAllTabpagebuffer()',
  \ ]

" }}}

" NeoBundle 'DeaR/vim-tabpagebuffer-misc', {'depends': 'Shougo/tabpagebuffer.vim'}
" let g:tabpagebuffer#command#bdelete_keeptabpage = 1

" " plugin:obsession {{{
" " }}}

" " plugin:prosession {{{
" let g:prosession_dir = '~/.local/share/nvim/sessions/'
" let g:prosession_tmux_title = 1
" " }}}

" plugin:fzf {{{
let g:fzf_action = {
  \ 'ctrl-s': function('BuildFZFQuickfixList'),
  \ 'ctrl-d': function('EchoLines'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:fzf_layout = { 'window': 'aboveleft 12split enew' }

command! -nargs=* Ag call fzf#vim#ag(<q-args>, '-i --line-numbers --hidden -S', g:fzf_layout)

let $FZF_DEFAULT_OPTS = '--height 13 --layout=reverse-list --bind alt-p:preview-up,alt-n:preview-down,ctrl-f:page-down,ctrl-b:page-up,ctrl-h:backward-kill-word,ctrl-n:down,ctrl-p:up,ctrl-j:next-history,ctrl-k:previous-history --color=dark'

"function! s:fzf_statusline()
"  highlight default fzf1 ctermfg=161 ctermbg=238 guifg=#E12672 guibg=#545454
"  highlight default fzf2 ctermfg=151 ctermbg=238 guifg=#BCDDBD guibg=#545454
"  highlight default fzf3 ctermfg=252 ctermbg=238 guifg=#D9D9D9 guibg=#545454
"  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
"endfunction

"autocmd! User FzfStatusLine call <SID>fzf_statusline()
" }}}

" plugin:fzf-quickfix {{{
" }}}

" plugin:ft-gitcommit-plugin {{{
" }}}

" plugin:fugitive {{{
" }}}

" plugin:gv {{{
" }}}

" plugin:gitv {{{
" }}}

" plugin:gitgutter {{{
" }}}

" метки
" plugin:signature {{{
" }}}

" plugin:vimlparser {{{
" }}}

" plugin:vimlint {{{
" }}}

" plugin:ultisnips {{{
let g:UltiSnipsListSnippets = '<LocalLeader><Tab>'
" }}}

" plugin:snippets {{{
" }}}

" plugin:ale {{{
let g:ale_javascript_prettier_options='--trailing-comma es5 --print-width 120'
" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
" let g:ale_open_list = 1
let g:ale_fixers = {'javascript': ['prettier', 'eslint', 'standard']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" if empty(glob(getcwd().'/.eslint*'))
"   let g:ale_linters_ignore = ['eslint']
" endif
" }}}

" `bash install.sh`
" plugin:languageclient {{{
let g:LanguageClient_serverCommands = {
\ 'javascript': ['javascript-typescript-stdio'],
\ 'javascript.jsx': ['javascript-typescript-stdio'],
\ }
let g:LanguageClient_hoverPreview = 'Always'
" }}}

" plugin:deoplete {{{
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
call deoplete#custom#option({
\ 'auto_complete_delay': 2000,
\ })
" https://github.com/SirVer/ultisnips/issues/517
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
" }}}
