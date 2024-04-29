#!/bin/bash

# GLOBAL CONSTS
SCRIPT_DIR=$(realpath $(dirname "$0"))
DOTFILE_DIR=$(dirname "$SCRIPT_DIR")
ESELECT_REPO="/etc/portage/repos.conf/eselect-repo.conf"

# test script
source ./test.sh

# util scripts
source ./utils/create_symlink.sh
source ./utils/emerge_check.sh
source ./utils/write_use.sh
source ./utils/overlay.sh
source ./utils/unmask.sh

# init scripts
source ./cli_app/bash_init.sh
source ./cli_app/tmux_init.sh

source ./gui_app/gui_init.sh

while getopts "t" opt; do
  case $opt in
    t)
      echo "test"
      test "somearg"
      exit 0
    ;;
  esac
done

emerge_check "app-portage/gentoolkit"

bash_init
tmux_init
gui_init
