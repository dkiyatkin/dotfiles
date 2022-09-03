# /etc/xdg/plasma-workspace/env/envars.sh
# ~/.config/plasma-workspace/env/profile.sh
export EDITOR="/usr/bin/nvim"
export VISUAL="$EDITOR"
# export GTK_USE_PORTAL=1

export PATH=$HOME/.bin:$HOME/.yarn/bin:$HOME/.local/bin:/etc/scripts/bin:$PATH

# https://github.com/sindresorhus/guides/blob/main/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# export MANPAGER="/usr/bin/nvim -c 'set ft=man' -"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rc"

# nnn bookmarks
export BOOKMARKS_DIR="$HOME/bookmarks"

export PAGER='less'
export LESS='-Ri +g'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export FZF_DEFAULT_OPTS="\
  --ansi \
  --height=30 \
  --info=inline \
  --layout=reverse \
  --bind 'bspace:backward-delete-char' \
  --bind 'del:delete-char' \
  --bind 'ctrl-w:backward-kill-word' \
  --bind 'alt-d:kill-word' \
  --bind 'ctrl-k:kill-line' \
  --bind 'ctrl-a:beginning-of-line' \
  --bind 'ctrl-e:end-of-line' \
  --bind 'ctrl-u:half-page-up' \
  --bind 'ctrl-d:half-page-down' \
  --bind 'ctrl-n:next-history' \
  --bind 'ctrl-p:previous-history' \
  --bind 'ctrl-f:forward-char' \
  --bind 'ctrl-b:backward-char' \
  --bind 'ctrl-y:execute-silent(echo {+} | xsel --clipboard --input)' \
  --bind 'alt-n:preview-down' \
  --bind 'alt-p:preview-up' \
  --bind 'pgdn:preview-page-down' \
  --bind 'pgup:preview-page-up' \
  --bind 'alt-w:toggle-preview-wrap' \
  --bind 'up:up' \
  --bind 'down:down' \
"
# --bind 'alt-enter:execute(less -f {})'
export FZF_DEFAULT_COMMAND='fd --type f --color=always'

export NNN_COLORS='7431'
export NNN_TRASH=1
export NNN_OPTS="aFErHdU"
# export NNN_BMS="v:~/.config/nvim;i:~/code/install;r:~/.config/ranger;b:~/.bash_it_custom;a:~/.config/alacritty;1:~/code/artdeline/artdeline-frontend;2:~/code/artdeline/artdeline-backend;t:~/.config/tmux;z:~/.config/oh-my-zsh-custom;H:~/tmp;w:~/code/itlife/zubnoi-tlt.ru/layout;n:~/Data/Note;V:~/.config/VSCodium"
# curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
# export NNN_PLUG='p:preview-tui;b:bookmarks;d:fzcd;z:fzz'
# export NNN_LOCKER='cmatrix'
# atool, bsdtar
# export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"

export RANGER_LOAD_DEFAULT_RC=FALSE

# https://wiki.archlinux.org/title/SSH_keys#Start_ssh-agent_with_systemd_user
# ~/.config/systemd/user/ssh-agent.service
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
