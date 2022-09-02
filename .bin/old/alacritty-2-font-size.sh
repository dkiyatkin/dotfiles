#!/usr/bin/env bash

sed -i 's/^  size: /  \# size: /g' ~/.config/alacritty/alacritty.yml && sed -i 's/^  \# size: 10\.5 /  size: 10\.5 /g' ~/.config/alacritty/alacritty.yml
