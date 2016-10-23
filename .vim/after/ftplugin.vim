" " 2 пробела за место символа табуляции
" autocmd FileType markdown,vim,sh,coffee setlocal expandtab shiftwidth=2 tabstop=2
"
" " отключаем умные отступы
" autocmd FileType markdown setlocal indentexpr=
"
" " отключаем перенос набираемого текста по ширине textwidth, за место этого используем gq
" autocmd FileType vim,jade setlocal formatoptions-=t formatoptions-=c formatoptions+=q

autocmd BufNewFile,BufRead ecosystem.json setlocal filetype=javascript

autocmd BufNewFile,BufRead seafile-ignore.txt setlocal filetype=conf

autocmd BufNewFile,BufRead .npmrc setlocal filetype=dosini
autocmd BufNewFile,BufRead .bash_aliases setlocal filetype=sh
