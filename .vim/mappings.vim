" Common:
" Tab делает отступы в noramal и visual TODO visual конфликт с ultisnips
inoremap <S-Tab> <C-D>
" не убирать выделение
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" backspace in Visual mode deletes selection
vnoremap <BS> d
vnoremap <C-BS> d
inoremap <C-BS> <C-W>
cnoremap <C-BS> <C-W>
" http://superuser.com/a/402247/377338
set <F17>=[9;3~
vnoremap <F17> d
inoremap <F17> <C-W>
cnoremap <F17> <C-W>

" SHIFT-Del Cut, Visual Ctrl-a/Ctrl-x для изменения цифр
set <S-Del>=[3;2~
vnoremap <S-Del> "+x

nnoremap <C-Del> de
inoremap <C-Del> <C-O>de

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

" убираем подсветку по esc
nnoremap <Esc><Esc> :nohlsearch<CR>

" навигация по Alt-n как в браузере
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

" jumplist without <Tab>
nnoremap <Leader>i <C-I>
nnoremap <Leader>o <C-O>

" навигация по сплитам по TAB в командном режиме
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" чтобы курсор тоже передвигался
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

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

" TODO http://vim.wikia.com/wiki/Search_for_visually_selected_text
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" закрыть вкладку по CTRL-F4
nnoremap <C-F4> :tabclose<CR>
inoremap <C-F4> <Esc>:tabclose<CR>
vnoremap <C-F4> <Esc>:tabclose<CR>
cnoremap <C-F4> <Esc>:tabclose<CR>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <Esc>:update<CR>
"inoremap <C-S> <C-O>:update<CR>
inoremap <C-S> <Esc>:update<CR>

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

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

" Разное:
nnoremap <LocalLeader>ev :vsplit $MYVIMRC<CR>
nnoremap <LocalLeader>sv :source $MYVIMRC<CR>
" из-за частых ошибок (во многих сплитах q означает выход), ставим макросы на <Leader>-q и отключаем q
noremap <Leader>q q
noremap q <Nop>
" noremap <C-[>q <Nop>
" заменить везде кавычки двойные на одинарные и наоборот
nnoremap <Leader>r"' :%s/\"/\'/g<CR>
nnoremap <Leader>r'" :%s/\'/\"/g<CR>
