" System:
if dein#tap('PreserveNoEOL')
  let g:PreserveNoEOL = 1
endif

if dein#tap('editorconfig-vim')
  let g:EditorConfig_preserve_formatoptions = 1
endif

if dein#tap('confirm-quit')
  let g:confirm_quit_nomap = 1
endif

" Filetypes:
if dein#tap('vim-mustache-handlebars')
  autocmd BufNewFile,BufRead *.tpl setfiletype mustache
endif

if dein#tap('vim-json')
  let g:vim_json_syntax_conceal = 0
  " let g:vim_json_warnings = 0
  autocmd BufNewFile,BufRead .eslintrc,.babelrc setlocal filetype=json
endif

if dein#tap('vim-javascript')
  let g:javascript_enable_domhtmlcss=1
  " autocmd BufNewFile,BufRead *.jsx setfiletype javascript
endif

if dein#tap('vim-jsx')
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files
endif

if dein#tap('vim-markdown')
  " let g:vim_markdown_initial_foldlevel=3
  " let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
  " TODO комментарии по gcc
  " let html_no_rendering=1
endif

" Themes:
if dein#tap('seoul256.vim')
  " не включаем цветную тему для tty терминала
  if $TERM != 'linux'
    if has("gui_running") || has("nvim") " цвета не совпадают в терминале и в gui
      let g:seoul256_background = 235
    else
      let g:seoul256_background = 236
    endif
    " vim-unimpaired TODO
    " function s:mapUnimpaired()
    "   nnoremap [ob :set background=light<CR>
    "   nnoremap ]ob :set background=dark<CR>
    "   nnoremap cob :set background=<C-R>=&background == 'dark' ? 'light' : 'dark'<CR><CR>
    " endfunction
    " function s:mapSeoulUnimpaired()
    "   nnoremap [ob :colorscheme seoul256-light<CR>
    "   nnoremap ]ob :colorscheme seoul256<CR>
    "   nnoremap cob :colorscheme <C-R>=&background == 'dark' ? 'seoul256-light' : 'seoul256'<CR><CR>
    " endfunction
    " autocmd ColorScheme * call <SID>mapUnimpaired()
    " autocmd ColorScheme seoul256 call <SID>mapSeoulUnimpaired()
    colorscheme seoul256
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
endif

if dein#tap('vim-airline-themes')
  " let g:airline_theme='tomorrow'
  let g:airline_theme='distinguished'
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

" Extends:
if dein#tap('vim-ctrlspace')
  autocmd BufNewFile,BufRead cs_workspaces setlocal filetype=vim
  let g:CtrlSpaceSaveWorkspaceOnExit = 1
  let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
  " TODO отключить Ctrl-o
  let g:CtrlSpaceGlobCommand = 'ag -l --hidden --nocolor -g ""'
  let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
endif

" ctrlspace
" NeoBundle 'DeaR/vim-tabpagebuffer-misc', {'depends': 'Shougo/tabpagebuffer.vim'}
" " не удалять вкладочные буферы
" " let g:tabpagebuffer#command#bdelete_keeptabpage = 1

" ctrlspace
" автосохранение сессий
" NeoBundle 'xolox/vim-session', {'depends': 'xolox/vim-misc'}
" let g:session_autosave='yes'
" let g:session_autoload='yes'
" set sessionoptions-=help
" " set sessionoptions-=buffers
" let g:session_command_aliases = 1
" " TODO t:tabpagebuffer
" " let g:session_persist_globals = []

if dein#tap('vim-ctrlspace')
  let g:speeddating_no_mappings=1
  nmap  <A-a>     <Plug>SpeedDatingUp
  nmap  <A-x>     <Plug>SpeedDatingDown
  xmap  <A-a>     <Plug>SpeedDatingUp
  xmap  <A-x>     <Plug>SpeedDatingDown
  nmap d<A-a>     <Plug>SpeedDatingNowUTC
  nmap d<A-x>     <Plug>SpeedDatingNowLocal
endif

if dein#tap('vim-shell')
  let g:shell_mappings_enabled=0
  " скрывать вкладки
  " inoremap <F11> <C-o>:Fullscreen<CR>
  " nnoremap <F11> :Fullscreen<CR>
  " let g:shell_fullscreen_items='mT'
  nnoremap gx :Open<CR>
endif

if dein#tap('open-browser.vim')
  vmap gx <Plug>(openbrowser-smart-search)
  vmap <F6> <Plug>(openbrowser-smart-search)
endif

if dein#tap('undotree')
  function g:Undotree_CustomMap()
    silent! nunmap <buffer> <Tab>
  endfunc
  nnoremap <Leader>ut :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_WindowLayout = 4
endif

if dein#tap('nerdtree')
  " autocmd FileType nerdtree,tagbar setlocal nocursorcolumn
  let g:NERDTreeWinSize=50
  let g:NERDTreeMinimalUI=1
  " let g:NERDTreeWinPos='right'
  nnoremap <Leader>\ :NERDTree<CR>
  " показывать все скрытые файлы
  let NERDTreeIgnore=[]
endif

if dein#tap('vim-nerdtree-tabs')
  let g:nerdtree_tabs_open_on_gui_startup = 0
  nnoremap <C-\> :NERDTreeTabsToggle<CR>
  nnoremap <A-\> :NERDTreeTabsFind<CR>
endif

if dein#tap('vim-fugitive')
  set previewheight=20
  " nmap <Leader>gs :Gstatus<CR><C-w>10+
  nnoremap <Leader>gs :Gstatus<CR>
  " проиндексировать все изменения и сделать коммит
  command IGitAddAllCommit Git add --all . | Gcommit
endif

if dein#tap('gitv')
  nnoremap <Leader>gv :Gitv --all<CR>
  nnoremap <Leader>gV :Gitv! --all<CR>
  vnoremap <Leader>gV :Gitv! --all<CR>
endif

if dein#tap('gitignore.vim')
  autocmd BufNewFile,BufRead .gitignore_global setlocal filetype=gitignore
endif

if dein#tap('vim-gitgutter')
  " GitGutter stuff (similar to what unimpaired.vim does).
  nnoremap [h :GitGutterPrevHunk<CR>
  nnoremap ]h :GitGutterNextHunk<CR>
endif

if dein#tap('vim-slime')
  let g:slime_target = 'tmux'
  let g:slime_no_mappings = 1
  xmap <LocalLeader>s <Plug>SlimeRegionSend
  nmap <LocalLeader>s <Plug>SlimeMotionSend
  nmap <LocalLeader>ss <Plug>SlimeLineSend
  let g:slime_default_config = {'socket_name': 'slime', 'target_pane': '0'}
endif

if dein#tap('syntastic')
  let g:syntastic_error_symbol = 'E!'
  let g:syntastic_style_error_symbol = 'SE'
  let g:syntastic_warning_symbol = 'W!'
  let g:syntastic_style_warning_symbol = 'SW'
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1 " автоматически открывать и закрывать :Errors
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_loc_list_height = 5
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
  nnoremap <F5> :SyntasticCheck<CR>
  " let g:syntastic_html_tidy_ignore_errors=['trimming empty <i>', 'trimming empty <span>', '<form> lacks "action" attribute', '<input> proprietary attribute "required"']
  " let g:syntastic_html_checkers=['tidy','jshint']
  " autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs'] : ['jshint']
  " https://github.com/airbnb/javascript/issues/465#issuecomment-173000798
  function! SyntasticESlintChecker()
    let l:npm_bin = ''
    let l:eslint = 'eslint'

    if executable('npm')
        let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif

    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
      let l:eslint = l:npm_bin . '/eslint'
    endif

    let b:syntastic_javascript_eslint_exec = l:eslint
  endfunction


  " let g:syntastic_javascript_checkers = ["eslint"]

  autocmd FileType javascript,javascript.jsx :call SyntasticESlintChecker()
  let g:syntastic_javascript_checkers = ['eslint', 'flow']
  let g:syntastic_jade_checkers = ['jade_lint']
endif

if dein#tap('ultisnips')
  let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
  autocmd Filetype html :UltiSnipsAddFiletypes html.javascript
  autocmd Filetype javascript,javascript.jsx :UltiSnipsAddFiletypes javascript-jsdoc
  autocmd Filetype javascript,javascript.jsx :UltiSnipsAddFiletypes javascript-node
endif

if dein#tap('YouCompleteMe')
  let g:neobundle#install_process_timeout = 1500
  let g:ycm_key_list_select_completion = ['<Down>'] " ctrl-n
  let g:ycm_key_list_previous_completion = ['<Up>'] " ctrl-p
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_complete_in_comments = 1 
  let g:ycm_seed_identifiers_with_syntax = 1
  let g:ycm_collect_identifiers_from_comments_and_strings = 1
  let g:ycm_collect_identifiers_from_tags_files = 1
  " если 1, то при русской раскладке могут вставиться буквы английской
  let g:ycm_auto_trigger = 0 " CTRL-X CTRL-U
  " let g:ycm_min_num_of_chars_for_completion = 99
  function! ToggleYcmAutoTrigger()
    if g:ycm_auto_trigger
      let g:ycm_auto_trigger = 0
    else
      let g:ycm_auto_trigger = 1
    endif
    echo 'g:ycm_auto_trigger = '.g:ycm_auto_trigger
  endfunction
  " TODO режим правки
  nnoremap <LocalLeader><C-Space> :call ToggleYcmAutoTrigger()<CR>
endif

if dein#tap('vim-sneak')
  let g:sneak#streak = 1
  nmap <Leader>s <Plug>Sneak_s
  nmap <Leader>S <Plug>Sneak_S
  xmap <Leader>s <Plug>Sneak_s
  xmap <Leader>S <Plug>Sneak_S
  omap <Leader>s <Plug>Sneak_s
  omap <Leader>S <Plug>Sneak_S
endif
