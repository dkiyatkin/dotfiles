if (exists('g:loaded_myMappings') && g:loaded_myMappings)
  finish
endif
let g:loaded_myMappings = 1

" plugin:sensible {{{
" }}}

" http://vim.wikia.com/wiki/Make_search_results_appear_in_the_middle_of_the_screen
" plugin:visualstar
" nnoremap <unique> n nzz
" nnoremap <unique> N Nzz

" http://vim.wikia.com/wiki/Count_number_of_matches_of_a_pattern
nnoremap <unique> <Leader><C-g> :%s///gn<CR>

" редактирование новых строк с курсором в самом начале
nmap <unique> <A-o> ]<Space>ji
nmap <unique> <A-O> [<Space>ki

" меняем местами ' `
noremap <unique> ' `
noremap <unique> ` '
noremap <unique> g' g`
noremap <unique> g` g'

" нажатие : без шифта
noremap <unique> ; :
noremap <unique> ;; ;
noremap <unique> ,, ,

" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
nnoremap Y y$

nnoremap <unique> <LocalLeader>T :edit TODO.md<CR>

" заменить везде кавычки двойные на одинарные и наоборот
" nnoremap <unique> <Leader>r"' :%s/\"/\'/g<CR>
" nnoremap <unique> <Leader>r'" :%s/\'/\"/g<CR>

" http://superuser.com/questions/216411/go-to-middle-of-line-in-vim
nnoremap <unique> <Leader>gm :exe 'normal '.(virtcol('$')/2).'\|'<CR>

" Easy block selection with mouse http://vim.wikia.com/wiki/VimTip1132
noremap <unique> <A-LeftMouse> <4-LeftMouse>
inoremap <unique> <A-LeftMouse> <4-LeftMouse>
onoremap <A-LeftMouse> <C-c><4-LeftMouse>
noremap <unique> <A-LeftDrag> <LeftDrag>
inoremap <unique> <A-LeftDrag> <LeftDrag>
onoremap <A-LeftDrag> <C-c><LeftDrag>

" заменить два символа http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
nnoremap <silent><unique> <Plug>TransposeCharacters xp
  \:call repeat#set("\<Plug>TransposeCharacters")<CR>
nnoremap <unique> cp <Plug>TransposeCharacters

" TODO folding
" " show only this fold section
" nnoremap <unique> <Leader>z zMzv

" common-hotkeys {{{
" Use `Ctrl+s` for saving, also in Insert mode
noremap <unique>  <C-s> <C-c>:update<CR>
vnoremap <C-s> <C-c>:update<CR>gv
inoremap <unique> <C-s> <C-o>:update<CR>

nnoremap <unique> [om :set selection=exclusive<CR>
nnoremap <unique> ]om :set selection=inclusive<CR>
nnoremap <unique> yom :call ToggleSelection()<CR>

" https://superuser.com/questions/402246/bash-can-i-set-ctrl-backspace-to-delete-the-word-backward/402247#402247
" set <F17>=[9;3~
" vnoremap <unique> <F17> d
" inoremap <unique> <F17> <C-w>
" cnoremap <unique> <F17> <C-w>

" отключаем переключение режимов по `Ctrl+Insert`
noremap <unique> <C-Insert> <Nop>
inoremap <unique> <C-Insert> <Nop>
cnoremap <unique> <C-Insert> <Nop>

" обработка буфера выделения, нет смысла для visual
nnoremap <unique> <C-S-Insert> "*gp
inoremap <unique> <C-S-Insert> <MiddleMouse>
cnoremap <unique> <C-S-Insert> <C-r>*
" }}}

" nnoremap <expr><unique> <C-\> empty(bufname("term://*//*:ranger")) ? ":terminal ranger<CR>" : ":buffer ranger<CR>"

" copy-filename {{{
" filename, copy, relative | скопировать относительный путь файла (src/foo.txt) TODO относительный путь файла от рута гита
nnoremap <unique> yr :<C-u>let @+=expand("%") \| call system("tmux loadb -",expand("%")) \| echo "clipboard:" expand("%")<CR>

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
inoremap <unique> <C-f> <C-r>=pumvisible() ? "\<lt>PageDown>" : "\<lt>C-f>"<CR>
inoremap <unique> <C-b> <C-r>=pumvisible() ? "\<lt>PageUp>"   : "\<lt>C-b>"<CR>

" emacs, bash maps
inoremap <unique> <C-a> <Home>
inoremap <unique> <C-e> <C-R>=pumvisible() ? "\<lt>C-e>" : "\<lt>End>"<CR>

" plugin:husk {{{
cnoremap <expr><unique> <C-Left> husk#left()
cnoremap <expr><unique> <C-Right> husk#right()
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

" навигация по вкладкам по `Ctrl+Tab`
" https://stackoverflow.com/questions/2686766/mapping-c-tab-in-my-vimrc-fails-in-ubuntu/31961401#31961401

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

nnoremap <unique> <C-Tab> gt
nnoremap <unique> <C-S-Tab> gT

" переключиться на предыдущую активную вкладку
tnoremap <unique> <A-0> <C-\><C-n>:exe "tabn ".g:LastTab<CR>
inoremap <unique> <A-0> <C-\><C-n>:exe "tabn ".g:LastTab<CR>
nnoremap <unique> <A-0> :exe "tabn ".g:LastTab<CR>

nnoremap <unique> <Leader>` :terminal<CR>
nnoremap <unique> <C-t> :tabnew<CR>

nnoremap <unique> <Leader><A-h> :leftabove vnew<CR>
nnoremap <unique> <Leader><A-j> :rightbelow new<CR>
nnoremap <unique> <Leader><A-k> :leftabove new<CR>
nnoremap <unique> <Leader><A-l> :rightbelow vnew<CR>

nnoremap <unique> <Leader><A-H> :topleft vnew<CR>
nnoremap <unique> <Leader><A-J> :botright new<CR>
nnoremap <unique> <Leader><A-K> :topleft new<CR>
nnoremap <unique> <Leader><A-L> :botright vnew<CR>

nnoremap <unique> <Leader>w+ :resize +10<CR>
nnoremap <unique> <Leader>w- :resize -10<CR>
nnoremap <unique> <Leader>w< :vertical-resize -40<CR>
nnoremap <unique> <Leader>w> :vertical-resize +40<CR>

" plugin:ctrlspace {{{
tnoremap <unique> <C-Space> <C-\><C-n>:CtrlSpace<CR>
inoremap <unique> <C-Space> <C-\><C-n>:CtrlSpace<CR>
let g:CtrlSpaceDefaultMappingKey = "<C-Space> "

nnoremap <silent><unique> <A-!> :CtrlSpace K q<CR>
nnoremap <silent><unique> <A-@> :CtrlSpace Kj q<CR>
nnoremap <silent><unique> <A-#> :CtrlSpace Kjj q<CR>
nnoremap <silent><unique> <A-$> :CtrlSpace Kjjj q<CR>
nnoremap <silent><unique> <A-%> :CtrlSpace Kjjjj q<CR>
nnoremap <silent><unique> <A-^> :CtrlSpace Kjjjjj q<CR>
nnoremap <silent><unique> <A-&> :CtrlSpace Kjjjjjj q<CR>
nnoremap <silent><unique> <A-*> :CtrlSpace Kjjjjjjj q<CR>
nnoremap <silent><unique> <A-(> :CtrlSpace J q<CR>
nnoremap <unique> <A-)> <C-^>

" plugin:unimpaired {{{
" <LocalLeader>
nnoremap <silent><unique> <A-\>k :CtrlSpace k q<CR>
nnoremap <silent><unique> <A-\>K :CtrlSpace K q<CR>
nnoremap <silent><unique> <A-\>j :CtrlSpace j q<CR>
nnoremap <silent><unique> <A-\>J :CtrlSpace J q<CR>
" }}}

" plugin:bclose {{{
" <LocalLeader>
nnoremap <silent><unique> <A-\>f :CtrlSpace fq<CR>
nnoremap <silent><unique> <A-\>F :CtrlSpace Fq<CR>
" }}}
" }}}

" :h terminal-input
tnoremap <unique> <Esc> <C-\><C-n>

" tnoremap <unique> <C-w>h <C-\><C-n><C-w>h
" tnoremap <unique> <C-w>j <C-\><C-n><C-w>j
" tnoremap <unique> <C-w>k <C-\><C-n><C-w>k
" tnoremap <unique> <C-w>l <C-\><C-n><C-w>l

" inoremap <unique> <A-h> <C-\><C-n><C-w>h
" inoremap <unique> <A-j> <C-\><C-n><C-w>j
" inoremap <unique> <A-k> <C-\><C-n><C-w>k
" inoremap <unique> <A-l> <C-\><C-n><C-w>l
"
" nnoremap <unique> <A-h> <C-w>h
" nnoremap <unique> <A-j> <C-w>j
" nnoremap <unique> <A-k> <C-w>k
" nnoremap <unique> <A-l> <C-w>l

" `Alt+o` `Alt+semicolon` tmux-like
" tnoremap <unique> <A-w> <C-\><C-n><C-w>w
" inoremap <unique> <A-w> <C-\><C-n><C-w>w
" nnoremap <unique> <A-w> <C-w>w
" tnoremap <unique> <A-w> <C-\><C-n><C-w>W
" inoremap <unique> <A-w> <C-\><C-n><C-w>W
" nnoremap <unique> <A-w> <C-w>W
" tnoremap <unique> <A-;> <C-\><C-n><C-w>p
" inoremap <unique> <A-;> <C-\><C-n><C-w>p
" nnoremap <unique> <A-;> <C-w>p

" plugin:bufmru {{{
nnoremap <silent><unique> ]m  :BufMRUPrev<CR>
nnoremap <silent><unique> [m  :BufMRUNext<CR>
nnoremap <silent><unique> <Leader>m  :BufMRUCommit<CR>
" }}}

" `Ctrl+q` `Ctrl+v` conflict. `Alt+v` - i_CTRL-V, `Ctrl+q` - :qall
noremap <unique> <A-v> <C-v>
inoremap <unique> <A-v> <C-v>
cnoremap <unique> <A-v> <C-v>
noremap <unique> <C-q> <C-c>:qall<CR>
inoremap <unique> <C-q> <C-c>:qall<CR>
cnoremap <unique> <C-q> <C-c>:qall<CR>
" tnoremap <unique> <C-q> <C-\><C-n><C-c>:qall<CR>

" из-за частых ошибок (во многих сплитах `q` означает выход), ставим макросы на `Alt+q`
noremap <unique> <A-q> q
noremap <silent><unique> q <C-w>c
" autocmd FileType scratch nnoremap <buffer><unique> q :q<CR>
" autocmd FileType qf nnoremap <silent><buffer><unique> q :bd<CR>
autocmd FileType nerdtree nnoremap <silent><buffer><unique> q :NERDTreeClose<CR>

" навигация в Cmdwin
autocmd CmdwinEnter * nnoremap <silent><buffer><unique> q :q<CR>

autocmd FileType help nnoremap <silent><buffer> gO :call ShowToc()<CR><C-w>L:vertical resize 29<CR>
" }}}

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
" plugin:unimpaired {{{
" css, color, enable | включить css цвета')
nnoremap <unique> <Leader>[oc :<C-u>call css_color#enable()<CR>
" css, color, disable | выключить css цвета')
nnoremap <unique> <Leader>]oc :<C-u>call css_color#disable()<CR>
" css, color, toggle | переключить css цвета')
nnoremap <unique> <Leader>yoc :<C-u>call css_color#toggle()<CR>
" }}}
" }}}

" plugin:gitv {{{
nnoremap <unique> <Leader>gv :Gitv --all<CR>
nnoremap <unique> <Leader>gV :Gitv! --all<CR>
vnoremap <unique> <Leader>gV :Gitv! --all<CR>
" навигация по diff git
nnoremap <unique> <Leader>gd /^diff --git<CR>:call histdel("search", -1)<CR>
" }}}

" plugin:gitgutter {{{
" plugin:unimpaired {{{
nnoremap <unique> [h :GitGutterPrevHunk<CR>
nnoremap <unique> ]h :GitGutterNextHunk<CR>
" }}}
" }}}

" plugin:undotree {{{
nnoremap <unique> <Leader>u :UndotreeToggle<CR>
" }}}

" plugin:fugitive {{{
nnoremap <unique><silent> <Leader>gs :Git<CR>
" }}}

" plugin:fzf {{{
nnoremap <unique> <Leader>r :PopRegisters<CR>
nnoremap <unique> <Leader>k :PopKeyMaps<CR>
" nnoremap <unique> <Leader>m :PopMarks<CR>

nnoremap <unique> <F1> :Helptags<CR>
nnoremap <unique> <Leader>bb :Buffers<CR>
nnoremap <unique> <Leader>ba :AllBuffers<CR>
nnoremap <unique> <Leader>bt :TabBuffers<CR>

nnoremap <unique> <Leader>pf :Files<CR>
nnoremap <unique> <C-p> :Files<CR>

nnoremap <unique> <Leader>pg :Rg<Space>
" alacritty `Ctrl+Shift+f`
nnoremap <unique> <F21> :Rg<Space>

nnoremap <unique> <Leader>/  :BLines<CR>
nnoremap <unique> <Leader>?  :Lines<CR>
nnoremap <unique> <Leader>M :MRU<CR>
" nnoremap <unique> <Leader>'m :FileMarks<CR>
nnoremap <unique> <Leader>'z :Z<CR>
" mapping selecting mappings
nnoremap <unique> <Leader><Tab> <plug>(fzf-maps-n)
xnoremap <unique> <Leader><Tab> <plug>(fzf-maps-x)
onoremap <unique> <Leader><Tab> <plug>(fzf-maps-o)
" Insert mode completion
inoremap <unique> <C-x><C-j> <plug>(fzf-complete-file-ag)
" }}}

" plugin:miniyank {{{
nnoremap <unique> <A-p> :YanksAfter<CR>
nnoremap <unique> <A-P> :YanksBefore<CR>
inoremap <unique> <A-p> <Nop>
inoremap <unique> <A-P> <Nop>
" }}}

" plugin:windowswap {{{
nnoremap <silent><unique> <Leader>w :call WindowSwap#EasyWindowSwap()<CR>
" }}}

" plugin:node {{{
autocmd FileType javascript
  \ nnoremap <buffer><unique> <LocalLeader>gf <Plug>NodeGotoFile
autocmd FileType javascript
  \ nnoremap <buffer><unique> <LocalLeader><C-w>f <Plug>NodeSplitGotoFile
autocmd FileType javascript
  \ nnoremap <buffer><unique> <LocalLeader><C-w><C-f> <Plug>NodeSplitGotoFile
autocmd FileType javascript
  \ nnoremap <buffer><unique> <LocalLeader><C-w>gf <Plug>NodeTabGotoFile
" }}}

" plugin:fetch {{{
" https://vi.stackexchange.com/questions/3364/open-filename-under-cursor-like-gf-but-in-a-new-tab-or-split/3369#3369
nnoremap <unique> <C-w><C-f> <C-w>vgf
" alacritty `Ctrl+Shift+f`
nnoremap <unique> <C-W><F21> <C-W>vgF
" open new buffer when file doesn't exist
nnoremap <unique> <Leader>gf :edit <cfile><CR>
nnoremap <unique> <Leader><C-W>f :split <cfile><CR>
nnoremap <unique> <Leader><C-W><C-f> :vsplit <cfile><CR>
nnoremap <unique> <Leader><C-W>gf :tabe <cfile><CR>

" TODO errors when wrong files
" nnoremap <silent><unique> <Enter> :normal gF<CR>
" https://stackoverflow.com/questions/437262/how-to-open-a-file-in-a-list-of-files-in-vim/69743457#69743457
" nnoremap <silent><unique> <Leader>f :silent! normal gF<CR>
" nnoremap <silent><unique> <Leader>F :% normal <Leader>F<CR>
" }}}
