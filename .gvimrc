scriptencoding utf-8
set guifont=InconsolataCyr\ 12

hi lCursor guifg=NONE guibg=Cyan
hi Cursor gui=reverse guifg=red guibg=NONE

set go=agit

function ToggleToolbar()
  if &go =~ 'mT'
    set go-=mT
  else
    set go+=mT
  endif
  return ''
endfunction

function! <SID>ToggleToolbarCMD()
  call ToggleToolbar()
  return getcmdline()
endfunction

command ToggleToolbar call ToggleToolbar()

" vim-shell
" открывать меню, скрывать/показывать
noremap <F10> <C-c><F10>:call ToggleToolbar()<CR>
vnoremap <F10> <C-c><F10>:call ToggleToolbar()<CR>gv
inoremap <F10> <F10><C-r>=ToggleToolbar()<CR>
cnoremap <F10> <F10><C-\>e<SID>ToggleToolbarCMD()<CR>

set linespace=1

" всплывающее окошко
hi Pmenu guibg=#3a6595 guifg=#9aadd5
hi PmenuSel guibg=#4a85ba guifg=#b0d0f0

set guicursor=a:blinkon600-blinkoff400
set lines=49 columns=105
