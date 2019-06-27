alias vim='nvim'
alias vim-session='nvim -S Session.vim'

alias fzf-gss="git -c color.ui=always status -s -z | fzf -m --ansi --read0 | cut -c 4-"

# https://unix.stackexchange.com/questions/157328/how-can-i-remove-all-comments-from-a-file
# https://stackoverflow.com/questions/16414410/delete-empty-lines-using-sed
alias cat-nocomm="sed '/^[[:blank:]]*#/d;s/#.*//;/^\s*$/d'"

alias nocomment="grep -Ev '''^(#|$)'''"

alias find-2d="find * -maxdepth 1 -mindepth 1 -type d | sort"

alias mount='mount | column -t'

alias ls='exa -l --git -F --group-directories-first -L 2'
alias lh='LC_COLLATE=C /usr/bin/ls -a -1 -F -h --group-directories-first'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias rsync-copy='rsync -ahlv --progress --delete --stats'

alias vim-with-log='savelog -t -n $HOME/log/vim.log ; vim -V0$HOME/log/vim.log'
alias nvim-with-log='savelog -t -n $HOME/log/nvim.log ; nvim -V0$HOME/log/nvim.log'

alias docker-altarix-owa='sudo docker run --env URL="https://mail.altarix.ru/owa/" --net host timonier/davmail'

alias ga-fzf='fzf-gss | while read line; do git add "$line" ; done'

unalias gst
