#!/bin/bash

# GLOBAL CONSTS
SCRIPT_DIR=$(realpath $(dirname "$0"))
DOTFILE_DIR=$(dirname "$SCRIPT_DIR")

source $SCRIPT_DIR/scripts/utils/print.sh
source $SCRIPT_DIR/scripts/utils/create_symlink.sh
source $SCRIPT_DIR/scripts/utils/get_package_manager.sh

source $SCRIPT_DIR/scripts/bash_init.sh
source $SCRIPT_DIR/scripts/tmux_init.sh
source $SCRIPT_DIR/scripts/nvim_init.sh

PACKAGE_MANAGER=$(get_package_manager)

if [ ! $SHELL = "/bin/bash" ]; then
	set +H
fi

while getopts "t" opt; do
	case $opt in
	t)
		test "somearg"
		exit 0
		;;
	esac
done

bash_init
tmux_init PACKAGE_MANAGER
nvim_init PACKAGE_MANAGER

if [ ! $SHELL = "/bin/bash" ]; then
	set -H
fi

exit 0
