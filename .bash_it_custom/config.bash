# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTFILE=/home/dkiyatkin/.bash_history_new

HISTTIMEFORMAT='%F %T '
HISTIGNORE='ls:bg:fg:history:j:t:e:forget'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# включаем поиск по ctrl-s
# http://stackoverflow.com/a/791800/1054723
[[ $- == *i* ]] && stty -ixon

# https://unix.stackexchange.com/a/233625
function forget() {
    history -d $(expr $(history | tail -n 1 | grep -oP '^ \d+') - 1);
}

# exports

PATH=$HOME/bin:$HOME/.yarn/bin:$PATH

export PATH

export VISUAL=nvim
export EDITOR="$VISUAL"

export MANPAGER="nvim -c 'set ft=man' -"

export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/rc

# TODO https://github.com/ranger/ranger/wiki/Common-Changes
if [ -n "$RANGER_LEVEL" ]; then export PS1="[ranger]$PS1"; fi

# одна копия nvim для каждого окна tmux или вcего терминала
# ~/bin/e
# https://www.reddit.com/r/neovim/comments/aex45u/integrating_nvr_and_tmux_to_use_a_single_tmux_per/
if [[ -v TMUX ]]; then
  export NVIM_LISTEN_ADDRESS=/tmp/nvim_$USER_$(tmux display -p "#{window_id}")
fi

# https://superuser.com/questions/212446/binding-backward-kill-word-to-ctrlw
stty werase undef
bind '"\C-w": backward-kill-word'
