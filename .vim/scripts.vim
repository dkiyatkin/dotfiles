" подсветка вспомогательных слов в комментариях
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\|REMOVE\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|OPTIMIZE\|REVIEW\|HACK\|CHANGED\|XXX\|UNDONE\|TO DO\|REFACTOR\|DEPRECATED\|TASK\|CHGME\|NOTREACHED\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(WTF\|BUG\|!!!\|???\|ERROR\|OMG\|ERR\|OMFGRLY\|WARNING\|WARN\|BROKEN\)')

" TODO один файл в нескольких сплитах, сбивается позиция
" Remember cursor position when switching buffer
" не переносить курсор в начало строки при смене буферов ctrl-^
autocmd BufLeave * let b:winview = winsaveview()
" Except NERDTree
autocmd BufLeave NERD_tree_\d\+ unlet! b:winview
" TODO центрировать буфер
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" показывать preview внизу
" augroup PreviewOnBottom
"   autocmd InsertEnter * set splitbelow
"   autocmd InsertLeave * set splitbelow!
" augroup END

" q - закрывает справку, syntastic :Errors (qf)
autocmd FileType help nnoremap <buffer> q ZQ
autocmd FileType qf nnoremap <buffer> q :bd<CR>
autocmd FileType nerdtree nnoremap <buffer> q :NERDTreeTabsClose<CR>
