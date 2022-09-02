#!/bin/bash

buku --export ~/Seafile/Home/Notes/buku/bookmarks.html
notify-send "buku: $(buku --nc -a $(xsel) 2>&1)"
