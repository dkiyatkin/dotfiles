" vim: set foldmethod=marker :

" полнынй URI с `https://github.com/` потому что могут быть ошибки если содержимое в pwd похоже на содержимое `~/.local/share/vim/dein/repos/github.com/`

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.local/share/vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.local/share/vim/dein'))

" Let dein manage dein
" Required:
call dein#add(expand('~/.local/share/vim/dein/repos/github.com/Shougo/dein.vim'))

" Add or remove your plugins here:
" System: {{{
call dein#add('https://github.com/Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('https://github.com/Shougo/neomru.vim')
call dein#add('https://github.com/Shougo/unite.vim', {'depends': ['neomru.vim']})
call dein#add('https://github.com/Shougo/neoyank.vim', {'depends': ['unite.vim']})
call dein#add('https://github.com/tacroe/unite-mark')
call dein#add('https://github.com/tsukkee/unite-help')
call dein#add('https://github.com/tmhedberg/matchit') " без matchit не работает % для {} html файлах
call dein#add('https://github.com/tpope/vim-sensible')
call dein#add('https://github.com/ConradIrwin/vim-bracketed-paste') " умная вставка, i_ctrl-r не применяется
call dein#add('https://github.com/tpope/vim-repeat')
call dein#add('https://github.com/tpope/vim-surround', {'depends': 'vim-repeat'})
call dein#add('https://github.com/tpope/vim-unimpaired', {'depends': 'vim-repeat'})
call dein#add('https://github.com/tomtom/tcomment_vim')
call dein#add('https://github.com/vim-scripts/PreserveNoEOL') " оставлять окончание файла как есть
call dein#add('https://github.com/editorconfig/editorconfig-vim') " общие конфигурации для файлов
call dein#add('https://github.com/vim-utils/vim-alt-mappings', {'if': '!has("nvim")'}) " включить alt клавиши для терминала
call dein#add('https://github.com/vim-scripts/confirm-quit') " спрашивать закрытие окон
call dein#add('https://github.com/ap/vim-you-keep-using-that-word') " change cw, cW
" }}}

" Themes: {{{
call dein#add('https://github.com/osyo-manga/unite-quickfix', {'depends': ['unite.vim']}) " TODO unite git log
call dein#add('https://github.com/ujihisa/unite-colorscheme', {'depends': ['unite.vim']})
call dein#add('https://github.com/junegunn/seoul256.vim')
call dein#add('https://github.com/chriskempson/base16-vim')
call dein#add('https://github.com/reedes/vim-colors-pencil')
call dein#add('https://github.com/bling/vim-airline')
call dein#add('https://github.com/vim-airline/vim-airline-themes')
call dein#add('https://github.com/jszakmeister/vim-togglecursor')
call dein#add('https://github.com/junegunn/goyo.vim')
call dein#add('https://github.com/junegunn/limelight.vim')
call dein#add('https://github.com/machakann/vim-highlightedyank')
" }}}

" Extends: {{{
call dein#add('https://github.com/tpope/vim-obsession')
call dein#add('https://github.com/tpope/vim-speeddating')
call dein#add('https://github.com/xolox/vim-misc')
" TODO конфликт ссылок в plasticboy/vim-markdown
" call dein#add('https://github.com/xolox/vim-shell', {'depends': 'vim-misc'}) " fullscreen and open http://ya.ru '~/.gvimrc'
call dein#add('https://github.com/tyru/open-browser.vim')
call dein#add('https://github.com/mbbill/undotree') " дерево истории
call dein#add('https://github.com/scrooloose/nerdtree')
call dein#add('https://github.com/jistr/vim-nerdtree-tabs')
call dein#add('https://github.com/kmnk/vim-unite-giti.git')
call dein#add('https://github.com/Xuyuanp/nerdtree-git-plugin')
call dein#add('https://github.com/tpope/vim-git')
call dein#add('https://github.com/tpope/vim-fugitive', {'depends': 'vim-git'})
call dein#add('https://github.com/gregsexton/gitv', {'depends': 'vim-fugitive'})
call dein#add('https://github.com/rdolgushin/gitignore.vim')
call dein#add('https://github.com/airblade/vim-gitgutter')
call dein#add('https://github.com/kshenoy/vim-signature') " метки
call dein#add('https://github.com/jpalardy/vim-slime') " отправить текст под курсором в терминал с `tmux -L slime`, пример 'ls'
call dein#add('https://github.com/scrooloose/syntastic')
call dein#add('https://github.com/ynkdir/vim-vimlparser')
call dein#add('https://github.com/syngan/vim-vimlint', {'depends': 'vim-vimlparser'})
call dein#add('https://github.com/SirVer/ultisnips')
call dein#add('https://github.com/honza/vim-snippets')
" TODO
" call dein#add('https://github.com/Valloric/YouCompleteMe', {
" \ 'build'      : {
" \     'mac'     : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
" \     'unix'    : 'git submodule update --init --recursive; ./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
" \     'windows' : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
" \     'cygwin'  : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer'
" \   }
" \ })
" TODO
" call dein#add('https://github.com/ternjs/tern_for_vim', {'build' : { 'linux': 'npm install' }})
call dein#add('https://github.com/justinmk/vim-sneak')
call dein#add('https://github.com/godlygeek/tabular')
" }}}

" Filetypes: {{{
call dein#add('https://github.com/kchmck/vim-coffee-script')
call dein#add('https://github.com/mustache/vim-mustache-handlebars')
call dein#add('https://github.com/derekwyatt/vim-scala')
call dein#add('https://github.com/junegunn/vim-redis')
call dein#add('https://github.com/othree/html5.vim')
call dein#add('https://github.com/Valloric/MatchTagAlways') " подсветка тэгов
call dein#add('https://github.com/moll/vim-node')
call dein#add('https://github.com/elzr/vim-json')
" call dein#add('https://github.com/pangloss/vim-javascript')
" call dein#add('https://github.com/mxw/vim-jsx', {'depends': 'vim-javascript'})
call dein#add('https://github.com/othree/yajs.vim')
call dein#add('https://github.com/mxw/vim-jsx', {'depends': 'othree/yajs.vim'})
call dein#add('https://github.com/othree/es.next.syntax.vim')
call dein#add('https://github.com/hail2u/vim-css3-syntax')
call dein#add('https://github.com/groenewege/vim-less')
" call dein#add('https://github.com/wavded/vim-stylus', {'depends': 'lepture/vim-css'})
" TODO vim-css-color портит расцветку
" call dein#add('https://github.com/ap/vim-css-color')
call dein#add('https://github.com/digitaltoad/vim-pug')
call dein#add('https://github.com/nginx/nginx', {'rtp': 'contrib/vim'})
" NOTE в файле `syntax/markdown.vim` закомментирована строка: `syn match   mkdInlineURL`
call dein#add('https://github.com/plasticboy/vim-markdown', {'depends': 'tabular'})
" }}}

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
