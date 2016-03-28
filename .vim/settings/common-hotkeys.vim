" Переключить selection и включить режим правки для других пользователей

source $VIMRUNTIME/mswin.vim

" inclusive лучше
set selection=inclusive

" like unimpaired.vim, m - mouse selection
function ToggleSelection()
  if &selection == 'inclusive'
    set selection=exclusive
  else
    set selection=inclusive
  endif
  echo 'set selection='.&selection
endfunction
nnoremap [om :set selection=exclusive<CR>
nnoremap ]om :set selection=inclusive<CR>
nnoremap com :call ToggleSelection()<CR>

" undo/redo для visual mode
vnoremap <C-z> <C-c>ugv
vnoremap <C-y> <C-c><C-r>gv

" scroll Alt-y-e
noremap <A-y> <C-y>
vnoremap <A-y> <C-y>
inoremap <A-y> <C-y>
noremap <A-e> <C-e>
vnoremap <A-e> <C-e>
inoremap <A-e> <C-e>

" suspend Alt-z
noremap <A-z> <C-z>
vnoremap <A-z> <C-z>
inoremap <A-z> <C-z>

" Ctrl-a/Ctrl-x == Ctrl-a/Ctrl-x
noremap <A-a> <C-a>
inoremap <A-a> <C-a>
cnoremap <A-a> <C-a>
noremap <A-x> <C-x>
inoremap <A-x> <C-x>
cnoremap <A-x> <C-x>

" unmap CTRL-Tab is Next window
unmap <C-Tab>
iunmap <C-Tab>
cunmap <C-Tab>

" unmap CTRL-F4 is Close window
unmap <C-F4>
iunmap <C-F4>
cunmap <C-F4>

" отключаем переключение режимов по ctrl-insert
noremap <C-Insert> <Nop>
inoremap <C-Insert> <Nop>
cnoremap <C-Insert> <Nop>

" обработка буфера выделения, нет смысла для visual
nnoremap <C-S-Insert> "*gp
inoremap <C-S-Insert> <MiddleMouse>
cnoremap <C-S-Insert> <C-r>*
