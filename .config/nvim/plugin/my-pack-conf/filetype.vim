if !(exists('g:myPackConfOpt') && g:myPackConfOpt)
  finish
endif
if (exists('g:loaded_myPackConfFiletype') && g:loaded_myPackConfFiletype)
  finish
endif
let g:loaded_myPackConfFiletype = 1

" plugin:syntax-vim-ex {{{
" }}}

" plugin:mustache-handlebars {{{
" }}}

" plugin:scala {{{
" }}}

" plugin:redis {{{
" }}}

" plugin:html5 {{{
" }}}

" plugin:npr {{{
" }}}

" plugin:json {{{
let g:vim_json_syntax_conceal = 0
" let g:vim_json_warnings = 0
" }}}

" plugin:css3-syntax {{{
" }}}

" plugin:less {{{
" }}}

" plugin:css-color {{{
" }}}

" plugin:pug {{{
" }}}

" NOTE раньше в файле `syntax/markdown.vim` была закомментирована строка: `syn match   mkdInlineURL`
" plugin:markdown {{{
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_no_extensions_in_markdown = 1
" }}}

" plugin:typescript {{{
" }}}

" plugin:javascript {{{
" }}}

" plugin:jsx-pretty {{{
let g:vim_jsx_pretty_enable_jsx_highlight = 0
highlight def link jsxTag Function
highlight def link jsxTagName Function
highlight def link jsxString String
highlight def link jsxNameSpace Function
highlight def link jsxComment Error
highlight def link jsxAttrib Type
highlight def link jsxCloseTag Identifier
highlight def link jsxCloseString Identifier
" }}}

" plugin:nginx {{{
" }}}
