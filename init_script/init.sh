#!/bin/bash

# GLOBAL CONSTS
SCRIPT_DIR=$(realpath $(dirname "$0"))
DOTFILE_DIR=$(dirname "$SCRIPT_DIR")
ESELECT_REPO="/etc/portage/repos.conf/eselect-repo.conf"
JSON="$SCRIPT_DIR/init_script.config.json"

while getopts "t" opt; do
	case $opt in
	t)
		test "somearg"
		exit 0
		;;
	esac
done

exit 0
