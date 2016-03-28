" Ctrl-q-v conflict. Alt-v == in_Ctrl-v, CTRL-q == :qall
noremap <A-v> <C-v>
inoremap <A-v> <C-v>
cnoremap <A-v> <C-v>
noremap <C-q> <C-c>:qall<CR>
inoremap <C-q> <C-c>:qall<CR>
cnoremap <C-q> <C-c>:qall<CR>

" из-за частых ошибок (во многих сплитах q означает выход), ставим макросы на <Alt>-q
noremap <A-q> q
if dein#tap('confirm-quit')
  noremap <silent> q :call confirm_quit#confirm(0, 'always')<CR>
else
  noremap q <Nop>
endif

" q - закрывает syntastic :Errors (qf)
autocmd FileType help nnoremap <buffer> q ZQ
autocmd FileType qf nnoremap <buffer> q :bd<CR>
if dein#tap('vim-nerdtree-tabs')
  autocmd FileType nerdtree nnoremap <buffer> q :NERDTreeTabsClose<CR>
endif

" навигация в Cmdwin
autocmd CmdwinEnter * nnoremap <silent> <buffer> q :q<CR>
