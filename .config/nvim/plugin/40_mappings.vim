if (exists('g:loaded_myMappings') && g:loaded_myMappings)
  finish
endif
let g:loaded_myMappings = 1

" plugin:sensible {{{
nnoremap <silent> <A-8> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
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
noremap ; :
noremap ;; <Plug>Sneak_;

" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
nnoremap Y y$

" открывать новый буфер, даже если файл не существует
nnoremap <Leader>gf :e <cfile><CR>

" скролл стрелками для нормального режима
nnoremap <Left> z<Left>
nnoremap <Right> z<Right>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

nnoremap <LocalLeader>ev :vsplit $MYVIMRC<CR>
nnoremap <LocalLeader>sv :source $MYVIMRC<CR>

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

" system, messages | системные сообщения
nnoremap <unique> <Leader>sm :<C-u>Redir messages<CR>

" common-hotkeys {{{

" Use CTRL-S for saving, also in Insert mode
noremap  <C-s> <C-c>:update<CR>
vnoremap <C-s> <C-c>:update<CR>gv
inoremap <C-s> <C-o>:update<CR>

nnoremap [om :set selection=exclusive<CR>
nnoremap ]om :set selection=inclusive<CR>
nnoremap yom :call ToggleSelection()<CR>

" ctrl + backspace
vnoremap <C-BS> d
inoremap <C-BS> <C-w>
cnoremap <C-BS> <C-w>
vnoremap <C-w> d

" ~/.inputrc ctrl + backspace
inoremap <C-h> <C-w>
cnoremap <C-h> <C-w>

" alacritty ctrl + backspace
vnoremap <M-C-H> d
inoremap <M-C-H> <C-w>
cnoremap <M-C-H> <C-w>

" alacritty arrows TODO part-word
cnoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>
inoremap <M-b> <C-Left>
inoremap <M-f> <C-Right>

" " http://superuser.com/a/402247/377338
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

" copy-filename {{{
" copy current file name (relative/absolute) to system clipboard

" " filename, copy, relative | скопировать относительный путь файла (src/foo.txt)
" nnoremap <unique> <Leader>fcr :<C-u>let @+=expand("%")<CR>

" filename, copy, absolute | скопировать абсолютный путь файла (/something/src/foo.txt)
nnoremap <unique> yp :<C-u>let @+=expand("%:p") \| call system("tmux loadb -",expand("%:p"))<CR>
" plugin:tmux {{{
nnoremap <unique> <A-\> :<C-u>let @+=expand("%:p") \| call system("tmux loadb -",expand("%:p")) \| call system("tmux select-pane -t 1")<CR>
" }}}

" " filename, copy, basename | скопировать базовое имя файла (foo.txt)
" nnoremap <unique> <Leader>fcb :<C-u>let @+=expand("%:t")<CR>

" " filename, copy, dirname | скопировать полный путь до директории файла (/something/src)
" nnoremap <unique> <Leader>fcd :<C-u>let @+=expand("%:p:h")<CR>
" }}}

" перемещение в всплывающем меню
inoremap <C-f> <C-R>=pumvisible() ? "\<lt>PageDown>" : "\<lt>C-f>"<CR>
inoremap <C-b> <C-R>=pumvisible() ? "\<lt>PageUp>"   : "\<lt>C-b>"<CR>

" de-emacs-theme {{{
" emacs theme
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
inoremap <C-e> <C-R>=pumvisible() ? "\<lt>C-e>" : "\<lt>End>"<CR>

" select all
nnoremap <A-a> ggVG
inoremap <A-a> <C-c>ggVG
onoremap <A-a> <C-c>ggVG
snoremap <A-a> <C-c>gggH<C-o>G
xnoremap <A-a> <C-c>ggVG
" }}}

" jump-buf-win-tab {{{
" Управление буфферами, окнами, вкладками

" digraph remap, free <C-k>
inoremap <unique> <A-d> <C-k>
cnoremap <unique> <A-d> <C-k>

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

" plugin:sneak {{{
" label-mode
nmap <unique> <Leader>s <Plug>SneakLabel_s
nmap <unique> <Leader>S <Plug>SneakLabel_S
xmap <unique> <Leader>s <Plug>SneakLabel_s
xmap <unique> <Leader>S <Plug>SneakLabel_S
omap <unique> <Leader>s <Plug>SneakLabel_s
omap <unique> <Leader>S <Plug>SneakLabel_S
" 1-character enhanced 'f'
nmap <unique> f <Plug>Sneak_f
nmap <unique> F <Plug>Sneak_F
" visual-mode
xmap <unique> f <Plug>Sneak_f
xmap <unique> F <Plug>Sneak_F
" operator-pending-mode
omap <unique> f <Plug>Sneak_f
omap <unique> F <Plug>Sneak_F
" 1-character enhanced 't'
nmap <unique> t <Plug>Sneak_t
nmap <unique> T <Plug>Sneak_T
" visual-mode
xmap <unique> t <Plug>Sneak_t
xmap <unique> T <Plug>Sneak_T
" operator-pending-mode
omap <unique> t <Plug>Sneak_t
omap <unique> T <Plug>Sneak_T
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

" переключиться на предыдущую активную вкладку
nnoremap <unique> <Leader>tl :exe "tabn ".g:LastTab<CR>

" plugin:fzf {{{
nnoremap <unique> <Leader>bb :Buffers<CR>
nnoremap <unique> <Leader>ba :AllBuffers<CR>
nnoremap <unique> <Leader>bt :TabBuffers<CR>
nnoremap <unique> <Leader>pf :Files<CR>
nnoremap <unique> <Leader>pg :Ag<Space>
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
let g:CtrlSpaceDefaultMappingKey = "<C-Space> "
" }}}
