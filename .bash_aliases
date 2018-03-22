alias ag='ag --hidden'
alias rsync-copy='rsync -ahlv --progress'
alias tmux-slime-node="tmux -L slime new-session -d 'node' \; attach"
# alias vim-session='ls `basename $1` | $1'
alias npm-exec='PATH=$(npm bin):$PATH'
alias vim-with-log='savelog -t -n $HOME/log/vim.log ; vim -V0$HOME/log/vim.log'
alias nvim-with-log='savelog -t -n $HOME/log/nvim.log ; nvim -V0$HOME/log/nvim.log'
alias lh='LC_COLLATE=C ls -a -1 -F -h --group-directories-first'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
