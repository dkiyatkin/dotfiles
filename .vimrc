scriptencoding utf-8
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" определение <Leader> и <LocalLeader> в самом начале
source ~/.vim/settings/leader.vim

" определение плагинов, загружаются в последнюю очередь
source ~/.vim/settings/plugins.vim

" базовые настройки для редактора
source ~/.vim/settings/options.vim

" настройки плагинов
source ~/.vim/settings/unite.vim
source ~/.vim/settings/plugin-options.vim
source ~/.vim/settings/themes.vim

" дополнительные настройки и собственные плагины
source ~/.vim/settings/escape.vim
source ~/.vim/settings/common-hotkeys.vim
source ~/.vim/settings/jump-buf-win-tab.vim
source ~/.vim/settings/save.vim

" языковые настройки
source ~/.vim/settings/language.vim

" собственные маппинги
source ~/.vim/settings/mappings.vim

" нестандартные настройки
source ~/.vim/settings/scripts.vim
source ~/.vim/settings/copy-filename.vim
source ~/.vim/settings/q-exit.vim

" /usr/share/vim/vim74/mswin.vim
" ~/.vim/after/plugin/plugin.vim
" ~/.vim/after/ftplugin.vim

" TODO
" увеличить высоту GStatus, большой список съезжает при добавлении в git файлов
" возможно стандартное управление нуждно везде одинаковое, для кода `o` например не должно делать дополнительный отступ
" отключить автоперенос строк в комментариях
" справка по своим функциям и клавишам, например как менять стиль отступов? (узнать что это F9)
" nolist cursorline Highlighting tab or space, space end of line
" iskeyword
" CTRL-\ CTRL-N and CTRL-\ CTRL-G
" better-f, sneak, ;, :
" хоткей для чеклистов: отметить, добавить новый в списке
" TAB в visual mode, konsole
" коммандный режим: разные диапозоны слов для ctrl-left|right, ctrl-backspace
" коммандный режим: не работает ctrl-delete
" горизонтальный скролл когда курсор на пустой строке (:set virtualedit=all)
" включать timeout при нажатии esc
" стиль курсора в cmdline
" Unite появление не вверху в углу
" i_CTRL-O в конце строки переходит на один символ назад, убрать из кейбиндов
" курсор в normal mode не меняется от iminsert
" ctrl-alt-r RestartVim если нет несохраненных изменений
" слишком яркие diff цвета (кроме gitdiff)
" vmap добавить пустые строки по краям выделения
" Unite ctrl-l не убирает подсветку
" при свертке фолдов может нарушится расцветка синтаксиса
" ycm goto decloration, ctags, syntastic goto, ternjs
" nerdtree при октрытии файла прыгает на вкладку с уже открытым файлом
" попробовать принудительный tw, gq, formatoptions
" сделать map на отступы по 1 пробелу
" vim - при bd не закрывать вкладку, если в ней есть еще другие буфферы
" vim - помечать вкладки
" rhubarb.vim
" уменьшать, увеличивать шрифт, возвращать размер по умолчанию

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
" read file by ext new auto format code
" project
" emmet vs sparkup js, neosnippet, html beautify, tern
