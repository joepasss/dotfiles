#!/bin/bash

# GLOBAL CONSTS
SCRIPT_DIR=$(realpath $(dirname "$0"))
DOTFILE_DIR=$(dirname "$SCRIPT_DIR")
ESELECT_REPO="/etc/portage/repos.conf/eselect-repo.conf"
JSON="$SCRIPT_DIR/init_script.config.json"

# util scripts
source $SCRIPT_DIR/utils/print.sh

# test script
source $SCRIPT_DIR/test.sh

# init scripts
source $SCRIPT_DIR/scripts/copy_configs.sh
source $SCRIPT_DIR/scripts/pre_install.sh
source $SCRIPT_DIR/scripts/sync_overlays.sh
source $SCRIPT_DIR/scripts/unmask_packages.sh
source $SCRIPT_DIR/scripts/write_use_flags.sh
source $SCRIPT_DIR/scripts/install_packages.sh

if ! command -v jq > /dev/null; then
  sudo emerge -vq jq
fi

while getopts "t" opt; do
  case $opt in
    t)
      test "somearg"
      exit 0
    ;;
  esac
done

pre_install
copy_configs
sync_overlays
unmask_packages
write_use_flags
install_packages

exit 0
