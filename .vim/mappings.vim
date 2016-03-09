" Tab делает отступы в noramal и visual TODO visual конфликт с ultisnips
inoremap <S-Tab> <C-D>
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

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
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
