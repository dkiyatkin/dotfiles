" packloadall
" if &runtimepath =~ '/sensible,'
"   echo 1
" endif

" plugin:sensible {{{
" }}}

" plugin:speeddating {{{
if exists(':SpeedDatingFormat')
  1SpeedDatingFormat %a %d.%m.%y %H:%M
endif
" }}}

" plugin:npr {{{
" }}}

"" toggle-indent-style {{{
"" TODO подвечивать табы или пробелы вначале в зависимости от expandtab
"" нету setlocal noexpandtab tabstop=4 shiftwidth=4<CR>

"autocmd BufNewFile,BufReadPost,BufFilePost * let [b:toggle_indent_style_expandtab, b:toggle_indent_style_shiftwidth, b:toggle_indent_style_tabstop] = [&l:expandtab, &l:shiftwidth, &l:tabstop]

"function s:TabToggle1()
"  set expandtab tabstop=2 shiftwidth=2
"  echo '[set custom style] - expandtab='.&expandtab.' tabstop='.&tabstop.' shiftwidth='.&shiftwidth
"  return ''
"endfunction

"function s:TabToggle2()
"  set expandtab tabstop=4 shiftwidth=4
"  echo '[set custom style] - expandtab='.&expandtab.' tabstop='.&tabstop.' shiftwidth='.&shiftwidth
"  return ''
"endfunction

"function s:TabToggle3()
"  set noexpandtab tabstop=8 shiftwidth=8
"  echo '[set custom style] - expandtab='.&expandtab.' tabstop='.&tabstop.' shiftwidth='.&shiftwidth
"  return ''
"endfunction

"function s:TabToggleDefault()
"  execute "set tabstop=".b:toggle_indent_style_tabstop
"  execute "set shiftwidth=".b:toggle_indent_style_shiftwidth
"  if b:toggle_indent_style_expandtab
"    set expandtab
"  else
"    set noexpandtab
"  endif
"  echo '[set default style] - expandtab='.b:toggle_indent_style_expandtab.' tabstop='.b:toggle_indent_style_tabstop.' shiftwidth='.b:toggle_indent_style_shiftwidth
"  return ''
"endfunction

"command TabToggle1 call <SID>TabToggle1()
"command TabToggle2 call <SID>TabToggle2()
"command TabToggle3 call <SID>TabToggle3()
"command TabToggleDefault call <SID>TabToggleDefault()

"noremap <silent> <F9> :call <SID>TabToggle1()<CR>
"vnoremap <silent> <F9> <C-c>:call <SID>TabToggle1()<CR>gv
"inoremap <silent> <F9> <C-r>=<SID>TabToggle1()<CR>

"noremap <silent> <C-F9> :call <SID>TabToggle2()<CR>
"vnoremap <silent> <C-F9> <C-c>:call <SID>TabToggle2()<CR>gv
"inoremap <silent> <C-F9> <C-r>=<SID>TabToggle2()<CR>

"noremap <silent> <S-F9> :call <SID>TabToggle3()<CR>
"vnoremap <silent> <S-F9> <C-c>:call <SID>TabToggle3()<CR>gv
"inoremap <silent> <S-F9> <C-r>=<SID>TabToggle3()<CR>

"noremap <silent> <C-S-F9> :call <SID>TabToggleDefault()<CR>
"vnoremap <silent> <C-S-F9> <C-c>:call <SID>TabToggleDefault()<CR>gv
"inoremap <silent> <C-S-F9> <C-r>=<SID>TabToggleDefault()<CR>
"" }}}
