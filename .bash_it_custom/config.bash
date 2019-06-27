# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups:ignorespace
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000
HISTFILE=/home/dkiyatkin/.bash_history_new

HISTTIMEFORMAT='%F %T '
HISTIGNORE='ls:bg:fg:history'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# включаем поиск по ctrl-s
# http://stackoverflow.com/a/791800/1054723
[[ $- == *i* ]] && stty -ixon

prompt_setter() {
  local exit_status=$?
  if [[ $exit_status -eq 0 ]]; then PROMPT_END=$PROMPT_END_CLEAN
    else PROMPT_END=$PROMPT_END_DIRTY
  fi
  # Save history
  history -a
  # history -c
  # history -r
  PS1="($(clock_prompt)${reset_color}) ${PATH_COLOR}\w${reset_color}$(scm_prompt_info) ${reset_color}\n$(prompt_end) "
  PS2='> '
  PS4='+ '
}

safe_append_prompt_command prompt_setter

# exports

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.yarn/bin

export PATH

export VISUAL=nvim
export EDITOR="$VISUAL"

export MANPAGER="nvim -c 'set ft=man' -"
