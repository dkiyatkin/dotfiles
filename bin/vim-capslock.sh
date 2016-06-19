#!/bin/bash

# для всех приложений xkb-switch -n, для vim <F2>
# если gvim отправлять через xvkbd, то в нем может появляться предупреждение о изменении файла
# Установить xkb-switch, xkb-switch

# TODO
# фильтровать другие терминалы с запущенным vim
# не определяется konsole-tmux, konsole-ssh
# как вариант: попробовать менять title через tmux

function _vimSwitch {
  xkb-switch -n # переключаем обратно
  xvkbd -xsendevent -text '\[F2]'
}

function vimSwitch {
  TITLE=$1
  if [[ ( $TITLE == *": nvim"* ) || ( $TITLE == *": vim"* ) ]]; then
    _vimSwitch
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
fi
