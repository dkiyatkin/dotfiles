scriptencoding utf-8
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

source ~/.vim/leader.vim

source ~/.vim/plugins.vim

" настройки для редактора
source ~/.vim/settings.vim

" языковые настройки
source ~/.vim/language.vim

source ~/.vim/mappings.vim

" настройки связанные с плагинами
source ~/.vim/settings-plugins.vim

" нестандартные настройки
source ~/.vim/scripts.vim

" ~/.vim/after/plugin/plugin.vim
" ~/.vim/after/ftplugin.vim

" TODO
" ctrlspace не отключается автосохранение
" Unite появление не вверху в углу
" i_CTRL-O в конце строки переходит на один символ назад, убрать из кейбиндов
" курсор в normal mode не меняется от iminsert
" ctrl-alt-r RestartVim если нет несохраненных изменений
" слишком яркие diff цвета (кроме gitdiff)
" vmap добавить пустые строки по краям выделения
" RestartVim для ctrlspace
" Unite ctrl-l не убирает подсветку
" при свертке фолдов может нарушится расцветка синтаксиса
" ycm goto decloration, ctags, syntastic goto, ternjs
" nerdtree при октрытии файла прыгает на вкладку с уже открытым файлом
" скопировать путь файла относительно pwd
" попробовать принудительный tw, gq, formatoptions
" сделать map на отступы по 1 пробелу
" vim - при bd не закрывать вкладку, если в ней есть еще другие буфферы
" vim - помечать вкладки
" unite bookmark - b,N key conflict
" rhubarb.vim
" neovim - так как обычный vim все равно бывает крэшится
" уменьшать, увеличивать шрифт, возвращать размер по умолчанию
" ctrlspace цвет курсора

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
