" vim: set foldmethod=marker :

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim-dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim-dein'))

" Let dein manage dein
" Required:
call dein#add(expand('~/.vim-dein/repos/github.com/Shougo/dein.vim'))

" Add or remove your plugins here:
" System: {{{
call dein#add('Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ })
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim', {'depends': ['neomru.vim']})
call dein#add('tacroe/unite-mark')
call dein#add('tsukkee/unite-help')
call dein#add('tmhedberg/matchit') " без matchit не работает % для {} html файлах
call dein#add('tpope/vim-sensible')
call dein#add('ConradIrwin/vim-bracketed-paste') " умная вставка, i_ctrl-r не применяется
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround', {'depends': 'vim-repeat'})
call dein#add('tpope/vim-unimpaired', {'depends': 'vim-repeat'})
call dein#add('tomtom/tcomment_vim')
call dein#add('vim-scripts/PreserveNoEOL') " оставлять окончание файла как есть
call dein#add('editorconfig/editorconfig-vim') " общие конфигурации для файлов
call dein#add('vim-utils/vim-alt-mappings', {'if': '!has("nvim")'}) " включить alt клавиши для терминала
call dein#add('vim-scripts/confirm-quit') " спрашивать закрытие окон
call dein#add('ap/vim-you-keep-using-that-word') " change cw, cW
" }}}

" Themes: {{{
call dein#add('junegunn/seoul256.vim')
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('jszakmeister/vim-togglecursor')
call dein#add('junegunn/goyo.vim')
call dein#add('junegunn/limelight.vim')
" }}}

" Extends: {{{
call dein#add('vim-ctrlspace/vim-ctrlspace')
call dein#add('tpope/vim-speeddating')
call dein#add('xolox/vim-misc')
call dein#add('xolox/vim-shell', {'depends': 'vim-misc'}) " fullscreen and open http://ya.ru '~/.gvimrc'
call dein#add('tyru/open-browser.vim')
call dein#add('mbbill/undotree') " дерево истории
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('tpope/vim-git')
call dein#add('tpope/vim-fugitive', {'depends': 'vim-git'})
call dein#add('gregsexton/gitv', {'depends': 'vim-fugitive'})
call dein#add('rdolgushin/gitignore.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('kshenoy/vim-signature') " метки
call dein#add('jpalardy/vim-slime') " отправить текст под курсором в терминал с `tmux -L slime`, пример 'ls'
call dein#add('scrooloose/syntastic')
call dein#add('ynkdir/vim-vimlparser')
call dein#add('syngan/vim-vimlint', {'depends': 'vim-vimlparser'})
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
" TODO
" call dein#add('Valloric/YouCompleteMe', {
" \ 'build'      : {
" \     'mac'     : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
" \     'unix'    : 'git submodule update --init --recursive; ./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
" \     'windows' : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer',
" \     'cygwin'  : './install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer'
" \   }
" \ })
call dein#add('ternjs/tern_for_vim', {'build' : { 'linux': 'npm install' }})
call dein#add('justinmk/vim-sneak')
call dein#add('godlygeek/tabular')
" }}}

" Filetypes: {{{
call dein#add('kchmck/vim-coffee-script')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('derekwyatt/vim-scala')
call dein#add('junegunn/vim-redis')
call dein#add('othree/html5.vim')
call dein#add('Valloric/MatchTagAlways') " подсветка тэгов
call dein#add('elzr/vim-json')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx', {'depends': 'vim-javascript'})
call dein#add('hail2u/vim-css3-syntax')
call dein#add('groenewege/vim-less')
" call dein#add('wavded/vim-stylus', {'depends': 'lepture/vim-css'})
call dein#add('ap/vim-css-color')
call dein#add('digitaltoad/vim-jade')
call dein#add('evanmiller/nginx-vim-syntax')
call dein#add('plasticboy/vim-markdown', {'depends': 'tabular'})
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

" установить плагины
nnoremap <Leader>pi :call dein#install()<CR>
" отключить неиспользуемые плагины
nnoremap <Leader>pr :call dein#recache_runtimepath()<CR>
" обновить плагины
nnoremap <Leader>pu :call dein#update()<CR>
