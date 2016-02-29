scriptencoding utf-8
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
" <Space> для Leader удобно нажимать и видно что в showcmd(_)
" все основные пользовательские хоткеи, только для нормального режима
nnoremap _ <Nop>
let g:mapleader = "_"
map <Space> <Leader>
" <Bslash> для LocalLeader
" хоткеи: системные, режим правки, очень редкие, персональные для определенного буфера
let g:maplocalleader = "\\"

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
" для neobundle. быстрый поиск в данных
NeoBundle 'Shougo/unite.vim', {'depends': ['Shougo/neomru.vim']}

NeoBundle 'vim-ctrlspace/vim-ctrlspace'
autocmd BufNewFile,BufRead cs_workspaces setlocal filetype=vim
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceGlobCommand = 'ag -l --hidden --nocolor -g ""'
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1

" ctrlspace
" NeoBundle 'DeaR/vim-tabpagebuffer-misc', {'depends': 'Shougo/tabpagebuffer.vim'}
" " не удалять вкладочные буферы
" " let g:tabpagebuffer#command#bdelete_keeptabpage = 1

NeoBundle 'tacroe/unite-mark'
NeoBundle 'tsukkee/unite-help'
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Disable cursor looping
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! nunmap <buffer> k
  silent! nunmap <buffer> j
  " Возвращаем <Leader> для sneak, TODO придумать замену для Space (Shift-j-k)
  silent! nunmap <buffer> <Space>
  " Unite Tab не то делает, остается работать в режиме правки
  silent! nunmap <buffer> <Tab>
endfunction
let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
" Use ag in unite grep source.
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '-i --line-numbers --nocolor --nogroup --hidden -S'
let g:unite_source_grep_recursive_opt = ''
" без matchit не работает % для {} html файлах
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-sensible'
" умная вставка
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround', {'depends': 'tpope/vim-repeat'}
NeoBundle 'tpope/vim-unimpaired', {'depends': 'tpope/vim-repeat'}
NeoBundle 'tomtom/tcomment_vim'
" Оставлять окончание файла как есть
NeoBundle 'vim-scripts/PreserveNoEOL'
let g:PreserveNoEOL = 1
" общие конфигурации для файлов
NeoBundle 'editorconfig/editorconfig-vim'
let g:EditorConfig_preserve_formatoptions = 1

" Filetypes:
autocmd BufNewFile,BufRead .npmrc setlocal filetype=dosini
autocmd BufNewFile,BufRead .bash_aliases setlocal filetype=sh
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mustache/vim-mustache-handlebars'
autocmd BufNewFile,BufRead *.tpl setfiletype mustache
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'junegunn/vim-redis'
NeoBundle 'othree/html5.vim'
" подсветка тэгов
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
" let g:vim_json_warnings = 0
autocmd BufNewFile,BufRead .eslintrc,.babelrc setlocal filetype=json
NeoBundle 'pangloss/vim-javascript'
let g:javascript_enable_domhtmlcss=1
" autocmd BufNewFile,BufRead *.jsx setfiletype javascript
NeoBundle 'mxw/vim-jsx', {'depends': 'pangloss/vim-javascript'}
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
" NeoBundle 'wavded/vim-stylus', {'depends': 'lepture/vim-css'}
NeoBundle 'ap/vim-css-color'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'evanmiller/nginx-vim-syntax'
" тормозит, используем встроенный
" NeoBundle 'plasticboy/vim-markdown'
" let g:vim_markdown_initial_foldlevel=3

" Theme Bundles:
NeoBundle 'junegunn/seoul256.vim'
let g:seoul256_background = 235
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
let g:airline_theme='tomorrow'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_exclude_preview = 1 " ctrlspace

" Extends:
NeoBundle 'tpope/vim-speeddating'
" fullscreen and open http://ya.ru '~/.gvimrc'
NeoBundle 'xolox/vim-shell', {'depends': 'xolox/vim-misc'}
nnoremap gx :Open<CR>
NeoBundle 'tyru/open-browser.vim'
vmap gx <Plug>(openbrowser-smart-search)
vmap <F6> <Plug>(openbrowser-smart-search)

" ctrlspace
" автосохранение сессий
" NeoBundle 'xolox/vim-session', {'depends': 'xolox/vim-misc'}
" let g:session_autosave='yes'
" let g:session_autoload='yes'
" set sessionoptions-=help
" " set sessionoptions-=buffers
" let g:session_command_aliases = 1
" " TODO t:tabpagebuffer
" " let g:session_persist_globals = []

" дерево истории
NeoBundle 'mbbill/undotree'
function g:Undotree_CustomMap()
  silent! nunmap <buffer> <Tab>
endfunc
nnoremap <Leader>ut :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 4

NeoBundle 'scrooloose/nerdtree'
" autocmd FileType nerdtree,tagbar setlocal nocursorcolumn
let g:NERDTreeWinSize=50
let g:NERDTreeMinimalUI=1
nmap <M-\> <Esc>\
nnoremap <Leader>\ :NERDTree<CR>

NeoBundle 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_gui_startup = 0
nnoremap <C-\> :NERDTreeTabsToggle<CR>
nnoremap <Esc>\ :NERDTreeTabsFind<CR>

NeoBundle 'Xuyuanp/nerdtree-git-plugin'

NeoBundle 'tpope/vim-fugitive', {'depends': 'tpope/vim-git'}
set previewheight=20
" nmap <Leader>gs :Gstatus<CR><C-w>10+
nnoremap <Leader>gs :Gstatus<CR>
" проиндексировать все изменения и сделать коммит
command IGitAddAllCommit Git add --all . | Gcommit

NeoBundle 'rdolgushin/gitignore.vim'
autocmd BufNewFile,BufRead .gitignore_global setlocal filetype=gitignore
NeoBundle 'airblade/vim-gitgutter'
" Метки
NeoBundle 'kshenoy/vim-signature'
" Отправить текст под курсором в терминал, должен быть открыт `tmux -L slime`. Пример 'ls'.
NeoBundle 'jpalardy/vim-slime'
let g:slime_target = 'tmux'
let g:slime_no_mappings = 1
xmap <LocalLeader>s <Plug>SlimeRegionSend
nmap <LocalLeader>s <Plug>SlimeMotionSend
nmap <LocalLeader>ss <Plug>SlimeLineSend
let g:slime_default_config = {'socket_name': 'slime', 'target_pane': '0'}
NeoBundle 'scrooloose/syntastic'
let g:syntastic_error_symbol = 'E!'
let g:syntastic_style_error_symbol = 'SE'
let g:syntastic_warning_symbol = 'W!'
let g:syntastic_style_warning_symbol = 'SW'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 " автоматически открывать и закрывать :Errors
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <F5> :SyntasticCheck<CR>
" let g:syntastic_html_tidy_ignore_errors=['trimming empty <i>', 'trimming empty <span>', '<form> lacks "action" attribute', '<input> proprietary attribute "required"']
" let g:syntastic_html_checkers=['tidy','jshint']
" autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs'] : ['jshint']
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_jade_checkers = ['jade_lint']
NeoBundle 'syngan/vim-vimlint', {'depends': 'ynkdir/vim-vimlparser'}
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
NeoBundle 'Valloric/YouCompleteMe', {
\ 'build'      : {
\     'mac'     : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
\     'unix'    : 'git submodule update --init --recursive; ./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
\     'windows' : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
\     'cygwin'  : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer'
\   }
\ }
let g:neobundle#install_process_timeout = 1500
let g:ycm_key_list_select_completion = ['<Down>'] " ctrl-n
let g:ycm_key_list_previous_completion = ['<Up>'] " ctrl-p
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
" если 1, то при русской раскладке могут вставиться буквы английской
let g:ycm_auto_trigger = 0 " CTRL-X CTRL-U
" let g:ycm_min_num_of_chars_for_completion = 99
function! ToggleYcmAutoTrigger()
  if g:ycm_auto_trigger
    let g:ycm_auto_trigger = 0
  else
    let g:ycm_auto_trigger = 1
  endif
  echo 'g:ycm_auto_trigger = '.g:ycm_auto_trigger
endfunction
" TODO режим правки
nnoremap <LocalLeader><C-Space> :call ToggleYcmAutoTrigger()<CR>
NeoBundle 'ternjs/tern_for_vim', {'build' : { 'linux': 'npm install' }}
NeoBundle 'justinmk/vim-sneak'
let g:sneak#streak = 1
nmap <Leader>s <Plug>Sneak_s
nmap <Leader>S <Plug>Sneak_S
xmap <Leader>s <Plug>Sneak_s
xmap <Leader>S <Plug>Sneak_S
omap <Leader>s <Plug>Sneak_s
omap <Leader>S <Plug>Sneak_S

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Settings:
set showcmd " показывать команды справа внизу
" не включаем цветную тему для tty терминала
if $TERM != 'linux'
  colorscheme seoul256
endif
set notimeout " отключим таймаут для leader
set nojoinspaces " не вставлять лишних пробелов при объединении строк
set visualbell
set history=10000 " Number of things to remember in history
set number " Включает отображение номеров строк
set relativenumber " номера относительно текущей строки
" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden
set linebreak " Перенос строк по словам, а не по буквам TODO не работает вместе с set list
set list
set listchars=tab:├─,trail:·,extends:»,precedes:«,nbsp:␣ " ,eol:¬
let &showbreak = '+++ ' " индикатор переноса
set cpoptions+=n " отображение переноса в столбике с цифрами
" set shiftwidth=8 tabstop=8 " Размер табулации по умолчанию
" set expandtab " пробелы за мето табов
set cursorline " Подсветка текущей строки --тормозит
set cursorcolumn " подсветка колонки
set hlsearch " Включаем подсветку выражения, которое ищется в тексте
set ignorecase
set smartcase
set whichwrap+=<,>,[,] " cursor keys wrap to previous/next line
set foldlevel=16
set foldmethod=indent
" let g:xml_syntax_folding=1 " jsx syntax bug
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
" vnoremap <Space> zf
" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" переключение расскладки ctrl-6
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
" setlocal spell spelllang=ru_yo,en_us
" set wildignore=*.o,*~,*.pyc,.git/,.hg/,.svn/,.DS_Store
" set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.exe
set wildignore=*~
" sbuffer переключает на существующую вкладку
" set switchbuf=useopen,usetab,newtab
if has('persistent_undo')
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undodir=~/.vim/undo
  set undofile
endif
silent !mkdir ~/.vim/backup > /dev/null 2>&1
silent !mkdir ~/.vim/swp > /dev/null 2>&1
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" подсветка вспомогательных слов в комментариях
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\|REMOVE\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|OPTIMIZE\|REVIEW\|HACK\|CHANGED\|XXX\|UNDONE\|TO DO\|REFACTOR\|DEPRECATED\|TASK\|CHGME\|NOTREACHED\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(WTF\|BUG\|!!!\|???\|ERROR\|OMG\|ERR\|OMFGRLY\|WARNING\|WARN\|BROKEN\)')

" UltiSnips:
autocmd Filetype html :UltiSnipsAddFiletypes html.javascript
autocmd Filetype javascript,javascript.jsx :UltiSnipsAddFiletypes javascript-jsdoc
autocmd Filetype javascript,javascript.jsx :UltiSnipsAddFiletypes javascript-node

" Unite:
call unite#custom#profile('default', 'context', {'direction': 'aboveleft'})
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <silent> <Leader>ur :<C-u>UniteResume<CR>
nnoremap <silent> <Leader>fa :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<CR>
nnoremap <silent> <Leader>fg :Unite -buffer-name=grep grep:. -no-empty<CR>
" let g:unite_source_history_yank_enable = 1
" nnoremap <Leader>y :<C-u>Unite history/yank<CR>
" " The prefix key.
" nnoremap    [unite]   <Nop>
" nmap    f [unite]
"
" nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
" 		\ -buffer-name=files buffer bookmark file<CR>
" nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
" 		\ -buffer-name=files buffer bookmark file<CR>
" nnoremap <silent> [unite]r  :<C-u>Unite
" 		\ -buffer-name=register register<CR>
" nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
" nnoremap <silent> [unite]f
" 		\ :<C-u>Unite -buffer-name=resume resume<CR>
" nnoremap <silent> [unite]ma
" 		\ :<C-u>Unite mapping<CR>
" nnoremap <silent> [unite]me
" 		\ :<C-u>Unite output:message<CR>
" nnoremap  [unite]f  :<C-u>Unite source<CR>

" Common Keybindings:
" Tab делает отступы в noramal и visual TODO visual конфликт с ultisnips
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" backspace in Visual mode deletes selection
vnoremap <BS> d
vnoremap <C-BS> d
inoremap <C-BS> <C-W>
cnoremap <C-BS> <C-W>
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
nnoremap <C-Del> de
inoremap <C-Del> <C-O>de

" чтобы курсор тоже передвигался
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

" TODO
" удобные знаки препинания для русской расскладки
" alt-,
inoremap ¬ ,
" alt-.
inoremap ® .
" alt-shift-?
inoremap ¿ ?
" alt-;
inoremap » ;
" alt-shift-:
inoremap » º

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

" отключаем не нужные срабатывания перехода в режим правки
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
" закрыть вкладку по CTRL-F4
nnoremap <C-F4> :tabclose<CR>
inoremap <C-F4> <Esc>:tabclose<CR>
vnoremap <C-F4> <Esc>:tabclose<CR>
" opens a new tab with the current buffer's path
nnoremap <Leader>te :tabedit <C-R>=expand("%:p:h")<CR>/

" ctrlspace
" переключиться на предыдущую активную вкладку
let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" навигация по вкладкам по Ctrl TAB
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
" jumplist without <Tab>
nnoremap <Leader>i <C-I>
nnoremap <Leader>o <C-O>

" навигация по сплитам по TAB в командном режиме
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <Esc>:update<CR>
"inoremap <C-S> <C-O>:update<CR>
inoremap <C-S> <Esc>:update<CR>

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" убираем подсветку по esc
nnoremap <Esc><Esc> :nohlsearch<CR>

" bash-style
" remap <C-K> digraphs
" inoremap <LocalLeader><C-K> <C-K>
" inoremap <C-K> <C-O>d$

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
" q - закрывает справку, syntastic :Errors (qf)
autocmd FileType help nnoremap <buffer> q ZQ
autocmd FileType qf nnoremap <buffer> q :bd<CR>
autocmd FileType nerdtree nnoremap <buffer> q :NERDTreeTabsClose<CR>
" Execute help.
nnoremap <F1> :<C-u>Unite -buffer-name=help -start-insert help<CR>
" Execute help by cursor keyword.
nnoremap <silent> g<F1> :<C-u>UniteWithCursorWord help<CR>
" TODO обработка команд в visual/select mode
" менять раскладку с помощью внешних программ
noremap  <F2> :let &l:imi = !&l:imi<CR>
inoremap <F2> <C-^>
cnoremap <F2> <C-^>

" GitGutter stuff (similar to what unimpaired.vim does).
nnoremap [h :GitGutterPrevHunk<CR>
nnoremap ]h :GitGutterNextHunk<CR>

" TODO
" i_CTRL-O в конце строки переходит на один символ назад, убрать из кейбиндов
" курсор в normal mode не меняется от iminsert
" ctrl-alt-r RestartVim если нет несохраненных изменений
" слишком яркие diff цвета (кроме gitdiff)
" vmap добавить пустые строки по краям выделения
" RestartVim срабатывать только когда все файлы сохранены
" Unite ctrl-l не убирает подсветку
" при свертке фолдов может нарушится расцветка синтаксиса
" ycm goto decloration, ctags, syntastic goto, ternjs
" nerdtree при октрытии файла прыгает на вкладку с уже открытым файлом
" vim-session не сохранять nerdtree
" vim-session не сохраняет список буферов для каждой вкладки tabpagebuffer
" начинает тормозить переход между буферами, сплитами и вкладками
" упорядочить конфиг, найти быстрый способ выявить текущий плагин
" скопировать путь файла относительно pwd
" Ctrl-Shift-PgDn-PgUp перемещать вкладки
" попробовать принудительный tw, gq, formatoptions
" сделать map на отступы по 1 пробелу
" alt-` = alt-ё - переключение на последнию активную вкладку, также alt-номер вкладки
" vim - при bd не закрывать вкладку, если в ней есть еще другие буфферы
" vim - помечать вкладки
" ctrl-x вырезать текст в обычный буфер
" unite bookmark - b,N key conflict
" rhubarb.vim
" neovim - так как обычный vim все равно бывает крэшится
" сохранять NeoBundleLog в файл после обновления, либо научится получать изменения за период с предпоследнего обновления
" уменьшать, увеличивать шрифт, возвращать размер по умолчанию
" цифры на вкладках
" ctrlspace цвет курсора

" показывать preview внизу
" augroup PreviewOnBottom
"   autocmd InsertEnter * set splitbelow
"   autocmd InsertLeave * set splitbelow!
" augroup END

" Remember cursor position when switching buffer
" не переносить курсор в начало строки при смене буферов ctrl-^
if v:version >= 700
  autocmd BufLeave * let b:winview = winsaveview()
  " Except NERDTree
  autocmd BufLeave NERD_tree_\d\+ unlet! b:winview
  " TODO центрировать буфер
  autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" " tagbar
" NeoBundle 'majutsushi/tagbar'
" let g:tagbar_left = 0
" let g:tagbar_width = 25
" let g:tagbar_sort = 0
" let g:tagbar_compact = 1
" let g:tagbar_foldlevel = 2
" let g:tagbar_iconchars = ['▸', '▾']
" let g:tagbar_autofocus = 1
" nmap <M-\> :TagbarToggle<CR>
"
" NeoBundle 'lukaszkorecki/CoffeeTags'
" let g:CoffeeAutoTagFile="./.git/coffeetags"
" let g:CoffeeAutoTagIncludeVars=0

" easytags
" NeoBundle 'xolox/vim-easytags', {'depends': 'xolox/vim-misc'}
" set tags=./.git/tags
" let g:easytags_dynamic_files = 1

" TODO
" backup
" read file by ext new auto format code
" project
" emmet vs sparkup js, neosnippet, html beautify, tern
