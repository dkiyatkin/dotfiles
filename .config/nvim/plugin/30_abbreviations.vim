if (exists('g:loaded_myAbbreviations') && g:loaded_myAbbreviations)
  finish
endif
let g:loaded_myAbbreviations = 1

cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'vertical help' : 'h'

cnoreabbrev <expr> help CmdAbbr('help', 'vertical help')

" plugin:ack {{{
cnoreabbrev <expr> Ack CmdAbbr('Ack', 'Ack!')
cnoreabbrev <expr> AckHelp CmdAbbr('AckHelp', 'AckHelp!')
" }}}
