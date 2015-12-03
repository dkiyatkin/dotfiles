" 2 пробела за место символа табуляции
autocmd FileType markdown,vim,sh,coffee setlocal expandtab shiftwidth=2 tabstop=2

" отключаем умные отступы
autocmd FileType markdown setlocal indentexpr=

" отключаем перенос набираемого текста по ширине textwidth, за место этого используем gq
autocmd FileType vim,jade setlocal formatoptions-=t formatoptions-=c formatoptions+=q

" включаем панель строк в unite
" https://github.com/Shougo/unite.vim/issues/1042
autocmd FileType unite setlocal number relativenumber
" autocmd BufWinEnter,BufEnter * setlocal number relativenumber
