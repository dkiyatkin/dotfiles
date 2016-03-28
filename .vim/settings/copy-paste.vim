" вставка/копирование CTRL-V/CTRL-C. CTRL-Q same as old CTRL-V
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
" use i_CTRL-Q instead
map <C-V> "+gp
map <S-Insert> "+gp
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+
" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
" по умолчанию MiddleMouse
imap <S-Insert> <C-V>
" vmap <S-Insert> <C-V>

" отключаем переключение режимов по ctrl-insert
inoremap <C-Insert> <Nop>
nnoremap <C-Insert> <Nop>
cnoremap <C-Insert> <Nop>

" обработка буфера выделения
inoremap <C-S-Insert> <MiddleMouse>
nnoremap <C-S-Insert> "*gp
cnoremap <C-S-Insert> <C-R>*
