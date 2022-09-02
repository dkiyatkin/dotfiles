#!/usr/bin/env bash

sed -i 's/^  size: /  \# size: /g' ~/.config/alacritty/alacritty.yml && sed -i 's/^  \# size: 5\.0 /  size: 5\.0 /g' ~/.config/alacritty/alacritty.yml
