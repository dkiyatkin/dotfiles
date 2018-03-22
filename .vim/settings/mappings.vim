" Common:
" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
nnoremap Y y$
" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" открывать новый буфер, даже если файл не существует
nnoremap <Leader>gf :e <cfile><CR>

" скролл стрелками для нормального режима
nnoremap <Left> z<Left>
nnoremap <Right> z<Right>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

" vim-sensible <C-l>
" убираем подсветку по esc
" nnoremap <Esc><Esc> :nohlsearch<CR>

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

" altGr == :
" xmodmap semicolon/colon => colon/semicolon
" " http://vim.wikia.com/wiki/Map_semicolon_to_colon
" " enter command mode without using shift key
" " noremap ; :
" " noremap : ;
" map ; :
" noremap ;; ;

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

" TODO k - ag

" заменить два символа http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
nnoremap <silent> <Plug>TransposeCharacters xp
  \:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters

" TODO folding
" " show only this fold section
" nnoremap <Leader>z zMzv

" TODO
" autocmd BufDelete * let g:latestdeletedbuffer = expand("<afile>:p")
" nnoremap <F8> :e <C-R>=fnameescape(g:latestdeletedbuffer)<CR><CR>
