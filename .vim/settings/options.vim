set showcmd " показывать команды справа внизу
set notimeout " отключим таймаут для leader
set nojoinspaces " не вставлять лишних пробелов при объединении строк
set visualbell
set history=10000 " Number of things to remember in history
set number " Включает отображение номеров строк
set relativenumber " номера относительно текущей строки
" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden
set linebreak " Перенос строк по словам, а не по буквам TODO не работает вместе с set list
set list
set listchars=tab:├─,trail:·,extends:»,precedes:«,nbsp:␣ " ,eol:¬
let &showbreak = '+++ ' " индикатор переноса
set cpoptions+=n " отображение переноса в столбике с цифрами
" set shiftwidth=8 tabstop=8 " Размер табулации по умолчанию
" set expandtab " пробелы за мето табов
" set tabstop=2 shiftwidth=2 expandtab
set cursorline " Подсветка текущей строки --тормозит
set cursorcolumn " подсветка колонки
set hlsearch " Включаем подсветку выражения, которое ищется в тексте
set ignorecase
set smartcase
set foldlevel=16
set foldmethod=indent
" let g:xml_syntax_folding=1 " jsx syntax bug
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
" vnoremap <Space> zf
" Enable mouse use in all modes
set mouse=a
" Don't redraw while executing macros (good performance config)
set lazyredraw
" set wildignore=*.o,*~,*.pyc,.git/,.hg/,.svn/,.DS_Store
" set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.exe
set wildignore=*~
" sbuffer переключает на существующую вкладку
" set switchbuf=useopen,usetab,newtab

if has("nvim")
  silent !mkdir ~/.local/share/nvim/undo > /dev/null 2>&1
  set undodir=~/.local/share/nvim/undo
  set undofile
  silent !mkdir ~/.local/share/nvim/backup > /dev/null 2>&1
  set backupdir=~/.local/share/nvim/backup//

  " vim-togglecursor
  " let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " cursor
  let g:terminal_scrollback_buffer_size = 10000
else
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undodir=~/.vim/undo
  set undofile
  silent !mkdir ~/.vim/backup > /dev/null 2>&1
  set backupdir=~/.vim/backup//
  silent !mkdir ~/.vim/swap > /dev/null 2>&1
  set directory=~/.vim/swap//
endif

" vim-togglecursor
" курсор для konsole
" if has("gui_running")
" else
"   let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"   let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"   let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif
