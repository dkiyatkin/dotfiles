" Use CTRL-S for saving, also in Insert mode
noremap <C-s> :update<CR>
vnoremap <C-s> <Esc>:update<CR>
inoremap <C-s> <Esc>:update<CR>
cnoremap <C-s> <C-c>:update<CR>

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
