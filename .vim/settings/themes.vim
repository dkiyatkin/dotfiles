" Themes:
if dein#tap('seoul256.vim')
  " не включаем цветную тему для tty терминала
  if $TERM != 'linux'
    if has("gui_running") || has("nvim") " цвета не совпадают в терминале и в gui
      let g:seoul256_background = 235
    else
      let g:seoul256_background = 236
    endif

    function s:colorschemeSeoul256()
      " let g:airline_theme='tomorrow'
      let g:airline_theme='distinguished'
      colorscheme seoul256
    endfunction

    function s:colorschemeSeoul256Light()
      let g:airline_theme='sol'
      colorscheme seoul256-light
    endfunction

    function s:mapUnimpaired()
      nnoremap [ob :set background=light<CR>
      nnoremap ]ob :set background=dark<CR>
      nnoremap cob :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
    endfunction

    function s:mapUnimpairedSeoul()
      nnoremap [ob :call <SID>colorschemeSeoul256Light()<CR>
      nnoremap ]ob :call <SID>colorschemeSeoul256()<CR>
      nnoremap cob :call <C-R>=&background == 'dark' ? '<SID>colorschemeSeoul256Light()' : '<SID>colorschemeSeoul256()'<CR><CR>
    endfunction

    function s:mapUnimpairedColorScheme()
      if exists('g:colors_name')
        if g:colors_name == 'seoul256' || g:colors_name == 'seoul256-light'
          call <SID>mapUnimpairedSeoul()
        endif
      endif
    endfunction

    autocmd VimEnter * call <SID>mapUnimpairedColorScheme()
    autocmd ColorScheme * call <SID>mapUnimpaired()
    autocmd ColorScheme seoul256,seoul256-light call <SID>mapUnimpairedSeoul()

    call <SID>colorschemeSeoul256()

  endif
endif

if dein#tap('vim-airline')
  " let g:airline_left_sep = '⮀'
  " let g:airline_left_alt_sep = '⮁'
  " let g:airline_right_sep = '⮂'
  " let g:airline_right_alt_sep = '⮃'
  " let g:airline_exclude_preview = 1 " ctrlspace

  " let g:airline_powerline_fonts = 1
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_detect_iminsert = 1

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#tab_min_count = 2 " при скольки вкладках показывать tabline
  let g:airline#extensions#tabline#show_close_button = 0 " переключает на буферы

  " TODO `)` после номера
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = ''
endif

if dein#tap('vim-togglecursor')
  " let g:loaded_togglecursor = 0
  let g:togglecursor_leave='blinking_block'
endif

if dein#tap('goyo.vim')
  " let g:goyo_width (default: 80)
  " let g:goyo_height (default: 85%)
  " let g:goyo_linenr (default: 0)
  noremap <C-F11> :Goyo<CR>
  vnoremap <C-F11> <Esc>:Goyo<CR>gv
  inoremap <C-F11> <Esc>:Goyo<CR>
  cnoremap <C-F11> <C-c>:Goyo<CR>
endif

if dein#tap('limelight.vim')
  nmap <Leader>l <Plug>(Limelight)
  xmap <Leader>l <Plug>(Limelight)
  nnoremap <silent> <Leader>L :Limelight!!<CR>
  " Color name (:help cterm-colors) or ANSI code
  " let g:limelight_conceal_ctermfg = 'gray'
  " let g:limelight_conceal_ctermfg = 240
  "
  " " Color name (:help gui-colors) or RGB color
  " let g:limelight_conceal_guifg = 'DarkGray'
  " let g:limelight_conceal_guifg = '#777777'

  " Default: 0.5
  let g:limelight_default_coefficient = 0.7

  " Number of preceding/following paragraphs to include (default: 0)
  let g:limelight_paragraph_span = 1

  " Beginning/end of paragraph
  "   When there's no empty line between the paragraphs
  "   and each paragraph starts with indentation
  " let g:limelight_bop = '^\s'
  " let g:limelight_eop = '\ze\n^\s'

  " Highlighting priority (default: 10)
  "   Set it to -1 not to overrule hlsearch
  let g:limelight_priority = -1
endif

if dein#tap('goyo.vim') && dein#tap('limelight.vim')
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
endif
