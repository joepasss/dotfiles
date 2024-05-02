#!/bin/bash

function copy_configs {
  # bash
  create_symlink_home "$DOTFILE_DIR/bash/.bashrc"

  # tmux
  create_symlink_home "$DOTFILE_DIR/tmux/.tmux.conf"

  # kitty
  create_symlink_config "$DOTFILE_DIR/kitty/"

  # dunst
  create_symlink_config "$DOTFILE_DIR/dunst/"

  # nvim
  create_symlink_config "$DOTFILE_DIR/nvim/"

  # tofi
  create_symlink_config "$DOTFILE_DIR/tofi/"

  # kime
  create_symlink_config "$DOTFILE_DIR/kime/"
}
