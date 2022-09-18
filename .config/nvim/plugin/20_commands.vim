if (exists('g:loaded_myCommands') && g:loaded_myCommands)
  finish
endif
let g:loaded_myCommands = 1

" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
command CdCurrent cd %:p:h
" plugin:fugitive {{{
command CdGitRoot silent! Gcd | pwd
" }}}

" https://vi.stackexchange.com/questions/8378/dump-the-output-of-internal-vim-command-into-buffer
command -nargs=+ -complete=command Redir let s:reg = @@ | redir @"> | silent execute <q-args> | redir END | new | pu | 1,2d_ | let @@ = s:reg
" system, messages | системные сообщения
" :Redir messages

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

command PrintBuffers redir => s:buffers | silent ls | redir END | echo s:buffers

command TrimWhitespace call TrimWhitespace()

" plugin:fugitive {{{
" проиндексировать все изменения и сделать коммит
command IGitAddAllCommit Git add --all . | Gcommit
" }}}

" Remove the Windows ^M - when the encodings get messed up
command RemoveMSMEndOfLine execute "normal! mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm"
" noremap <Leader>mm mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" plugin:fzf {{{
command PopRegisters call fzf#run(fzf#wrap('PopRegisters', {
\ 'source':  FZFPopRegistersList(),
\ 'sink':    function('FZFEmptyHandler'),
\ 'options': '--no-extended --exact +i --tac --no-sort --prompt="PopRegisters> "',
\ 'window': { 'width': 0.5, 'height': 0.5, 'xoffset': 1, 'yoffset': 0 },
\ }))

command PopKeyMaps call fzf#run(fzf#wrap('PopKeyMaps', {
\ 'source':  FZFPopKeyMapsList(),
\ 'sink':    function('FZFEmptyHandler'),
\ 'options': '--no-extended --exact +i --no-sort --prompt="PopKeyMaps> "',
\ 'window': { 'width': 0.5, 'height': 0.5, 'xoffset': 1, 'yoffset': 0 },
\ }))

command PopMarks call fzf#run(fzf#wrap('PopMarks', {
\ 'source':  FZFPopMarksList(),
\ 'sink':    function('FZFEmptyHandler'),
\ 'options': '--no-extended --exact +i --tac --no-sort --prompt="PopMarks> "',
\ 'window': { 'width': 0.5, 'height': 0.5, 'xoffset': 1, 'yoffset': 0 },
\ }))

command MRU call fzf#run(fzf#wrap('MRU', {
\ 'source':  FZFMruFiles(),
\ 'options': '--multi --no-sort --prompt="MRU> "',
\ }))

command YanksAfter call fzf#run(fzf#wrap('YanksAfter', {
\ 'source':  FZFYankList(),
\ 'sink':    function('FZFYankHandler', ['p']),
\ 'options': '--no-sort --prompt="Yanks-p> "',
\ }))

command YanksBefore call fzf#run(fzf#wrap('YanksBefore', {
\ 'source':  FZFYankList(),
\ 'sink':    function('FZFYankHandler', ['P']),
\ 'options': '--no-sort --prompt="Yanks-P> "',
\ }))

command AllBuffers call fzf#run(fzf#wrap('AllBuffers', {
\ 'source':  reverse(FZFBuffersList()),
\ 'sink*':    function('FZFBuffersHandler', [0]),
\ 'options': '--expect=ctrl-d,alt-d --multi --no-sort --prompt="AllBuf> "',
\ }))

command TabBuffers call fzf#run(fzf#wrap('TabBuffers', {
\ 'source':  reverse(FZFBuffersList(t:tabpagebuffer)),
\ 'sink*':    function('FZFBuffersHandler', [1]),
\ 'options': '--expect=ctrl-d,alt-d --multi --no-sort --prompt="TabBuf> "',
\ }))

command FileMarks call fzf#run(fzf#wrap('FileMarks', {
\ 'source':  FZFFileMarksList(),
\ 'sink*':    function('FZFFileMarksHandler'),
\ 'options': '--extended --no-sort --prompt="FileMarks> "',
\ }))

command Z call fzf#run(fzf#wrap('Z', {
\ 'source':  'zsh -c "z -l"',
\ 'sink*':    function('FZFZHandler'),
\ 'options': '--no-sort --prompt="Z> "',
\ }))
" }}}

" plugin:~/.config/nvim/plugin/gitignore.vim {{{
" обновить wildignore
command WildignoreReset set wildignore=Session.vim | WildignoreFromGitignore .
" }}}

" https://marketplace.visualstudio.com/items?itemName=jonsmithers.open-in-vim
command OpenCwdInVSCode exe "silent !vscodium '" . getcwd() . "' --goto '" . expand("%") . ":" . line(".") . ":" . col(".") . "'" | redraw!
