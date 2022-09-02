#!/usr/bin/env bash

# если gvim отправлять через xvkbd, то в нем может появляться предупреждение о изменении файла

# TODO
# фильтровать другие терминалы с запущенным vim
# не определяется konsole-tmux, konsole-ssh
# как вариант: попробовать менять title через tmux

C1="$1"
C2="$2"

function _vimSwitch {
  sh -c "$C1"
}

function vimSwitch {
  TITLE=$1
  # notify-send "$TITLE"
  if [[ ( $TITLE == *": nvim"* ) || ( $TITLE == *": vim"* ) || ( $TITLE == *"- VIM\"" ) ]]; then
    _vimSwitch
  else
    sh -c "$C2"
  fi
}

# W=`xdotool getactivewindow`
W=$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2)
S1=`xprop -id ${W} WM_CLASS`
if [[ $S1 == *"\"gvim\", \"Gvim\""* ]]; then
  _vimSwitch
elif [[ $S1 == *"\"konsole\", \"konsole\""* ]]; then
  TITLE=$(xprop -id ${W} WM_NAME)
  vimSwitch "$TITLE"
elif [[ $S1 == *"\"yakuake\", \"yakuake\""* ]]; then
  TITLE=$(qdbus org.kde.yakuake /yakuake/tabs tabTitle $(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.activeSessionId))
  vimSwitch "$TITLE"
# else
#   notify-send "$S1"
fi
