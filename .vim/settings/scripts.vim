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

" навигация в Cmdwin
autocmd CmdwinEnter * nnoremap <buffer> <Tab> <C-c>
autocmd CmdwinEnter * nnoremap <buffer> <S-Tab> <C-c>

" gitv
" навигация по diff git
" TODO поиск вхождения до конца строки и на несколько строк
nnoremap <Leader>/dg /^diff --git<CR>:call histdel("search", -1)<CR>
nnoremap <Leader>/gd /^diff --git<CR>:call histdel("search", -1)<CR>
