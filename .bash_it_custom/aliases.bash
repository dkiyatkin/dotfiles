# https://github.com/ranger/ranger/blob/master/examples/bash_automatic_cd.sh
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

alias t='task'
alias f='ranger-cd'
alias vim='nvim'
alias nvr-git='nvr -s --servername $(git rev-parse --show-toplevel)/.git/nvimsocket'
alias vim-session='nvr -s --servername $(git rev-parse --show-toplevel)/.git/nvimsocket -c "source Session.vim"'

alias fzf-gss="git -c color.ui=always status -s -z | fzf -m --ansi --read0 | cut -c 4-"

alias nocomment="grep -Ev '''^(#|$)'''"

alias mount='mount | column -t'

alias lh='LC_COLLATE=C /usr/bin/ls -a -1 -F -h --group-directories-first'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias rsync-copy-danger-trailing-slash='rsync -ahlv --progress --delete --stats'

alias vim-with-log='savelog -t -n $HOME/log/vim.log ; vim -V0$HOME/log/vim.log'
alias nvim-with-log='savelog -t -n $HOME/log/nvim.log ; nvim -V0$HOME/log/nvim.log'

alias docker-altarix-owa='sudo docker run --env URL="https://mail.altarix.ru/owa/" --net host timonier/davmail'

alias ga-fzf='fzf-gss | while read line; do git add "$line" ; done'

unalias gst
unalias g
