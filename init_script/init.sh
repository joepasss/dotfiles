#!/bin/bash

# GLOBAL CONSTS
SCRIPT_DIR=$(realpath $(dirname "$0"))
DOTFILE_DIR=$(dirname "$SCRIPT_DIR")
ESELECT_REPO="/etc/portage/repos.conf/eselect-repo.conf"

# test script
source $SCRIPT_DIR/scripts/test.sh

# init scripts
source $SCRIPT_DIR/scripts/copy_configs.sh
source $SCRIPT_DIR/scripts/unmask_packages.sh
source $SCRIPT_DIR/scripts/write_use_flags.sh
source $SCRIPT_DIR/scripts/sync_overlays.sh
source $SCRIPT_DIR/scripts/install_packages.sh

while getopts "t" opt; do
  case $opt in
    t)
      echo "test"
      test "somearg"
      exit 0
    ;;
  esac
done

# copy_configs
copy_configs

echo "need sudo ..."
sudo -v

# prepare
unmask_packages
write_use_flag
emerge_dependencies

# install
install_packages

sudo -k
exit 0
