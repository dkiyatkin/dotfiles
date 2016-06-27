" TODO не переключается в vim-sneak
" TODO не работает вместе с `r`, `f`, `F`, `t`, `T` (можно перемапить их на функцию где будет выбираться нужная раскладка и ставится нужный символ, а потом возвращаться старая раскладка)

" при выходе из режима правки всегда переключаться на английскую раскладку клавиатуры
autocmd InsertLeave * silent exe "!xkb-switch -s us"

" при выходе из режима команд всегда переключаться на английскую раскладку клавиатуры
cnoremap <silent> <Esc> <C-c>:silent exe "!xkb-switch -s us"<CR>
function! s:XkbSwitchUS()
   silent exe "!xkb-switch -s us"
   let cmd = getcmdline()
   return cmd
endfunction
cnoremap <CR> <C-\>e<SID>XkbSwitchUS()<CR><CR>

" setlocal spell spelllang=ru_yo,en_us
