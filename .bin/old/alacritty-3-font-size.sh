#!/usr/bin/env bash

sed -i 's/^  size: /  \# size: /g' ~/.config/alacritty/alacritty.yml && sed -i 's/^  \# size: 7\.0 /  size: 7\.0 /g' ~/.config/alacritty/alacritty.yml
