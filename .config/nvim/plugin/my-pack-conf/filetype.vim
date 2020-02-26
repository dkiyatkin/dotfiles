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
" }}}

" plugin:typescript {{{
" }}}

" plugin:javascript {{{
" }}}

" plugin:jsx {{{
" }}}

" plugin:nginx {{{
" }}}
