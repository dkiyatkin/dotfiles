" Переключить selection и включить режим правки для других пользователей

source $VIMRUNTIME/mswin.vim

" inclusive лучше
set selection=inclusive

" TODO а так же переключать Ctrl-z, Ctrl-y
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

" backspace in Visual mode deletes selection
vnoremap <C-BS> d
inoremap <C-BS> <C-w>
cnoremap <C-BS> <C-w>
vnoremap <C-w> d
" " http://superuser.com/a/402247/377338
" set <F17>=[9;3~
" vnoremap <F17> d
" inoremap <F17> <C-w>
" cnoremap <F17> <C-w>

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

" поиск по F3
nnoremap <F3> n
nnoremap <S-F3> N
vnoremap <F3> n
vnoremap <S-F3> N

" чтобы курсор тоже передвигался
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

" Tab делает отступы в noramal и visual TODO visual конфликт с ultisnips
inoremap <S-Tab> <C-d>
" не убирать выделение
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" TODO C-Del не работает в терминале (кроме nvim), не назначается через set
nnoremap <C-Del> de
inoremap <C-Del> <C-o>de
