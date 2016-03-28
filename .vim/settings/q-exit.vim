" Alt-v == blockwise-visual, CTRL-q == :qall
if !has('nvim')
  set <A-v>=v
endif
noremap <A-v> <C-v>
inoremap <A-v> <C-v>
cnoremap <A-v> <C-v>
noremap <C-q> <C-c>:qall<CR>
inoremap <C-q> <C-c>:qall<CR>
cnoremap <C-q> <C-c>:qall<CR>

" из-за частых ошибок (во многих сплитах q означает выход), ставим макросы на <Alt>-q
if !has('nvim')
  set <A-q>=q
endif
noremap <A-q> q
noremap <silent> q :q<CR>

" q - закрывает syntastic :Errors (qf)
autocmd FileType qf nnoremap <buffer> q :bd<CR>
if dein#tap('vim-nerdtree-tabs')
  autocmd FileType nerdtree nnoremap <buffer> q :NERDTreeTabsClose<CR>
endif
