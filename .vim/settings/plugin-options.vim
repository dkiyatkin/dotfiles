" System:
if exists('g:dein#_runtime_path')
  call AddCmd('common',
  \ 'dein, package, manager, plugin, install | установить плагины                               ', '<Leader>pmi',
  \ 'call dein#install()'
  \ )

  call AddCmd('common',
  \ 'dein, package, manager, plugin, recache | перекэшировать, отключить неиспользуемые плагины ', '<Leader>pmr',
  \ 'call dein#recache_runtimepath()'
  \ )

  call AddCmd('common',
  \ 'dein, package, manager, plugin, update | обновить плагины                                  ', '<Leader>pmu',
  \ 'call dein#update()'
  \ )
endif

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

if dein#tap('vim-markdown')
  " let g:vim_markdown_initial_foldlevel=3
  " let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
  " TODO комментарии по gcc
  " let html_no_rendering=1
endif

if dein#tap('vim-css-color')
  call AddCmd('common',
  \ 'css, color, enable | включить css цвета                                                    ', '<Leader>[oc',
  \ 'call css_color#enable()'
  \ )
  call AddCmd('common',
  \ 'css, color, disable | выключить css цвета                                                  ', '<Leader>]oc',
  \ 'call css_color#disable()'
  \ )
  call AddCmd('common',
  \ 'css, color, toggle | переключить css цвета                                                 ', '<Leader>coc',
  \ 'call css_color#toggle()'
  \ )
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

if dein#tap('vim-highlightedyank')
  let g:highlightedyank_highlight_duration = 250
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
  let NERDTreeRespectWildIgnore = 1
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

if dein#tap('ruanyl/vim-fixmyjs')
  let g:fixmyjs_use_local = 1
endif
