#!/usr/bin/env bash

# Запуск, остановка `xbindkeys -f ~/.vim.xbindkeysrc`

ps=$(ps -e -o pid,command | grep 'xbindkeys -f ' | grep '/.vim.xbindkeysrc' | awk '{$1=$1;print}')

# запустить `xbindkeys -f ~/.vim.xbindkeysrc`, если он еще не запущен
if [[ $1 == "start" ]]; then
  if [[ ! $ps ]]; then
    xbindkeys -f ~/.vim.xbindkeysrc
  fi
# остановить `xbindkeys -f ~/.vim.xbindkeysrc`
elif [[ $1 == "stop" ]]; then
  if [[ $ps ]]; then
    pid=$(echo "$ps" | cut -d' ' -f1)
    kill $pid
  fi
fi
