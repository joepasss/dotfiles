#!/bin/bash

function create_symlink() {
	local filename=$1
	local file_path=$2
	local dest=$3

	print_yellow "create \"$filename\" symlink ..."

	if [ -e "$dest/$filename" ]; then
		rm -rf "$dest/$filename"
	fi

	ln -s $file_path $dest
	print_green "create \"$filename\" symlink done!"
}
