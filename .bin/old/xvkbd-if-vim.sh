#!/usr/bin/env bash

# Выполнить xvkbd -xsendevent -text с первым аргументом если это vim, иначе со вторым

W=`xdotool getactivewindow`
S1=`xprop -id ${W} | awk '/WM_CLASS/{print $4}'`

C1="xvkbd -xsendevent -text $1"
C2="xvkbd -xsendevent -text $2"
# notify-send "$C1"
# notify-send "$C2"

if [ $S1 = '"Gvim"' ]; then
  $C1
# TODO
# фильтровать другие терминалы с запущенным vim
# не определяется yakuake, konsole-tmux, konsole-ssh
# как вариант: попробовать менять title через tmux
elif [ $S1 = '"Konsole"' ]; then
  S2=`xprop -id ${W} | awk '/WM_NAME/{for (i = 3; i <= NF; i++) printf $i " "; print ""}' | sed -n "1p"`
  if [[ $S2 == *"vim — Konsole"* ]]; then
    $C1
  else
    $C2
  fi
else
  $C2
fi
