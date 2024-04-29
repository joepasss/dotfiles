#!/bin/bash

function gitmux_install {
  echo "gitmux install ..."
  go install github.com/arl/gitmux@latest

  sudo mv $HOME/go/bin/gitmux /usr/bin

  emerge_check "go"
}

function tpm_install {
  echo "tpm install ..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

function tmux_init {
  emerge_check "app-misc/tmux"
  create_symlink_home "$DOTFILE_DIR/tmux/.tmux.conf"

  if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    tpm_install
  fi

  if ! command -v go $ > /dev/null; then
    emerge_check "dev-lang/go"
  fi

  if [ ! -f $HOME/go/bin/gitmux ] && [ ! -f /usr/bin/gitmux ]; then
    gitmux_install
  fi
}
