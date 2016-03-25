" http://vim.wikia.com/wiki/Avoid_scrolling_when_switch_buffers {{{
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
" }}}

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

" gitv
" навигация по diff git
" TODO поиск вхождения до конца строки и на несколько строк
nnoremap <Leader>/dg /^diff --git<CR>:call histdel("search", -1)<CR>
nnoremap <Leader>/gd /^diff --git<CR>:call histdel("search", -1)<CR>

" LocalLeader для операций с именами файлов, потому что они могут происходить в режиме вставки
" TODO
" autocmd BufDelete * let g:latestdeletedbuffer = expand("<afile>:p")
" nnoremap <F8> :e <C-R>=fnameescape(g:latestdeletedbuffer)<CR><CR>

" TODO # - alternate file

" TODO
" " скопировать полный путь файла
" nnoremap <LocalLeader>yff
" " показать полный путь файла (n_1-CTRL-g)
" nnoremap <LocalLeader>1CTRL-G
" " вставить полный путь файла во всех режимах
" nnoremap <LocalLeader>pff

" скопировать относительный путь файла
" nnoremap y<LocalLeader><C-g> :let @+=expand("%")<CR>:echo '.expand("%")'.' [Скопировано]'<CR>
" " показать относительный путь файла (n_CTRL-g)
" nnoremap <LocalLeader><C-g><C-g> :echo "Copied: ".expand("%")<CR>
" " вставить относительный путь файла во всех режимах
" nnoremap <LocalLeader><C-g>p
" inoremap <LocalLeader>pfr <C-r>=expand("%")<CR>
" cnoremap <LocalLeader>pfr <C-r>=expand("%")<CR>

" TODO
" " скопировать имя файла
" nnoremap <LocalLeader>yfn
" " показать имя файла
" nnoremap <LocalLeader>0CTRL-G
" " вставить имя файла во всех режимах
" nnoremap <LocalLeader>pfn
