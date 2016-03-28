" Common:
" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
nnoremap Y y$
" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" открывать новый буфер, даже если файл не существует
nnoremap gf :e <cfile><CR>

" скролл стрелками для нормального режима
nnoremap <Left> z<Left>
nnoremap <Right> z<Right>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

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

" TODO C-Del не работает в терминале (кроме nvim), не назначается через set
nnoremap <C-Del> de
inoremap <C-Del> <C-O>de

" vim-sensible <C-l>
" убираем подсветку по esc
" nnoremap <Esc><Esc> :nohlsearch<CR>

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

" Разное:
nnoremap <LocalLeader>ev :vsplit $MYVIMRC<CR>
nnoremap <LocalLeader>sv :source $MYVIMRC<CR>
" заменить везде кавычки двойные на одинарные и наоборот
nnoremap <Leader>r"' :%s/\"/\'/g<CR>
nnoremap <Leader>r'" :%s/\'/\"/g<CR>

" http://superuser.com/questions/216411/go-to-middle-of-line-in-vim
nnoremap <Leader>gm :exe 'normal '.(virtcol('$')/2).'\|'<CR>

" http://vim.wikia.com/wiki/Map_semicolon_to_colon
" enter command mode without using shift key
" noremap ; :
" noremap : ;
map ; :
noremap ;; ;

" Remove the Windows ^M - when the encodings get messed up
noremap <Leader>mm mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Easy block selection with mouse http://vim.wikia.com/wiki/VimTip1132
" TODO работает только в gvim
noremap <A-LeftMouse> <4-LeftMouse>
inoremap <A-LeftMouse> <4-LeftMouse>
onoremap <A-LeftMouse> <C-C><4-LeftMouse>
noremap <A-LeftDrag> <LeftDrag>
inoremap <A-LeftDrag> <LeftDrag>
onoremap <A-LeftDrag> <C-C><LeftDrag>
