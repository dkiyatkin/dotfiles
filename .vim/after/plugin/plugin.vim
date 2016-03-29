if exists(':SpeedDatingFormat')
  1SpeedDatingFormat %a %d.%m.%y %H:%M
endif

" подсветка вспомогательных слов в комментариях
" TODO не подсвечивать в nerdtree
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\|REMOVE\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|OPTIMIZE\|REVIEW\|HACK\|CHANGED\|XXX\|UNDONE\|TO DO\|REFACTOR\|DEPRECATED\|TASK\|CHGME\|NOTREACHED\|MAGIC\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(WTF\|BUG\|!!!\|???\|ERROR\|OMG\|ERR\|OMFGRLY\|WARNING\|WARN\|BROKEN\)')

" http://stackoverflow.com/a/24027507/1054723
func! GetScriptNumber(script_name)
  " Return the <SNR> of a script.
  "
  " Args:
  "   script_name : (str) The name of a sourced script.
  "
  " Return:
  "   (int) The <SNR> of the script; if the script isn't found, -1.

  redir => scriptnames
  silent! scriptnames
  redir END

  for script in split(l:scriptnames, "\n")
    if l:script =~ a:script_name
      return str2nr(split(l:script, ":")[0])
    endif
  endfor

  return -1
endfunc

if dein#tap('vim-you-keep-using-that-word')
  " переопределяем вместе с <silent>
  function s:DoWordMotion(wordmotion, endmotion)
    call eval(printf("<SNR>%d_DoWordMotion('".a:wordmotion."','".a:endmotion."')", GetScriptNumber("ykutw.vim")))
  endfunc
  onoremap <silent> w :<C-U>call <SID>DoWordMotion('w','e')<CR>
  onoremap <silent> W :<C-U>call <SID>DoWordMotion('W','E')<CR>
endif


" toggle-indent-style {{{
" нету setlocal noexpandtab tabstop=4 shiftwidth=4<CR>

autocmd BufNewFile,BufReadPost,BufFilePost * let [b:toggle_indent_style_expandtab, b:toggle_indent_style_shiftwidth, b:toggle_indent_style_tabstop] = [&l:expandtab, &l:shiftwidth, &l:tabstop]

function s:TabToggle1()
  set expandtab tabstop=2 shiftwidth=2
  echo '[set custom style] - expandtab='.&expandtab.' tabstop='.&tabstop.' shiftwidth='.&shiftwidth
  return ''
endfunction

function s:TabToggle2()
  set expandtab tabstop=4 shiftwidth=4
  echo '[set custom style] - expandtab='.&expandtab.' tabstop='.&tabstop.' shiftwidth='.&shiftwidth
  return ''
endfunction

function s:TabToggle3()
  set noexpandtab tabstop=8 shiftwidth=8
  echo '[set custom style] - expandtab='.&expandtab.' tabstop='.&tabstop.' shiftwidth='.&shiftwidth
  return ''
endfunction

function s:TabToggleDefault()
  execute "set tabstop=".b:toggle_indent_style_tabstop
  execute "set shiftwidth=".b:toggle_indent_style_shiftwidth
  if b:toggle_indent_style_expandtab
    set expandtab
  else
    set noexpandtab
  endif
  echo '[set default style] - expandtab='.b:toggle_indent_style_expandtab.' tabstop='.b:toggle_indent_style_tabstop.' shiftwidth='.b:toggle_indent_style_shiftwidth
  return ''
endfunction

noremap <silent> <F9> :call <SID>TabToggle1()<CR>
vnoremap <silent> <F9> <C-c>:call <SID>TabToggle1()<CR>gv
inoremap <silent> <F9> <C-r>=<SID>TabToggle1()<CR>

noremap <silent> <C-F9> :call <SID>TabToggle2()<CR>
vnoremap <silent> <C-F9> <C-c>:call <SID>TabToggle2()<CR>gv
inoremap <silent> <C-F9> <C-r>=<SID>TabToggle2()<CR>

noremap <silent> <S-F9> :call <SID>TabToggle3()<CR>
vnoremap <silent> <S-F9> <C-c>:call <SID>TabToggle3()<CR>gv
inoremap <silent> <S-F9> <C-r>=<SID>TabToggle3()<CR>

noremap <silent> <C-S-F9> :call <SID>TabToggleDefault()<CR>
vnoremap <silent> <C-S-F9> <C-c>:call <SID>TabToggleDefault()<CR>gv
inoremap <silent> <C-S-F9> <C-r>=<SID>TabToggleDefault()<CR>
" }}}
