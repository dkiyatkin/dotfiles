augroup all_formatoptions
  autocmd!
  autocmd FileType * setlocal formatoptions=
  " autocmd FileType * setlocal formatoptions-=tcroqwan2vblmMB1jp
  " autocmd FileType * setlocal formatoptions-=t
  " autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  " autocmd FileType * setlocal formatoptions-=q formatoptions-=w
  " autocmd FileType * setlocal formatoptions-=a formatoptions-=n formatoptions-=2
  " autocmd FileType * setlocal formatoptions-=v formatoptions-=b formatoptions-=l
  " autocmd FileType * setlocal formatoptions-=m formatoptions-=M formatoptions-=B
  " autocmd FileType * setlocal formatoptions-=1 formatoptions-=j formatoptions-=p
augroup END

" plugin:sensible {{{
" term
set sidescrolloff=0
" }}}

" plugin:speeddating {{{
if exists(':SpeedDatingFormat')
  1SpeedDatingFormat %a %d.%m.%y %H:%M
endif
" }}}
