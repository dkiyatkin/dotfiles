scriptencoding utf-8

" https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
set modelines=0
set nomodeline

" skip initialization for vim-tiny or vim-small
if !1 | finish | endif

" определение <Leader> и <LocalLeader> в самом начале {{{
" <Space> для Leader удобно нажимать и видно что в showcmd(_)
" все основные пользовательские хоткеи, только для нормального режима
nnoremap _ <Nop>
let g:mapleader = "_"
map <Space> <Leader>
" <Bslash> для LocalLeader
" хоткеи: системные, режим правки, очень редкие, персональные для определенного буфера
let g:maplocalleader = "\\"
" }}}

" базовые настройки для редактора {{{
set synmaxcol=500
set showcmd " показывать команды справа внизу
set notimeout " отключим таймаут для leader
set nojoinspaces " не вставлять лишних пробелов при объединении строк
set visualbell
set history=10000 " Number of things to remember in history
set number " Включает отображение номеров строк
" set relativenumber " номера относительно текущей строки
set hidden
set linebreak
set list
set listchars=tab:├─,trail:·,extends:»,precedes:«,nbsp:␣ " ,eol:¬
let &showbreak = '+++ ' " индикатор переноса
set cpoptions+=n " отображение переноса в столбике с цифрами
set hlsearch " Включаем подсветку выражения, которое ищется в тексте
set ignorecase
set smartcase
set foldlevel=16
set foldmethod=indent
set mouse=a " enable mouse use in all modes
set lazyredraw " don't redraw while executing macros (good performance config)
set showtabline=1

" служебные файлы рядом с редактируемым файлом, они должны быть в ~/.gitignore_global
silent !mkdir ~/.local/share/nvim/undo > /dev/null 2>&1
set undodir=.,~/.local/share/nvim/undo
set undofile
silent !mkdir ~/.local/share/nvim/backup > /dev/null 2>&1
set backupdir=.,~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//

set scrollback=100000
" set termguicolors
set cursorline
set cursorcolumn
set previewheight=7

" https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally
set splitbelow splitright

set sessionoptions-=help
set wildignore=Session.vim

set shell=/bin/zsh

" https://github.com/onivim/oni/issues/962
augroup TerminalStuff
  au!
  autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no
  autocmd TermOpen * startinsert
  autocmd BufEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
augroup END

" https://www.reddit.com/r/vim/comments/3ae4qf/psa_set_clipboardunnamed/
" set clipboard^=unnamedplus
" }}}

let did_indent_on = 1

if exists('g:gui_oni')
  set noswapfile
  set noshowmode
endif

" ~/.local/share/nvim/site/pack/git/repos.conf

" ~/.config/nvim/plugin/my-pack-conf/base.vim

let g:myPackConfOpt = 1

if (exists('g:myPackConfOpt') && g:myPackConfOpt && !exists('g:vscode'))
  " plugin:seoul256 {{{
  " https://vi.stackexchange.com/questions/2938/can-the-split-separator-in-vim-be-less-than-a-full-column-wide
  set fillchars+=vert:\ 
  autocmd ColorScheme * highlight VertSplit ctermbg=NONE guibg=NONE
  let g:seoul256_background = 236
  colorscheme seoul256
  set background=light
  " }}}

  packadd! tmux-focus-events
  packadd! tmux-clipboard
  " packadd! tmux-navigator
  packadd! tmux

  " ~/.config/nvim/plugin/my-pack-conf/enhancement.vim {{{
  packadd! undotree
  packadd! fzf
  packadd! fzf-quickfix
  packadd! ft-gitcommit-plugin
  packadd! fugitive
  packadd! gv
  packadd! gitv
  packadd! gitgutter
  packadd! signature
  packadd! vimlparser
  packadd! vimlint
  packadd! coc
  packadd! ctrlspace
  " }}}

  " ~/.config/nvim/plugin/my-pack-conf/filetype.vim {{{
  packadd! json
  packadd! javascript
  packadd! yats
  packadd! jsx-pretty
  packadd! syntax-vim-ex
  packadd! mustache-handlebars
  packadd! redis
  packadd! html5
  packadd! npr
  packadd! css3-syntax
  packadd! less
  packadd! css-color
  packadd! markdown
  packadd! nginx
  packadd! fish
  " }}}

  " ~/.config/nvim/plugin/my-pack-conf/appearance.vim {{{
  packadd! seoul256
  packadd! base16
  packadd! dracula
  packadd! airline
  packadd! airline-themes
  packadd! goyo
  packadd! limelight
  " }}}
endif
