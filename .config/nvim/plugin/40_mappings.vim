if (exists('g:loaded_myMappings') && g:loaded_myMappings)
  finish
endif
let g:loaded_myMappings = 1

" plugin:sensible {{{
" }}}

" http://vim.wikia.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen
" plugin:visualstar
" nnoremap n nzz
" nnoremap N Nzz

" http://vim.wikia.com/wiki/Count_number_of_matches_of_a_pattern
nnoremap <Leader><C-g> :%s///gn<CR>

" редактирование новых строк с курсором в самом начале
nmap <A-o> ]<Space>ji
nmap <A-O> [<Space>ki

" меняем местами ' `
noremap ' `
noremap ` '

" нажатие : без шифта
noremap <unique> ; :
noremap <unique> ;; ;
noremap <unique> ,, ,

" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
nnoremap Y y$

" открывать новый буфер, даже если файл не существует
nnoremap <Leader>gf :e <cfile><CR>

nnoremap <unique> <LocalLeader>T :edit TODO.md<CR>

" заменить везде кавычки двойные на одинарные и наоборот
nnoremap <Leader>r"' :%s/\"/\'/g<CR>
nnoremap <Leader>r'" :%s/\'/\"/g<CR>

" http://superuser.com/questions/216411/go-to-middle-of-line-in-vim
nnoremap <Leader>gm :exe 'normal '.(virtcol('$')/2).'\|'<CR>

" Easy block selection with mouse http://vim.wikia.com/wiki/VimTip1132
noremap <A-LeftMouse> <4-LeftMouse>
inoremap <A-LeftMouse> <4-LeftMouse>
onoremap <A-LeftMouse> <C-c><4-LeftMouse>
noremap <A-LeftDrag> <LeftDrag>
inoremap <A-LeftDrag> <LeftDrag>
onoremap <A-LeftDrag> <C-c><LeftDrag>

" заменить два символа http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
nnoremap <silent> <Plug>TransposeCharacters xp
  \:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters

" TODO folding
" " show only this fold section
" nnoremap <Leader>z zMzv

" common-hotkeys {{{

" Use CTRL-S for saving, also in Insert mode
noremap  <C-s> <C-c>:update<CR>
vnoremap <C-s> <C-c>:update<CR>gv
inoremap <C-s> <C-o>:update<CR>

nnoremap [om :set selection=exclusive<CR>
nnoremap ]om :set selection=inclusive<CR>
nnoremap yom :call ToggleSelection()<CR>

" http://superuser.com/a/402247/377338
" set <F17>=[9;3~
" vnoremap <F17> d
" inoremap <F17> <C-w>
" cnoremap <F17> <C-w>

" отключаем переключение режимов по ctrl-insert
noremap <C-Insert> <Nop>
inoremap <C-Insert> <Nop>
cnoremap <C-Insert> <Nop>

" обработка буфера выделения, нет смысла для visual
nnoremap <C-S-Insert> "*gp
inoremap <C-S-Insert> <MiddleMouse>
cnoremap <C-S-Insert> <C-r>*
" }}}

nnoremap <expr><unique> <C-\> empty(bufname("term://*//*:ranger")) ? ":terminal ranger<CR>" : ":buffer ranger<CR>"

" copy-filename {{{
" filename, copy, relative | скопировать относительный путь файла (src/foo.txt)
" nnoremap <unique> <Leader>fcr :<C-u>let @+=expand("%")<CR>

" filename, copy, dirname | скопировать полный путь до директории файла (/something/src)
nnoremap <unique> yd :<C-u>let @+=expand("%:p:h") \| call system("tmux loadb -",expand("%:p:h")) \| echo "clipboard:" expand("%:p:h")<CR>

" filename, copy, basename | скопировать базовое имя файла (foo.txt)
nnoremap <unique> yn :<C-u>let @+=expand("%:t") \| call system("tmux loadb -",expand("%:t")) \| echo "clipboard:" expand("%:t")<CR>

" filename, copy, basename, extname | скопировать базовое имя файла без расширения (foo)
nnoremap <unique> y. :<C-u>let @+=expand("%:t:r") \| call system("tmux loadb -",expand("%:t:r")) \| echo "clipboard:" expand("%:t:r")<CR>

" filename, copy, absolute | скопировать абсолютный путь файла (/something/src/foo.txt)
nnoremap <unique> yp :<C-u>let @+=expand("%:p") \| call system("tmux loadb -",expand("%:p")) \| echo "clipboard:" expand("%:p")<CR>
" }}}

" перемещение в всплывающем меню
inoremap <C-f> <C-R>=pumvisible() ? "\<lt>PageDown>" : "\<lt>C-f>"<CR>
inoremap <C-b> <C-R>=pumvisible() ? "\<lt>PageUp>"   : "\<lt>C-b>"<CR>

" emacs, bash maps
inoremap <C-a> <Home>
inoremap <C-e> <C-R>=pumvisible() ? "\<lt>C-e>" : "\<lt>End>"<CR>

" plugin:husk {{{
cnoremap <expr> <C-Left> husk#left()
cnoremap <expr> <C-Right> husk#right()
" }}}

" jump-buf-win-tab {{{
" Управление буфферами, окнами, вкладками
tnoremap <unique> <C-PageUp>   <C-\><C-n>:tabprev<CR>
tnoremap <unique> <C-PageDown> <C-\><C-n>:tabnext<CR>
tnoremap <unique> <C-S-PageUp>   <C-\><C-n>:tabmove -1<CR>
tnoremap <unique> <C-S-PageDown> <C-\><C-n>:tabmove +1<CR>

inoremap <unique> <C-PageUp>   <C-\><C-n>:tabprev<CR>
inoremap <unique> <C-PageDown> <C-\><C-n>:tabnext<CR>
inoremap <unique> <C-S-PageUp>   <C-\><C-n>:tabmove -1<CR>
inoremap <unique> <C-S-PageDown> <C-\><C-n>:tabmove +1<CR>

nnoremap <unique> <C-PageUp>   :tabprev<CR>
nnoremap <unique> <C-PageDown> :tabnext<CR>
nnoremap <unique> <C-S-PageUp>   :tabmove -1<CR>
nnoremap <unique> <C-S-PageDown> :tabmove +1<CR>

" :h terminal-input
tnoremap <Esc> <C-\><C-n>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

inoremap <A-h> <C-\><C-n><C-w>h
inoremap <A-j> <C-\><C-n><C-w>j
inoremap <A-k> <C-\><C-n><C-w>k
inoremap <A-l> <C-\><C-n><C-w>l

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" alt-o alt-; tmux-like
tnoremap <A-w> <C-\><C-N><C-w>w
inoremap <A-w> <C-\><C-N><C-w>w
nnoremap <A-w> <C-w>w
tnoremap <A-W> <C-\><C-N><C-w>W
inoremap <A-W> <C-\><C-N><C-w>W
nnoremap <A-W> <C-w>W
tnoremap <A-;> <C-\><C-N><C-w>p
inoremap <A-;> <C-\><C-N><C-w>p
nnoremap <A-;> <C-w>p

" bufmru {{{
nnoremap ]m  :BufMRUPrev<CR>
nnoremap [m  :BufMRUNext<CR>
" }}}

" Ctrl-q-v conflict. Alt-v == in_Ctrl-v, CTRL-q == :qall
noremap <A-v> <C-v>
inoremap <A-v> <C-v>
cnoremap <A-v> <C-v>
noremap <C-q> <C-c>:qall<CR>
inoremap <C-q> <C-c>:qall<CR>
cnoremap <C-q> <C-c>:qall<CR>
" tnoremap <C-q> <C-\><C-n><C-c>:qall<CR>

" из-за частых ошибок (во многих сплитах q означает выход), ставим макросы на <Alt>-q
noremap <M-q> q
noremap <silent> q <C-w>c
" autocmd FileType scratch nnoremap <buffer> q :q<CR>
" autocmd FileType qf nnoremap <silent><buffer> q :bd<CR>
autocmd FileType nerdtree nnoremap <silent> <buffer> q :NERDTreeClose<CR>

" навигация в Cmdwin
autocmd CmdwinEnter * nnoremap <silent> <buffer> q :q<CR>

" навигация по вкладкам по Ctrl TAB
" http://stackoverflow.com/a/31961401/1054723

" }}}

autocmd FileType help nnoremap <silent><buffer> gO :call ShowToc()<CR><C-w>L:vertical resize 29<CR>

" plugin:matchup {{{
" xmap <unique> <Leader>%            <Plug>(matchup-z%)
" nmap <unique> <Leader>%            <Plug>(matchup-z%)
" omap <unique> <Leader>%            <Plug>(matchup-o_)<Plug>(matchup-z%)
nmap <unique> <F7>                 <plug>(matchup-hi-surround)
" }}}

" plugin:easymotion {{{
map <unique> , <Plug>(easymotion-prefix)
nmap <unique> s <Plug>(easymotion-overwin-f)
xmap <unique> s <Plug>(easymotion-bd-f)
omap <unique> s <Plug>(easymotion-bd-f)
" }}}

" plugin:css-color {{{
" css, color, enable | включить css цвета')
nnoremap <unique> <Leader>[oc :<C-u>call css_color#enable()<CR>

" css, color, disable | выключить css цвета')
nnoremap <unique> <Leader>]oc :<C-u>call css_color#disable()<CR>

" css, color, toggle | переключить css цвета')
nnoremap <unique> <Leader>yoc :<C-u>call css_color#toggle()<CR>
" }}}

" plugin:gitv {{{
nnoremap <unique> <Leader>gv :Gitv --all<CR>
nnoremap <unique> <Leader>gV :Gitv! --all<CR>
vnoremap <unique> <Leader>gV :Gitv! --all<CR>
" навигация по diff git
nnoremap <unique> <Leader>gd /^diff --git<CR>:call histdel("search", -1)<CR>
" }}}

" plugin:gitgutter {{{
" GitGutter stuff (similar to what unimpaired.vim does).
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>
" }}}

" plugin:undotree {{{
nnoremap <unique> <Leader>ut :UndotreeToggle<CR>
" }}}

" plugin:fugitive {{{
nnoremap <unique><silent> <Leader>gs :Gstatus<CR>
" }}}

tnoremap <unique> <C-^> <C-\><C-n><C-^>
inoremap <unique> <C-^> <C-\><C-n><C-^>
nnoremap <unique> <C-^> <C-^>

tnoremap <unique> <A-1> <C-\><C-n>1gt
tnoremap <unique> <A-2> <C-\><C-n>2gt
tnoremap <unique> <A-3> <C-\><C-n>3gt
tnoremap <unique> <A-4> <C-\><C-n>4gt
tnoremap <unique> <A-5> <C-\><C-n>5gt
tnoremap <unique> <A-6> <C-\><C-n>6gt
tnoremap <unique> <A-7> <C-\><C-n>7gt
tnoremap <unique> <A-8> <C-\><C-n>8gt
tnoremap <unique> <A-9> <C-\><C-n>:tablast<CR>

inoremap <unique> <A-1> <C-\><C-n>1gt
inoremap <unique> <A-2> <C-\><C-n>2gt
inoremap <unique> <A-3> <C-\><C-n>3gt
inoremap <unique> <A-4> <C-\><C-n>4gt
inoremap <unique> <A-5> <C-\><C-n>5gt
inoremap <unique> <A-6> <C-\><C-n>6gt
inoremap <unique> <A-7> <C-\><C-n>7gt
inoremap <unique> <A-8> <C-\><C-n>8gt
inoremap <unique> <A-9> <C-\><C-n>:tablast<CR>

nnoremap <unique> <A-1> 1gt
nnoremap <unique> <A-2> 2gt
nnoremap <unique> <A-3> 3gt
nnoremap <unique> <A-4> 4gt
nnoremap <unique> <A-5> 5gt
nnoremap <unique> <A-6> 6gt
nnoremap <unique> <A-7> 7gt
nnoremap <unique> <A-8> 8gt
nnoremap <unique> <A-9> :tablast<CR>

" переключиться на предыдущую активную вкладку
tnoremap <unique> <A-`> <C-\><C-n>:exe "tabn ".g:LastTab<CR>
inoremap <unique> <A-`> <C-\><C-n>:exe "tabn ".g:LastTab<CR>
nnoremap <unique> <A-`> :exe "tabn ".g:LastTab<CR>

nnoremap <unique> <Leader>t :tabnew<CR>
nnoremap <unique> <Leader>n :enew<CR>
nnoremap <unique> <Leader>` :terminal /usr/bin/zsh<CR>
nnoremap <unique> <Leader>c :tabnew \| terminal<CR>
nnoremap <unique> <Leader>" :split \| terminal<CR>
nnoremap <unique> <Leader>% :vsplit \| terminal<CR>

" plugin:fzf {{{
nnoremap <unique> <Leader>bb :Buffers<CR>
nnoremap <unique> <Leader>ba :AllBuffers<CR>
nnoremap <unique> <Leader>bt :TabBuffers<CR>
nnoremap <unique> <Leader>pf :Files<CR>
nnoremap <unique> <C-p> :Files<CR>
nnoremap <unique> <Leader>pg :Rg<Space>
nnoremap <unique> <Leader>/  :BLines<CR>
nnoremap <unique> <Leader>?  :Lines<CR>
nnoremap <unique> <Leader>'r :MRU<CR>
nnoremap <unique> <Leader>'m :FileMarks<CR>
nnoremap <unique> <Leader>'z :Z<CR>
" Mapping selecting mappings
nmap <unique> <Leader><Tab> <plug>(fzf-maps-n)
xmap <unique> <Leader><Tab> <plug>(fzf-maps-x)
omap <unique> <Leader><Tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <unique> <C-x><C-j> <plug>(fzf-complete-file-ag)
" }}}

" plugin:miniyank {{{
nnoremap <A-p> :YanksAfter<CR>
nnoremap <A-P> :YanksBefore<CR>
inoremap <A-p> <Nop>
inoremap <A-P> <Nop>
" }}}

" plugin:windowswap {{{
nnoremap <silent> <Leader>w :call WindowSwap#EasyWindowSwap()<CR>
" }}}

" plugin:node {{{
autocmd FileType javascript
  \ nmap <buffer> <LocalLeader>gf <Plug>NodeGotoFile
autocmd FileType javascript
  \ nmap <buffer> <LocalLeader><C-w>f <Plug>NodeSplitGotoFile
autocmd FileType javascript
  \ nmap <buffer> <LocalLeader><C-w><C-f> <Plug>NodeSplitGotoFile
autocmd FileType javascript
  \ nmap <buffer> <LocalLeader><C-w>gf <Plug>NodeTabGotoFile
" }}}

" plugin:ctrlspace {{{
tnoremap <C-Space> <C-\><C-n>:CtrlSpace<CR>
inoremap <C-Space> <C-\><C-n>:CtrlSpace<CR>
let g:CtrlSpaceDefaultMappingKey = "<C-Space> "
" }}}
