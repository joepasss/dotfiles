#!/bin/bash

function bash_init() {
  git clone --depth=1 https://github.com/romkatv/gitstatus.git ~/gitstatus
  create_symlink_home $DOTFILE_DIR/bash/.bashrc
}
