if !(exists('g:myPackConfOpt') && g:myPackConfOpt)
  finish
endif
if (exists('g:loaded_myPackConfAppearance') && g:loaded_myPackConfAppearance)
  finish
endif
let g:loaded_myPackConfAppearance = 1

" plugin:seoul256 {{{
if has("gui_running") || has("nvim") " цвета не совпадают в терминале и в gui
  let g:seoul256_srgb = 1
  let g:seoul256_background = 237
else
  let g:seoul256_background = 236
endif
" }}}

" plugin:base16 {{{
" }}}

" plugin:dracula {{{
let g:dracula_colorterm=0
" }}}

" plugin:airline {{{
" странно работает подсветка активного окна
" let g:airline_exclude_preview = 1
" }}}

" plugin:airline-themes {{{
if (g:colors_name == 'dracula')
  let g:airline_theme='dracula'
elseif (g:colors_name == 'pencil')
  let g:airline_theme = 'pencil'
elseif (g:colors_name == 'seoul256')
  let g:airline_theme='distinguished'
elseif (g:colors_name == 'seoul256-light')
  let g:airline_theme='sol'
endif
" }}}

" plugin:togglecursor {{{
let g:togglecursor_leave='blinking_block'
" }}}

" plugin:goyo {{{
" }}}

" plugin:limelight {{{
" }}}
