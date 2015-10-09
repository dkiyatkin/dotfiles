scriptencoding utf-8
set guifont=InconsolataCyr\ 12
hi lCursor guifg=NONE guibg=Cyan
hi Cursor gui=reverse guifg=red guibg=NONE

set go=agit

function ToggleFullScreen()
  if &go =~ 'mT'
    set go-=mT
    silent !wmctrl -r :ACTIVE: -b add,fullscreen
  else
    set go+=mT
    silent !wmctrl -r :ACTIVE: -b remove,fullscreen
  endif
endfunction

map <F11> <Esc>:call ToggleFullScreen()<cr>

function SetFullScreen()
  " silent !wmctrl -r :ACTIVE: -e '0,-3,-27,1921,1085' " set guifont=InconsolataCyr\ 13
  silent !wmctrl -r :ACTIVE: -e '0,-4,-28,1924,1085'
  silent !wmctrl -r :ACTIVE: -b toggle,above
endfunction

map <A-F11> <Esc>:call SetFullScreen()<CR>

set linespace=1

" всплывающее окошко
hi Pmenu guibg=#3a6595 guifg=#9aadd5
hi PmenuSel guibg=#4a85ba guifg=#b0d0f0

set guicursor=a:blinkon600-blinkoff400
set lines=49 columns=105
