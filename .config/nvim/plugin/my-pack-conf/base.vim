if (exists('g:loaded_myPackConfBase') && g:loaded_myPackConfBase)
  finish
endif
let g:loaded_myPackConfBase = 1

" общие конфигурации для файлов
" plugin:editorconfig {{{
let g:EditorConfig_preserve_formatoptions = 1
" }}}

" plugin:sensible {{{
" }}}

" plugin:matchup {{{
let g:matchup_matchparen_status_offscreen = 0
let loaded_matchit = 1
" }}}

" умная вставка, i_ctrl-r не применяется
" plugin:bracketed-paste {{{
" }}}

" plugin:repeat {{{
" }}}

" plugin:surround {{{
" }}}

" plugin:unimpaired {{{
" }}}

" change cw, cW
" plugin:ykutw {{{
" }}}

" plugin:fetch {{{
" }}}

" plugin:rel-jump {{{
" }}}

" plugin:bclose {{{
" }}}

" plugin:bufmru {{{
" }}}

" plugin:abolish {{{
" }}}

" plugin:pasteurize {{{
" }}}

" plugin:visualstar {{{
" let g:visualstar_extra_commands = 'zzzv'
" }}}

" plugin:stay {{{
set viewoptions=cursor,folds,slash,unix
" }}}

" plugin:speeddating {{{
" }}}

" plugin:tcomment {{{
" }}}

" plugin:sneak {{{
" let g:sneak#label = 1
" }}}

" plugin:tabular {{{
" }}}

" plugin:bufferize {{{
let g:bufferize_command = 'vnew'
" }}}

" plugin:ack {{{
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0
" }}}

" plugin:scratch {{{
let g:scratch_insert_autohide = 0
let g:scratch_autohide = 0
let g:scratch_height = 10
" }}}

" оставлять окончание файла как есть
" plugin:preservenoeol {{{
let g:PreserveNoEOL = 1
" }}}

" plugin:fish {{{
" }}}

" plugin:colors-pencil {{{
" }}}

" plugin:highlightedyank {{{
let g:highlightedyank_highlight_duration = 250
" }}}

" plugin:targets {{{
" }}}

" plugin:miniyank {{{
let g:miniyank_delete_maxlines = 0
let g:miniyank_filename = $HOME."/.local/share/nvim/.miniyank.mpack"
" }}}

" plugin:windowswap {{{
let g:windowswap_map_keys = 0
" }}}

" plugin:tmux-focus-events {{{
" }}}

" plugin:tmux-clipboard {{{
" }}}

" plugin:tmux-navigator {{{
let g:tmux_navigator_no_mappings = 1
" }}}

" plugin:tmux {{{
" }}}
