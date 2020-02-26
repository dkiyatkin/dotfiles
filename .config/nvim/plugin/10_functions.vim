if (exists('g:loaded_myFunctions') && g:loaded_myFunctions)
  finish
endif
let g:loaded_myFunctions = 1

" https://stackoverflow.com/questions/4478891/is-there-a-vimscript-equivalent-for-rubys-strip-strip-leading-and-trailing-s
function Strip(input_string) abort
  return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function ListBuffers() abort
  let l:buffers = range(1, bufnr('$'))
  let l:names = filter(l:buffers, 'buflisted(v:val)')
  " let l:names = map(l:listed, 'bufname(v:val)')
  return join(l:names, "\n")
endfunction

function PrintBuffers() abort
  redir => s:buffers | silent ls! | redir END
  return s:buffers
endfunction

function FZFBuffersList(...) abort
  redir => s:buffers | silent ls | redir END
  if (a:0)
    let s:tabpagebuffer = a:1
    let s:tabbuffers = split(s:buffers, '\n')
    function! Filter(idx, val)
      let bufnrkey = substitute(Strip(a:val), ' .*', '', '')
      return has_key(s:tabpagebuffer, bufnrkey)
    endfunction
    call filter(s:tabbuffers, function('Filter'))
    return s:tabbuffers
  endif
  return split(s:buffers, '\n')
endfunction

function FZFBuffersHandler(one, lines) abort
  if len(a:lines) < 2
    return
  endif
  let key = remove(a:lines, 0)
  function! KeyValue(key, val)
    return substitute(Strip(a:val), ' .*', '', '')
  endfunction
  let s:lines = map(a:lines, function('KeyValue'))
  let bufnrs = join(s:lines, ' ')
  if (key ==# 'ctrl-d')
    call DeleteBuffers(bufnrs)
  elseif (key ==# 'alt-d')
    if (a:one ==# 0)
      call RefreshAllTabpagebuffer(s:lines)
    elseif (a:one ==# 1)
      for bufnr in s:lines
        call remove(t:tabpagebuffer, bufnr)
      endfor
    endif
  else
    for bufnr in s:lines
      call SelectBuffer(bufnr)
    endfor
  endif
endfunction

function SelectBuffer(num) abort
  execute "buffer" a:num
  return ''
endfunction

function DeleteBuffers(bnames) abort
  execute "bdelete" a:bnames
  return ''
endfunction

" https://github.com/tacroe/unite-mark/blob/master/autoload/unite/sources/mark.vim
function FZFFileMarksList() abort
  let l:lines = []
  let l:marks = split("ABCDEFGHIJKLMNOPQRSTUVWXYZ", '\zs')
  for l:mark in l:marks
    let l:pos = getpos("'" . l:mark)
    let l:lnum = l:pos[1]
    if l:lnum !=# 0 " else mark does not exist
      let l:path = fnamemodify(bufname(l:pos[0]), ':p')
      let l:col = l:pos[2]
      let l:line = '['.l:mark.'] '.l:path.':'.l:lnum.':'.l:col
      call add(l:lines, l:line)
    endif
  endfor
  return l:lines
endfunction

function FZFFileMarksHandler(lines) abort
  let l:mark = a:lines[0][1]
  execute "normal! `".l:mark
endfunction

function FZFZHandler(lines) abort
  let l:dir = substitute(a:lines[0], '^.* ', '', '')
  execute "cd ".l:dir
endfunction

" TODO а так же переключать Ctrl-z, Ctrl-y
" like unimpaired.vim, m - mouse selection
function ToggleSelection() abort
  if &selection == 'inclusive'
    set selection=exclusive
  else
    set selection=inclusive
  endif
  echo 'set selection='.&selection
endfunction

function Qall(k)
  qall
endfunction

" https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
function TrimWhitespace() abort
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

" http://stackoverflow.com/a/24027507/1054723
function GetScriptNumber(script_name) abort
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
endfunction

function ShowToc() abort
  call eval(printf("<SNR>%d_show_toc()", GetScriptNumber("/share/nvim/runtime/ftplugin/help.vim")))
endfunction

" https://coderwall.com/p/3tukca/open-vim-help-in-a-new-tab-or-a-vertical-split
function CmdAbbr(origcmd, newcmd) abort
  return getcmdtype() == ':' && getcmdline() == a:origcmd ? a:newcmd : a:origcmd
endfunction

" https://github.com/junegunn/fzf/blob/master/README-VIM.md#examples
function BuildFZFQuickfixList(lines) abort
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

function EchoLines(lines) abort
  echomsg join(a:lines, ',')
endfunction

" plugin:fzf {{{
" https://github.com/junegunn/fzf/wiki/Examples-(vim)#filtered-voldfiles-and-open-buffers
function FZFMruFiles() abort
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~# '^fugitive:\\|^NERD_tree\\|^/tmp/\\|^.git/\\|^term://.//\\|^__Scratch__$\\|^__LanguageClient__$\\|^Bufferize: \\|^undotree_2$\\|^diffpanel_3$'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

" plugin:miniyank {{{
function FZFYankList() abort
  function! KeyValue(key, val)
    let line = join(a:val[0], '\n')
    if (a:val[1] ==# 'V')
      let line = '\n'.line
    endif
    return a:key.' '.line
  endfunction
  return map(miniyank#read(), function('KeyValue'))
endfunction

function FZFYankHandler(opt, line) abort
  let key = substitute(a:line, ' .*', '', '')
  if !empty(a:line)
    let yanks = miniyank#read()[key]
    call miniyank#drop(yanks, a:opt)
  endif
endfunction
" }}}
" }}}

" https://stackoverflow.com/questions/3155461/how-to-delete-multiple-buffers-in-vim
function DeleteOtherBuffers() abort
  let s:bufNr = bufnr("$")
  while s:bufNr > 0
    if (bufname(s:bufNr) =~# '^fugitive:\|^NERD_tree\|^/tmp/\|^.git/\|^term://.//\|^__Scratch__$\|^__LanguageClient__$\|^Bufferize: \|^undotree_2$\|^diffpanel_3$')
      execute "silent! bd! ".s:bufNr
    endif
    let s:bufNr = s:bufNr-1
  endwhile
endfunction

function _SaveTabVars() abort
  let tabpagenr = tabpagenr()
  let g:TabVars[tabpagenr] = {'tabpagebuffer': {}}
  let g:TabVars[tabpagenr]['tabpagebuffer'] = t:tabpagebuffer
  let g:TabVars[tabpagenr]['alternatebuffer'] = bufnr(@#)
endfunction

function SaveTabVars() abort
  " собрать с каждой вкладки t:tabpagebuffer и сохранить все в объект g:TabVars.tabpagebuffer
  " сохранить также alternate files https://vi.stackexchange.com/a/8267/3162
  let g:TabVars = {}

  let s:curtab = tabpagenr()
  let s:LastTab = g:LastTab

  tabdo call _SaveTabVars()

  execute "tabn ".s:curtab
  let g:LastTab = s:LastTab
endfunction

function _RestoreTabVars() abort
  let tabpagenr = tabpagenr()
  let t:tabpagebuffer = g:TabVars[tabpagenr]['tabpagebuffer']
  silent! let @# = g:TabVars[tabpagenr]['alternatebuffer']
endfunction

function RestoreTabVars() abort
  " назначить для каждой вкладки t:tabpagebuffer из объекта g:TabPageBuffer
  " восстановить также alternate files https://vi.stackexchange.com/a/8267/3162
  let g:TabVars = get(g:, 'TabVars', {})
  if empty(g:TabVars)
    return
  endif

  let s:curtab = tabpagenr()
  let s:LastTab = g:LastTab

  tabdo call _RestoreTabVars()

  execute "tabn ".s:curtab
  let g:LastTab = s:LastTab
endfunction

function DeleteOneTabpagebuffer(bufnr) abort
  for tabnr in range(1, tabpagenr('$'))
    let tabpagebuffer = gettabvar(tabnr, 'tabpagebuffer')
    silent! call remove(tabpagebuffer, a:bufnr)
  endfor
endfunction

function RefreshAllTabpagebuffer(...) abort
  " убрать ссылки на отсутствующие буферы или на dellist из всех t:tabpagebuffer
  for tabnr in range(1, tabpagenr('$'))
    let tabpagebuffer = gettabvar(tabnr, 'tabpagebuffer')
    if type(tabpagebuffer) == type({})
      for bufnrkey in keys(tabpagebuffer)
        if (a:0) " dellist
          let s:bufnr = index(a:1, bufnrkey)
          if (s:bufnr !=# -1)
            call remove(tabpagebuffer, bufnrkey)
          endif
        else
          let s:bufnr = bufnr(str2nr(bufnrkey))
          if (s:bufnr ==# -1)
            call remove(tabpagebuffer, bufnrkey)
          endif
        endif
      endfor
    endif
  endfor
endfunction

" https://github.com/Shougo/tabpagebuffer.vim/blob/master/plugin/buffer.vim
function AddOneTabpagebuffer(bufnr) abort
  if (bufnr('%') !=# a:bufnr)
    return
  endif
  if !exists('t:tabpagebuffer')
    let t:tabpagebuffer = {}
  endif
  let bufnr = bufnr('%')
  let t:tabpagebuffer[bufnr] = 1
endfunction
