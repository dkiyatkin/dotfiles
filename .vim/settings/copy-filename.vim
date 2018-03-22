" TODO копирование путей в Unite, NERDTree

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  call AddCmd('common',
  \ 'filename, copy, relative | скопировать относительный путь файла (src/foo.txt)              ', '<Leader>fcr',
  \ 'let @*=expand("%")'
  \ )
  call AddCmd('common',
  \ 'filename, copy, absolute | скопировать абсолютный путь файла (/something/src/foo.txt)      ', '<Leader>fca',
  \ 'let @*=expand("%:p")'
  \ )
  call AddCmd('common',
  \ 'filename, copy, basename | скопировать базовое имя файла (foo.txt)                         ', '<Leader>fcb',
  \ 'let @*=expand("%:t")'
  \ )
  call AddCmd('common',
  \ 'filename, copy, dirname | скопировать полный путь до директории файла (/something/src)     ', '<Leader>fcd',
  \ 'let @*=expand("%:p:h")'
  \ )
endif
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  call AddCmd('common',
  \ 'filename, copy, relative | скопировать относительный путь файла (src/foo.txt)              ', '<Leader>fcr',
  \ 'let @+=expand("%")'
  \ )
  call AddCmd('common',
  \ 'filename, copy, absolute | скопировать абсолютный путь файла (/something/src/foo.txt)      ', '<Leader>fca',
  \ 'let @+=expand("%:p")'
  \ )
  call AddCmd('common',
  \ 'filename, copy, basename | скопировать базовое имя файла (foo.txt)                         ', '<Leader>fcb',
  \ 'let @+=expand("%:t")'
  \ )
  call AddCmd('common',
  \ 'filename, copy, dirname | скопировать полный путь до директории файла (/something/src)     ', '<Leader>fcd',
  \ 'let @+=expand("%:p:h")'
  \ )
endif
