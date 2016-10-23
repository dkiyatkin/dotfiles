if dein#tap('unite.vim')
  autocmd FileType unite call s:unite_settings()
  function! s:unite_settings()
    " Disable cursor looping
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> k
    silent! nunmap <buffer> j
    " Возвращаем <Leader> для sneak, TODO придумать замену для Space (Shift-j-k)
    silent! nunmap <buffer> <Space>
    " Unite Tab не то делает, остается работать в режиме правки
    silent! nunmap <buffer> <Tab>
  endfunction
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden -S'
  let g:unite_source_grep_recursive_opt = ''

  call unite#custom#profile('default', 'context', {'direction': 'top'})
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  nnoremap <silent> <Leader>ur :<C-u>UniteResume<CR>
  nnoremap <silent> <Leader>fa :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<CR>
  nnoremap <silent> <Leader>fg :Unite -buffer-name=grep grep:. -no-empty<CR>
  " let g:unite_source_history_yank_enable = 1
  " nnoremap <Leader>y :<C-u>Unite history/yank<CR>
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

  " включаем панель строк в unite
  " https://github.com/Shougo/unite.vim/issues/1042
  autocmd FileType unite setlocal number relativenumber
  " autocmd BufWinEnter,BufEnter * setlocal number relativenumber
endif

if dein#tap('unite-help')
  " TODO F1 изменить
  " Execute help.
  nnoremap <F1> :<C-u>Unite -buffer-name=help -start-insert help<CR>
  " Execute help by cursor keyword.
  nnoremap <silent> g<F1> :<C-u>UniteWithCursorWord help<CR>
endif
