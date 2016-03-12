" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\«ZXCVBNM<>

set keymap=russian-jcukenwin " настраиваем переключение раскладок клавиатуры по C-^
set iminsert=0               " раскладка по умолчанию для ввода - английская
set imsearch=0               " раскладка по умолчанию для поиска - английская
" setlocal spell spelllang=ru_yo,en_us

" чем короче сочетание, тем меньше возможности для глюков
" менять раскладку программно нажимая клавиши (Mod3 - switch-keyboard) с помощью внешними программ (xbindkeys, xkb-switch, xdotool, xprop, xvkbd)
noremap  <F2> :let &l:imi = !&l:imi<CR>
inoremap <F2> <C-^>
cnoremap <F2> <C-^>
vnoremap <F2> <Esc>:let &l:imi = !&l:imi<CR>gv
" удобные знаки препинания с помощью внешних программ (Mod3 - .), вне зависимости от внутренней раскладки, xvkbd не обрабатывает shift-F keys
" используем просто F клавишу без модификаторов (F18 - F35)
" не работает вместе с `r`, для этого случая нужно нажимать обычную клавишу без Mod3, так как в vim используется только английская раскладка
if has("gui_running")
else
  set <F18>=[30~
  set <F19>=[31~
  set <F20>=[32~
  set <F21>=[33~
  set <F22>=[34~
  set <F23>=[35~
  set <F24>=[36~
  set <F25>=[37~
  set <F26>=[38~
  set <F27>=[39~
  set <F28>=[40~
  set <F29>=[41~
  set <F30>=[42~
  set <F31>=[43~
  set <F32>=[44~
endif
inoremap <F18> [
cnoremap <F18> [
inoremap <F19> {
cnoremap <F19> {
inoremap <F20> ]
cnoremap <F20> ]
inoremap <F21> }
cnoremap <F21> }
inoremap <F22> ,
cnoremap <F22> ,
inoremap <F23> <
cnoremap <F23> <
inoremap <F24> .
cnoremap <F24> .
inoremap <F25> >
cnoremap <F25> >
inoremap <F26> ;
cnoremap <F26> ;
inoremap <F27> :
cnoremap <F27> :
inoremap <F28> /
cnoremap <F28> /
inoremap <F29> ?
cnoremap <F29> ?
inoremap <F30> '
cnoremap <F30> '
inoremap <F31> "
cnoremap <F31> "
inoremap <F32> \|
cnoremap <F32> \|

" map ё `
" map й q
" map ц w
" map у e
" map к r
" map е t
" map н y
" map г u
" map ш i
" map щ o
" map з p
" map х [
" map ъ ]
" map ф a
" map ы s
" map в d
" map а f
" map п g
" map р h
" map о j
" map л k
" map д l
" map ж ;
" map э '
" map я z
" map ч x
" map с c
" map м v
" map и b
" map т n
" map ь m
" map б ,
" map ю .
" map . /
"
" map Ё ~
" map Й Q
" map Ц W
" map У E
" map К R
" map Е T
" map Н Y
" map Г U
" map Ш I
" map Щ O
" map З P
" map Х {
" map Ъ }
" map Ф A
" map Ы S
" map В D
" map А F
" map П G
" map Р H
" map О J
" map Л K
" map Д L
" map Ж :
" map Э "
" map Я Z
" map Ч X
" map С C
" map М V
" map И B
" map Т N
" map Ь M
" map Б <
" map Ю >
" map , ?
