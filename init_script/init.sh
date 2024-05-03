#!/bin/bash

# GLOBAL CONSTS
SCRIPT_DIR=$(realpath $(dirname "$0"))
DOTFILE_DIR=$(dirname "$SCRIPT_DIR")
ESELECT_REPO="/etc/portage/repos.conf/eselect-repo.conf"

# test script
source ./scripts/test.sh

# util scripts
source ./utils/create_symlink.sh
source ./utils/emerge_check.sh
source ./utils/write_use.sh
source ./utils/overlay.sh
source ./utils/unmask.sh

# init scripts
source ./scripts/init_prepare.sh
source ./scripts/write_use_flag.sh
source ./scripts/install_packages.sh
source ./scripts/copy_config.sh

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
unmask_package
write_use_flag

emerge_dependencies
overlay_add

# install
install_packages

sudo -k
exit 0
