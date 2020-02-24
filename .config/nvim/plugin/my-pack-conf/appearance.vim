if !(exists('g:myPackConfOpt') && g:myPackConfOpt)
  finish
endif
if (exists('g:loaded_myPackConfAppearance') && g:loaded_myPackConfAppearance)
  finish
endif
let g:loaded_myPackConfAppearance = 1

" let g:terminal_color_0  = '#2e3436'
" let g:terminal_color_1  = '#cc0000'
" let g:terminal_color_2  = '#4e9a06'
" let g:terminal_color_3  = '#c4a000'
" let g:terminal_color_4  = '#3465a4'
" let g:terminal_color_5  = '#75507b'
" let g:terminal_color_6  = '#0b939b'
" let g:terminal_color_7  = '#d3d7cf'
" let g:terminal_color_8  = '#555753'
" let g:terminal_color_9  = '#ef2929'
" let g:terminal_color_10 = '#8ae234'
" let g:terminal_color_11 = '#fce94f'
" let g:terminal_color_12 = '#729fcf'
" let g:terminal_color_13 = '#ad7fa8'
" let g:terminal_color_14 = '#00f5e9'
" let g:terminal_color_15 = '#eeeeec'

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
if (exists('g:colors_name'))
  if (g:colors_name == 'dracula')
    let g:airline_theme='dracula'
  elseif (g:colors_name == 'pencil')
    let g:airline_theme = 'pencil'
  elseif (g:colors_name == 'seoul256')
    let g:airline_theme='distinguished'
  elseif (g:colors_name == 'seoul256-light')
    let g:airline_theme='sol'
  endif
endif
" }}}

" plugin:togglecursor {{{
let g:togglecursor_leave='blinking_block'
" }}}

" plugin:goyo {{{
" }}}

" plugin:limelight {{{
" }}}
