" TODO
" autocmd BufDelete * let g:latestdeletedbuffer = expand("<afile>:p")
" nnoremap <F8> :e <C-R>=fnameescape(g:latestdeletedbuffer)<CR><CR>

" TODO # - alternate file

" show only this fold section
nnoremap <Leader>z zMzv
" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <Leader>cfr :let @*=expand("%")<CR>
  " absolute path  (/something/src/foo.txt)
  nnoremap <Leader>cfa :let @*=expand("%:p")<CR>
  " filename       (foo.txt)
  nnoremap <Leader>cff :let @*=expand("%:t")<CR>
  " directory name (/something/src)
  nnoremap <Leader>cfd :let @*=expand("%:p:h")<CR>
endif
if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path  (src/foo.txt)
  nnoremap <Leader>cfr :let @+=expand("%")<CR>
  " absolute path  (/something/src/foo.txt)
  nnoremap <Leader>cfa :let @+=expand("%:p")<CR>
  " filename       (foo.txt)
  nnoremap <Leader>cff :let @+=expand("%:t")<CR>
  " directory name (/something/src)
  nnoremap <Leader>cfd :let @+=expand("%:p:h")<CR>
endif
