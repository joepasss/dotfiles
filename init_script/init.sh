#!/bin/bash

# GLOBAL CONSTS
SCRIPT_DIR=$(realpath $(dirname "$0"))
DOTFILE_DIR=$(dirname "$SCRIPT_DIR")

source $SCRIPT_DIR/scripts/copy_configs.sh

while getopts "t" opt; do
	case $opt in
	t)
		test "somearg"
		exit 0
		;;
	esac
done

copy_configs

exit 0
