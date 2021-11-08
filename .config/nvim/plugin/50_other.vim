if (exists('g:loaded_myOther') && g:loaded_myOther)
  finish
endif
let g:loaded_myOther = 1

let g:LastTab = 1
autocmd TabLeave * let g:LastTab = tabpagenr()
autocmd BufDelete * call DeleteOneTabpagebuffer(expand('<abuf>'))
autocmd BufEnter,BufWinEnter,BufFilePost * call AddOneTabpagebuffer(expand('<abuf>'))

" подсветка вспомогательных слов в комментариях
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\|REMOVE\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|OPTIMIZE\|REVIEW\|HACK\|CHANGED\|XXX\|UNDONE\|TO DO\|REFACTOR\|DEPRECATED\|TASK\|CHGME\|NOTREACHED\|MAGIC\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(WTF\|BUG\|!!!\|???\|ERROR\|OMG\|ERR\|OMFGRLY\|WARNING\|WARN\|BROKEN\)')

autocmd BufNewFile,BufRead ecosystem.json setlocal filetype=javascript
autocmd BufNewFile,BufRead seafile-ignore.txt setlocal filetype=conf
autocmd BufNewFile,BufRead .npmrc setlocal filetype=dosini
autocmd BufNewFile,BufRead .bash_aliases setlocal filetype=sh
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType qf setlocal nonumber
autocmd FileType help setlocal conceallevel=0 nolist nonumber
autocmd FileType man setlocal signcolumn=auto
autocmd BufNewFile,BufRead .gitignore_global setlocal filetype=conf

" plugin:fish {{{
autocmd FileType fish compiler fish
" }}}

" plugin:limelight {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" plugin:mustache-handlebars {{{
autocmd BufNewFile,BufRead *.tpl setfiletype mustache
" }}}

" plugin:json {{{
autocmd BufNewFile,BufRead .eslintrc,.babelrc setlocal filetype=json
" }}}

" https://www.reddit.com/r/vim/comments/793s17/setting_quickfix_window_height/
autocmd FileType qf 7wincmd_

" всегда переключаться на английскую раскладку клавиатуры
" autocmd InsertLeave * silent exe "!gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'imports.ui.status.keyboard.getInputSourceManager().inputSources[0].activate()'"
autocmd InsertLeave * silent exe "!xkb-switch -s us"
" " }}}
