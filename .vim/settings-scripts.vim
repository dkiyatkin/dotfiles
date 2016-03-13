" подсветка вспомогательных слов в комментариях
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\|REMOVE\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|OPTIMIZE\|REVIEW\|HACK\|CHANGED\|XXX\|UNDONE\|TO DO\|REFACTOR\|DEPRECATED\|TASK\|CHGME\|NOTREACHED\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(WTF\|BUG\|!!!\|???\|ERROR\|OMG\|ERR\|OMFGRLY\|WARNING\|WARN\|BROKEN\)')

" Remember cursor position when switching buffer
" не переносить курсор в начало строки при смене буферов ctrl-^
autocmd BufLeave * let b:winview = winsaveview()
" Except NERDTree
" autocmd BufLeave NERD_tree_\d\+ unlet! b:winview
" autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
function RestoreLinePosition()
  if(exists('b:winview')) | call winrestview(b:winview) | endif
endfunction
nnoremap <silent> <C-^> <C-^>:call RestoreLinePosition()<CR>

" показывать preview внизу
" augroup PreviewOnBottom
"   autocmd InsertEnter * set splitbelow
"   autocmd InsertLeave * set splitbelow!
" augroup END

" q - закрывает справку, syntastic :Errors (qf)
autocmd FileType help nnoremap <buffer> q ZQ
autocmd FileType qf nnoremap <buffer> q :bd<CR>
autocmd FileType nerdtree nnoremap <buffer> q :NERDTreeTabsClose<CR>
" навигация в Cmdwin
autocmd CmdwinEnter * nnoremap <silent> <buffer> q :q<CR>
autocmd CmdwinEnter * nnoremap <buffer> <Tab> <C-c>
autocmd CmdwinEnter * nnoremap <buffer> <S-Tab> <C-c>
