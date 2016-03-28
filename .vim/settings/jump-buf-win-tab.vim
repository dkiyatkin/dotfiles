" Управление буфферами, окнами, вкладками

" Tab key confict, jumps and indent with alt
nnoremap <A-i> <C-i>
nnoremap <A-o> <C-o>
nnoremap <A-t> <C-t>
" create new tab confict CTRL-t
inoremap <A-t> <C-t>
inoremap <A-d> <C-d>
" tags
nnoremap <A-]> <C-]>
nnoremap <A-t> <C-t>

" навигация по вкладкам по Ctrl TAB
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
" http://stackoverflow.com/a/31961401/1054723
set <F13>=[27;5;9~
nnoremap <F13> gt
set <F14>=[27;6;9~
nnoremap <F14> gT

" навигация по сплитам по TAB и Alt+{h,j,k,l}
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
" навигация в терминале
if exists(':tnoremap')
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  " map esc to exit to normal mode in terminal
  tnoremap <Esc><Esc> <C-\><C-n>
endif

" навигация по Alt-n как в браузере (alt-0 ?)
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> :tablast<CR>
" ctrlspace
" переключиться на предыдущую активную вкладку Alt-`
let g:lasttab = 1
" nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
nnoremap <A-`> :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" перемещение вкладок
nnoremap <C-S-PageUp> :tabmove -1<CR>
nnoremap <C-S-PageDown> :tabmove +1<CR>
set <F15>=[5;9~
nnoremap <F15> :tabmove -1<CR>
set <F16>=[6;9~
nnoremap <F16> :tabmove +1<CR>

" навигация по сплитам по TAB в командном режиме
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" новая вкладка
noremap <C-t> :tabe<CR>
vnoremap <C-t> <Esc>:tabe<CR>
inoremap <C-t> <Esc>:tabe<CR>
cnoremap <C-t> <C-c>:tabe<CR>

" закрыть вкладку по CTRL-F4
noremap <C-F4> :tabclose<CR>
vnoremap <C-F4> <Esc>:tabclose<CR>
inoremap <C-F4> <Esc>:tabclose<CR>
cnoremap <C-F4> <C-c>:tabclose<CR>

" Leader:
" Switch CWD to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
" close current buffer
nnoremap <Leader>bd :bd<CR>
" close all buffers or bufferonly TODO
nnoremap <Leader>bo :bufdo bd<CR>
" list buffers
nnoremap <silent> <Leader>bt :<C-u>Unite -buffer-name=buffers_tab buffer_tab<CR>
nnoremap <silent> <Leader>ba :<C-u>Unite -buffer-name=buffers buffer<CR>
" managing tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tm :tabmove 
nnoremap <silent> <Leader>ta :<C-u>Unite -buffer-name=tabs tab:no-current<CR>
" opens a new tab with the current buffer's path
nnoremap <Leader>te :tabedit <C-R>=expand("%:p:h")<CR>/
