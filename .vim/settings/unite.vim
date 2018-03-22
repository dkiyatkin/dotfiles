scriptencoding utf-8
if dein#tap('unite.vim')
  " включаем панель строк в unite https://github.com/Shougo/unite.vim/issues/1042
  autocmd FileType unite setlocal number relativenumber
  " autocmd BufWinEnter,BufEnter * setlocal number relativenumber

  " Initialize Unite's global list of menus {{{
  if !exists('g:unite_source_menu_menus')
    let g:unite_source_menu_menus = {}
  endif

  " Новые меню Unite
  let g:unite_source_menu_menus.common = {'description': 'common commands'}
  " Define our list of [Label, Command] pairs
  let g:unite_source_menu_menus.common.command_candidates = []

  let g:unite_source_menu_menus.common2 = {'description': 'common commands'}
  let g:unite_source_menu_menus.common2.command_candidates = [
  \   ['Open/Close NERDTree', 'NERDTreeToggle'],
  \   ['Git Blame', 'Gblame'],
  \   ['Grep for TODOs', 'grep TODO']
  \ ]

  let s:action = ':<C-u>Unite menu:common -start-insert -ignorecase<CR>'
  " ctrlspace
  let s:defaultKey = "<C-Space>"
  if s:defaultKey ==? "<C-Space>" && !has("gui_running") && !has("win32") && !has("nvim")
    let s:defaultKey = "<Nul>"
  endif
  silent! exe 'nnoremap <unique><silent>' . s:defaultKey . ' ' . s:action

  " Создать новую комманду, добавить в меню Unite
  function AddCmd(menu_name, label, mapping, command)
    exe 'nnoremap <unique>' . a:mapping . ' :<C-u>' . a:command . '<CR>'
    " TODO русские буквы и len()
    " let s:label_and_mapping = a:label . '                                                                      '
    " let s:label_and_mapping = s:label_and_mapping[:84 - len(a:mapping)] . a:mapping
    let s:label_and_mapping = a:label . a:mapping
    call add(g:unite_source_menu_menus[a:menu_name].command_candidates, [s:label_and_mapping, a:command])
  endfunction

  " сортировка всех меню после запуска
  function s:UniteSourceMenuMenusSort()
    for key in keys(g:unite_source_menu_menus)
      call sort(g:unite_source_menu_menus[key].command_candidates)
    endfor
  endfunction
  autocmd VimEnter * call <SID>UniteSourceMenuMenusSort()
  " }}}

  " Стандартные клавиши с префиксом `<LocalLeader>` за исключением (->)
  let g:unite_no_default_keymappings = 1
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    " Normal mode key-mappings.
    nmap <buffer> <LocalLeader>i <Plug>(unite_insert_enter)
    nmap <buffer> <LocalLeader>I <Plug>(unite_insert_head)
    nmap <buffer> <LocalLeader>A <Plug>(unite_append_end)
    nmap <buffer> <LocalLeader>q <Plug>(unite_exit)
    nmap <buffer> <LocalLeader><C-g> <Plug>(unite_exit)
    nmap <buffer> <LocalLeader>Q <Plug>(unite_all_exit)
    nmap <buffer> <LocalLeader>g<C-g> <Plug>(unite_all_exit)
    nmap <buffer> <LocalLeader><CR> <Plug>(unite_do_default_action)
    nmap <buffer> <LocalLeader><Space> <Plug>(unite_toggle_mark_current_candidate)
    nmap <buffer> <LocalLeader><S-Space> <Plug>(unite_toggle_mark_current_candidate_up)
    nmap <buffer> <LocalLeader><Tab> <Plug>(unite_choose_action)
    nmap <buffer> <LocalLeader><C-n> <Plug>(unite_rotate_next_source)
    nmap <buffer> <LocalLeader><C-p> <Plug>(unite_rotate_previous_source)
    nmap <buffer> <LocalLeader><C-a> <Plug>(unite_print_message_log)
    nmap <buffer> <LocalLeader><C-k> <Plug>(unite_print_candidate)
    nmap <buffer> <LocalLeader><C-l> <Plug>(unite_redraw)
    nmap <buffer> <LocalLeader>gg <Plug>(unite_cursor_top)
    nmap <buffer> <LocalLeader><C-Home> <Plug>(unite_cursor_top)
    nmap <buffer> <LocalLeader>G <Plug>(unite_cursor_bottom)
    nmap <buffer> <LocalLeader><C-End> <Plug>(unite_cursor_bottom)$
    nmap <buffer> <LocalLeader>j <Plug>(unite_loop_cursor_down)
    nmap <buffer> <LocalLeader><Down> <Plug>(unite_loop_cursor_down)
    nmap <buffer> <LocalLeader>k <Plug>(unite_loop_cursor_up)
    nmap <buffer> <LocalLeader><Up> <Plug>(unite_loop_cursor_up)
    nmap <buffer> <LocalLeader>J <Plug>(unite_skip_cursor_down)
    nmap <buffer> <LocalLeader>K <Plug>(unite_skip_cursor_up)
    nmap <buffer> <LocalLeader><C-h> <Plug>(unite_delete_backward_path)
    nmap <buffer> <LocalLeader><C-r> <Plug>(unite_restart)
    nmap <buffer> <LocalLeader>* <Plug>(unite_toggle_mark_all_candidates)
    nmap <buffer> <LocalLeader>M <Plug>(unite_disable_max_candidates)
    nmap <buffer> <LocalLeader>g? <Plug>(unite_quick_help)
    nmap <buffer> <LocalLeader>N <Plug>(unite_new_candidate)
    nmap <buffer> <LocalLeader>. <Plug>(unite_narrowing_dot)
    nmap <buffer> <LocalLeader>p <Plug>(unite_smart_preview)
    nmap <buffer> <LocalLeader><2-LeftMouse> <Plug>(unite_do_default_action)
    nmap <buffer> <LocalLeader><RightMouse> <Plug>(unite_exit)

    nmap <silent><buffer><expr> <LocalLeader>a unite#smart_map("\<Plug>(unite_append_enter)", "\<Plug>(unite_choose_action)")
    nnoremap <silent><buffer><expr> <LocalLeader>d unite#do_action('delete')
    nnoremap <silent><buffer><expr> <LocalLeader>b unite#do_action('bookmark')
    nnoremap <silent><buffer><expr> <LocalLeader>e unite#do_action('edit')
    nmap <silent><buffer><expr> <LocalLeader>x <Plug>(unite_quick_match_default_action)
    nnoremap <silent><buffer><expr> <LocalLeader>t unite#do_action('tabopen')
    nnoremap <silent><buffer><expr> <LocalLeader>yy unite#do_action('yank')
    nnoremap <silent><buffer><expr> <LocalLeader>o unite#do_action('open')

    " Visual mode key-mappings.
    xmap <buffer> <LocalLeader><Space> <Plug>(unite_toggle_mark_selected_candidates)

    " Insert mode key-mappings.
    imap <buffer> <LocalLeader><TAB>     <Plug>(unite_choose_action)
    imap <buffer> <LocalLeader><C-n>     <Plug>(unite_select_next_line)
    imap <buffer> <LocalLeader><Down>    <Plug>(unite_select_next_line)
    imap <buffer> <LocalLeader><C-p>     <Plug>(unite_select_previous_line)
    imap <buffer> <LocalLeader><Up>      <Plug>(unite_select_previous_line)
    imap <buffer> <LocalLeader><C-f>     <Plug>(unite_select_next_page)
    imap <buffer> <LocalLeader><C-b>     <Plug>(unite_select_previous_page)
    imap <buffer> <LocalLeader><CR>      <Plug>(unite_do_default_action)
    imap <buffer> <LocalLeader><C-h>     <Plug>(unite_delete_backward_char)
    imap <buffer> <LocalLeader><BS>      <Plug>(unite_delete_backward_char)
    imap <buffer> <LocalLeader><C-u>     <Plug>(unite_delete_backward_line)
    imap <buffer> <LocalLeader><C-w>     <Plug>(unite_delete_backward_word)
    imap <buffer> <LocalLeader><C-a>     <Plug>(unite_move_head)
    imap <buffer> <LocalLeader><Home>    <Plug>(unite_move_head)
    imap <buffer> <LocalLeader><Left>    <Plug>(unite_move_left)
    imap <buffer> <LocalLeader><Right>   <Plug>(unite_move_right)
    imap <buffer> <LocalLeader><C-l>     <Plug>(unite_redraw)
    if has('gui_running')
      imap <buffer> <LocalLeader><ESC>   <Plug>(unite_insert_leave)
    endif
    imap <buffer> <LocalLeader><C-g> <Plug>(unite_exit)
    imap <buffer> <LocalLeader><2-LeftMouse>   <Plug>(unite_do_default_action)
    imap <buffer> <LocalLeader><RightMouse>    <Plug>(unite_exit)

    imap <silent><buffer><expr> <LocalLeader><Space>
          \ unite#smart_map(' ', "\<Plug>(unite_toggle_mark_current_candidate)")
    imap <silent><buffer><expr> <LocalLeader><S-Space>
          \ unite#smart_map(' ', "\<Plug>(unite_toggle_mark_current_candidate_up)")

    inoremap <silent><buffer><expr> <LocalLeader><C-d>
          \ unite#do_action('delete')
    inoremap <silent><buffer><expr> <LocalLeader><C-e>
          \ unite#do_action('edit')
    inoremap <silent><buffer><expr> <LocalLeader><C-t>
          \ unite#do_action('tabopen')
    inoremap <silent><buffer><expr> <LocalLeader><C-y>
          \ unite#do_action('yank')
    inoremap <silent><buffer><expr> <LocalLeader><C-o>
          \ unite#do_action('open')

    " ->
    nmap <buffer> q <Plug>(unite_exit)
    nmap <buffer> <CR> <Plug>(unite_do_default_action)
    nmap <buffer> <2-LeftMouse> <Plug>(unite_do_default_action)
    nmap <buffer> <RightMouse> <Plug>(unite_exit)
    imap <buffer> <CR>      <Plug>(unite_do_default_action)
    imap <buffer> <2-LeftMouse>   <Plug>(unite_do_default_action)
    imap <buffer> <RightMouse>    <Plug>(unite_exit)
  endfunction

  " TODO поиск в определенной директории в проекте
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden -S'
  let g:unite_source_grep_recursive_opt = ''

  call unite#custom#profile('default', 'context', {
  \ 'direction': 'top',
  \ 'prompt_visible': 1,
  \ 'prompt': '',
  \ 'prompt_focus': 1,
  \ 'marked_icon': '* ',
  \ 'candidate_icon': '- ',
  \ 'no_hide_icon': 1,
  \ })
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  " call unite#custom#source('help', 'sorters', 'sorter_selecta')
  " call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#filters#sorter_default#use(['sorter_selecta'])

  call AddCmd('common',
  \ 'unite, resume | открыть предыдущее окно                                                     ', '<Leader>ur',
  \ 'UniteResume'
  \ )
  call AddCmd('common',
  \ 'project, filenames, files, fuzzy, find | открыть список файлов проекта                      ', '<Leader>pf',
  \ 'Unite -buffer-name=files -start-insert file_rec/async:!'
  \ )
  call AddCmd('common',
  \ 'project, grep, text, files, find | поиск текста в файлах проекта                            ', '<Leader>pg',
  \ 'Unite -buffer-name=grep grep:. -no-empty'
  \ )

  call AddCmd('common',
  \ 'system, messages | системные сообщения                                                      ', '<Leader>sm',
  \ 'Unite -buffer-name=messages output:messages'
  \ )

  call AddCmd('common',
  \ 'git, status, porcelain |                                                                    ', '<Leader>gsp',
  \ 'Unite -buffer-name=git\ status\ --porcelain output/shellcmd:git\ status\ --porcelain'
  \ )

  " " The prefix key.
  " nnoremap    [unite]   <Nop>
  " nmap    f [unite]
  "
  " nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
  " 		\ -buffer-name=files buffer bookmark file<CR>
  " nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
  " 		\ -buffer-name=files buffer bookmark file<CR>
  " nnoremap <silent> [unite]r  :<C-u>Unite
  " 		\ -buffer-name=register register<CR>
  " nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
  " nnoremap <silent> [unite]f
  " 		\ :<C-u>Unite -buffer-name=resume resume<CR>
  " nnoremap <silent> [unite]ma
  " 		\ :<C-u>Unite mapping<CR>
  " nnoremap <silent> [unite]me
  " 		\ :<C-u>Unite output:message<CR>
  " nnoremap  [unite]f  :<C-u>Unite source<CR>
endif

if dein#tap('neoyank.vim')
  " autocmd BufWinEnter \(*.asc\|*.gpg\) let g:neoyank#disable_write = 1
  call AddCmd('common',
  \ 'history, yank, ring, copy, paste | история копирования                                      ', '<Leader>hy',
  \ 'Unite history/yank'
  \ )
endif

if dein#tap('unite-mark')
  call AddCmd('common',
  \ 'mark, list | список меток                                                                   ', '<Leader>ml',
  \ 'Unite mark'
  \ )
endif

if dein#tap('unite-help')
  call unite#custom#source('help', 'max_candidates', 0)
  call unite#custom#source('help', 'required_pattern_length', 0)
  call AddCmd('common',
  \ 'help, find | поиск в справке                                                                      ', '<F1>',
  \ 'Unite help -buffer-name=help -start-insert'
  \ )
  call AddCmd('common',
  \ 'help, cursor, word, find | поиск слова под курсором в справке                                    ', 'g<F1>',
  \ 'UniteWithCursorWord help'
  \ )
endif
