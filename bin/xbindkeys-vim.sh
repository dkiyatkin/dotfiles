#!/usr/bin/env bash

if [[ $1 == "vim" ]]; then
  # Запуск, остановка `xbindkeys -f ~/.vim.xbindkeysrc`
  ps=$(ps -e -o pid,command | grep 'xbindkeys -f ' | grep '/.vim.xbindkeysrc' | awk '{$1=$1;print}')
  # запустить `xbindkeys -f ~/.vim.xbindkeysrc`, если он еще не запущен
  if [[ $2 == "start" ]]; then
    if [[ ! $ps ]]; then
      xbindkeys -f ~/.vim.xbindkeysrc
    fi
  # остановить `xbindkeys -f ~/.vim.xbindkeysrc`
  elif [[ $2 == "stop" ]]; then
    if [[ $ps ]]; then
      pid=$(echo "$ps" | cut -d' ' -f1)
      kill $pid
    fi
  fi
elif [[ $1 == "vim-mode" ]]; then
  # Запуск, остановка `xbindkeys -f ~/.vim-mode.xbindkeysrc`
  ps=$(ps -e -o pid,command | grep 'xbindkeys -f ' | grep '/.vim-mode.xbindkeysrc' | awk '{$1=$1;print}')
  if [[ $2 == "start" ]]; then
    if [[ ! $ps ]]; then
      xbindkeys -f ~/.vim-mode.xbindkeysrc
    fi
  elif [[ $2 == "stop" ]]; then
    if [[ $ps ]]; then
      pid=$(echo "$ps" | cut -d' ' -f1)
      kill $pid
    fi
  fi
fi
