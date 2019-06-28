if (exists('g:loaded_myOther') && g:loaded_myOther)
  finish
endif
let g:loaded_myOther = 1

let g:LastTab = 1
autocmd TabLeave * let g:LastTab = tabpagenr()
autocmd BufDelete * call DeleteOneTabpagebuffer(expand('<abuf>'))
autocmd BufEnter,BufWinEnter,BufFilePost * call AddOneTabpagebuffer(expand('<abuf>'))

" подсветка вспомогательных слов в комментариях
" TODO не подсвечивать в nerdtree
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\|REMOVE\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|OPTIMIZE\|REVIEW\|HACK\|CHANGED\|XXX\|UNDONE\|TO DO\|REFACTOR\|DEPRECATED\|TASK\|CHGME\|NOTREACHED\|MAGIC\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(WTF\|BUG\|!!!\|???\|ERROR\|OMG\|ERR\|OMFGRLY\|WARNING\|WARN\|BROKEN\)')

" отключаем перенос набираемого текста по ширине textwidth, за место этого используем gq
" autocmd FileType vim,jade setlocal formatoptions-=t formatoptions-=c formatoptions+=q

autocmd BufNewFile,BufRead ecosystem.json setlocal filetype=javascript
autocmd BufNewFile,BufRead seafile-ignore.txt setlocal filetype=conf
autocmd BufNewFile,BufRead .npmrc setlocal filetype=dosini
autocmd BufNewFile,BufRead .bash_aliases setlocal filetype=sh
autocmd FileType vim setlocal foldmethod=marker
autocmd BufNewFile,BufRead .gitignore_global setlocal filetype=conf

" plugin:languageclient {{{
autocmd FileType javascript setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" }}}

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

" TODO не переключается в vim-sneak
" TODO не работает вместе с `r`, `f`, `F`, `t`, `T` (можно перемапить их на функцию где будет выбираться нужная раскладка и ставится нужный символ, а потом возвращаться старая раскладка)

" при выходе из режима правки всегда переключаться на английскую раскладку клавиатуры
autocmd InsertLeave * silent exe "!gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell --method org.gnome.Shell.Eval 'imports.ui.status.keyboard.getInputSourceManager().inputSources[0].activate()'"

" при выходе из режима команд всегда переключаться на английскую раскладку клавиатуры
" cnoremap <silent> <Esc> <C-c>:silent exe "!xkb-switch -s us"<CR>
" function! s:XkbSwitchUS()
"    silent exe "!xkb-switch -s us"
"    let cmd = getcmdline()
"    return cmd
" endfunction
" cnoremap <CR> <C-\>e<SID>XkbSwitchUS()<CR><CR>

" setlocal spell spelllang=ru_yo,en_us

" " save current view settings on a per-window, per-buffer basis {{{
" " http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers
" function! AutoSaveWinView()
"     if !exists("w:SavedBufView")
"         let w:SavedBufView = {}
"     endif
"     let w:SavedBufView[bufnr("%")] = winsaveview()
" endfunction

" " Restore current view settings.
" function! AutoRestoreWinView()
"     let buf = bufnr("%")
"     if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
"         let v = winsaveview()
"         let atStartOfFile = v.lnum == 1 && v.col == 0
"         if atStartOfFile && !&diff
"             call winrestview(w:SavedBufView[buf])
"         endif
"         unlet w:SavedBufView[buf]
"     endif
" endfunction

" " When switching buffers, preserve window view.
" if v:version >= 700
"     autocmd BufLeave * call AutoSaveWinView()
"     autocmd BufEnter * call AutoRestoreWinView()
" endif
" " }}}
